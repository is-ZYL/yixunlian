package com.yixunlian.pojo.system;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SysLeaveWord {
    /**
     * 主键id
     */
    private Long id;

    /**
     * 用户id
     */
    private String userId;

    /**
     * 
     */
    private String time;



    /**
     * 用户留言
     */
    private String leaveWord;

    public SysLeaveWord(Long id, String userId, String time, Date created, Date updated) {
        this.id = id;
        this.userId = userId;
        this.time = time;

    }

    public SysLeaveWord(Long id, String userId, String time, Date created, Date updated, String leaveWord) {
        this.id = id;
        this.userId = userId;
        this.time = time;

        this.leaveWord = leaveWord;
    }

    public SysLeaveWord() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }



    public String getLeaveWord() {
        return leaveWord;
    }

    public void setLeaveWord(String leaveWord) {
        this.leaveWord = leaveWord == null ? null : leaveWord.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }
}