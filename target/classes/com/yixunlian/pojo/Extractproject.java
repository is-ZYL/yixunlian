package com.yixunlian.pojo;

import lombok.*;

import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.UUID;

/**
 * td_extractproject
 */
@Table(name = "td_extractproject")
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder(toBuilder = true)
public class Extractproject extends BasePojo {
    /**
     * 发布设置提成项目表
     */
    @Id
    private String extractprojectId;

    /**
     * 提成项目
     */
    private String projectName;

    /**
     * 提成比列
     */
    private BigDecimal projectRate;

    /**
     * 提成金额
     */
    private BigDecimal projectMoney;

    /**
     * 关联活动表
     */
    private String activityId;
    /**
     * 备注
     */
    private String remark;

    public static Extractproject getExtractproject() {
        return new Extractproject();
    }

    public Extractproject init() {
        this.extractprojectId = UUID.randomUUID().toString().replace("-", "");
        return this;
    }
}