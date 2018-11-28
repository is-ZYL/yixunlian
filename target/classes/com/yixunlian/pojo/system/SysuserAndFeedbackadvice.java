package com.yixunlian.pojo.system;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * td_sysuser_and_feedbackadvice
 */
@Table(name = "td_sysuser_and_feedbackadvice")
public class SysuserAndFeedbackadvice {
    /**
     * 回复和反馈建议的第三方表
     */
    @Id
    private String sysuserAndfeedbackadviceId;

    /**
     * 关联系统管理员表，谁处理的即回复反馈建议
     */
    private String sysuserId;

    /**
     * 回复那个，关联用户表
     */
    private String userId;

    /**
     * 关联反馈建议表
     */
    private String feedbackadviceId;

    /**
     * 系统管理员回复内容
     */
    private String replyContext;

    public String getReplyContext() {
        return replyContext;
    }

    public void setReplyContext(String replyContext) {
        this.replyContext = replyContext;
    }

    /**
     * 回复和反馈建议的第三方表
     *
     * @return sysuser_andfeedbackadvice_id
     */
    public String getSysuserAndfeedbackadviceId() {
        return sysuserAndfeedbackadviceId;
    }

    /**
     * 回复和反馈建议的第三方表
     *
     * @param sysuserAndfeedbackadviceId
     */
    public void setSysuserAndfeedbackadviceId(String sysuserAndfeedbackadviceId) {
        this.sysuserAndfeedbackadviceId = sysuserAndfeedbackadviceId == null ? null : sysuserAndfeedbackadviceId.trim();
    }

    /**
     * 关联系统管理员表，谁处理的即回复反馈建议
     *
     * @return sysuser_id
     */
    public String getSysuserId() {
        return sysuserId;
    }

    /**
     * 关联系统管理员表，谁处理的即回复反馈建议
     *
     * @param sysuserId
     */
    public void setSysuserId(String sysuserId) {
        this.sysuserId = sysuserId == null ? null : sysuserId.trim();
    }

    /**
     * 回复那个，关联用户表
     *
     * @return user_id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 回复那个，关联用户表
     *
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 关联反馈建议表
     *
     * @return feedbackadvice_id
     */
    public String getFeedbackadviceId() {
        return feedbackadviceId;
    }

    /**
     * 关联反馈建议表
     *
     * @param feedbackadviceId
     */
    public void setFeedbackadviceId(String feedbackadviceId) {
        this.feedbackadviceId = feedbackadviceId == null ? null : feedbackadviceId.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}