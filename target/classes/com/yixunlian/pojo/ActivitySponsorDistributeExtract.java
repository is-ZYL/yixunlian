package com.yixunlian.pojo;

import lombok.*;

import javax.persistence.Table;
import java.math.BigDecimal;

/**
 * td_activity_sponsor_distribute_extract
 */
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
@Table(name = "td_activity_sponsor_distribute_extract")
public class ActivitySponsorDistributeExtract extends BasePojo {
    /**
     * 活动主办方发放每笔提成金额去向比率表
     */
    private String activitySponsorDistributeExtractId;

    /**
     * 活动主办方分发提成对象：0为主办方推荐人（注册时的推荐人）1为（活动分享人）普通会员分享二选一，2（活动分享人）拥有资源库的人分享或输出资源二选一，3，公益基金
     */
    private Integer activitySponsorDistributeExtractType;

    /**
     * 分发比率
     */
    private BigDecimal activitySponsorDistributeExtractRate;

    /**
     * 备注
     */
    private String remark;

    public static ActivitySponsorDistributeExtract getActivitySponsorDistributeExtract() {
        return new ActivitySponsorDistributeExtract();
    }
}