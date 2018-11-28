/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: TextMessage
 * Author:   yuanyuana
 * Date:     2018/11/4 17:38
 * Description: 响应消息之文本消息
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.weixin.resp;

/**
 * 〈一句话功能简述〉<br>
 * 〈响应消息之文本消息〉
 *
 * @author yuanyuana
 * @create 2018/11/4
 * @since 1.0.0
 */
public class TextMessage extends BaseMessage {
    /**
     * 回复的消息内容
     */
    private String Content;

    public TextMessage() {
        super();
    }

    public TextMessage(String toUserName, String fromUserName, Long createTime, String msgType, int funcFlag, String content) {
        super(toUserName, fromUserName, createTime, msgType, funcFlag);
        Content = content;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }
}

