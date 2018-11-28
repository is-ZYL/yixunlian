/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: LinkMessage
 * Author:   yuanyuana
 * Date:     2018/11/4 17:26
 * Description: 请求消息之链接消息
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.weixin.req;

/**
 * 〈一句话功能简述〉<br>
 * 〈请求消息之链接消息〉
 *
 * @author yuanyuana
 * @create 2018/11/4
 * @since 1.0.0
 */
public class LinkMessage extends BaseMessage {
    /**
     * 消息标题
     */
    private String Title;
    /**
     * 消息描述
     */
    private String Description;
    /**
     * 消息链接
     */
    private String Url;

    public LinkMessage(String title, String description, String url) {
        Title = title;
        Description = description;
        Url = url;
    }

    public LinkMessage(String fromUserName, String toUserName, String title, String description, String url) {
        super(fromUserName, toUserName);
        Title = title;
        Description = description;
        Url = url;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getUrl() {
        return Url;
    }

    public void setUrl(String url) {
        Url = url;
    }
}

