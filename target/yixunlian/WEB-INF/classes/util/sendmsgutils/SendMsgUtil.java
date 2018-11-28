package util.sendmsgutils;

import com.gm.common.util.RandomString;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * 〈一句话功能简述〉<br>
 * 〈发送短信工具类〉
 *
 * @author yuanyuana
 * @create 2018/9/25
 * @since 1.0.0
 */
public class SendMsgUtil {
    /**
     * 发送短信消息
     * 方法说明
     *
     * @param phones
     * @param content
     * @return String
     * @Discription:扩展说明
     */
    @SuppressWarnings("deprecation")
    public static String sendMsg(String phones, String content) {
        //短信接口URL提交地址
        String url = "短信接口URL提交地址";

        Map<String, String> params = new HashMap<>();

        params.put("zh", "用户账号");
        params.put("mm", "用户密码");
        params.put("dxlbid", "短信类别编号");
        params.put("extno", "扩展编号");

        //手机号码，多个号码使用英文逗号进行分割
        params.put("hm", phones);
        //将短信内容进行URLEncoder编码
        params.put("nr", URLEncoder.encode(content));

        return HttpRequestUtil.getRequest(url, params);
    }

    /**
     * 测试
     * 方法说明
     *
     * @param args
     * @return void
     * @Discription:扩展说明
     */
    public static void main(String[] args) {
//      System.out.println(SendMsgUtil.createRandomVcode());
//      System.out.println("&ecb=12".substring(1));
        System.out.println(sendMsg("18123456789,15123456789", "尊敬的用户，您的验证码为" + RandomString.getRandomString(5) + "，有效期为60秒，如有疑虑请详询400-069-2886（客服电话）【XXX中心】"));
    }
}
