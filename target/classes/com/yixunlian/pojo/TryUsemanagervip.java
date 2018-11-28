package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_try_usemanagervip
 */
@Table(name = "td_try_usemanagervip")
public class TryUsemanagervip extends BasePojo {
    /**
     * 用户试用vip表
     */
    @Id
    private String tryUsevipId;

    /**
     * 试用天数
     */
    private Integer tryUsevipDays;

    /**
     * 试用vip客户经理天数
     */
    private Date tryUsevipStartday;

    /**
     * 关联用户类型表的体验vip客户经理
     */
    private String utypeId;

    /**
     * 用户试用vip表
     * @return try_useVip_id 
     */
    public String getTryUsevipId() {
        return tryUsevipId;
    }

    /**
     * 用户试用vip表
     * @param tryUsevipId 
     */
    public void setTryUsevipId(String tryUsevipId) {
        this.tryUsevipId = tryUsevipId == null ? null : tryUsevipId.trim();
    }

    /**
     * 试用天数
     * @return try_useVip_days 
     */
    public Integer getTryUsevipDays() {
        return tryUsevipDays;
    }

    /**
     * 试用天数
     * @param tryUsevipDays 
     */
    public void setTryUsevipDays(Integer tryUsevipDays) {
        this.tryUsevipDays = tryUsevipDays;
    }

    /**
     * 试用vip客户经理天数
     * @return try_useVip_startDay 
     */
    public Date getTryUsevipStartday() {
        return tryUsevipStartday;
    }

    /**
     * 试用vip客户经理天数
     * @param tryUsevipStartday 
     */
    public void setTryUsevipStartday(Date tryUsevipStartday) {
        this.tryUsevipStartday = tryUsevipStartday;
    }

    /**
     * 关联用户类型表的体验vip客户经理
     * @return utype_id 
     */
    public String getUtypeId() {
        return utypeId;
    }

    /**
     * 关联用户类型表的体验vip客户经理
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
        this.tryUsevipId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}