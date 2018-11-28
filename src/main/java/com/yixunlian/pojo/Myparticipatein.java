package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_myparticipatein
 */
@Table(name = "td_myparticipatein")
public class Myparticipatein extends BasePojo {
    /**
     * 我的参与表
     */
    @Id
    private String myparticipateinId;

    /**
     * 关联用户表
     */
    private String userId;

    /**
     * 活动表
     */
    private String activityId;

    /**
     * 我的参与活动列表的显示状态，1为删除不显示(逻辑删除）
     */
    private Integer myparticipateinStatus;
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
     * 我的参与表
     *
     * @return myparticipatein_id
     */
    public String getMyparticipateinId() {
        return myparticipateinId;
    }

    /**
     * 我的参与表
     *
     * @param myparticipateinId
     */
    public void setMyparticipateinId(String myparticipateinId) {
        this.myparticipateinId = myparticipateinId == null ? null : myparticipateinId.trim();
    }

    /**
     * 关联用户表
     *
     * @return user_id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 关联用户表
     *
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 活动表
     *
     * @return activity_id
     */
    public String getActivityId() {
        return activityId;
    }

    /**
     * 活动表
     *
     * @param activityId
     */
    public void setActivityId(String activityId) {
        this.activityId = activityId == null ? null : activityId.trim();
    }

    /**
     * 我的参与活动列表的显示状态，1为删除不显示(逻辑删除）
     *
     * @return myparticipatein_status
     */
    public Integer getMyparticipateinStatus() {
        return myparticipateinStatus;
    }

    /**
     * 我的参与活动列表的显示状态，1为删除不显示(逻辑删除）
     *
     * @param myparticipateinStatus
     */
    public void setMyparticipateinStatus(Integer myparticipateinStatus) {
        this.myparticipateinStatus = myparticipateinStatus;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.myparticipateinId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}