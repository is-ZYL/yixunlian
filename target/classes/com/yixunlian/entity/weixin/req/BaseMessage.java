/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: BaseMessage
 * Author:   yuanyuana
 * Date:     2018/11/3 22:28
 * Description: 微信公众号请求消息的基类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.weixin.req;

import com.thoughtworks.xstream.annotations.XStreamAlias;

import java.io.Serializable;

/**
 * 〈一句话功能简述〉<br>
 * 〈微信公众号请求消息的基类 （普通用户 -> 公众帐号）〉
 *
 * @author yuanyuana
 * @create 2018/11/3
 * @since 1.0.0
 */
public class BaseMessage implements Serializable {
    /**
     * 开发者微信号
     */
    @XStreamAlias("ToUserName")
    private String ToUserName;
    /**
     * 发送方帐号（一个OpenID）
     */
    @XStreamAlias("FromUserName")
    private String FromUserName;
    /**
     * 消息创建时间 （整型）
     */
    @XStreamAlias("CreateTime")
    private Long CreateTime;

    /**
     * 消息类型（text/image/location/link）
     */
    @XStreamAlias("MsgType")
    private String MsgType;

    /**
     * 消息id，64位整型
     */
    private long MsgId;

    public BaseMessage() {
        super();
    }

    public BaseMessage(String fromUserName, String toUserName) {
        super();
        FromUserName = fromUserName;
        ToUserName = toUserName;
        CreateTime = System.currentTimeMillis();
    }

    public long getMsgId() {
        return MsgId;
    }

    public void setMsgId(long msgId) {
        MsgId = msgId;
    }

    public String getToUserName() {
        return ToUserName;
    }

    public void setToUserName(String toUserName) {
        ToUserName = toUserName;
    }

    public String getFromUserName() {
        return FromUserName;
    }

    public void setFromUserName(String fromUserName) {
        FromUserName = fromUserName;
    }

    public Long getCreateTime() {
        return CreateTime;
    }

    public void setCreateTime(Long createTime) {
        CreateTime = createTime;
    }

    public String getMsgType() {
        return MsgType;
    }

    public void setMsgType(String msgType) {
        MsgType = msgType;
    }
}

