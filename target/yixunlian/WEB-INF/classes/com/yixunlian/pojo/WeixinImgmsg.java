package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * weixin_imgmsg
 */
@Table(name = "weixin_imgmsg")
public class WeixinImgmsg extends BasePojo {
    /**
     *
     */
    @Id
    private String imgmsgId;

    /**
     * 关键词
     */
    private String keyword;

    /**
     * 创建时间
     */
    private String createtime;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 备注
     */
    private String bz;

    /**
     * 标题1
     */
    private String title1;

    /**
     * 描述1
     */
    private String description1;

    /**
     * 图片地址1
     */
    private String imgurl1;

    /**
     * 超链接1
     */
    private String tourl1;

    /**
     * 标题2
     */
    private String title2;

    /**
     * 描述2
     */
    private String description2;

    /**
     * 图片地址2
     */
    private String imgurl2;

    /**
     * 超链接2
     */
    private String tourl2;

    /**
     * 标题3
     */
    private String title3;

    /**
     * 描述3
     */
    private String description3;

    /**
     * 图片地址3
     */
    private String imgurl3;

    /**
     * 超链接3
     */
    private String tourl3;

    /**
     * 标题4
     */
    private String title4;

    /**
     * 描述4
     */
    private String description4;

    /**
     * 图片地址4
     */
    private String imgurl4;

    /**
     * 超链接4
     */
    private String tourl4;

    /**
     * 标题5
     */
    private String title5;

    /**
     * 描述5
     */
    private String description5;

    /**
     * 图片地址5
     */
    private String imgurl5;

    /**
     * 超链接5
     */
    private String tourl5;

    /**
     * 标题6
     */
    private String title6;

    /**
     * 描述6
     */
    private String description6;

    /**
     * 图片地址6
     */
    private String imgurl6;

    /**
     * 超链接6
     */
    private String tourl6;

    /**
     * 标题7
     */
    private String title7;

    /**
     * 描述7
     */
    private String description7;

    /**
     * 图片地址7
     */
    private String imgurl7;

    /**
     * 超链接7
     */
    private String tourl7;

    /**
     * 标题8
     */
    private String title8;

    /**
     * 描述8
     */
    private String description8;

    /**
     * 图片地址8
     */
    private String imgurl8;

    /**
     * 超链接8
     */
    private String tourl8;

    /**
     * 备注
     */
    private String remark;

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
     * @return IMGMSG_ID
     */
    public String getImgmsgId() {
        return imgmsgId;
    }

    /**
     * @param imgmsgId
     */
    public void setImgmsgId(String imgmsgId) {
        this.imgmsgId = imgmsgId == null ? null : imgmsgId.trim();
    }

    /**
     * 关键词
     *
     * @return KEYWORD
     */
    public String getKeyword() {
        return keyword;
    }

    /**
     * 关键词
     *
     * @param keyword
     */
    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    /**
     * 创建时间
     *
     * @return CREATETIME
     */
    public String getCreatetime() {
        return createtime;
    }

    /**
     * 创建时间
     *
     * @param createtime
     */
    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    /**
     * 状态
     *
     * @return STATUS
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 状态
     *
     * @param status
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 备注
     *
     * @return BZ
     */
    public String getBz() {
        return bz;
    }

    /**
     * 备注
     *
     * @param bz
     */
    public void setBz(String bz) {
        this.bz = bz == null ? null : bz.trim();
    }

    /**
     * 标题1
     *
     * @return TITLE1
     */
    public String getTitle1() {
        return title1;
    }

    /**
     * 标题1
     *
     * @param title1
     */
    public void setTitle1(String title1) {
        this.title1 = title1 == null ? null : title1.trim();
    }

    /**
     * 描述1
     *
     * @return DESCRIPTION1
     */
    public String getDescription1() {
        return description1;
    }

    /**
     * 描述1
     *
     * @param description1
     */
    public void setDescription1(String description1) {
        this.description1 = description1 == null ? null : description1.trim();
    }

    /**
     * 图片地址1
     *
     * @return IMGURL1
     */
    public String getImgurl1() {
        return imgurl1;
    }

    /**
     * 图片地址1
     *
     * @param imgurl1
     */
    public void setImgurl1(String imgurl1) {
        this.imgurl1 = imgurl1 == null ? null : imgurl1.trim();
    }

    /**
     * 超链接1
     *
     * @return TOURL1
     */
    public String getTourl1() {
        return tourl1;
    }

    /**
     * 超链接1
     *
     * @param tourl1
     */
    public void setTourl1(String tourl1) {
        this.tourl1 = tourl1 == null ? null : tourl1.trim();
    }

    /**
     * 标题2
     *
     * @return TITLE2
     */
    public String getTitle2() {
        return title2;
    }

    /**
     * 标题2
     *
     * @param title2
     */
    public void setTitle2(String title2) {
        this.title2 = title2 == null ? null : title2.trim();
    }

    /**
     * 描述2
     *
     * @return DESCRIPTION2
     */
    public String getDescription2() {
        return description2;
    }

    /**
     * 描述2
     *
     * @param description2
     */
    public void setDescription2(String description2) {
        this.description2 = description2 == null ? null : description2.trim();
    }

    /**
     * 图片地址2
     *
     * @return IMGURL2
     */
    public String getImgurl2() {
        return imgurl2;
    }

    /**
     * 图片地址2
     *
     * @param imgurl2
     */
    public void setImgurl2(String imgurl2) {
        this.imgurl2 = imgurl2 == null ? null : imgurl2.trim();
    }

    /**
     * 超链接2
     *
     * @return TOURL2
     */
    public String getTourl2() {
        return tourl2;
    }

    /**
     * 超链接2
     *
     * @param tourl2
     */
    public void setTourl2(String tourl2) {
        this.tourl2 = tourl2 == null ? null : tourl2.trim();
    }

    /**
     * 标题3
     *
     * @return TITLE3
     */
    public String getTitle3() {
        return title3;
    }

    /**
     * 标题3
     *
     * @param title3
     */
    public void setTitle3(String title3) {
        this.title3 = title3 == null ? null : title3.trim();
    }

    /**
     * 描述3
     *
     * @return DESCRIPTION3
     */
    public String getDescription3() {
        return description3;
    }

    /**
     * 描述3
     *
     * @param description3
     */
    public void setDescription3(String description3) {
        this.description3 = description3 == null ? null : description3.trim();
    }

    /**
     * 图片地址3
     *
     * @return IMGURL3
     */
    public String getImgurl3() {
        return imgurl3;
    }

    /**
     * 图片地址3
     *
     * @param imgurl3
     */
    public void setImgurl3(String imgurl3) {
        this.imgurl3 = imgurl3 == null ? null : imgurl3.trim();
    }

    /**
     * 超链接3
     *
     * @return TOURL3
     */
    public String getTourl3() {
        return tourl3;
    }

    /**
     * 超链接3
     *
     * @param tourl3
     */
    public void setTourl3(String tourl3) {
        this.tourl3 = tourl3 == null ? null : tourl3.trim();
    }

    /**
     * 标题4
     *
     * @return TITLE4
     */
    public String getTitle4() {
        return title4;
    }

    /**
     * 标题4
     *
     * @param title4
     */
    public void setTitle4(String title4) {
        this.title4 = title4 == null ? null : title4.trim();
    }

    /**
     * 描述4
     *
     * @return DESCRIPTION4
     */
    public String getDescription4() {
        return description4;
    }

    /**
     * 描述4
     *
     * @param description4
     */
    public void setDescription4(String description4) {
        this.description4 = description4 == null ? null : description4.trim();
    }

    /**
     * 图片地址4
     *
     * @return IMGURL4
     */
    public String getImgurl4() {
        return imgurl4;
    }

    /**
     * 图片地址4
     *
     * @param imgurl4
     */
    public void setImgurl4(String imgurl4) {
        this.imgurl4 = imgurl4 == null ? null : imgurl4.trim();
    }

    /**
     * 超链接4
     *
     * @return TOURL4
     */
    public String getTourl4() {
        return tourl4;
    }

    /**
     * 超链接4
     *
     * @param tourl4
     */
    public void setTourl4(String tourl4) {
        this.tourl4 = tourl4 == null ? null : tourl4.trim();
    }

    /**
     * 标题5
     *
     * @return TITLE5
     */
    public String getTitle5() {
        return title5;
    }

    /**
     * 标题5
     *
     * @param title5
     */
    public void setTitle5(String title5) {
        this.title5 = title5 == null ? null : title5.trim();
    }

    /**
     * 描述5
     *
     * @return DESCRIPTION5
     */
    public String getDescription5() {
        return description5;
    }

    /**
     * 描述5
     *
     * @param description5
     */
    public void setDescription5(String description5) {
        this.description5 = description5 == null ? null : description5.trim();
    }

    /**
     * 图片地址5
     *
     * @return IMGURL5
     */
    public String getImgurl5() {
        return imgurl5;
    }

    /**
     * 图片地址5
     *
     * @param imgurl5
     */
    public void setImgurl5(String imgurl5) {
        this.imgurl5 = imgurl5 == null ? null : imgurl5.trim();
    }

    /**
     * 超链接5
     *
     * @return TOURL5
     */
    public String getTourl5() {
        return tourl5;
    }

    /**
     * 超链接5
     *
     * @param tourl5
     */
    public void setTourl5(String tourl5) {
        this.tourl5 = tourl5 == null ? null : tourl5.trim();
    }

    /**
     * 标题6
     *
     * @return TITLE6
     */
    public String getTitle6() {
        return title6;
    }

    /**
     * 标题6
     *
     * @param title6
     */
    public void setTitle6(String title6) {
        this.title6 = title6 == null ? null : title6.trim();
    }

    /**
     * 描述6
     *
     * @return DESCRIPTION6
     */
    public String getDescription6() {
        return description6;
    }

    /**
     * 描述6
     *
     * @param description6
     */
    public void setDescription6(String description6) {
        this.description6 = description6 == null ? null : description6.trim();
    }

    /**
     * 图片地址6
     *
     * @return IMGURL6
     */
    public String getImgurl6() {
        return imgurl6;
    }

    /**
     * 图片地址6
     *
     * @param imgurl6
     */
    public void setImgurl6(String imgurl6) {
        this.imgurl6 = imgurl6 == null ? null : imgurl6.trim();
    }

    /**
     * 超链接6
     *
     * @return TOURL6
     */
    public String getTourl6() {
        return tourl6;
    }

    /**
     * 超链接6
     *
     * @param tourl6
     */
    public void setTourl6(String tourl6) {
        this.tourl6 = tourl6 == null ? null : tourl6.trim();
    }

    /**
     * 标题7
     *
     * @return TITLE7
     */
    public String getTitle7() {
        return title7;
    }

    /**
     * 标题7
     *
     * @param title7
     */
    public void setTitle7(String title7) {
        this.title7 = title7 == null ? null : title7.trim();
    }

    /**
     * 描述7
     *
     * @return DESCRIPTION7
     */
    public String getDescription7() {
        return description7;
    }

    /**
     * 描述7
     *
     * @param description7
     */
    public void setDescription7(String description7) {
        this.description7 = description7 == null ? null : description7.trim();
    }

    /**
     * 图片地址7
     *
     * @return IMGURL7
     */
    public String getImgurl7() {
        return imgurl7;
    }

    /**
     * 图片地址7
     *
     * @param imgurl7
     */
    public void setImgurl7(String imgurl7) {
        this.imgurl7 = imgurl7 == null ? null : imgurl7.trim();
    }

    /**
     * 超链接7
     *
     * @return TOURL7
     */
    public String getTourl7() {
        return tourl7;
    }

    /**
     * 超链接7
     *
     * @param tourl7
     */
    public void setTourl7(String tourl7) {
        this.tourl7 = tourl7 == null ? null : tourl7.trim();
    }

    /**
     * 标题8
     *
     * @return TITLE8
     */
    public String getTitle8() {
        return title8;
    }

    /**
     * 标题8
     *
     * @param title8
     */
    public void setTitle8(String title8) {
        this.title8 = title8 == null ? null : title8.trim();
    }

    /**
     * 描述8
     *
     * @return DESCRIPTION8
     */
    public String getDescription8() {
        return description8;
    }

    /**
     * 描述8
     *
     * @param description8
     */
    public void setDescription8(String description8) {
        this.description8 = description8 == null ? null : description8.trim();
    }

    /**
     * 图片地址8
     *
     * @return IMGURL8
     */
    public String getImgurl8() {
        return imgurl8;
    }

    /**
     * 图片地址8
     *
     * @param imgurl8
     */
    public void setImgurl8(String imgurl8) {
        this.imgurl8 = imgurl8 == null ? null : imgurl8.trim();
    }

    /**
     * 超链接8
     *
     * @return TOURL8
     */
    public String getTourl8() {
        return tourl8;
    }

    /**
     * 超链接8
     *
     * @param tourl8
     */
    public void setTourl8(String tourl8) {
        this.tourl8 = tourl8 == null ? null : tourl8.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}