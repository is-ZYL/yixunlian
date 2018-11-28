package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_homekeywordslog
 */
@Table(name = "td_homekeywordslog")
public class Homekeywordslog extends BasePojo {
    /**
     * 首页关键词log图片
     */
    @Id
    private String homekeywordsId;

    /**
     * 关键词名字
     */
    private String homekeywordsName;

    /**
     * 关键词log图片
     */
    private String homekeywordsImgurl;

    /**
     * 关键词顺序
     */
    private Integer homekeywordsOrder;
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
     * 首页关键词log图片
     *
     * @return homekeywords_id
     */
    public String getHomekeywordsId() {
        return homekeywordsId;
    }

    /**
     * 首页关键词log图片
     *
     * @param homekeywordsId
     */
    public void setHomekeywordsId(String homekeywordsId) {
        this.homekeywordsId = homekeywordsId == null ? null : homekeywordsId.trim();
    }

    /**
     * 关键词名字
     *
     * @return homekeywords_name
     */
    public String getHomekeywordsName() {
        return homekeywordsName;
    }

    /**
     * 关键词名字
     *
     * @param homekeywordsName
     */
    public void setHomekeywordsName(String homekeywordsName) {
        this.homekeywordsName = homekeywordsName == null ? null : homekeywordsName.trim();
    }

    /**
     * 关键词log图片
     *
     * @return homekeywords_imgurl
     */
    public String getHomekeywordsImgurl() {
        return homekeywordsImgurl;
    }

    /**
     * 关键词log图片
     *
     * @param homekeywordsImgurl
     */
    public void setHomekeywordsImgurl(String homekeywordsImgurl) {
        this.homekeywordsImgurl = homekeywordsImgurl == null ? null : homekeywordsImgurl.trim();
    }

    /**
     * 关键词顺序
     *
     * @return homekeywords_order
     */
    public Integer getHomekeywordsOrder() {
        return homekeywordsOrder;
    }

    /**
     * 关键词顺序
     *
     * @param homekeywordsOrder
     */
    public void setHomekeywordsOrder(Integer homekeywordsOrder) {
        this.homekeywordsOrder = homekeywordsOrder;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.homekeywordsId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}