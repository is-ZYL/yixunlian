package com.yixunlian.pojo;

import lombok.*;

import javax.persistence.Table;

/**
 * td_advertisementimage
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
@EqualsAndHashCode(callSuper = true)
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
     * 0为下架 表示首页不展示，1为上线
     */
    private Integer isOnlineStatus;

    /**
     * 备注
     */
    private String remark;

}

