/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: UserInfo
 * Author:   yuanyuana
 * Date:     2018/9/25 17:03
 * Description: 封装前台传过来的数据
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.pojo;

import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈封装前台传过来的用户数据  用户激活〉
 *
 * @author yuanyuana
 * @create 2018/9/25
 * @since 1.0.0
 */
public class UserInfo {

    //user其他的数据
    private User user;

    //爱好集合
    private List<Uhobby> uhobbies;

    //爱好集合
    private List<Userandhobby> hobbyList;

    private String token;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public List<Uhobby> getUhobbies() {
        return uhobbies;
    }

    public void setUhobbies(List<Uhobby> uhobbies) {
        this.uhobbies = uhobbies;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Userandhobby> getHobbyList() {
        return hobbyList;
    }

    public void setHobbyList(List<Userandhobby> hobbyList) {
        this.hobbyList = hobbyList;
    }
}
