package com.yixunlian.mapper;

import com.github.abel533.mapper.Mapper;
import com.yixunlian.pojo.ActivityFillInItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ActivityFillInItemMapper extends Mapper<ActivityFillInItem> {

    /**
     * 根据活动id，type查询活动报名填写项
     *
     * @param map
     * @return
     */
    public List<ActivityFillInItem> selectByActivityIdAndType(@Param("map") Map<String, Object> map);

}