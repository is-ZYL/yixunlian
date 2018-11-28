package com.yixunlian.pojo;

import util.myutils.UuidUtil;
import lombok.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * td_organizer_info
 */
@Table(name = "td_organizer_info")
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder(toBuilder = true)
public class OrganizerInfo extends BasePojo {
    /**
     * 主办方信息表
     */
    @Id
    private String organizerInfoId;

    /**
     * 头像
     */
    private String headUrl;

    /**
     * 名称
     */
    private String name;

    /**
     * 手机号
     */
    private String phone;

    /**
     * 绑定用户表
     */
    private String userId;

    /**
     * 备注
     */
    private String remark;

    /**
     * 简介
     */
    private String detailInfo;

    public static OrganizerInfo getcInstance() {
        return new OrganizerInfo();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public OrganizerInfo init() {
        this.organizerInfoId = UuidUtil.get32UUID();
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        return this;
    }
}