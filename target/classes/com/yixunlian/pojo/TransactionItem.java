package com.yixunlian.pojo;

import lombok.*;

import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;

/**
 * td_transaction_item
 */
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder(toBuilder = true)
@Table(name = "td_transaction_item")
public class TransactionItem extends BasePojo {
    /**
     * 成交项目id
     */
    @Id
    private String transactionItemId;

    /**
     * 活动id
     */
    private String activityId;

    /**
     * 用户id
     */
    private String userId;

    /**
     * 成交项目名称
     */
    private String transactionItemName;

    /**
     * 成交金额
     */
    private BigDecimal transactionItemMoney;

    /**
     * 数据状态
     */
    private Integer status = 0;

    /**
     * 备注
     */
    private String remark;


}