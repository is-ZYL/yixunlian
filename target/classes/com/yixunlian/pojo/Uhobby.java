package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_uhobby
 */
@Table(name = "td_uhobby")
public class Uhobby extends BasePojo {
    /**
     * 兴趣爱好
     */
    @Id
    private String hobbyId;

    /**
     * 兴趣爱好
     */
    private String hobbyName;

    /**
     * 兴趣爱好
     * @return hobby_id 
     */
    public String getHobbyId() {
        return hobbyId;
    }

    /**
     * 兴趣爱好
     * @param hobbyId 
     */
    public void setHobbyId(String hobbyId) {
        this.hobbyId = hobbyId == null ? null : hobbyId.trim();
    }

    /**
     * 兴趣爱好
     * @return hobby_name 
     */
    public String getHobbyName() {
        return hobbyName;
    }

    /**
     * 兴趣爱好
     * @param hobbyName 
     */
    public void setHobbyName(String hobbyName) {
        this.hobbyName = hobbyName == null ? null : hobbyName.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.hobbyId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}