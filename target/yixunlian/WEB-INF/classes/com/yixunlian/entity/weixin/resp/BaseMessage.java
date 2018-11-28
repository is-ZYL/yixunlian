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
package com.yixunlian.entity.weixin.resp;

import com.thoughtworks.xstream.annotations.XStreamAlias;

import java.io.Serializable;

/**
 * 〈一句话功能简述〉<br>
 * 〈用户请求响应基类 （公众帐号 -> 普通用户）〉
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
     * 接收方帐号（收到的OpenID）
     */
    @XStreamAlias("FromUserName")
    private String FromUserName;
    /**
     * 消息创建时间 （整型）
     */
    @XStreamAlias("CreateTime")
    private Long CreateTime;

    /**
     * 消息类型（text/music/news）
     */
    @XStreamAlias("MsgType")
    private String MsgType;

    /**
     * 位0x0001被标志时，星标刚收到的消息
     */
    private int FuncFlag;

    public BaseMessage() {
        super();
    }

    public BaseMessage(String toUserName, String fromUserName, Long createTime, String msgType, int funcFlag) {
        ToUserName = toUserName;
        FromUserName = fromUserName;
        CreateTime = createTime;
        MsgType = msgType;
        FuncFlag = funcFlag;
    }

    public int getFuncFlag() {
        return FuncFlag;
    }

    public void setFuncFlag(int funcFlag) {
        FuncFlag = funcFlag;
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

