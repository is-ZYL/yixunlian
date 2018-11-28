package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_activityprojectandacsign
 */
@Table(name = "td_activityprojectandacsign")
public class Activityprojectandacsign extends BasePojo {
    /**
     * 每个活动的项目表,关联活动报名表
     */
    @Id
    private String activityprojectId;

    /**
     * 一个活动，每个项目的项目名字
     */
    private String activityprojectName;

    /**
     * 每个项目的收费
     */
    private Long activityprojectMoney;

    /**
     * 关联活动报名表，一对多
     */
    private String uandactivityenrollId;

    /**
     * 关联活动表
     */
    private String activityId;
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
     * 每个活动的项目表,关联活动报名表
     *
     * @return activityproject_id
     */
    public String getActivityprojectId() {
        return activityprojectId;
    }

    /**
     * 每个活动的项目表,关联活动报名表
     *
     * @param activityprojectId
     */
    public void setActivityprojectId(String activityprojectId) {
        this.activityprojectId = activityprojectId == null ? null : activityprojectId.trim();
    }

    /**
     * 一个活动，每个项目的项目名字
     *
     * @return activityproject_name
     */
    public String getActivityprojectName() {
        return activityprojectName;
    }

    /**
     * 一个活动，每个项目的项目名字
     *
     * @param activityprojectName
     */
    public void setActivityprojectName(String activityprojectName) {
        this.activityprojectName = activityprojectName == null ? null : activityprojectName.trim();
    }

    /**
     * 每个项目的收费
     *
     * @return activityproject_money
     */
    public Long getActivityprojectMoney() {
        return activityprojectMoney;
    }

    /**
     * 每个项目的收费
     *
     * @param activityprojectMoney
     */
    public void setActivityprojectMoney(Long activityprojectMoney) {
        this.activityprojectMoney = activityprojectMoney;
    }

    /**
     * 关联活动报名表，一对多
     *
     * @return uAndactivityEnroll_id
     */
    public String getUandactivityenrollId() {
        return uandactivityenrollId;
    }

    /**
     * 关联活动报名表，一对多
     *
     * @param uandactivityenrollId
     */
    public void setUandactivityenrollId(String uandactivityenrollId) {
        this.uandactivityenrollId = uandactivityenrollId == null ? null : uandactivityenrollId.trim();
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

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.activityprojectId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}