/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: WeiXinResult
 * Author:   yuanyuana
 * Date:     2018/10/31 18:17
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/10/31
 * @since 1.0.0
 */
public class WeiXinResult {
    /**
     * 返回的结果对象
     *
     * @author fjing
     */

    public static final int NEWSMSG = 1;            //图文消息
    private boolean isSuccess;
    private Object obj;
    private int type;
    private String msg;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public boolean isSuccess() {
        return isSuccess;
    }

    public void setSuccess(boolean isSuccess) {
        this.isSuccess = isSuccess;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }
}
