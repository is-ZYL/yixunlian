/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: UmoneyService
 * Author:   yuanyuana
 * Date:     2018/10/4 17:04
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.github.abel533.entity.Example;
import com.github.abel533.entity.Example.Criteria;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import util.myutils.ObjectUtil;
import com.yixunlian.entity.UmoneyResult;
import com.yixunlian.mapper.UmoneyMapper;
import com.yixunlian.pojo.Taxrevenue;
import com.yixunlian.pojo.Umoney;
import com.yixunlian.pojo.User;
import com.yixunlian.service.baseservice.BaseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import util.myutils.DateUtils;

import javax.annotation.Resource;
import javax.xml.crypto.Data;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/4
 * @since 1.0.0
 */
@Service
@Slf4j
public class UmoneyService extends BaseService<Umoney> {
    @Autowired
    private UmoneyMapper umoneyMapper;
    @Resource(name = "taxrevenueService")
    private TaxrevenueService taxrevenueService;

    /**
     * 查询用户提现数据
     *
     * @param user
     * @param page
     * @param rows
     * @param startTime
     * @param endTime
     * @return
     */
    public UmoneyResult queryUmoneyListByUserAndTime(User user, Integer page, Integer rows, Date startTime, Data endTime) {
        UmoneyResult umoneyResult = new UmoneyResult();
        BigDecimal alreadyPresented = umoneyResult.getAlreadyPresented();
        Umoney umoney = new Umoney();
        umoney.setUserId(user.getUserId());
        if (ObjectUtil.isNotNull(startTime) && ObjectUtil.isNotNull(endTime)) {
            Example example = new Example(Umoney.class);
            Criteria criteria = example.createCriteria();
            example.setOrderByClause("created DESC");
            criteria.andBetween("putTime", startTime, endTime);
            PageHelper.startPage(page, rows);
            List<Umoney> result = umoneyMapper.selectByExample(example);
            //累加已提现金额
            for (Umoney umoney1 : result) {
                alreadyPresented.add(umoney1.getPutMoney());
            }
            umoneyResult.setAlreadyPresented(alreadyPresented.setScale(2, BigDecimal.ROUND_HALF_UP));

            PageInfo<Umoney> list = new PageInfo<>(result);
            umoneyResult.setRows(list.getList());
            umoneyResult.setTotal(list.getTotal());
            return umoneyResult;
        }

        //降序查询当前用户所有的提现数据
        List<Umoney> userProfits = super.queryListByWhereDesc(umoney);
        //累加已提现金额
        for (Umoney umoney1 : userProfits) {
            alreadyPresented.add(umoney1.getPutMoney());
        }
        umoneyResult.setAlreadyPresented(alreadyPresented.setScale(2, BigDecimal.ROUND_HALF_UP));
        PageInfo<Umoney> list = new PageInfo<>(userProfits);
        umoneyResult.setRows(list.getList());
        umoneyResult.setTotal(list.getTotal());
        return umoneyResult;

    }

    /**
     * 用户提现到零钱成功后保存至数据库
     *
     * @param user
     * @param money
     * @param taxrevenueId
     * @param map
     * @return
     */
    public Integer saveSelectiveByBaseInfo(User user, BigDecimal money, String taxrevenueId, Map<String, String> map) {
        Taxrevenue taxrevenue = taxrevenueService.queryById(taxrevenueId);
        Umoney umoney = new Umoney().init();
        umoney.setPutMoney(money);
        umoney.setTaxrevenueId(taxrevenueId);
        //计算实际提现金额 = money-money*税率
        BigDecimal resultMoney = money.subtract(money.multiply(new BigDecimal(taxrevenue.getTaxrevenueRate())));
        umoney.setActualarrivalAmount(resultMoney);
        umoney.setUserId(user.getUserId());
        umoney.setPaymentNo(map.get("payment_no"));
        try {
            umoney.setPutTime(DateUtils.fomatDate(map.get("payment_time"), new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")));
        } catch (ParseException e) {
            log.error("时间转换失败,类名称及行数为：[{},{}]" + getClass() + 124);
        }
        //若订单号为空则说明提现失败否则设置为提现成功
        if (ObjectUtil.isNull(umoney.getPaymentNo())) {
            umoney.setPutStatus(1);
        } else {
            umoney.setPutStatus(0);
            //备注提现失败的原因
            umoney.setRemark("提现失败错误代码：" + map.get("err_code") + "错误描述：" + map.get("err_code_des"));
        }
        return super.saveSelective(umoney);
    }
}
