package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_activitycategory
 */
@Table(name = "td_activitycategory")
public class Activitycategory extends BasePojo {
    /**
     * 活动类别表
     */
    @Id
    private String activitycategoryId;

    /**
     * 活动类别
     */
    private String activitycategoryName;

    /**
     *
     */
    private Date created;

    /**
     *
     */
    private Date updated;

    /**
     * 关联调研表
     */
    private String readingsurveyId;

    /**
     * 备注
     */
    private String remark;

    public static Activitycategory getActivityCategory() {
        return new Activitycategory();
    }

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
     * 活动类别表
     *
     * @return activitycategory_id
     */
    public String getActivitycategoryId() {
        return activitycategoryId;
    }

    /**
     * 活动类别表
     *
     * @param activitycategoryId
     */
    public void setActivitycategoryId(String activitycategoryId) {
        this.activitycategoryId = activitycategoryId == null ? null : activitycategoryId.trim();
    }

    /**
     * 活动类别
     *
     * @return activitycategory_name
     */
    public String getActivitycategoryName() {
        return activitycategoryName;
    }

    /**
     * 活动类别
     *
     * @param activitycategoryName
     */
    public void setActivitycategoryName(String activitycategoryName) {
        this.activitycategoryName = activitycategoryName == null ? null : activitycategoryName.trim();
    }

    /**
     * 关联调研表
     *
     * @return readingsurvey_id
     */
    public String getReadingsurveyId() {
        return readingsurveyId;
    }

    /**
     * 关联调研表
     *
     * @param readingsurveyId
     */
    public void setReadingsurveyId(String readingsurveyId) {
        this.readingsurveyId = readingsurveyId == null ? null : readingsurveyId.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public Activitycategory init() {
        this.activitycategoryId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }
}