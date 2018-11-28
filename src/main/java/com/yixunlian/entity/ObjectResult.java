package com.yixunlian.entity;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;

import java.util.List;

public class ObjectResult implements Comparable<ObjectResult> {
    /**
     * 数量
     */
    private Integer total;

    private Object object;

    private Object name;

    public ObjectResult() {
    }

    public ObjectResult(Integer total, Object object, Object name) {
        this.total = total;
        this.object = object;
        this.name = name;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    public Object getName() {
        return name;
    }

    public void setName(Object name) {
        this.name = name;
    }

    @Override
    public int compareTo(ObjectResult o) {
        return this.getTotal() - o.getTotal();
    }
}
