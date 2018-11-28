package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_qrcode
 */
@Table(name = "td_qrcode")
public class Qrcode extends BasePojo {
    /**
     * 二维码id
     */
    @Id
    private String qrcodeId;

    /**
     * 二维码存放路径
     */
    private String qrcodeUrl;

    /**
     * 二维码类型 0 活动分享 1 VIP客户体验邀请
     */
    private Integer qrcodeType;

    /**
     * 关联用户id
     */
    private String qrcodeUserId;

    /**
     * 关联活动id
     */
    private String qrcodeActivityId;

    /**
     * 二维码id
     *
     * @return qrcode_id
     */
    public String getQrcodeId() {
        return qrcodeId;
    }

    /**
     * 二维码id
     *
     * @param qrcodeId
     */
    public void setQrcodeId(String qrcodeId) {
        this.qrcodeId = qrcodeId == null ? null : qrcodeId.trim();
    }

    /**
     * 二维码存放路径
     *
     * @return qrcode_url
     */
    public String getQrcodeUrl() {
        return qrcodeUrl;
    }

    /**
     * 二维码存放路径
     *
     * @param qrcodeUrl
     */
    public void setQrcodeUrl(String qrcodeUrl) {
        this.qrcodeUrl = qrcodeUrl == null ? null : qrcodeUrl.trim();
    }

    /**
     * 二维码类型 0 活动分享 1 VIP客户体验邀请
     *
     * @return qrcode_type
     */
    public Integer getQrcodeType() {
        return qrcodeType;
    }

    /**
     * 二维码类型 0 活动分享 1 VIP客户体验邀请
     *
     * @param qrcodeType
     */
    public void setQrcodeType(Integer qrcodeType) {
        this.qrcodeType = qrcodeType;
    }

    /**
     * 关联用户id
     *
     * @return qrcode_user_id
     */
    public String getQrcodeUserId() {
        return qrcodeUserId;
    }

    /**
     * 关联用户id
     *
     * @param qrcodeUserId
     */
    public void setQrcodeUserId(String qrcodeUserId) {
        this.qrcodeUserId = qrcodeUserId == null ? null : qrcodeUserId.trim();
    }

    /**
     * 关联活动id
     *
     * @return qrcode_activity_id
     */
    public String getQrcodeActivityId() {
        return qrcodeActivityId;
    }

    /**
     * 关联活动id
     *
     * @param qrcodeActivityId
     */
    public void setQrcodeActivityId(String qrcodeActivityId) {
        this.qrcodeActivityId = qrcodeActivityId == null ? null : qrcodeActivityId.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public static Qrcode getQrcode() {
        return new Qrcode();
    }

    public Qrcode init() {
        Date date = new Date();
        this.qrcodeId = UUID.randomUUID().toString().replace("-", "");
        this.setUpdated(date);
        this.setCreated(date);
        return this;
    }

}