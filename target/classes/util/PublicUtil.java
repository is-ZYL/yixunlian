package util;

import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * 〈一句话功能简述〉<br>
 * 〈IP处理〉
 *
 * @author yuanyuana
 * @create 2018/11/6
 * @since 1.0.0
 */
public class PublicUtil {

    public static void main(String[] args) {
        System.out.println("本机的ip=" + PublicUtil.getIp());
    }

    public static String getPorjectPath() {
        String nowpath = "";
        nowpath = System.getProperty("user.dir") + "/";

        return nowpath;
    }

    /**
     * 获取本机访问地址
     *
     * @return
     */
    public static String getIp() {
        String ip = "";
        try {
            InetAddress inet = InetAddress.getLocalHost();
            ip = inet.getHostAddress();
            //System.out.println("本机的ip=" + ip);
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }

        return ip;
    }

}