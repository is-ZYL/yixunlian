package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_complaint
 */
@Table(name = "td_complaint")
public class Complaint extends BasePojo {
    /**
     * 投诉表
     */
    @Id
    private String complaintId;

    /**
     * 用户表
     */
    private String userId;

    /**
     * 关联活动
     */
    private String activityId;

    /**
     * 投诉内容
     */
    private String complaintContext;
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
     * 投诉表
     *
     * @return complaint_id
     */
    public String getComplaintId() {
        return complaintId;
    }

    /**
     * 投诉表
     *
     * @param complaintId
     */
    public void setComplaintId(String complaintId) {
        this.complaintId = complaintId == null ? null : complaintId.trim();
    }

    /**
     * 用户表
     *
     * @return user_id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 用户表
     *
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 关联活动
     *
     * @return activity_id
     */
    public String getActivityId() {
        return activityId;
    }

    /**
     * 关联活动
     *
     * @param activityId
     */
    public void setActivityId(String activityId) {
        this.activityId = activityId == null ? null : activityId.trim();
    }

    /**
     * 投诉内容
     *
     * @return complaint_context
     */
    public String getComplaintContext() {
        return complaintContext;
    }

    /**
     * 投诉内容
     *
     * @param complaintContext
     */
    public void setComplaintContext(String complaintContext) {
        this.complaintContext = complaintContext == null ? null : complaintContext.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public Complaint init() {
        this.complaintId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }
}