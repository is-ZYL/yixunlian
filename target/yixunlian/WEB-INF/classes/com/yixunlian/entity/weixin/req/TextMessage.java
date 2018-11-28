/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: TextMessage
 * Author:   yuanyuana
 * Date:     2018/11/4 17:22
 * Description: 请求消息之文本消息
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.weixin.req;

/**
 * 〈一句话功能简述〉<br>
 * 〈请求消息之文本消息〉
 *
 * @author yuanyuana
 * @create 2018/11/4
 * @since 1.0.0
 */
public class TextMessage extends BaseMessage {
    /**
     * 消息内容
     */
    private String Content;

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }
}

