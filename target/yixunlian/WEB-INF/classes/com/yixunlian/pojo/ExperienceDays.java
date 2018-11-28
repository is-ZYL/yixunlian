package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_experience_days
 */
@Table(name = "td_experience_days")
public class ExperienceDays extends BasePojo {
    /**
     * 普通客户和客户经理体验vip客户经理天数
     */
    @Id
    private String experienceDaysId;

    /**
     * 体验天数
     */
    private Integer experienceDays;

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
     * 普通客户和客户经理体验vip客户经理天数
     *
     * @return experience_days_id
     */
    public String getExperienceDaysId() {
        return experienceDaysId;
    }

    /**
     * 普通客户和客户经理体验vip客户经理天数
     *
     * @param experienceDaysId
     */
    public void setExperienceDaysId(String experienceDaysId) {
        this.experienceDaysId = experienceDaysId == null ? null : experienceDaysId.trim();
    }

    /**
     * 体验天数
     *
     * @return experience_days
     */
    public Integer getExperienceDays() {
        return experienceDays;
    }

    /**
     * 体验天数
     *
     * @param experienceDays
     */
    public void setExperienceDays(Integer experienceDays) {
        this.experienceDays = experienceDays;
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
        this.experienceDaysId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }

}