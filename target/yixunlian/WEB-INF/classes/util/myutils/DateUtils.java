/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: DateUtils
 * Author:   yuanyuana
 * Date:     2018/10/9 18:41
 * Description: 日期比较
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package util.myutils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 〈一句话功能简述〉<br>
 * 〈日期比较〉
 *
 * @author yuanyuana
 * @create 2018/10/9
 * @since 1.0.0
 */
public class DateUtils {

    public final static SimpleDateFormat SDF_YEAR = new SimpleDateFormat("yyyy");
    public final static SimpleDateFormat SDF_DAY = new SimpleDateFormat("yyyy-MM-dd");
    public final static SimpleDateFormat SDF_DAYS = new SimpleDateFormat("yyyyMMdd");
    public final static SimpleDateFormat SDF_TIME = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    public final static SimpleDateFormat SDF_TIMES = new SimpleDateFormat("yyyyMMddHHmmss");
    public final static String YEAR = "yyyy";
    public final static String DAY = "yyyy-MM-dd";
    public final static String DAYS = "yyyyMMdd";
    public final static String MONTH = "yyyy-MM";
    public final static String MONTHs = "yyyyMM";
    public final static String TIME = "yyyy-MM-dd HH:mm:ss";
    public final static String TIMES = "yyyyMMddHHmmss";

    /**
     * 判断选择的日期是否是今天
     *
     * @param time
     * @return
     */
    public static boolean isToday(long time) {
        return isThisTime(time, DAYS);
    }

    /**
     * 判断选择的日期是否是本周
     *
     * @param time
     * @return
     */
    public static boolean isThisWeek(long time) {
        Calendar calendar = Calendar.getInstance();
        int currentWeek = calendar.get(Calendar.WEEK_OF_YEAR);
        calendar.setTime(new Date(time));
        int paramWeek = calendar.get(Calendar.WEEK_OF_YEAR);
        return paramWeek == currentWeek;
    }

    /**
     * 判断选择的日期是否是本月
     *
     * @param time
     * @return
     */
    public static boolean isThisMonth(long time) {
        return isThisTime(time, MONTHs);
    }

    /**
     * 判断当前时间是否是此刻
     *
     * @param time
     * @param pattern
     * @return
     */
    public static boolean isThisTime(long time, String pattern) {
        Date date = new Date(time);
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        //参数时间
        String param = sdf.format(date);
        //当前时间
        String now = sdf.format(new Date());
        return param.equals(now);
    }

    /**
     * 获取指定格式的当前时间，没有指定格式则设置为:yyyy-MM-dd HH:mm:ss
     *
     * @param format
     * @return
     */
    public static String getDate(String format) {
        Date date = new Date();
        if (ObjectUtil.isNull(format)) {
            format = TIME;
        }
        DateFormat simpleDateFormat = new SimpleDateFormat(format);
        return simpleDateFormat.format(date);
    }

    /**
     * 计算时间差
     *
     * @param d2
     * @return
     */
    public static Long getDateC(Date d2) {
        Date d = new Date();
        return (d.getTime() - d2.getTime()) / 1000;
    }

    /**
     * 获取时间差
     *
     * @return
     */
    public static Integer getDateCByString(String date) {
        SimpleDateFormat sdf = new SimpleDateFormat(TIME);
        try {
            Date d1 = sdf.parse(date);
            Date ddd = new Date();
            int i = d1.compareTo(ddd);
            if (i < 0) {
                return 0;
            } else {
                return 1;
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static Integer getDateCByString(String date, String fenzhonghou) {
        SimpleDateFormat sdf = new SimpleDateFormat(TIME);
        try {
            Date d1 = sdf.parse(date);
            Date ddd = sdf.parse(fenzhonghou);
            // 除以1000是为了转换成秒
            long between = (d1.getTime() - ddd.getTime()) / 1000;
            long min = between / 60;
            if (min <= 30) {
                // 30分钟内
                return 1;
            } else {
                // 30分钟外
                return 0;
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return 0;

    }

    /**
     * 获取YYYY格式
     *
     * @return
     */
    public static String getSdfTimes() {
        return SDF_TIMES.format(new Date());
    }

    /**
     * 获取YYYY格式
     *
     * @return
     */
    public static String getYear() {
        return SDF_YEAR.format(new Date());
    }

    /**
     * 获取YYYY-MM-DD格式
     *
     * @return
     */
    public static String getDay() {
        return SDF_DAY.format(new Date());
    }

    /**
     * 获取YYYYMMDD格式
     *
     * @return
     */
    public static String getDays() {
        return SDF_DAYS.format(new Date());
    }

    /**
     * 获取YYYY-MM-DD HH:mm:ss格式
     *
     * @return
     */
    public static String getTime() {
        return SDF_TIME.format(new Date());
    }

    /**
     * @param s
     * @param e
     * @return boolean
     * @throws
     * @Title: compareDate
     * @Description: TODO(日期比较 ， 如果s > = e 返回true 否则返回false)
     * @author fh
     */
    public static boolean compareDate(String s, String e) {
        if (fomatDate(s) == null || fomatDate(e) == null) {
            return false;
        }
        return fomatDate(s).getTime() >= fomatDate(e).getTime();
    }

    /**
     * 格式化日期
     *
     * @return
     */
    public static Date fomatDate(String date) {
        try {
            return SDF_DAY.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 格式化日期
     *
     * @return
     */
    public static String fomatDate(Date date) {
        DateFormat fmt = new SimpleDateFormat(DAY);
        return fmt.format(date);
    }

    /**
     * 格式化日期
     *
     * @return
     */
    public static Date fomatDate(String date, DateFormat fmt) throws ParseException {
        return fmt.parse(date);
    }

    /**
     * 格式化日期
     *
     * @return
     */
    public static Date fomatDateTime(String date) throws ParseException {
        return SDF_TIME.parse(date);
    }

    /**
     * 校验日期是否合法
     *
     * @return
     */
    public static boolean isValidDate(String s) {
        DateFormat fmt = new SimpleDateFormat(DAY);
        try {
            fmt.parse(s);
            return true;
        } catch (Exception e) {
            // 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
            return false;
        }
    }

    /**
     * @param startTime
     * @param endTime
     * @return
     */
    public static int getDiffYear(String startTime, String endTime) {
        DateFormat fmt = new SimpleDateFormat(DAY);
        try {
            return (int) (((fmt.parse(endTime).getTime() - fmt.parse(startTime).getTime()) / (1000 * 60 * 60 * 24)) / 365);
        } catch (Exception e) {
            // 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
            return 0;
        }
    }

    /**
     * <li>功能描述：时间相减得到天数
     *
     * @param beginDateStr
     * @param endDateStr
     * @return long
     * @author Administrator
     */
    public static long getDaySub(String beginDateStr, String endDateStr) {
        long day;
        SimpleDateFormat format = new SimpleDateFormat(DAY);
        Date beginDate = null;
        Date endDate = null;
        try {
            beginDate = format.parse(beginDateStr);
            endDate = format.parse(endDateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        day = (endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60 * 1000);
        return day;
    }

    /**
     * 得到n天之后的日期
     *
     * @param days
     * @return
     */
    public static String getAfterDayDate(String days) {
        int daysInt = Integer.parseInt(days);
        Calendar canlendar = Calendar.getInstance();
        // 日期减 如果不够减会将月变动
        canlendar.add(Calendar.DATE, daysInt);
        Date date = canlendar.getTime();
        SimpleDateFormat sdfd = new SimpleDateFormat(TIME);
        return sdfd.format(date);
    }

    /**
     * 得到n天之后的日期
     *
     * @param days
     * @return
     */
    public static String getAfterDayDate(int days) {
        // java.util包
        Calendar canlendar = Calendar.getInstance();
        // 日期减 如果不够减会将月变动
        canlendar.add(Calendar.DATE, days);
        Date date = canlendar.getTime();
        SimpleDateFormat sdfd = new SimpleDateFormat(TIME);
        return sdfd.format(date);
    }

    /**
     * 得到n天之后是周几
     *
     * @param days
     * @return
     */
    public static String getAfterDayWeek(String days) {
        int daysInt = Integer.parseInt(days);
        // java.util包
        Calendar canlendar = Calendar.getInstance();
        // 日期减 如果不够减会将月变动
        canlendar.add(Calendar.DATE, daysInt);
        Date date = canlendar.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("E");
        return sdf.format(date);
    }

    /**
     * 把时间根据时、分、秒转换为时间段
     *
     * @param StrDate
     */
    public static String getTimes(String StrDate) {
        String resultTimes = "";
        SimpleDateFormat df = new SimpleDateFormat(TIME);
        Date now;
        try {
            now = new Date();
            Date date = df.parse(StrDate);
            long times = now.getTime() - date.getTime();
            long day = times / (24 * 60 * 60 * 1000);
            long hour = (times / (60 * 60 * 1000) - day * 24);
            long min = ((times / (60 * 1000)) - day * 24 * 60 - hour * 60);
            long sec = (times / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);

            StringBuilder sb = new StringBuilder();
            if (hour > 0) {
                sb.append(hour).append("小时前");
            } else if (min > 0) {
                sb.append(min).append("分钟前");
            } else {
                sb.append(sec).append("秒前");
            }
            resultTimes = sb.toString();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return resultTimes;
    }

    /**
     * 把时间根据时、分、秒转换为时间段
     *
     * @param date
     */
    public static String getTimes(Date date) {
        String resultTimes;
        Date now;
        now = new Date();
        long times = now.getTime() - date.getTime();
        long day = times / (24 * 60 * 60 * 1000);
        long hour = (times / (60 * 60 * 1000) - day * 24);
        long min = ((times / (60 * 1000)) - day * 24 * 60 - hour * 60);
        long sec = (times / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
        StringBuilder sb = new StringBuilder();
        if (hour > 0) {
            sb.append(hour).append("小时前");
        } else if (min > 0) {
            sb.append(min).append("分钟前");
        } else {
            sb.append(sec).append("秒前");
        }
        resultTimes = sb.toString();
        return resultTimes;
    }

    /**
     * 按照参数format的格式，日期转字符串
     *
     * @param date
     * @param format
     * @return
     */
    public static String dateToStr(Date date, String format) {
        if (date != null) {
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            return sdf.format(date);
        } else {
            return "";
        }
    }

    /**
     * 按照yyyy-MM-dd HH:mm:ss的格式，日期转字符串
     *
     * @param date
     * @return yyyy-MM-dd HH:mm:ss
     */
    public static String dateToStr(Date date) {
        return dateToStr(date, TIME);
    }

    /**
     * 按照yyyy-MM-dd HH:mm:ss的格式，字符串转日期
     *
     * @param date
     * @return
     */
    public static Date strToDate(String date) {
        if (Tools.notEmpty(date)) {
            try {
                return SDF_TIME.parse(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            return new Date();
        } else {
            return null;
        }
    }
}
