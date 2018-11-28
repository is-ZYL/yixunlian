package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_readingsurvey
 */
@Table(name = "td_readingsurvey")
public class Readingsurvey extends BasePojo {
    /**
     * 阅读调研表
     */
    @Id
    private String readingsurveyId;

    /**
     * 阅读调研内容
     */
    private String readingsurveyContext;

    /**
     * 调研选择状态0为，不参加调研，1表示参加调研
     */
    private Integer readingsurveyStatus;
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
     * 阅读调研表
     *
     * @return readingsurvey_id
     */
    public String getReadingsurveyId() {
        return readingsurveyId;
    }

    /**
     * 阅读调研表
     *
     * @param readingsurveyId
     */
    public void setReadingsurveyId(String readingsurveyId) {
        this.readingsurveyId = readingsurveyId == null ? null : readingsurveyId.trim();
    }

    /**
     * 阅读调研内容
     *
     * @return readingsurvey_context
     */
    public String getReadingsurveyContext() {
        return readingsurveyContext;
    }

    /**
     * 阅读调研内容
     *
     * @param readingsurveyContext
     */
    public void setReadingsurveyContext(String readingsurveyContext) {
        this.readingsurveyContext = readingsurveyContext == null ? null : readingsurveyContext.trim();
    }

    /**
     * 调研选择状态0为，不参加调研，1表示参加调研
     *
     * @return readingsurvey_status
     */
    public Integer getReadingsurveyStatus() {
        return readingsurveyStatus;
    }

    /**
     * 调研选择状态0为，不参加调研，1表示参加调研
     *
     * @param readingsurveyStatus
     */
    public void setReadingsurveyStatus(Integer readingsurveyStatus) {
        this.readingsurveyStatus = readingsurveyStatus;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.readingsurveyId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}