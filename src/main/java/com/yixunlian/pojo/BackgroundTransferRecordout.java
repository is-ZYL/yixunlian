package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * td_background_transfer_recordout
 */
@Table(name = "td_background_transfer_recordout")
public class BackgroundTransferRecordout extends BasePojo {
    /**
     * 后台支付提成给分享活动的人的支出表
     */
    @Id
    private String backgroundTransferRecordId;

    /**
     * 支出金额
     */
    private Long backgroundTransferMoney;

    /**
     * 支付给谁
     */
    private String userId;

    /**
     * 支付项目
     */
    private String activityprojectId;
    /**
     * 备注
     */
    private String remark;

    /**
     * 备注
     *
     * @return remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 备注
     *
     * @param remark
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    /**
     * 后台支付提成给分享活动的人的支出表
     *
     * @return background_transfer_record_id
     */
    public String getBackgroundTransferRecordId() {
        return backgroundTransferRecordId;
    }

    /**
     * 后台支付提成给分享活动的人的支出表
     *
     * @param backgroundTransferRecordId
     */
    public void setBackgroundTransferRecordId(String backgroundTransferRecordId) {
        this.backgroundTransferRecordId = backgroundTransferRecordId == null ? null : backgroundTransferRecordId.trim();
    }

    /**
     * 支出金额
     *
     * @return background_transfer_money
     */
    public Long getBackgroundTransferMoney() {
        return backgroundTransferMoney;
    }

    /**
     * 支出金额
     *
     * @param backgroundTransferMoney
     */
    public void setBackgroundTransferMoney(Long backgroundTransferMoney) {
        this.backgroundTransferMoney = backgroundTransferMoney;
    }

    /**
     * 支付给谁
     *
     * @return user_id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 支付给谁
     *
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 支付项目
     *
     * @return activityproject_id
     */
    public String getActivityprojectId() {
        return activityprojectId;
    }

    /**
     * 支付项目
     *
     * @param activityprojectId
     */
    public void setActivityprojectId(String activityprojectId) {
        this.activityprojectId = activityprojectId == null ? null : activityprojectId.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}