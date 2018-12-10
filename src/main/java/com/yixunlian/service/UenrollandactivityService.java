/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: UenrollandactivityService
 * Author:   yuanyuana
 * Date:     2018/10/15 17:57
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.service;

import com.github.abel533.entity.Example;
import com.github.abel533.entity.Example.Criteria;
import com.yixunlian.entity.ActivityResult;
import com.yixunlian.mapper.UenrollandactivityMapper;
import com.yixunlian.pojo.Activity;
import com.yixunlian.pojo.OrganizerInfo;
import com.yixunlian.pojo.Uenrollandactivity;
import com.yixunlian.service.baseservice.BaseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import util.myutils.BigDecimalUtils;
import util.myutils.ObjectUtil;
import util.myutils.Tools;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/15
 * @since 1.0.0
 */
@Service
@Slf4j
public class UenrollandactivityService extends BaseService<Uenrollandactivity> {

    @Resource(name = "uenrollandactivityMapper")
    private UenrollandactivityMapper uenrollandactivityMapper;

    /**
     * 根据用户id，活动id查询报名信息
     *
     * @param userId
     * @param activityId
     * @return
     */
    public Uenrollandactivity queryOneByUser(String userId, String activityId) {
        Uenrollandactivity uenrollandactivity = Uenrollandactivity.getUenrollAndActivity().toBuilder().activityId(activityId).userId(userId).build();
        return super.queryOne(uenrollandactivity);
    }

    /**
     * 根据用户id，活动id查询报名信息
     *
     * @param userId
     * @param activityId
     * @return
     */
    public Uenrollandactivity queryOneByUser(String organizerId, String userId, String activityId) {
        Uenrollandactivity uenrollandactivity = Uenrollandactivity.getUenrollAndActivity().toBuilder().activityId(activityId).userId(userId).organizerId(organizerId).build();
        return super.queryOne(uenrollandactivity);
    }

    /**
     * 根据活动查询当前的报名等情况
     *
     * @param activity
     * @return
     */
    public List<Uenrollandactivity> queryListByActivity(Activity activity) {
        Uenrollandactivity ue = Uenrollandactivity.getUenrollAndActivity().toBuilder().activityId(activity.getActivityId()).build();
        return super.queryListByWhere(ue);
    }

    /**
     * 根据活动查询当前的报名等情况
     *
     * @param activityId
     * @return
     */
    public List<Uenrollandactivity> queryListByActivity(String activityId) {
        Uenrollandactivity ue = Uenrollandactivity.getUenrollAndActivity().toBuilder().activityId(activityId).build();
        return super.queryListByWhere(ue);
    }

    /**
     * 根据类别id统计所有活动用户报过名的总人数
     *
     * @param list 类别id集合
     * @param o
     * @return
     */
    public List<ActivityResult> queryTotalCountAndUser(Map<String, String> list, OrganizerInfo o) {
        List<ActivityResult> activityResults = new ArrayList<>();
        for (Map.Entry<String, String> m : list.entrySet()) {
            Uenrollandactivity build = Uenrollandactivity.getUenrollAndActivity()
                    .toBuilder()
                    .organizerId(o.getUserId())
                    .status(0)
                    .activitycategoryId(m.getKey().toString())
                    .build();
            //根据类别以及主办方id查询活动报名情况
            List<Uenrollandactivity> uenrollandactivities = super.queryDistinctListByWhere(build);
            //封装
            ActivityResult a = ActivityResult.getActivityResult().toBuilder().isOrganizer(true).activityCategoryName(m.getValue().toString()).obj(uenrollandactivities).build();
            activityResults.add(a);
        }
        return activityResults;
    }

    /**
     * 根据活动id查询活动报名情况
     *
     * @param activityId     活动id
     * @param dealStatus     用户每个活动收费对应的支付状态0，为未成交，1为已成交
     * @param usersignStatus 签到状态，0为未签到，1表示已签到
     * @param paymentStatus  支付提成给经理人的支付状态 0 未支付  1已支付
     * @param keywords       关键字搜索  手机号和姓名
     * @return
     */
    public ActivityResult queryListByWhere(String activityId, Integer dealStatus, Integer usersignStatus, Integer paymentStatus, String keywords) {
        Example e = new Example(Uenrollandactivity.class);
        Criteria criteria = e.createCriteria();
        if (ObjectUtil.notEmpty(activityId)) {
            criteria.andEqualTo("activityId", activityId);
        }
        if (null != dealStatus) {
            criteria.andEqualTo("dealStatus", dealStatus);
        }
        if (null != usersignStatus) {
            criteria.andEqualTo("usersignStatus", usersignStatus);
        }
        if (null != paymentStatus) {
            criteria.andEqualTo("paymentStatus", paymentStatus);
        }
        //根据手机号
        if (ObjectUtil.notEmpty(keywords) && Tools.isMobile(keywords)) {
            criteria.andEqualTo("uPhone", keywords);
        }

        //根据姓名
        if (ObjectUtil.notEmpty(keywords) && !Tools.isMobile(keywords)) {
            criteria.andEqualTo("uNickname", keywords);
        }
        List<Uenrollandactivity> uenrollandactivities = uenrollandactivityMapper.selectByExample(e);

        log.info("主办方查看用户报名信息：uen:{}", uenrollandactivities);

        ActivityResult result = ActivityResult.getActivityResult();
        //报名人数
        Integer joinTotal = uenrollandactivities.size();
        //签到人数
        Integer signInTotal = result.getSignInTotal();
        //成交人数
        Integer transactionTotal = result.getTransactionTotal();
        //成交总金额
        BigDecimal transactionTotalAmount = result.getTransactionTotalAmount();
        //提成总金额
        BigDecimal commissionTotalAmount = result.getCommissionTotalAmount();

        //dealStatus     用户每个活动收费对应的支付状态0，为未成交，1为已成交
        //usersignStatus 签到状态，0为未签到，1表示已签到
        //paymentStatus  支付提成给经理人的支付状态 0 未支付  1已支付
        List<Uenrollandactivity> obj = new ArrayList<>();
        for (Uenrollandactivity ue : uenrollandactivities) {
            //已签到
            if (1 == ue.getUsersignStatus()) {
                signInTotal++;
            }
            //已成交
            if (1 == ue.getDealStatus()) {
                transactionTotal++;
                //计算成交总金额
                transactionTotalAmount = BigDecimalUtils.safeAdd(transactionTotalAmount, ue.getTransactionNum());
            }
            //已成交
            if (1 == ue.getDealStatus()) {
                transactionTotal++;
                //计算成交总金额
                BigDecimalUtils.safeAdd(transactionTotalAmount, ue.getTransactionNum());
            }
            //添加至list中
            obj.add(ue);
        }
        //封装用户数据
        result.setObj(obj);
        return result;
    }

}
