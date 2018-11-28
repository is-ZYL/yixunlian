/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ImageMessage
 * Author:   yuanyuana
 * Date:     2018/11/4 17:23
 * Description: 请求消息之图片消息
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.weixin.req;

/**
 * 〈一句话功能简述〉<br>
 * 〈请求消息之图片消息〉
 *
 * @author yuanyuana
 * @create 2018/11/4
 * @since 1.0.0
 */
public class ImageMessage extends BaseMessage {
    /**
     * 图片链接
     */
    private String PicUrl;

    public ImageMessage(String picUrl) {
        PicUrl = picUrl;
    }

    public ImageMessage(String fromUserName, String toUserName, String picUrl) {
        super(fromUserName, toUserName);
        PicUrl = picUrl;
    }

    public String getPicUrl() {
        return PicUrl;
    }

    public void setPicUrl(String picUrl) {
        PicUrl = picUrl;
    }
}

