/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: DateConvert
 * Author:   yuanyuana
 * Date:     2018/11/22 14:05
 * Description: 全局日期处理类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.filter;

import lombok.extern.slf4j.Slf4j;
import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 〈一句话功能简述〉<br>
 * 〈全局日期处理类〉
 *
 * @author yuanyuana
 * @create 2018/11/22
 * @since 1.0.0
 */
@Slf4j
public class DateConvert implements Converter<String, Date> {

    /**
     * @param str     原字符串
     * @param sToFind 需要查找的字符串
     * @return 返回在原字符串中sToFind出现的次数
     */
    private static int countStr(String str, String sToFind) {
        int num = 0;
        while (str.contains(sToFind)) {
            str = str.substring(str.indexOf(sToFind) + sToFind.length());
            num++;
        }
        return num;
    }

    @Override
    public Date convert(String stringDate) {
        System.out.println("stringDate=" + stringDate);
        SimpleDateFormat simpleDateFormat;
        if (countStr(stringDate, ":") > 1) {
            simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        } else {
            simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        }
        try {
            return simpleDateFormat.parse(stringDate);
        } catch (ParseException e) {
            log.error("date类型转换异常,转换类为：" + getClass().getName() + e.getMessage());
        }
        return null;
    }
}
