/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ActivitySingInfo
 * Author:   yuanyuana
 * Date:     2018/12/3 15:49
 * Description: 活动报名参数
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity;

import com.yixunlian.pojo.Activitysign;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈活动报名参数〉
 *
 * @author yuanyuana
 * @create 2018/12/3
 * @since 1.0.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class ActivitySingInfo {
    /**
     * 当前报名用户token
     */
    private String token;
    /**
     * 活动id
     */
    private String activityId;
    /**
     * 活动报名分享人token
     */
    private String activityShareToken;
    /**
     * 报名填写项信息
     */
    private List<Activitysign> activitySign;
}
