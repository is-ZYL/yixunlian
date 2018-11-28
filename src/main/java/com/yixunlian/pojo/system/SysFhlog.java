package com.yixunlian.pojo.system;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SysFhlog {
    /**
     * 
     */
    private String fhlogId;

    /**
     * 用户名
     */
    private String username;

    /**
     * 操作时间
     */
    private String cztime;

    /**
     * 事件
     */
    private String content;

    public SysFhlog(String fhlogId, String username, String cztime, String content) {
        this.fhlogId = fhlogId;
        this.username = username;
        this.cztime = cztime;
        this.content = content;
    }

    public SysFhlog() {
        super();
    }

    public String getFhlogId() {
        return fhlogId;
    }

    public void setFhlogId(String fhlogId) {
        this.fhlogId = fhlogId == null ? null : fhlogId.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getCztime() {
        return cztime;
    }

    public void setCztime(String cztime) {
        this.cztime = cztime == null ? null : cztime.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}