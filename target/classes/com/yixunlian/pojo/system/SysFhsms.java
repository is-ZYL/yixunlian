package com.yixunlian.pojo.system;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SysFhsms {
    /**
     * 
     */
    private String fhsmsId;

    /**
     * 内容
     */
    private String content;

    /**
     * 类型
     */
    private String type;

    /**
     * 收信人
     */
    private String toUsername;

    /**
     * 发信人
     */
    private String fromUsername;

    /**
     * 发信时间
     */
    private String sendTime;

    /**
     * 状态
     */
    private String status;

    /**
     * 
     */
    private String sanmeId;

    public SysFhsms(String fhsmsId, String content, String type, String toUsername, String fromUsername, String sendTime, String status, String sanmeId) {
        this.fhsmsId = fhsmsId;
        this.content = content;
        this.type = type;
        this.toUsername = toUsername;
        this.fromUsername = fromUsername;
        this.sendTime = sendTime;
        this.status = status;
        this.sanmeId = sanmeId;
    }

    public SysFhsms() {
        super();
    }

    public String getFhsmsId() {
        return fhsmsId;
    }

    public void setFhsmsId(String fhsmsId) {
        this.fhsmsId = fhsmsId == null ? null : fhsmsId.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getToUsername() {
        return toUsername;
    }

    public void setToUsername(String toUsername) {
        this.toUsername = toUsername == null ? null : toUsername.trim();
    }

    public String getFromUsername() {
        return fromUsername;
    }

    public void setFromUsername(String fromUsername) {
        this.fromUsername = fromUsername == null ? null : fromUsername.trim();
    }

    public String getSendTime() {
        return sendTime;
    }

    public void setSendTime(String sendTime) {
        this.sendTime = sendTime == null ? null : sendTime.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getSanmeId() {
        return sanmeId;
    }

    public void setSanmeId(String sanmeId) {
        this.sanmeId = sanmeId == null ? null : sanmeId.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}