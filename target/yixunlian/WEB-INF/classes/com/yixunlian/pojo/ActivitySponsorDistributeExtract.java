package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;

/**
 * td_activity_sponsor_distribute_extract
 */
@Table(name = "td_activity_sponsor_distribute_extract")
public class ActivitySponsorDistributeExtract extends BasePojo {
    /**
     * 活动主办方发放每笔提成金额去向比率表
     */
    private String activitySponsorDistributeExtractId;

    /**
     * 活动主办方分发提成对象：0为主办方推荐人（注册时的推荐人）1为（活动分享人）普通会员分享二选一，2（活动分享人）拥有资源库的人分享或输出资源二选一，3，公益基金
     */
    private Integer activitySponsorDistributeExtractType;

    /**
     * 分发比率
     */
    private BigDecimal activitySponsorDistributeExtractRate;

    /**
     * 
     */
    private Date created;

    /**
     * 
     */
    private Date updated;

    /**
     * 备注
     */
    private String remark;

    /**
     * 活动主办方发放每笔提成金额去向比率表
     * @return activity_sponsor_distribute_extract_id 
     */
    public String getActivitySponsorDistributeExtractId() {
        return activitySponsorDistributeExtractId;
    }

    /**
     * 活动主办方发放每笔提成金额去向比率表
     * @param activitySponsorDistributeExtractId 
     */
    public void setActivitySponsorDistributeExtractId(String activitySponsorDistributeExtractId) {
        this.activitySponsorDistributeExtractId = activitySponsorDistributeExtractId == null ? null : activitySponsorDistributeExtractId.trim();
    }

    /**
     * 活动主办方分发提成对象：0为主办方推荐人（注册时的推荐人）1为（活动分享人）普通会员分享二选一，2（活动分享人）拥有资源库的人分享或输出资源二选一，3，公益基金
     * @return activity_sponsor_distribute_extract_type 
     */
    public Integer getActivitySponsorDistributeExtractType() {
        return activitySponsorDistributeExtractType;
    }

    /**
     * 活动主办方分发提成对象：0为主办方推荐人（注册时的推荐人）1为（活动分享人）普通会员分享二选一，2（活动分享人）拥有资源库的人分享或输出资源二选一，3，公益基金
     * @param activitySponsorDistributeExtractType 
     */
    public void setActivitySponsorDistributeExtractType(Integer activitySponsorDistributeExtractType) {
        this.activitySponsorDistributeExtractType = activitySponsorDistributeExtractType;
    }

    /**
     * 分发比率
     * @return activity_sponsor_distribute_extract_rate 
     */
    public BigDecimal getActivitySponsorDistributeExtractRate() {
        return activitySponsorDistributeExtractRate;
    }

    /**
     * 分发比率
     * @param activitySponsorDistributeExtractRate 
     */
    public void setActivitySponsorDistributeExtractRate(BigDecimal activitySponsorDistributeExtractRate) {
        this.activitySponsorDistributeExtractRate = activitySponsorDistributeExtractRate;
    }

    /**
     * 
     * @return created 
     */
    public Date getCreated() {
        return created;
    }

    /**
     * 
     * @param created 
     */
    public void setCreated(Date created) {
        this.created = created;
    }

    /**
     * 
     * @return updated 
     */
    public Date getUpdated() {
        return updated;
    }

    /**
     * 
     * @param updated 
     */
    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    /**
     * 备注
     * @return remark 
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 备注
     * @param remark 
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}