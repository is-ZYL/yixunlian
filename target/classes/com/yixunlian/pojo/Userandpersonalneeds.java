package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;
import java.util.UUID;

/**
 * td_userandpersonalneeds
 */
@Table(name = "td_userandpersonalneeds")
public class Userandpersonalneeds extends BasePojo {
    /**
     * 用户和个人需求的第三方表，多对多
     */
    @Id
    private String userandpersonalneedsId;

    /**
     *
     */
    private String userId;

    /**
     * 个人需求表
     */
    private String personalneedsId;

    /**
     * 活动类型id
     */
    private String activitycategoryId;

    /**
     * 个人需求名称
     */
    @Transient
    private String personalneedsName;

    /**
     * 备注
     */
    private String remark;

    public static Userandpersonalneeds getUserandpersonalneeds() {
        return new Userandpersonalneeds();
    }

    /**
     * 备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark 备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 用户和个人需求的第三方表，多对多
     *
     * @return userAndpersonalneeds_id
     */
    public String getUserandpersonalneedsId() {
        return userandpersonalneedsId;
    }

    /**
     * 用户和个人需求的第三方表，多对多
     *
     * @param userandpersonalneedsId
     */
    public void setUserandpersonalneedsId(String userandpersonalneedsId) {
        this.userandpersonalneedsId = userandpersonalneedsId == null ? null : userandpersonalneedsId.trim();
    }

    /**
     * 个人需求名称
     */
    public String getPersonalneedsName() {
        return personalneedsName;
    }

    /**
     * 个人需求名称
     */
    public void setPersonalneedsName(String personalneedsName) {
        this.personalneedsName = personalneedsName;
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
     * 关联个人需求表
     *
     * @return personalneeds_id
     */
    public String getPersonalneedsId() {
        return personalneedsId;
    }

    /**
     * 关联个人需求表
     *
     * @param personalneedsId
     */
    public void setPersonalneedsId(String personalneedsId) {
        this.personalneedsId = personalneedsId == null ? null : personalneedsId.trim();
    }

    /**
     * 活动类别id
     *
     * @return
     */
    public String getActivitycategoryId() {
        return activitycategoryId;
    }

    /**
     * 活动类别id
     *
     * @param activitycategoryId
     */
    public void setActivitycategoryId(String activitycategoryId) {
        this.activitycategoryId = activitycategoryId;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public Userandpersonalneeds init() {
        this.userandpersonalneedsId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }
}