package com.yixunlian.mapper;

import com.yixunlian.pojo.Activity;
import org.apache.ibatis.annotations.Param;
import com.github.abel533.mapper.Mapper;

import java.util.List;
import java.util.Map;

public interface ActivityMapper extends Mapper<Activity> {

    /**
     * 根据关键词进行匹配活动
     *
     * @param maps
     * @return
     */
    List<Activity> queryActivityListByMaps(@Param("map") Map<String, Object> maps);

    /**
     * 查询活动专区的总浏览量
     *
     * @return
     */
    Long queryViewsNums();
}