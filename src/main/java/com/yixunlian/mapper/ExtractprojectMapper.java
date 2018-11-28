package com.yixunlian.mapper;

import com.yixunlian.pojo.Extractproject;
import org.apache.ibatis.annotations.Param;
import com.github.abel533.mapper.Mapper;

import java.math.BigDecimal;

public interface ExtractprojectMapper extends Mapper<Extractproject> {

    BigDecimal queryProjectRateSumByActivityId(@Param("activityId") String activityId);

}