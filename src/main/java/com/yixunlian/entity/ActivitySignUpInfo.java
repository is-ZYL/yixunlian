/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ActivitySignUpInfo
 * Author:   yuanyuana
 * Date:     2018/12/3 18:23
 * Description: 用户填写的活动报名信息
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity;

import com.yixunlian.pojo.Activitysign;
import com.yixunlian.pojo.TransactionItem;
import com.yixunlian.pojo.Uenrollandactivity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈用户填写的活动报名信息〉
 *
 * @author yuanyuana
 * @create 2018/12/3
 * @since 1.0.0
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder(toBuilder = true)
public class ActivitySignUpInfo {

    private Uenrollandactivity uen;
    /**
     * 用户填写的报名信息
     */
    private List<Activitysign> act;
    /**
     * 用户的成交信息
     */
    private List<TransactionItem> trans;

    public static ActivitySignUpInfo getActivitySignUpInfo() {
        return new ActivitySignUpInfo();
    }

}
