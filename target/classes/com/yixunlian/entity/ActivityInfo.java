/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ActivityInfo
 * Author:   yuanyuana
 * Date:     2018/11/6 14:59
 * Description: 活动详情
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity;

import com.yixunlian.pojo.Activity;
import com.yixunlian.pojo.ActivityChargeItem;
import com.yixunlian.pojo.ActivityFillInItem;
import com.yixunlian.pojo.Extractproject;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈活动详情〉
 *
 * @author yuanyuana
 * @create 2018/11/6
 * @since 1.0.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class ActivityInfo {
    /**
     * 活动详情
     */
    private Activity activity;
    /**
     * token值
     */
    private String token;

    /**
     * 保存类型  0 草稿 1发布
     */
    private Integer type = 0;
    /**
     * 收费项目list
     */
    private List<ActivityChargeItem> chargeItemList;
    /**
     * 提成项目
     */
    private List<Extractproject> extractprojectList;

    /**
     * 活动报名填写项
     */
    private List<ActivityFillInItem> fillInItems;

}
