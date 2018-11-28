package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_membershipwelfare
 */
@Table(name = "td_membershipwelfare")
public class Membershipwelfare extends BasePojo {
    /**
     * 会员福利表
     */
    @Id
    private String welfareId;

    /**
     * 会员福利图片路径
     */
    private String welfareImgurl;

    /**
     * 设置分享次数条件
     */
    private Integer welfareSharecount;

    /**
     * 福利标题
     */
    private String welfareTitle;

    /**
     * 会员福利详情
     */
    private String welfareContext;

    /**
     * 分享条件，分享活动需要报名并签到成功几个人限定
     */
    private Integer welfareCondition;
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
     * 会员福利表
     *
     * @return welfare_id
     */
    public String getWelfareId() {
        return welfareId;
    }

    /**
     * 会员福利表
     *
     * @param welfareId
     */
    public void setWelfareId(String welfareId) {
        this.welfareId = welfareId == null ? null : welfareId.trim();
    }

    /**
     * 会员福利图片路径
     *
     * @return welfare_imgurl
     */
    public String getWelfareImgurl() {
        return welfareImgurl;
    }

    /**
     * 会员福利图片路径
     *
     * @param welfareImgurl
     */
    public void setWelfareImgurl(String welfareImgurl) {
        this.welfareImgurl = welfareImgurl == null ? null : welfareImgurl.trim();
    }

    /**
     * 设置分享次数条件
     *
     * @return welfare_sharecount
     */
    public Integer getWelfareSharecount() {
        return welfareSharecount;
    }

    /**
     * 设置分享次数条件
     *
     * @param welfareSharecount
     */
    public void setWelfareSharecount(Integer welfareSharecount) {
        this.welfareSharecount = welfareSharecount;
    }

    /**
     * 福利标题
     *
     * @return welfare_title
     */
    public String getWelfareTitle() {
        return welfareTitle;
    }

    /**
     * 福利标题
     *
     * @param welfareTitle
     */
    public void setWelfareTitle(String welfareTitle) {
        this.welfareTitle = welfareTitle == null ? null : welfareTitle.trim();
    }

    /**
     * 会员福利详情
     *
     * @return welfare_context
     */
    public String getWelfareContext() {
        return welfareContext;
    }

    /**
     * 会员福利详情
     *
     * @param welfareContext
     */
    public void setWelfareContext(String welfareContext) {
        this.welfareContext = welfareContext == null ? null : welfareContext.trim();
    }

    /**
     * 分享条件，分享活动需要报名并签到成功几个人限定
     *
     * @return welfare_condition
     */
    public Integer getWelfareCondition() {
        return welfareCondition;
    }

    /**
     * 分享条件，分享活动需要报名并签到成功几个人限定
     *
     * @param welfareCondition
     */
    public void setWelfareCondition(Integer welfareCondition) {
        this.welfareCondition = welfareCondition;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.welfareId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}