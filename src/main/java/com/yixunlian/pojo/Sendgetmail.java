package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_sendgetmail
 */
@Table(name = "td_sendgetmail")
public class Sendgetmail extends BasePojo {
    /**
     * 站内信表
     */
    @Id
    private String mailId;

    /**
     * 站内信内容
     */
    private String mail;

    /**
     * 站内信发送者，暂时不用，都是平台发送，不用显示谁发送的
     */
    private String senduserId;

    /**
     * 站内信接受者,暂时不用
     */
    private String getuserId;

    /**
     * 站内信表
     * @return mail_id 
     */
    public String getMailId() {
        return mailId;
    }

    /**
     * 站内信表
     * @param mailId 
     */
    public void setMailId(String mailId) {
        this.mailId = mailId == null ? null : mailId.trim();
    }

    /**
     * 站内信内容
     * @return mail 
     */
    public String getMail() {
        return mail;
    }

    /**
     * 站内信内容
     * @param mail 
     */
    public void setMail(String mail) {
        this.mail = mail == null ? null : mail.trim();
    }

    /**
     * 站内信发送者，暂时不用，都是平台发送，不用显示谁发送的
     * @return senduser_id 
     */
    public String getSenduserId() {
        return senduserId;
    }

    /**
     * 站内信发送者，暂时不用，都是平台发送，不用显示谁发送的
     * @param senduserId 
     */
    public void setSenduserId(String senduserId) {
        this.senduserId = senduserId == null ? null : senduserId.trim();
    }

    /**
     * 站内信接受者,暂时不用
     * @return getuser_id 
     */
    public String getGetuserId() {
        return getuserId;
    }

    /**
     * 站内信接受者,暂时不用
     * @param getuserId 
     */
    public void setGetuserId(String getuserId) {
        this.getuserId = getuserId == null ? null : getuserId.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
    public void init() {
        this.mailId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }

}