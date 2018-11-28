package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

/**
 * td_utype
 */
@Table(name = "td_utype")
public class Utype extends BasePojo {
    /**
     * 用户等级
     */
    @Id
    private String utypeId;

    /**
     * 用户充值等级
     */
    private String userType;

    /**
     * de等级使用天数
     */
    private Integer userDay;

    /**
     * 等级金额
     */
    private BigDecimal utypeCharge;

    /**
     * 备注
     */
    private String remark;

    public static Utype getUtype() {
        return new Utype();
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

    /**
     * 用户充值等级
     *
     * @return user_type
     */
    public String getUserType() {
        return userType;
    }

    /**
     * 用户充值等级
     *
     * @param userType
     */
    public void setUserType(String userType) {
        this.userType = userType == null ? null : userType.trim();
    }

    /**
     * de等级使用天数
     *
     * @return user_day
     */
    public Integer getUserDay() {
        return userDay;
    }

    /**
     * de等级使用天数
     *
     * @param userDay
     */
    public void setUserDay(Integer userDay) {
        this.userDay = userDay;
    }

    /**
     * 等级金额
     *
     * @return utype_charge
     */
    public BigDecimal getUtypeCharge() {
        return utypeCharge;
    }

    /**
     * 等级金额
     *
     * @param utypeCharge
     */
    public void setUtypeCharge(BigDecimal utypeCharge) {
        this.utypeCharge = utypeCharge;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.utypeId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }

}