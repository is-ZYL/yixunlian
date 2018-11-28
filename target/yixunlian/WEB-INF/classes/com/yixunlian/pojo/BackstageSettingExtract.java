package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * td_backstage_setting_extract
 */
@Table(name = "td_backstage_setting_extract")
public class BackstageSettingExtract extends BasePojo {
    /**
     * 后台设置提成分类明细表
     */
    @Id
    private String backstageSettingExtractId;

    /**
     * 提成类型
     */
    private String extractType;

    /**
     * 提成比率
     */
    private Long extractRete;
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
     * 后台设置提成分类明细表
     *
     * @return backstage_setting_extract_id
     */
    public String getBackstageSettingExtractId() {
        return backstageSettingExtractId;
    }

    /**
     * 后台设置提成分类明细表
     *
     * @param backstageSettingExtractId
     */
    public void setBackstageSettingExtractId(String backstageSettingExtractId) {
        this.backstageSettingExtractId = backstageSettingExtractId == null ? null : backstageSettingExtractId.trim();
    }

    /**
     * 提成类型
     *
     * @return extract_type
     */
    public String getExtractType() {
        return extractType;
    }

    /**
     * 提成类型
     *
     * @param extractType
     */
    public void setExtractType(String extractType) {
        this.extractType = extractType == null ? null : extractType.trim();
    }

    /**
     * 提成比率
     *
     * @return extract_rete
     */
    public Long getExtractRete() {
        return extractRete;
    }

    /**
     * 提成比率
     *
     * @param extractRete
     */
    public void setExtractRete(Long extractRete) {
        this.extractRete = extractRete;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}