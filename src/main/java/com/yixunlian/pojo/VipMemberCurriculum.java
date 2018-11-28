package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

/**
 * td_vip_member_curriculum
 */
@Table(name = "td_vip_member_curriculum")
public class VipMemberCurriculum extends BasePojo {
    /**
     * 升级为易商同学汇+Vip客户经理的课程表
     */
    @Id
    private String vipMemberCurriculumId;

    /**
     * 课程名字
     */
    private String vipMemberCurriculumName;

    /**
     * 课程介绍
     */
    private String vipMemberCurriculumIntroduction;

    /**
     * 价格
     */
    private BigDecimal vipMemberCurriculumPrice;

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
     * 升级为易商同学汇+Vip客户经理的课程表
     *
     * @return vip_member_curriculum_id
     */
    public String getVipMemberCurriculumId() {
        return vipMemberCurriculumId;
    }

    /**
     * 升级为易商同学汇+Vip客户经理的课程表
     *
     * @param vipMemberCurriculumId
     */
    public void setVipMemberCurriculumId(String vipMemberCurriculumId) {
        this.vipMemberCurriculumId = vipMemberCurriculumId == null ? null : vipMemberCurriculumId.trim();
    }

    /**
     * 课程名字
     *
     * @return vip_member_curriculum_name
     */
    public String getVipMemberCurriculumName() {
        return vipMemberCurriculumName;
    }

    /**
     * 课程名字
     *
     * @param vipMemberCurriculumName
     */
    public void setVipMemberCurriculumName(String vipMemberCurriculumName) {
        this.vipMemberCurriculumName = vipMemberCurriculumName == null ? null : vipMemberCurriculumName.trim();
    }

    /**
     * 课程介绍
     *
     * @return vip_member_curriculum_introduction
     */
    public String getVipMemberCurriculumIntroduction() {
        return vipMemberCurriculumIntroduction;
    }

    /**
     * 课程介绍
     *
     * @param vipMemberCurriculumIntroduction
     */
    public void setVipMemberCurriculumIntroduction(String vipMemberCurriculumIntroduction) {
        this.vipMemberCurriculumIntroduction = vipMemberCurriculumIntroduction == null ? null : vipMemberCurriculumIntroduction.trim();
    }

    /**
     * 价格
     *
     * @return vip_member_curriculum_price
     */
    public BigDecimal getVipMemberCurriculumPrice() {
        return vipMemberCurriculumPrice;
    }

    /**
     * 价格
     *
     * @param vipMemberCurriculumPrice
     */
    public void setVipMemberCurriculumPrice(BigDecimal vipMemberCurriculumPrice) {
        this.vipMemberCurriculumPrice = vipMemberCurriculumPrice;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.vipMemberCurriculumId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}