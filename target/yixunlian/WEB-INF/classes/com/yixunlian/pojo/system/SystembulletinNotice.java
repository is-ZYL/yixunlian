package com.yixunlian.pojo.system;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * td_systembulletin_notice
 */
@Table(name = "td_systembulletin_notice")
public class SystembulletinNotice{
    /**
     * 系统公告表
     */
    @Id
    private String noticeId;

    /**
     * 公告内容
     */
    private String noticeContext;

    /**
     * 系统公告表
     * @return notice_id 
     */
    public String getNoticeId() {
        return noticeId;
    }

    /**
     * 系统公告表
     * @param noticeId 
     */
    public void setNoticeId(String noticeId) {
        this.noticeId = noticeId == null ? null : noticeId.trim();
    }

    /**
     * 公告内容
     * @return notice_context 
     */
    public String getNoticeContext() {
        return noticeContext;
    }

    /**
     * 公告内容
     * @param noticeContext 
     */
    public void setNoticeContext(String noticeContext) {
        this.noticeContext = noticeContext == null ? null : noticeContext.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}