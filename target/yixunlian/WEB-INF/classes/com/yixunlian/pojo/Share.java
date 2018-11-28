package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_share
 */
@Table(name = "td_share")
public class Share extends BasePojo {
    /**
     * 分享表
     */
    @Id
    private String shareId;

    /**
     * 分享状态id,0为新闻分享，1为分享活动
     */
    private Integer shareidStatus;

    /**
     * 关联用户表    分享者
     */
    private String sharesendId;

    /**
     * 关联用户表     分享接收者
     */
    private String sharegetId;

    /**
     * 关联活动表
     */
    private String activityId;

    /**
     * 关联新闻表
     */
    private String journalismId;

    /**
     * 分享记录删除，1为删除
     */
    private Integer sharingRecordsDelete;

    public static Share getShare() {
        return new Share();
    }

    /**
     * 分享表
     *
     * @return share_id
     */
    public String getShareId() {
        return shareId;
    }

    /**
     * 分享表
     *
     * @param shareId
     */
    public void setShareId(String shareId) {
        this.shareId = shareId == null ? null : shareId.trim();
    }

    /**
     * 分享状态id,0为新闻分享，1为分享活动
     *
     * @return shareid_status
     */
    public Integer getShareidStatus() {
        return shareidStatus;
    }

    /**
     * 分享状态id,0为新闻分享，1为分享活动
     *
     * @param shareidStatus
     */
    public void setShareidStatus(Integer shareidStatus) {
        this.shareidStatus = shareidStatus;
    }

    /**
     * 关联用户表    分享者
     *
     * @return sharesend_id
     */
    public String getSharesendId() {
        return sharesendId;
    }

    /**
     * 关联用户表    分享者
     *
     * @param sharesendId
     */
    public void setSharesendId(String sharesendId) {
        this.sharesendId = sharesendId == null ? null : sharesendId.trim();
    }

    /**
     * 关联用户表     分享接收者
     *
     * @return shareget_id
     */
    public String getSharegetId() {
        return sharegetId;
    }

    /**
     * 关联用户表     分享接收者
     *
     * @param sharegetId
     */
    public void setSharegetId(String sharegetId) {
        this.sharegetId = sharegetId == null ? null : sharegetId.trim();
    }

    /**
     * 关联活动表
     *
     * @return activity_id
     */
    public String getActivityId() {
        return activityId;
    }

    /**
     * 关联活动表
     *
     * @param activityId
     */
    public void setActivityId(String activityId) {
        this.activityId = activityId == null ? null : activityId.trim();
    }

    /**
     * 关联新闻表
     *
     * @return journalism_id
     */
    public String getJournalismId() {
        return journalismId;
    }

    /**
     * 关联新闻表
     *
     * @param journalismId
     */
    public void setJournalismId(String journalismId) {
        this.journalismId = journalismId == null ? null : journalismId.trim();
    }

    /**
     * 分享记录删除，1为删除
     *
     * @return sharing_records_delete
     */
    public Integer getSharingRecordsDelete() {
        return sharingRecordsDelete;
    }

    /**
     * 分享记录删除，1为删除
     *
     * @param sharingRecordsDelete
     */
    public void setSharingRecordsDelete(Integer sharingRecordsDelete) {
        this.sharingRecordsDelete = sharingRecordsDelete;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public Share init() {
        this.shareId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }
}