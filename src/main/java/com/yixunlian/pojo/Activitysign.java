package com.yixunlian.pojo;

import lombok.*;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * td_activitysign
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "td_activitysign")
public class Activitysign extends BasePojo {

    /**
     * 活动报名填写项表
     */
    @Id
    private String activitySignid;
    /**
     * 活动id
     */
    private String activityId;

    /**
     * 用户id
     */
    private String userId;

    /**
     * 填写项id
     */
    private String fillInItemId;

    /**
     * 填写项名称
     */
    private String fillInItemName;

    /**
     * 用户填写的内容
     */
    private String fillInItemVal;

    /**
     * 备注
     */
    private String remark;

}