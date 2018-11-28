/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: LocationMessage
 * Author:   yuanyuana
 * Date:     2018/11/4 17:24
 * Description: 请求消息之地理位置消息
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.weixin.req;

/**
 * 〈一句话功能简述〉<br>
 * 〈请求消息之地理位置消息〉
 *
 * @author yuanyuana
 * @create 2018/11/4
 * @since 1.0.0
 */
public class LocationMessage extends BaseMessage {
    /**
     * 地理位置纬度
     */
    private String Location_X;
    /**
     * 地理位置经度
     */
    private String Location_Y;
    /**
     * 地图缩放大小
     */
    private String Scale;
    /**
     * 地理位置信息
     */
    private String Label;

    public LocationMessage(String location_X, String location_Y, String scale, String label) {
        Location_X = location_X;
        Location_Y = location_Y;
        Scale = scale;
        Label = label;
    }

    public LocationMessage(String fromUserName, String toUserName, String location_X, String location_Y, String scale, String label) {
        super(fromUserName, toUserName);
        Location_X = location_X;
        Location_Y = location_Y;
        Scale = scale;
        Label = label;
    }

    public String getLocation_X() {
        return Location_X;
    }

    public void setLocation_X(String location_X) {
        Location_X = location_X;
    }

    public String getLocation_Y() {
        return Location_Y;
    }

    public void setLocation_Y(String location_Y) {
        Location_Y = location_Y;
    }

    public String getScale() {
        return Scale;
    }

    public void setScale(String scale) {
        Scale = scale;
    }

    public String getLabel() {
        return Label;
    }

    public void setLabel(String label) {
        Label = label;
    }
}

