/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ArticlesItem
 * Author:   yuanyuana
 * Date:     2018/11/3 22:34
 * Description: 图文消息中的ArticlesItem类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.weixin.resp;

import com.thoughtworks.xstream.annotations.XStreamAlias;

import java.io.Serializable;

/**
 * 〈一句话功能简述〉<br>
 * 〈图文消息model类〉
 *
 * @author yuanyuana
 * @create 2018/11/3
 * @since 1.0.0
 */
@XStreamAlias("item")
public class ArticlesItem implements Serializable {
    /**
     * 图文消息名称
     */
    @XStreamAlias("Title")
    private String Title;

    /**
     * 图文消息描述
     */
    @XStreamAlias("Description")
    private String Description;
    /**
     * 图片链接，支持JPG、PNG格式，较好的效果为大图640*320，小图80*80，限制图片链接的域名需要与开发者填写的基本资料中的Url一致
     */
    @XStreamAlias("PicUrl")
    private String PicUrl;

    /**
     * 点击图文消息跳转链接
     */
    @XStreamAlias("Url")
    private String Url;

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

    public String getPicUrl() {
        return PicUrl;
    }

    public void setPicUrl(String picUrl) {
        PicUrl = picUrl;
    }

    public String getUrl() {
        return Url;
    }

    public void setUrl(String url) {
        Url = url;
    }
}
