/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: Result
 * Author:   yuanyuana
 * Date:     2018/10/25 14:38
 * Description: 结果封装类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity;

/**
 * 〈一句话功能简述〉<br>
 * 〈结果封装类〉
 *
 * @author yuanyuana
 * @create 2018/10/25
 * @since 1.0.0
 */
public class Result<T> {

    /**
     * 错误码
     */
    private String code;

    /**
     * 提示信息
     */
    private String msg;

    /**
     * 具体的内容
     */
    private T data;

    private Result(T data) {
        this.code = ResultEnum.SUCCESS.getCode();
        this.msg = ResultEnum.SUCCESS.getMsg();
        this.data = data;
    }

    private Result(String msg) {
        this.code = ResultEnum.ERROR.getCode();
        this.data = null;
        this.msg = msg;
    }

    private Result(ResultEnum resultEnum) {
        this.code = resultEnum.getCode();
        this.msg = resultEnum.getMsg();
    }

    private Result(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    private Result(T data, String msg) {
        this.data = data;
        this.msg = msg;
    }

    private Result(String code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    /**
     * 成功时候的调用
     *
     * @param <T>
     * @return
     */
    public static <T> Result<T> success(String msg, T data) {
        return new Result<>("200", msg, data);
    }

    /**
     * 成功时候的调用
     *
     * @param <T>
     * @return
     */
    public static <T> Result<T> success(String code, String msg, T data) {
        return new Result<>(code, msg, data);
    }

    /**
     * 成功时候的调用
     *
     * @param <T>
     * @return
     */
    public static <T> Result<T> success() {
        return new Result<>("200", "成功", null);
    }

    /**
     * 成功时候的调用
     *
     * @param <T>
     * @return
     */
    public static <T> Result<T> success(String code, String msg) {
        return new Result<>(code, msg);
    }

    /**
     * 成功时候的调用
     *
     * @param <T>
     * @return
     */
    public static <T> Result<T> success(String msg) {
        return new Result<>("200", msg);
    }

    /**
     * 成功时候的调用
     *
     * @param <T>
     * @return
     */
    public static <T> Result<T> success(T data) {
        return new Result<>(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMsg(), data);
    }

    /**
     * 根据返回的状态对象， 构建返回结果
     *
     * @param resultEnum
     * @param <T>
     * @return
     */
    public static <T> Result<T> build(ResultEnum resultEnum) {
        return new Result<>(resultEnum);
    }

    /**
     * 根据 code， 和  msg 构建返回结果
     *
     * @param code
     * @param msg
     * @param <T>
     * @return
     */
    public static <T> Result<T> build(String code, String msg) {
        return new Result<T>(code, msg);
    }

    /**
     * 根据 code， 和  msg, 和 data 构建返回结果
     *
     * @param code
     * @param msg
     * @param <T>
     * @return
     */
    public static <T> Result<T> build(String code, String msg, T data) {
        return new Result<T>(code, msg, data);
    }

    /**
     * 失败的调用
     *
     * @param codeMsg
     * @param <T>
     * @return
     */
    public static <T> Result<T> error(String codeMsg) {
        return new Result<>("204", codeMsg);
    }

    /**
     * 失败的调用
     *
     * @param codeMsg
     * @param <T>
     * @return
     */
    public static <T> Result<T> error(String codeMsg, T data) {
        return new Result<>("204", codeMsg, data);
    }

    /**
     * 失败的调用
     *
     * @param codeMsg
     * @param <T>
     * @return
     */
    public static <T> Result<T> error(String code, String codeMsg) {
        return new Result<>(code, codeMsg);
    }

    /**
     * 失败的调用
     *
     * @param codeMsg
     * @param <T>
     * @return
     */
    public static <T> Result<T> error(String code, String codeMsg, T data) {
        return new Result<>(code, codeMsg, data);
    }

    /**
     * 失败的调用 将返回结果传入
     *
     * @param data
     * @param <T>
     * @return
     */
    public static <T> Result<T> error(T data) {
        return new Result<>(ResultEnum.ERROR.getCode(), ResultEnum.ERROR.getMsg(), data);
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
