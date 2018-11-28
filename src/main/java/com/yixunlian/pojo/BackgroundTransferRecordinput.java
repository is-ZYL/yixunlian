package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * td_background_transfer_recordinput
 */
@Table(name = "td_background_transfer_recordinput")
public class BackgroundTransferRecordinput extends BasePojo {
    /**
     * 分享活动者支付提成给后台系统的的收入表
     */
    @Id
    private String backgroundTransferRecordId;

    /**
     * 支付给平台的金额
     */
    private Long backgroundTransferRecordMoney;
    /**
     * 备注
     */
    private String remark;
    /**
     * 谁支付的支付
     */
    private String userId;
    /**
     * 支付项目
     */
    private String activityprojectId;

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
     * 分享活动者支付提成给后台系统的的收入表
     *
     * @return background_transfer_record_id
     */
    public String getBackgroundTransferRecordId() {
        return backgroundTransferRecordId;
    }

    /**
     * 分享活动者支付提成给后台系统的的收入表
     *
     * @param backgroundTransferRecordId
     */
    public void setBackgroundTransferRecordId(String backgroundTransferRecordId) {
        this.backgroundTransferRecordId = backgroundTransferRecordId == null ? null : backgroundTransferRecordId.trim();
    }

    /**
     * 支付给平台的金额
     *
     * @return background_transfer_record_money
     */
    public Long getBackgroundTransferRecordMoney() {
        return backgroundTransferRecordMoney;
    }

    /**
     * 支付给平台的金额
     *
     * @param backgroundTransferRecordMoney
     */
    public void setBackgroundTransferRecordMoney(Long backgroundTransferRecordMoney) {
        this.backgroundTransferRecordMoney = backgroundTransferRecordMoney;
    }

    /**
     * 谁支付的支付
     *
     * @return user_id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 谁支付的支付
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