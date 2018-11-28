package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_utype_andvipmember_curriculum
 */
@Table(name = "td_utype_andvipmember_curriculum")
public class UtypeAndvipmemberCurriculum extends BasePojo {
    /**
     *
     */
    @Id
    private String utypeAndvipmemberCurriculumId;

    /**
     * 升级为易商同学汇+Vip客户经理的课程表
     */
    private String vipMemberCurriculumId;

    /**
     * 用户等级
     */
    private String utypeId;

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
     * @return utype_andvipmember_curriculum_id
     */
    public String getUtypeAndvipmemberCurriculumId() {
        return utypeAndvipmemberCurriculumId;
    }

    /**
     * @param utypeAndvipmemberCurriculumId
     */
    public void setUtypeAndvipmemberCurriculumId(String utypeAndvipmemberCurriculumId) {
        this.utypeAndvipmemberCurriculumId = utypeAndvipmemberCurriculumId == null ? null : utypeAndvipmemberCurriculumId.trim();
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
     * 用户等级
     *
     * @return utype_id
     */
    public String getUtypeId() {
        return utypeId;
    }

    /**
     * 用户等级
     *
     * @param utypeId
     */
    public void setUtypeId(String utypeId) {
        this.utypeId = utypeId == null ? null : utypeId.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.utypeAndvipmemberCurriculumId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}