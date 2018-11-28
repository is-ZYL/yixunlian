package com.yixunlian.mapper;

import com.github.abel533.mapper.Mapper;
import com.yixunlian.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper extends Mapper<User> {

    public List<Map> selectByPrimaryKey1(@Param("map") Map<Object, Object> map);

    public List<Map> selectUserListCountByKeywords(@Param("map") Map<String, Object> maps, @Param("count") Integer count);

    // @Param("user") User user, @Param("keyWord") String keyWord
    public List<User> queryResourceListResultByKeywords(@Param("maps") Map<String, Object> maps);

}