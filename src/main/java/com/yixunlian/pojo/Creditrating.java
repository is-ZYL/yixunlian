package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_creditrating
 */
@Table(name = "td_creditrating")
public class Creditrating extends BasePojo {
    /**
     * 信用值
     */
    @Id
    private String creditrdId;

    /**
     * 信用值等级:0~10为分数，10~50为十字星，50~250为五角星，250~1250为月亮，以上为太阳
     */
    private Integer creditRating;

    /**
     * 等级区间最大值
     */
    private Integer creditratingMax;

    /**
     * 等级区间最小值
     */
    private Integer creditratingMix;
    /**
     * 备注
     */
    private String remark;

    /**
     * 信用值
     *
     * @return creditrd_id
     */
    public String getCreditrdId() {
        return creditrdId;
    }

    /**
     * 信用值
     *
     * @param creditrdId
     */
    public void setCreditrdId(String creditrdId) {
        this.creditrdId = creditrdId == null ? null : creditrdId.trim();
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

    /**
     * 信用值等级:0~10为分数，10~50为十字星，50~250为五角星，250~1250为月亮，以上为太阳
     *
     * @return credit_rating
     */
    public Integer getCreditRating() {
        return creditRating;
    }

    /**
     * 信用值等级:0~10为分数，10~50为十字星，50~250为五角星，250~1250为月亮，以上为太阳
     *
     * @param creditRating
     */
    public void setCreditRating(Integer creditRating) {
        this.creditRating = creditRating;
    }

    /**
     * 等级区间最大值
     *
     * @return creditrating_max
     */
    public Integer getCreditratingMax() {
        return creditratingMax;
    }

    /**
     * 等级区间最大值
     *
     * @param creditratingMax
     */
    public void setCreditratingMax(Integer creditratingMax) {
        this.creditratingMax = creditratingMax;
    }

    /**
     * 等级区间最小值
     *
     * @return creditrating_mix
     */
    public Integer getCreditratingMix() {
        return creditratingMix;
    }

    /**
     * 等级区间最小值
     *
     * @param creditratingMix
     */
    public void setCreditratingMix(Integer creditratingMix) {
        this.creditratingMix = creditratingMix;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.creditrdId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}