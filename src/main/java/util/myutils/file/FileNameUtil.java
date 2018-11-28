package util.myutils.file;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class FileNameUtil {
    /**
     * 文件重命名
     *
     * @param name
     * @return
     */
    public static String rename(String name) {
        String body;
        String ext;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String date = simpleDateFormat.format(new Date());
        Random random = new Random();
        StringBuilder randomCode = new StringBuilder();
        for (int i = 0; i < 4; i++) {
            randomCode.append(Integer.toString(random.nextInt(36), 36));
        }
        int pot = name.lastIndexOf(".");
        if (pot != -1) {
            body = date + randomCode + "";
            ext = name.substring(pot);
        } else {
            body = date + randomCode + "";
            ext = "";
        }
        return body + ext;
    }

    /**
     * 获取当前时间+五位随机数组成的字符串
     *
     * @return
     */
    public static String getRandomFileName() {
        SimpleDateFormat simpleDateFormat;
        simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        String str = simpleDateFormat.format(date);
        Random random = new Random();
        // 获取5位随机数
        int rannum = random.nextInt() * (99999 - 10000 + 1) + 10000;
        // 当前时间
        return rannum + str;
    }

}
