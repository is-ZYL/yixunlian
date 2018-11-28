/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: VoiceMessage
 * Author:   yuanyuana
 * Date:     2018/11/4 17:27
 * Description: 请求消息之语音消息
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.weixin.req;

/**
 * 〈一句话功能简述〉<br>
 * 〈请求消息之语音消息〉
 *
 * @author yuanyuana
 * @create 2018/11/4
 * @since 1.0.0
 */
public class VoiceMessage extends BaseMessage {
    /**
     * 媒体ID
     */
    private String MediaId;
    /**
     * 语音格式
     */
    private String Format;

    public VoiceMessage(String mediaId, String format) {
        MediaId = mediaId;
        Format = format;
    }

    public VoiceMessage(String fromUserName, String toUserName, String mediaId, String format) {
        super(fromUserName, toUserName);
        MediaId = mediaId;
        Format = format;
    }

    public String getMediaId() {
        return MediaId;
    }

    public void setMediaId(String mediaId) {
        MediaId = mediaId;
    }

    public String getFormat() {
        return Format;
    }

    public void setFormat(String format) {
        Format = format;
    }
}
