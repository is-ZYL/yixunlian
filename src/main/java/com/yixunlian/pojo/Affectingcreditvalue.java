package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_affectingcreditvalue
 */
@Table(name = "td_affectingcreditvalue")
public class Affectingcreditvalue extends BasePojo {
    /**
     * 信用值影响记录表
     */
    @Id
    private String affectingcreditvalueId;

    /**
     * 信用值影响因素
     */
    private String affectingcreditvalueName;

    /**
     * 信用值影响值
     */
    private Integer affectingcreditvalueNum;

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
     * 信用值影响记录表
     *
     * @return affectingcreditvalue_id
     */
    public String getAffectingcreditvalueId() {
        return affectingcreditvalueId;
    }

    /**
     * 信用值影响记录表
     *
     * @param affectingcreditvalueId
     */
    public void setAffectingcreditvalueId(String affectingcreditvalueId) {
        this.affectingcreditvalueId = affectingcreditvalueId == null ? null : affectingcreditvalueId.trim();
    }

    /**
     * 信用值影响因素
     *
     * @return affectingcreditvalue_name
     */
    public String getAffectingcreditvalueName() {
        return affectingcreditvalueName;
    }

    /**
     * 信用值影响因素
     *
     * @param affectingcreditvalueName
     */
    public void setAffectingcreditvalueName(String affectingcreditvalueName) {
        this.affectingcreditvalueName = affectingcreditvalueName == null ? null : affectingcreditvalueName.trim();
    }

    /**
     * 信用值影响值
     *
     * @return affectingcreditvalue_num
     */
    public Integer getAffectingcreditvalueNum() {
        return affectingcreditvalueNum;
    }

    /**
     * 信用值影响值
     *
     * @param affectingcreditvalueNum
     */
    public void setAffectingcreditvalueNum(Integer affectingcreditvalueNum) {
        this.affectingcreditvalueNum = affectingcreditvalueNum;
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
        this.affectingcreditvalueId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}