package util;

import org.apache.commons.codec.digest.DigestUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class RandomString {
    public static void main(String[] args) {
        System.out.print(getListInteger(new ArrayList<Long>()));
    }

    public static List<Integer> getListInteger(List<Long> dd) {
        Integer i = (int) (Math.random() * (dd.size() - 1));
        Integer d = (int) (Math.random() * (dd.size() - 1));
        Integer x = (int) (Math.random() * (dd.size() - 1));
        Integer y = (int) (Math.random() * (dd.size() - 1));
        Integer t = (int) (Math.random() * (dd.size() - 1));
        Integer z = (int) (Math.random() * (dd.size() - 1));
        if (z == t || z == y || z == x || z == d || z == i) {
            z = (int) (Math.random() * (dd.size() - 1));
        } else if (t == y || t == x || t == d || t == i) {
            t = (int) (Math.random() * (dd.size() - 1));
        } else if (y == x || y == d || y == i) {
            y = (int) (Math.random() * (dd.size() - 1));
        } else if (x == d || x == i) {
            x = (int) (Math.random() * (dd.size() - 1));
        } else if (d == i) {
            d = (int) (Math.random() * (dd.size() - 1));
        }
        List<Integer> list = new ArrayList<Integer>();
        list.add(i);
        list.add(d);
        list.add(x);
        list.add(y);
        list.add(t);
        list.add(z);
        return list;
    }

    public static String getStringNew(String str1, Long id) {
        // 构造一个StringBuilder对象
        StringBuilder sb = new StringBuilder(str1);
        // 在指定的位置1，插入指定的字符串
        sb.insert(str1.length(), id);
        return sb.toString();
    }

    /**
     * 取随机数验证码
     *
     * @param length length表示生成字符串的长度
     * @return
     */
    public static String getRandomString(int length) {
        String base = "0123456789012345678901234567890123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    /**
     * 获取随机用户名
     *
     * @param length
     * @return
     */
    public static String getRandomUname(int length) { // length表示生成字符串的长度
        String base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    /**
     * 生成订单编号
     *
     * @param length length表示生成字符串的长度
     * @return
     */
    public static String getOrderNo(int length) {
        String base = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    /**
     * 根据用户名与用户id生成唯一token值
     *
     * @param uName 用户名
     * @param uId   用户id
     * @return 返回token值
     */
    public static String getDataToken(String uName, Long uId) {
        long s = System.currentTimeMillis();
        String token = String.valueOf(s);
        String md5Token = uName + uId + token;
        return DigestUtils.md5Hex(md5Token);

    }

    /**
     * 根据用户名与手机号生成token值
     *
     * @param uName  用户名
     * @param uPhone 手机号
     * @return 返回token值
     */
    public static String getDataTokenUphone(String uName, String uPhone) {
        long s = System.currentTimeMillis();
        String token = String.valueOf(s);
        token = token + "&" + uName + "*" + uPhone;
        return token;

    }
}