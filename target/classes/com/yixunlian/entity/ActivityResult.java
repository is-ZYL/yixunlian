package com.yixunlian.entity;

import lombok.*;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author yuanyuana
 * @Desc 前端需要的数据类型的总封装pojo，关于活动的所有数据
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder(toBuilder = true)
public class ActivityResult {
    /**
     * 分享数量
     */
    private Integer shareTotal = 0;

    /**
     * 我的活动页面,客户管理下的活动类别名称
     */
    private String activityCategoryName;

    /**
     * 我的活动页面,客户管理下的活动类别报名人的详细数据
     */
    private List<?> obj;

    /**
     * 需求数量
     */
    private Integer needsTotal = 0;

    /**
     * 有精准需求的用户id
     */
    private List<String> uids;

    /**
     * 报名此活动的人数
     */
    private Integer joinTotal = 0;

    /**
     * 签到此活动的人数
     */
    private Integer signInTotal = 0;

    /**
     * 成交此活动的人数
     */
    private Integer transactionTotal = 0;

    /**
     * 报名此活动的用户id
     */
    private List<String> joinUids;

    /**
     * 此活动的用户未成交人数
     */
    private Integer unfilledNum = 0;

    /**
     * 此活动的成交总金额
     */
    private BigDecimal transactionTotalAmount;

    /**
     * 此活动的提成总金额
     */
    private BigDecimal commissionTotalAmount;

    /**
     * 此活动的举报内容
     */
    private String reportContext;
    /**
     * 活动数据
     */
    private Object object;
    /**
     * 是否是活动主办方
     */
    private Boolean isOrganizer;
    /**
     * 是否已设置提成项目(前提是有设置分享提成)
     */
    private Boolean isSetExtractProject;

    public static ActivityResult getActivityResult() {
        return new ActivityResult();
    }

}
