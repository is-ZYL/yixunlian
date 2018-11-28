package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_sendgetmail_anduser
 */
@Table(name = "td_sendgetmail_anduser")
public class SendgetmailAnduser extends BasePojo {
    /**
     * 用户与站内信的第三方表
     */
    @Id
    private String userandmailId;

    /**
     * 关联站内信表
     */
    private String mailId;

    /**
     * 关联用户表,站内信接受者
     */
    private String userId;

    /**
     * 站内信阅读状态
     */
    private Integer isReadstatus;

    /**
     * 站内信发送者
     */
    private String senduserId;

    /**
     * 用户与站内信的大三方表
     * @return userandmail_id 
     */
    public String getUserandmailId() {
        return userandmailId;
    }

    /**
     * 用户与站内信的大三方表
     * @param userandmailId 
     */
    public void setUserandmailId(String userandmailId) {
        this.userandmailId = userandmailId == null ? null : userandmailId.trim();
    }

    /**
     * 关联站内信表
     * @return mail_id 
     */
    public String getMailId() {
        return mailId;
    }

    /**
     * 关联站内信表
     * @param mailId 
     */
    public void setMailId(String mailId) {
        this.mailId = mailId == null ? null : mailId.trim();
    }

    /**
     * 关联用户表,站内信接受者
     * @return user_id 
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 关联用户表,站内信接受者
     * @param userId 
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 站内信阅读状态
     * @return is_readstatus 
     */
    public Integer getIsReadstatus() {
        return isReadstatus;
    }

    /**
     * 站内信阅读状态
     * @param isReadstatus 
     */
    public void setIsReadstatus(Integer isReadstatus) {
        this.isReadstatus = isReadstatus;
    }

    /**
     * 站内信发送者
     * @return senduser_id 
     */
    public String getSenduserId() {
        return senduserId;
    }

    /**
     * 站内信发送者
     * @param senduserId 
     */
    public void setSenduserId(String senduserId) {
        this.senduserId = senduserId == null ? null : senduserId.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.userandmailId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}