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
public class UmoneyResult {

    /**
     * 定义jackson对象
     */
    private static final ObjectMapper MAPPER = new ObjectMapper();

    /**
     * 总条数
     */
    private Long total;

    /**
     * 提现列表
     */
    private List<?> rows;

    /**
     * 已提现
     */
    private BigDecimal alreadyPresented;

    public UmoneyResult() {

    }

    public UmoneyResult(Long total, List<?> rows, BigDecimal alreadyPresented) {
        this.total = total;
        this.rows = rows;
        this.alreadyPresented = alreadyPresented;
    }

    /**
     * Object是集合转化
     *
     * @param jsonData json数据
     * @param clazz    集合中的类型
     * @return
     */
    public static UmoneyResult formatToList(String jsonData, Class<?> clazz) {
        try {
            JsonNode jsonNode = MAPPER.readTree(jsonData);
            JsonNode data = jsonNode.get("rows");
            List<?> list = null;
            if (data.isArray() && data.size() > 0) {
                list = MAPPER.readValue(data.traverse(),
                        MAPPER.getTypeFactory().constructCollectionType(List.class, clazz));
            }
            return new UmoneyResult(jsonNode.get("total").getLongValue(), list, jsonNode.get("alreadyPresented").getDecimalValue());
        } catch (Exception e) {
            return null;
        }
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

}
