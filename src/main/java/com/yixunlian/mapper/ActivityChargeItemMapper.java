package com.yixunlian.mapper;

import com.yixunlian.pojo.ActivityChargeItem;
import org.apache.ibatis.annotations.Param;
import com.github.abel533.mapper.Mapper;

import java.math.BigDecimal;

public interface ActivityChargeItemMapper extends Mapper<ActivityChargeItem> {

    BigDecimal querySumMoneyByActivity(@Param("activityId") String activityId);
}