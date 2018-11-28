package com.yixunlian.entity;

/**
 * created with Intellij IDEA
 *
 * @author : yuanyuana
 * Date : 2018-10-25
 * Time : 14:39
 */
public enum ResultEnum {

    SUCCESS("200", "成功"),
    ERROR("204", "失败");

    private String code;

    private String msg;

    ResultEnum(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public String getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
