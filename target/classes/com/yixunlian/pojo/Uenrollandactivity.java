package com.yixunlian.pojo;

import lombok.*;

import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
@Table(name = "td_uenrollandactivity")
public class Uenrollandactivity extends BasePojo {
    /**
     * 活动报名表
     */
    @Id
    private String uandactivityenrollId;

    /**
     * 报名用户id
     */
    private String userId;

    /**
     * 报名用户昵称
     */
    private String uNickname;

    /**
     * 报名用户性别（0为女1为男）
     */
    private Integer uSex;

    /**
     * 报名用户电话号码
     */
    private String uPhone;

    /**
     * 报名用户更改过后的头像
     */
    private String changeHeadUrl;

    /**
     * 活动id
     */
    private String activityId;

    /**
     * 活动主办方id
     */
    private String organizerId;

    /**
     * 活动类别id
     */
    private String activitycategoryId;

    /**
     * 用户每个活动收费对应的支付状态0，为未成交，1为已成交
     */
    private Integer dealStatus;

    /**
     * 每个用户的成交金额
     */
    private BigDecimal transactionNum;

    /**
     * 签到状态，0为未签到，1表示已签到
     */
    private Integer usersignStatus;

    /**
     * 支付提成给经理人的支付状态 0 未支付  1已支付
     */
    private Integer paymentStatus;

    /**
     * 提交提成给系统平台的金额，每个客户经理的提成金额
     */
    private BigDecimal paymentNum;

    /**
     * 数据状态，0 正常 ，1 不能使用
     */
    private Integer status;

    /**
     * 备注
     */
    private String remark;

    /**
     * 活动邀约人
     */
    private String eventSharer;


    /**
     * 活动邀约人会员号
     */
    private String eventSharerMemberid;

    /**
     * 主办方对每个活动的每个报名用户的备注
     */
    private String remar;

    public static Uenrollandactivity getUenrollAndActivity() {
        return new Uenrollandactivity();
    }
}