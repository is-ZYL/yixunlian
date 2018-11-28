package util.myutils;

import java.util.UUID;

public class UuidUtil {

    /**
     * 生成32位的uuid码
     *
     * @return
     */
    public static String get32UUID() {
        return UUID.randomUUID().toString().trim().replaceAll("-", "");
    }
}


