package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_user_experience_vip
 */
@Table(name = "td_user_experience_vip")
public class UserExperienceVip extends BasePojo {
    /**
     * 体验vip客户经理表
     */
    @Id
    private String experienceVipId;

    /**
     * 关联用户表，体验人
     */
    private String userId;

    /**
     * 关联用户类型，默认为5，体验vip用户类型
     */
    private String utypeId;

    /**
     * 体验VIP客户经理开始时间
     */
    private Date experienceVipStarttime;

    /**
     * 备注
     */
    private String remark;

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
     * 体验vip客户经理表
     *
     * @return experience_vip_id
     */
    public String getExperienceVipId() {
        return experienceVipId;
    }

    /**
     * 体验vip客户经理表
     *
     * @param experienceVipId
     */
    public void setExperienceVipId(String experienceVipId) {
        this.experienceVipId = experienceVipId == null ? null : experienceVipId.trim();
    }

    /**
     * 关联用户表，体验人
     *
     * @return user_id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 关联用户表，体验人
     *
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * 关联用户类型，默认为5，体验vip用户类型
     *
     * @return utype_id
     */
    public String getUtypeId() {
        return utypeId;
    }

    /**
     * 关联用户类型，默认为5，体验vip用户类型
     *
     * @param utypeId
     */
    public void setUtypeId(String utypeId) {
        this.utypeId = utypeId == null ? null : utypeId.trim();
    }

    /**
     * 体验VIP客户经理开始时间
     *
     * @return experience_vip_starttime
     */
    public Date getExperienceVipStarttime() {
        return experienceVipStarttime;
    }

    /**
     * 体验VIP客户经理开始时间
     *
     * @param experienceVipStarttime
     */
    public void setExperienceVipStarttime(Date experienceVipStarttime) {
        this.experienceVipStarttime = experienceVipStarttime;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public UserExperienceVip init() {
        this.experienceVipId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }
}