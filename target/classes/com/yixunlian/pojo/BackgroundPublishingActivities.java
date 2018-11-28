package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * td_background_publishing_activities
 */
@Table(name = "td_background_publishing_activities")
public class BackgroundPublishingActivities extends BasePojo {
    /**
     * 后台管理人员发布活动时，选择发布活动的类别表
     */
    @Id
    private String backgroundActivitiesTypeid;
    /**
     * 备注
     */
    private String remark;
    /**
     * 类别:选择判断，插入到那个表中
     */
    private String publishingType;

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
     * 后台管理人员发布活动时，选择发布活动的类别表
     *
     * @return background_activities_typeid
     */
    public String getBackgroundActivitiesTypeid() {
        return backgroundActivitiesTypeid;
    }

    /**
     * 后台管理人员发布活动时，选择发布活动的类别表
     *
     * @param backgroundActivitiesTypeid
     */
    public void setBackgroundActivitiesTypeid(String backgroundActivitiesTypeid) {
        this.backgroundActivitiesTypeid = backgroundActivitiesTypeid == null ? null : backgroundActivitiesTypeid.trim();
    }

    /**
     * 类别:选择判断，插入到那个表中
     *
     * @return publishing_type
     */
    public String getPublishingType() {
        return publishingType;
    }

    /**
     * 类别:选择判断，插入到那个表中
     *
     * @param publishingType
     */
    public void setPublishingType(String publishingType) {
        this.publishingType = publishingType == null ? null : publishingType.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}