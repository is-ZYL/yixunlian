package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Table;

/**
 * td_advertisementimage
 */
@Table(name = "td_advertisementimage")
public class Advertisementimage extends BasePojo {
    /**
     * 首页广告图片轮播图id
     */
    private Integer id;

    /**
     * 轮播图名字
     */
    private String imgName;

    /**
     * 轮播图路径
     */
    private String imgUrl;

    /**
     * 详情文件路径
     */
    private String advertisementDetailsurl;
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
     * 首页广告图片轮播图id
     *
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 首页广告图片轮播图id
     *
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 轮播图名字
     *
     * @return img_name
     */
    public String getImgName() {
        return imgName;
    }

    /**
     * 轮播图名字
     *
     * @param imgName
     */
    public void setImgName(String imgName) {
        this.imgName = imgName == null ? null : imgName.trim();
    }

    /**
     * 轮播图路径
     *
     * @return img_url
     */
    public String getImgUrl() {
        return imgUrl;
    }

    /**
     * 轮播图路径
     *
     * @param imgUrl
     */
    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl == null ? null : imgUrl.trim();
    }

    /**
     * 详情文件路径
     *
     * @return advertisement_detailsurl
     */
    public String getAdvertisementDetailsurl() {
        return advertisementDetailsurl;
    }

    /**
     * 详情文件路径
     *
     * @param advertisementDetailsurl
     */
    public void setAdvertisementDetailsurl(String advertisementDetailsurl) {
        this.advertisementDetailsurl = advertisementDetailsurl == null ? null : advertisementDetailsurl.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}