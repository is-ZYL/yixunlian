/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ResourceListResult
 * Author:   yuanyuana
 * Date:     2018/10/9 18:22
 * Description: 封装资源列表数据
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;

import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈封装资源列表数据〉
 *
 * @author yuanyuana
 * @create 2018/10/9
 * @since 1.0.0
 */
public class ResourceListResult {

    // 定义jackson对象
    private static final ObjectMapper MAPPER = new ObjectMapper();

    /**
     * 总人数
     */
    private Long total;

    /**
     * 列表
     */
    private List<?> rows;
    /**
     * 当月新增人数
     */
    private Integer thisMonthAddNums;
    /**
     * 当日新增
     */
    private Integer thisDayAddNums;
    /**
     * 当月推荐
     */
    private Integer thisMonthShareNums;
    /**
     * 当日推荐
     */
    private Integer thisDayShareNums;

    public ResourceListResult() {
    }

    public ResourceListResult(Long total, List<?> rows, Integer thisMonthAddNums, Integer thisDayAddNums, Integer thisMonthShareNums, Integer thisDayShareNums) {
        this.total = total;
        this.rows = rows;
        this.thisMonthAddNums = thisMonthAddNums;
        this.thisDayAddNums = thisDayAddNums;
        this.thisMonthShareNums = thisMonthShareNums;
        this.thisDayShareNums = thisDayShareNums;
    }

    /**
     * Object是集合转化
     *
     * @param jsonData json数据
     * @param clazz    集合中的类型
     * @return
     */
    public static ResourceListResult formatToList(String jsonData, Class<?> clazz) {
        try {
            JsonNode jsonNode = MAPPER.readTree(jsonData);
            JsonNode data = jsonNode.get("rows");
            List<?> list = null;
            if (data.isArray() && data.size() > 0) {
                list = MAPPER.readValue(data.traverse(),
                        MAPPER.getTypeFactory().constructCollectionType(List.class, clazz));
            }
            return new ResourceListResult(jsonNode.get("total").getLongValue(), list, jsonNode.get("thisMonthAddNums").getIntValue(), jsonNode.get("thisDayAddNums").getIntValue(), jsonNode.get("thisMonthShareNums").getIntValue(), jsonNode.get("thisDayShareNums").getIntValue());
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

    public Integer getThisMonthAddNums() {
        return thisMonthAddNums;
    }

    public void setThisMonthAddNums(Integer thisMonthAddNums) {
        this.thisMonthAddNums = thisMonthAddNums;
    }

    public Integer getThisDayAddNums() {
        return thisDayAddNums;
    }

    public void setThisDayAddNums(Integer thisDayAddNums) {
        this.thisDayAddNums = thisDayAddNums;
    }

    public Integer getThisMonthShareNums() {
        return thisMonthShareNums;
    }

    public void setThisMonthShareNums(Integer thisMonthShareNums) {
        this.thisMonthShareNums = thisMonthShareNums;
    }

    public Integer getThisDayShareNums() {
        return thisDayShareNums;
    }

    public void setThisDayShareNums(Integer thisDayShareNums) {
        this.thisDayShareNums = thisDayShareNums;
    }
}
