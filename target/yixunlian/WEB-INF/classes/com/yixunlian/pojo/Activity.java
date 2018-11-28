package com.yixunlian.pojo;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_activity
 */
@Table(name = "td_activity")
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder(toBuilder = true)
public class Activity extends BasePojo {

    /**
     * 活动表
     */
    @Id
    @NonNull
    private String activityId;
    /**
     * 关联用户表
     */
    @NonNull
    private String userId;
    /**
     * 主办方名称
     */
    private String userNickName;
    /**
     * 活动名称
     */
    private String activityName;
    /**
     * 关联活动类别表id
     */
    private String activitycategoryId;
    /**
     * 活动类别名称
     */
    private String activitycategoryName;
    /**
     * 活动报名开始时间
     */
    private Date activitysignStarttime;
    /**
     * 活动结束报名时间
     */
    private Date activitysignEndtime;
    /**
     * 活动开始时间
     */
    private Date activitystartTime;
    /**
     * 活动结束时间
     */
    @DateTimeFormat(pattern = "YYYY-MM-DD hh:mm:ss")
    private Date activityendTime;
    /**
     * 活动人数
     */
    private Integer activityCountpersons;
    /**
     * 活动费用，0为免费，1，收费
     */
    private Integer activityChargestatus;
    /**
     * 0为平台代收，1为线下支付
     */
    private Integer activityChargemethod;
    /**
     * 0为线上，1线下
     */
    private Integer activityType;
    /**
     * 活动区域详细地址信息
     */
    private String citycode;
    /**
     * 系统自动匹配精准客户的区域省
     */
    private String precisionDemandProvinceId;
    /**
     * 活动举办地址名称
     */
    private String addressName;
    /**
     * 活动匹配地址名称
     */
    private String precisionDemandAddressName;
    /**
     * 系统自动匹配精准客户的区域市
     */
    private String precisionDemandCityId;
    /**
     * 系统自动匹配精准客户的区域区
     */
    private String precisionDemandAreaId;
    /**
     * 活动举办地址—省
     */
    private String provinceCitycode;
    /**
     * 活动举办地址--市
     */
    private String cityCitycode;
    /**
     * 活动举办地址--区
     */
    private String areaCitycode;
    /**
     * 分享摘要
     */
    private String shareAbstract;
    /**
     * 详细地址经度
     */
    private String lng;
    /**
     * 详细地址纬度
     */
    private String lat;
    /**
     * 活动封面图
     */
    private String activityCoverimgurl;
    /**
     * 是否设置提成0，为否，1为是
     */
    private Integer activityIsextract;
    /**
     * 活动详情，上传h5
     */
    private String activityDetailsurl;
    /**
     * 关联活动音乐表
     */
    private String activitymusicId;
    /**
     * 活动上下架情况，活动发布者上架为0，下架为1，管理员上架为2，下架为3，草稿为4
     */
    private Integer onlineStatus;
    /**
     * 活动报名状态，0为未开始，1为报名中，2为已经报名结束
     */
    private Integer activitySignupstatus;
    /**
     * 活动状态，0为活动未开始，1为活动进行中，2活动已经结束
     */
    private Integer activityStatus;
    /**
     * 活动二维码路径
     */
    private String activityQrcode;
    /**
     * 下架原因：只有平台下架才显示的下架原因
     */
    private String undercarriageReason;
    /**
     * 备注
     */
    private String remark;
    /**
     * 活动浏览量
     */
    private Integer views;
    /**
     * 活动报名人数
     */
    private Integer joinNum;
    /**
     * 活动支付状态 0未支付 ,1 未支付
     */
    private Integer paymentResult;

    public static Activity getActivity() {
        return new Activity();
    }

    public Activity init() {
        this.activityId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        //设置浏览量为0
        this.setViews(0);
        //活动报名状态，0为未开始，1为报名中，2为已经报名结束
        this.setActivitySignupstatus(0);
        //活动状态，0为活动未开始，1为活动进行中，2活动已经结束
        this.setActivityStatus(0);
        return this;
    }
}