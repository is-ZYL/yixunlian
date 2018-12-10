/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: UserTransactionInfo
 * Author:   yuanyuana
 * Date:     2018/12/10 9:53
 * Description: 用户活动成交信息
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity;

import com.yixunlian.pojo.TransactionItem;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈用户活动成交信息〉
 *
 * @author yuanyuana
 * @create 2018/12/10
 * @since 1.0.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class UserTransactionInfo {

    /**
     * 主办方完善客户成交信息list
     */
    private List<TransactionItem> transactionItems;

    /**
     * 活动id
     */
    private String activityId;

    /**
     * 用户id
     */
    private String userId;

    /**
     * 当前用户token（主办发token）
     */
    private String token;
    /**
     * 主办方设置当前用户为成交
     */
    private Integer dealStatus;

}
