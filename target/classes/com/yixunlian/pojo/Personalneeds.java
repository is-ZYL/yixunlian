package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.shiro.util.ThreadState;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_personalneeds
 */
@Table(name = "td_personalneeds")
public class Personalneeds extends BasePojo {
    /**
     * 个人需求
     */
    @Id
    private String personalneedsId;

    /**
     * 个人需求类型
     */
    private String personalneedsType;

    /**
     * 个人需求与活动类别关联
     */
    private String activitycategoryId;

    /**
     * 备注
     */
    private String remark;

    public static Personalneeds getPersonalNeeds() {
        return new Personalneeds();
    }

    public String getActivitycategoryId() {
        return activitycategoryId;
    }

    public void setActivitycategoryId(String activitycategoryId) {
        this.activitycategoryId = activitycategoryId;
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
     * 个人需求
     *
     * @return personalneeds_id
     */
    public String getPersonalneedsId() {
        return personalneedsId;
    }

    /**
     * 个人需求
     *
     * @param personalneedsId
     */
    public void setPersonalneedsId(String personalneedsId) {
        this.personalneedsId = personalneedsId == null ? null : personalneedsId.trim();
    }

    /**
     * 个人需求类型
     *
     * @return personalneeds_type
     */
    public String getPersonalneedsType() {
        return personalneedsType;
    }

    /**
     * 个人需求类型
     *
     * @param personalneedsType
     */
    public void setPersonalneedsType(String personalneedsType) {
        this.personalneedsType = personalneedsType == null ? null : personalneedsType.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public Personalneeds init() {
        this.personalneedsId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }

}
