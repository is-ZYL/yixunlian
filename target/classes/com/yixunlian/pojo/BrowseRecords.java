package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_browse_records
 */
@Table(name = "td_browse_records")
public class BrowseRecords extends BasePojo {
    /**
     * 浏览记录表
     */
    @Id
    private String browseRecordsId;

    /**
     * 关联新闻表，
     */
    private String journalismId;

    /**
     * 活动表
     */
    private String activityId;

    /**
     * 浏览记录类型，0为新闻，1为活动
     */
    private Integer browseRecordsStatus;

    /**
     * 关联用户表
     */
    private String userId;
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
     * 浏览记录表
     *
     * @return browse_records_id
     */
    public String getBrowseRecordsId() {
        return browseRecordsId;
    }

    /**
     * 浏览记录表
     *
     * @param browseRecordsId
     */
    public void setBrowseRecordsId(String browseRecordsId) {
        this.browseRecordsId = browseRecordsId == null ? null : browseRecordsId.trim();
    }

    /**
     * 关联新闻表，
     *
     * @return journalism_id
     */
    public String getJournalismId() {
        return journalismId;
    }

    /**
     * 关联新闻表，
     *
     * @param journalismId
     */
    public void setJournalismId(String journalismId) {
        this.journalismId = journalismId == null ? null : journalismId.trim();
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
     * 浏览记录类型，0为新闻，1为活动
     *
     * @return browse_records_status
     */
    public Integer getBrowseRecordsStatus() {
        return browseRecordsStatus;
    }

    /**
     * 浏览记录类型，0为新闻，1为活动
     *
     * @param browseRecordsStatus
     */
    public void setBrowseRecordsStatus(Integer browseRecordsStatus) {
        this.browseRecordsStatus = browseRecordsStatus;
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

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.browseRecordsId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}