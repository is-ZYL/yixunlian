/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: UserprofitService
 * Author:   yuanyuana
 * Date:     2018/10/4 15:59
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
import com.yixunlian.entity.ProfitListResult;
import com.yixunlian.mapper.UserprofitMapper;
import com.yixunlian.pojo.Memberupdateextract;
import com.yixunlian.pojo.User;
import com.yixunlian.pojo.Userprofit;
import com.yixunlian.service.baseservice.BaseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import util.myutils.DateUtils;

import javax.xml.crypto.Data;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

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
public class UserprofitService extends BaseService<Userprofit> {

    @Autowired
    private UserprofitMapper userprofitMapper;

    /**
     * 分页查询当前用户的收益记录
     *
     * @param user      当前用户
     * @param page      当前页码
     * @param rows      每页显示数据条数
     * @param startTime 指定的提现时间段查询
     * @param endTime   指定的提现时间段查询
     * @return 返回pageInfo 数据
     */
    public ProfitListResult queryUserProfitListByUserAndTime(User user, Integer page, Integer rows, Date startTime, Data endTime) {
        Userprofit userProfit = new Userprofit();
        userProfit.setUserId(user.getUserId());
        // 查询已提现/待提现/可提现记录  保留两位小数
        ProfitListResult profitListResult = queryUserProfitByStatus(userProfit);
        //总收益
        BigDecimal allProfit = profitListResult.getAllProfit();
        //根据时间段查询
        if (ObjectUtil.isNotNull(startTime) && ObjectUtil.isNotNull(endTime)) {
            //分页查询出数据
            PageHelper.startPage(page, rows);
            Example example = new Example(Userprofit.class);
            Criteria criteria = example.createCriteria();
            example.setOrderByClause("created DESC");
            criteria.andBetween("paymentTime", startTime, endTime);
            List<Userprofit> result = userprofitMapper.selectByExample(example);
            for (Userprofit userprofit : result) {
                //计算总收益
                allProfit.add(userprofit.getAcMoney());
            }
            profitListResult.setAllProfit(allProfit.setScale(2, BigDecimal.ROUND_HALF_UP));
            PageInfo<Userprofit> list = new PageInfo<>(result);
            profitListResult.setRows(list.getList());
            profitListResult.setTotal(list.getTotal());
            return profitListResult;
        }
        //查询全部
        List<Userprofit> result = super.queryListByWhere(userProfit);
        for (Userprofit userprofit : result) {
            //计算总收益
            allProfit.add(userprofit.getAcMoney());
        }
        profitListResult.setAllProfit(allProfit.setScale(2, BigDecimal.ROUND_HALF_UP));
        PageInfo<Userprofit> list = new PageInfo<>(result);
        profitListResult.setRows(list.getList());
        profitListResult.setTotal(list.getTotal());
        return profitListResult;
    }

    /**
     * 用户查询已提现/待提现/可提现  保留两位小数
     *
     * @param userprofit
     * @return
     */
    private ProfitListResult queryUserProfitByStatus(Userprofit userprofit) {
        //数据封装对象
        ProfitListResult profitListResult = new ProfitListResult();
        //已提现
        BigDecimal alreadyPresented = profitListResult.getAlreadyPresented();
        //可提现
        BigDecimal canPresented = profitListResult.getCanPresented();
        //待提现
        BigDecimal toRaised = profitListResult.getToRaised();

        //降序查询当前用户所有的数据
        List<Userprofit> userProfits = super.queryListByWhereDesc(userprofit);

        for (Userprofit userprofit1 : userProfits) {
            //待提现
            if (userprofit1.getMoneyStatus() == 0) {
                toRaised.add(userprofit1.getAcMoney());
            }
            //可提现
            if (userprofit1.getMoneyStatus() == 1) {
                canPresented.add(userprofit1.getAcMoney());
            }
            //已提现
            if (userprofit1.getMoneyStatus() == 2) {
                alreadyPresented.add(userprofit1.getAcMoney());
            }
        }
        //保留两位小数
        profitListResult.setAlreadyPresented(alreadyPresented.setScale(2, BigDecimal.ROUND_HALF_UP));
        profitListResult.setCanPresented(canPresented.setScale(2, BigDecimal.ROUND_HALF_UP));
        profitListResult.setToRaised(toRaised.setScale(2, BigDecimal.ROUND_HALF_UP));
        return profitListResult;
    }

    /**
     * 查询当前用户的可提现金额
     *
     * @param user 当前用户
     * @return 返回金额
     */
    public double queryUserIsPutForwardUserprofit(User user) {
        BigDecimal result = new BigDecimal("0");
        Userprofit userprofit = new Userprofit();
        userprofit.setUserId(user.getUserId());
        Example example = new Example(Userprofit.class);
        //查询为可提现状态的金额
        example.createCriteria().andEqualTo("moneyStatus", 1);
        List<Userprofit> userprofits = userprofitMapper.selectByExample(example);
        //循环获取当前用户的可提现金额
        for (Userprofit userprofit1 : userprofits) {
            result.add(userprofit1.getAcMoney());
        }
        //保留两位数并返回
        return result.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * 查询平台总收益
     *
     * @return
     */
    public double queryAllWallet() {
        List<Userprofit> userprofits = super.queryAll();
        BigDecimal result = new BigDecimal("0");
        for (Userprofit userprofit : userprofits) {
            result.add(userprofit.getAcMoney());
        }
        return result.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * 添加提成——根据用户,提成信息
     *
     * @param user
     * @param m
     * @param date
     * @return
     */
    public Integer saveSelectiveByMemberAndUser(User user, Memberupdateextract m, Date date) {
        Userprofit userprofit = Userprofit.getUserprofit();
        //设置提成金额
        userprofit.setAcMoney(m.getMemberUpdateMoney());
        //设置提成用户id，即当前升级用户的归属人
        userprofit.setUserId(user.getUsermanagerUid());
        //设置支付时间
        userprofit.setPaymentTime(date);
        //升级用户id
        userprofit.setUpgradeUserId(user.getUserId());
        //将金额设置为待提现
        userprofit.setMoneyStatus(0);
        //计算可提现时间  72个小时之后转入可提现金额
        String endTime = DateUtils.getAfterDayDate(3);
        Date date1 = null;
        try {
            date1 = DateUtils.fomatDateTime(endTime);
        } catch (ParseException e) {
            log.info("计算可提现时间失败,类名及行数为：[{},{}]", getClass(), 199);
        }
        userprofit.setRecordingtimeEnd(date1);
        //设置提成类型为用户升级所得提成
        userprofit.setProfitStatus(1);
        return super.saveSelective(userprofit);
    }
}
