/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: a
 * Author:   yuanyuana
 * Date:     2018/10/31 18:34
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
public class WeiXinQRCode {
    private String ticket;
    private int expire_seconds;
    private String url;

    public String getTicket() {
        return ticket;
    }

    public void setTicket(String ticket) {
        this.ticket = ticket;
    }

    public int getExpire_seconds() {
        return expire_seconds;
    }

    public void setExpire_seconds(int expireSeconds) {
        expire_seconds = expireSeconds;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}

