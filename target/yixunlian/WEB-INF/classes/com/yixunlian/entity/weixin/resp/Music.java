/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: Music
 * Author:   yuanyuana
 * Date:     2018/11/4 17:40
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.weixin.resp;

/**
 * 〈一句话功能简述〉<br>
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/11/4
 * @since 1.0.0
 */
public class Music {
    /**
     * 音乐名称
     */
    private String Title;
    /**
     * 音乐描述
     */
    private String Description;
    /**
     * 音乐链接
     */
    private String MusicUrl;
    /**
     * 高质量音乐链接，WIFI环境优先使用该链接播放音乐
     */

    private String HQMusicUrl;

    public Music() {
    }

    public Music(String title, String description, String musicUrl, String HQMusicUrl) {
        Title = title;
        Description = description;
        MusicUrl = musicUrl;
        this.HQMusicUrl = HQMusicUrl;
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

    public String getMusicUrl() {
        return MusicUrl;
    }

    public void setMusicUrl(String musicUrl) {
        MusicUrl = musicUrl;
    }

    public String getHQMusicUrl() {
        return HQMusicUrl;
    }

    public void setHQMusicUrl(String musicUrl) {
        HQMusicUrl = musicUrl;
    }

}
