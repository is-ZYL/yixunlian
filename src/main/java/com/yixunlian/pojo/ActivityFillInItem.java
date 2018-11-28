package com.yixunlian.pojo;

import lombok.*;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_activity_fill_in_item
 */
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder(toBuilder = true)
@Table(name = "td_activity_fill_in_item")
public class ActivityFillInItem extends BasePojo {
    /**
     * 填写项目id(活动报名填写项)
     */
    @Id
    private String fillInItemId;

    /**
     * 活动id
     */
    private String activityId;

    /**
     * 填写项目名称
     */
    private String fillInItemName;

    /**
     * 报名填写项类型  0 后台设置必填项 ， 1 活动关联的填写项
     */
    private Integer type;

    /**
     * 备注
     */
    private String remark;

    public static ActivityFillInItem getInstance() {
        return new ActivityFillInItem();
    }

    public ActivityFillInItem init() {
        this.fillInItemId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
        this.setType(1);
        return this;
    }
}