package com.yixunlian.pojo.system;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * td_systembulletin_userandnotice
 */
@Table(name = "td_systembulletin_userandnotice")
public class SystembulletinUserandnotice {
    /**
     * 系统公告和用户的第三方表
     */
    @Id
    private String userAndnoticeId;

    /**
     * 
     */
    private String userId;

    /**
     * 
     */
    private String noticeId;

    /**
     * 阅读状态：0为未阅读，1为已经阅读
     */
    private Integer noticeStatus;

    /**
     * 系统公告和用户的第三方表
     * @return user_andnotice_id 
     */
    public String getUserAndnoticeId() {
        return userAndnoticeId;
    }

    /**
     * 系统公告和用户的第三方表
     * @param userAndnoticeId 
     */
    public void setUserAndnoticeId(String userAndnoticeId) {
        this.userAndnoticeId = userAndnoticeId == null ? null : userAndnoticeId.trim();
    }

    /**
     * 
     * @return user_id 
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 
     * @param userId 
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 
     * @return notice_id 
     */
    public String getNoticeId() {
        return noticeId;
    }

    /**
     * 
     * @param noticeId 
     */
    public void setNoticeId(String noticeId) {
        this.noticeId = noticeId == null ? null : noticeId.trim();
    }

    /**
     * 阅读状态：0为未阅读，1为已经阅读
     * @return notice_status 
     */
    public Integer getNoticeStatus() {
        return noticeStatus;
    }

    /**
     * 阅读状态：0为未阅读，1为已经阅读
     * @param noticeStatus 
     */
    public void setNoticeStatus(Integer noticeStatus) {
        this.noticeStatus = noticeStatus;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}