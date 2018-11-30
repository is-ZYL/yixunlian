package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.UUID;

/**
 * td_report
 */
@Table(name = "td_report")
public class Report extends BasePojo {
    /**
     * 举报
     */
    @Id
    private String reportId;

    /**
     *
     */
    private String userId;

    /**
     * 举报活动
     */
    private String activityId;

    /**
     * 举报内容
     */
    private String reportContext;

    public static Report getReport() {
        return new Report();
    }

    /**
     * 举报
     *
     * @return report_id
     */
    public String getReportId() {
        return reportId;
    }

    /**
     * 举报
     *
     * @param reportId
     */
    public void setReportId(String reportId) {
        this.reportId = reportId == null ? null : reportId.trim();
    }

    /**
     * @return user_id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 举报活动
     *
     * @return activity_id
     */
    public String getActivityId() {
        return activityId;
    }

    /**
     * 举报活动
     *
     * @param activityId
     */
    public void setActivityId(String activityId) {
        this.activityId = activityId == null ? null : activityId.trim();
    }

    /**
     * 举报内容
     *
     * @return report_context
     */
    public String getReportContext() {
        return reportContext;
    }

    /**
     * 举报内容
     *
     * @param reportContext
     */
    public void setReportContext(String reportContext) {
        this.reportContext = reportContext == null ? null : reportContext.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public Report init() {
        this.reportId = UUID.randomUUID().toString().replace("-", "");
        return this;
    }
}