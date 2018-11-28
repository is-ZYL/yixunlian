package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

/**
 * td_memberupdateextract
 */
@Table(name = "td_memberupdateextract")
public class Memberupdateextract extends BasePojo {
    /**
     * 会员升级归属人所得提成表
     */
    @Id
    private String memberupdateextractId;

    /**
     * 会员升级时归属人为以下角色时： 0为VIP客户经理，1为助创/公益基金
     */
    private Integer memberUpdateExtractType;

    /**
     * 升级角色：0推荐VIP客户经理，1推荐普通客户经理
     */
    private String typeId;

    /**
     * 归属人提成金额
     */
    private BigDecimal memberUpdateMoney;

    /**
     *
     */
    private Date created;

    /**
     *
     */
    private Date updated;

    /**
     * 备注
     */
    private String remark;

    public static Memberupdateextract getMemberupdateextract() {
        return new Memberupdateextract();
    }

    /**
     * 会员升级归属人所得提成表
     *
     * @return memberupdateextract_id
     */
    public String getMemberupdateextractId() {
        return memberupdateextractId;
    }

    /**
     * 会员升级归属人所得提成表
     *
     * @param memberupdateextractId
     */
    public void setMemberupdateextractId(String memberupdateextractId) {
        this.memberupdateextractId = memberupdateextractId == null ? null : memberupdateextractId.trim();
    }

    /**
     * 会员升级时归属人为以下角色时： 0为VIP客户经理，1为助创/公益基金
     *
     * @return member_update_extract_type
     */
    public Integer getMemberUpdateExtractType() {
        return memberUpdateExtractType;
    }

    /**
     * 会员升级时归属人为以下角色时： 0为VIP客户经理，1为助创/公益基金
     *
     * @param memberUpdateExtractType
     */
    public void setMemberUpdateExtractType(Integer memberUpdateExtractType) {
        this.memberUpdateExtractType = memberUpdateExtractType;
    }

    /**
     * 升级角色：0推荐VIP客户经理，1推荐普通客户经理
     *
     * @return
     */
    public String getTypeId() {
        return typeId;
    }

    /**
     * 升级角色：0推荐VIP客户经理，1推荐普通客户经理
     *
     * @param typeId
     */
    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    /**
     * 归属人提成金额
     *
     * @return member_update_money
     */
    public BigDecimal getMemberUpdateMoney() {
        return memberUpdateMoney;
    }

    /**
     * 归属人提成金额
     *
     * @param memberUpdateMoney
     */
    public void setMemberUpdateMoney(BigDecimal memberUpdateMoney) {
        this.memberUpdateMoney = memberUpdateMoney;
    }

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

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public Memberupdateextract init() {
        this.memberupdateextractId = UUID.randomUUID().toString().replace("-", "");
        return this;
    }

}