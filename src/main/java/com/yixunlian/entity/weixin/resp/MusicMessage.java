/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: MusicMessage
 * Author:   yuanyuana
 * Date:     2018/11/4 17:39
 * Description: 响应消息之音乐消息
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.weixin.resp;

/**
 * 〈一句话功能简述〉<br>
 * 〈响应消息之音乐消息〉
 *
 * @author yuanyuana
 * @create 2018/11/4
 * @since 1.0.0
 */
public class MusicMessage extends BaseMessage {
    /**
     * 音乐
     */
    private Music Music;

    public Music getMusic() {
        return Music;
    }

    public void setMusic(Music music) {
        Music = music;
    }
}

