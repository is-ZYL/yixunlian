/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: CronUtil
 * Author:   yuanyuana
 * Date:     2018/11/23 13:43
 * Description: Java日期转换成Cron日期表达式工具类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.job;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 〈一句话功能简述〉<br>
 * 〈Java日期转换成Cron日期表达式工具类〉
 *
 * @author yuanyuana
 * @create 2018/11/23
 * @since 1.0.0
 */
public class CronUtil {

    /***
     * convert Date to cron (时间转换成Cron表达式)
     * @param date
     * @param dateFormat : eg:yyyy-MM-dd HH:mm:ss
     * @return
     */
    public static String formatDateByPattern(Date date, String dateFormat) {
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        String formatTimeStr = null;
        if (date != null) {
            formatTimeStr = sdf.format(date);
        }
        return formatTimeStr;
    }

    /***
     * convert Date to cron ,eg. "0 06 10 15 1 ? 2014"
     * @param date : 时间点
     * @return
     */
    public static String getCron(Date date) {
        String dateFormat = "ss mm HH dd MM ? yyyy";
        return formatDateByPattern(date, dateFormat);
    }
}
