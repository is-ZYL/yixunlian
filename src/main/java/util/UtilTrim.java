package util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class UtilTrim {
    /**
     * 去除空格
     *
     * @param s
     * @return
     */
    public static String delTrim(String s) {
        return s.trim();
    }


    /**
     * String 转换double
     */
    public static Double ToDouble(String s) {
        return Double.parseDouble(s);
    }

    public static String getRandomFileName() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        String str = simpleDateFormat.format(date);
        Random random = new Random();
        // 获取5位随机数
        int randNum = (int) (random.nextDouble() * (99999 - 10000 + 1)) + 10000;
        // 当前时间
        return randNum + str;
    }

    public static int getSuiJiMoney2() {
        return (int) Math.round(Math.random() * 2500);
    }

    public static int getSuiJiMoney() {
        int i;
        do {
            i = getSuiJiMoney2();
        } while (i < 1000 || i > 2500);
        return i;
    }
}
