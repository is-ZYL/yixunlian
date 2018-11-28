package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_taxrevenue
 */
@Table(name = "td_taxrevenue")
public class Taxrevenue extends BasePojo {
    /**
     * 后台设置税收表
     */
    @Id
    private String taxrevenueId;

    /**
     * 税率小数
     */
    private Long taxrevenueRate;

    /**
     * 税收状态：为1是为当前税率，其他未往期汇率
     */
    private Integer taxrevenueStatus;

    /**
     * 后台设置税收表
     * @return taxrevenue_id 
     */
    public String getTaxrevenueId() {
        return taxrevenueId;
    }

    /**
     * 后台设置税收表
     * @param taxrevenueId 
     */
    public void setTaxrevenueId(String taxrevenueId) {
        this.taxrevenueId = taxrevenueId == null ? null : taxrevenueId.trim();
    }

    /**
     * 税率小数
     * @return taxrevenue_rate 
     */
    public Long getTaxrevenueRate() {
        return taxrevenueRate;
    }

    /**
     * 税率小数
     * @param taxrevenueRate 
     */
    public void setTaxrevenueRate(Long taxrevenueRate) {
        this.taxrevenueRate = taxrevenueRate;
    }

    /**
     * 税收状态：为1是为当前税率，其他未往期汇率
     * @return taxrevenue_status 
     */
    public Integer getTaxrevenueStatus() {
        return taxrevenueStatus;
    }

    /**
     * 税收状态：为1是为当前税率，其他未往期汇率
     * @param taxrevenueStatus 
     */
    public void setTaxrevenueStatus(Integer taxrevenueStatus) {
        this.taxrevenueStatus = taxrevenueStatus;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.taxrevenueId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}