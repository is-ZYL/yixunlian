/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ProfitListResult
 * Author:   yuanyuana
 * Date:     2018/10/9 20:14
 * Description: 收益记录数据封装类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;

import java.math.BigDecimal;
import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈收益记录数据封装类〉
 *
 * @author yuanyuana
 * @create 2018/10/9
 * @since 1.0.0
 */
public class ProfitListResult {

    // 定义jackson对象
    private static final ObjectMapper MAPPER = new ObjectMapper();

    /**
     * 总条数
     */
    private Long total;

    /**
     * 总收益
     */
    private BigDecimal allProfit;

    /**
     * 提成列表
     */
    private List<?> rows;

    /**
     * 已提现
     */
    private BigDecimal alreadyPresented;

    /**
     * 可提现
     */
    private BigDecimal canPresented;

    /**
     * 待提现
     */
    private BigDecimal toRaised;

    public ProfitListResult() {

    }

    public ProfitListResult(Long total, List<?> rows, BigDecimal alreadyPresented, BigDecimal canPresented, BigDecimal toRaised, BigDecimal allProfit) {
        this.total = total;
        this.rows = rows;
        this.alreadyPresented = alreadyPresented;
        this.canPresented = canPresented;
        this.toRaised = toRaised;
        this.allProfit = allProfit;
    }

    /**
     * Object是集合转化
     *
     * @param jsonData json数据
     * @param clazz    集合中的类型
     * @return
     */
    public static ProfitListResult formatToList(String jsonData, Class<?> clazz) {
        try {
            JsonNode jsonNode = MAPPER.readTree(jsonData);
            JsonNode data = jsonNode.get("rows");
            List<?> list = null;
            if (data.isArray() && data.size() > 0) {
                list = MAPPER.readValue(data.traverse(),
                        MAPPER.getTypeFactory().constructCollectionType(List.class, clazz));
            }
            return new ProfitListResult(jsonNode.get("total").getLongValue(), list, jsonNode.get("alreadyPresented").getDecimalValue(), jsonNode.get("canPresented").getDecimalValue(), jsonNode.get("toRaised").getDecimalValue(), jsonNode.get("allProfit").getDecimalValue());
        } catch (Exception e) {
            return null;
        }
    }

    public static ObjectMapper getMAPPER() {
        return MAPPER;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public List<?> getRows() {
        return rows;
    }

    public void setRows(List<?> rows) {
        this.rows = rows;
    }

    public BigDecimal getAlreadyPresented() {
        return alreadyPresented;
    }

    public void setAlreadyPresented(BigDecimal alreadyPresented) {
        this.alreadyPresented = alreadyPresented;
    }

    public BigDecimal getCanPresented() {
        return canPresented;
    }

    public void setCanPresented(BigDecimal canPresented) {
        this.canPresented = canPresented;
    }

    public BigDecimal getToRaised() {
        return toRaised;
    }

    public void setToRaised(BigDecimal toRaised) {
        this.toRaised = toRaised;
    }

    public BigDecimal getAllProfit() {
        return allProfit;
    }

    public void setAllProfit(BigDecimal allProfit) {
        this.allProfit = allProfit;
    }
}
