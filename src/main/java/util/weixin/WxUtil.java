package util.weixin;

import util.myutils.ObjectUtil;
import com.yixunlian.service.RedisService;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import util.HttpUtils;
import util.weixinpay.CommonUtil;
import util.weixinpay.HttpKit;

import javax.annotation.PostConstruct;
import javax.net.ssl.HttpsURLConnection;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
public class WxUtil {

    public static final Integer TWOHOUR = 60 * 60 * 2;
    public static final Logger logger = LoggerFactory.getLogger(WxUtil.class);
    public static WxUtil wxUtil;
    public static String AppKey = "23798921";// 需要修改
    public static String AppSecret = "6b84ed2cbd4a54249d99d50ae59f9de8";// 需要修改
    public static String AppCode = "f4e6b136e9f843b48a1eac27b3fcf8e6";// 需要修改
    @Autowired
    private RedisService redisService;

    public static String userRz(String idcard, String mobile, String realname) {
        String host = "http://telecom-ali.juheapi.com";
        String path = "/telecom/query";
        String method = "GET";
        String appcode = AppCode;
        Map<String, String> headers = new HashMap<String, String>();
        // 最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        Map<String, String> querys = new HashMap<>();
        querys.put("idcard", idcard);
        querys.put("mobile", mobile);
        querys.put("realname", realname);
        try {
            HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
            String preinfo = EntityUtils.toString(response.getEntity());
            JSONObject object = JSONObject.fromObject(preinfo);
            return object.getString("result");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 时间转字符串
     *
     * @return
     */
    public static String getStringDate() {
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return formatter.format(currentTime);
    }

    /***
     * 获取access
     *
     * @return
     */
    public static String getAt() {
        String path = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + Const.APPID + "&secret=" + Const.APPSECRET;
        String result = HttpKit.get(path);
        JSONObject object = JSONObject.fromObject(result);
        String accessToken = object.getString("access_token");
        //将获取到的access_token储存在redis中，避免每次都去获取（access_token有效时间为两个小时，避免错误，将保存时长设置的小一点）
        wxUtil.redisService.set("accessToken", accessToken, TWOHOUR - 200);
        return accessToken;
    }

    /**
     * @method sendWechatmsgToUser
     * @描述: TODO(发送模板信息给用户)
     * @参数@param touser 用户的openid
     * @参数@param templat_id 信息模板id
     * @参数@param url 用户点击详情时跳转的url
     * @参数@param topcolor 模板字体的颜色
     * @参数@param data 模板详情变量 Json格式
     * @参数@return
     * @返回类型：String
     * @添加时间 2016-1-5上午10:38:45 @作者：***
     */
    public static String sendWechatmsgToUser(String touser, String templat_id, String formId, String topcolor,
                                             JSONObject data, String token) {
        String tmpurl = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token=ACCESS_TOKEN";
        String url = tmpurl.replace("ACCESS_TOKEN", token);
        JSONObject json = new JSONObject();
        try {
            json.put("touser", touser);
            json.put("template_id", templat_id);
            json.put("form_id", formId);
            json.put("topcolor", topcolor);
            json.put("data", data);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        String result = httpsRequest(url, "POST", json.toString());
        System.out.println(result);
        return "success";
    }

    private static String httpsRequest(String requestUrl, String requestMethod, String outputStr) {
        try {
            URL url = new URL(requestUrl);
            HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setUseCaches(false);
            // 设置请求方式（GET/POST）
            conn.setRequestMethod(requestMethod);
            conn.setRequestProperty("content-type", "application/x-www-form-urlencoded");
            // 当outputStr不为null时向输出流写数据
            if (null != outputStr) {
                OutputStream outputStream = conn.getOutputStream();
                // 注意编码格式
                outputStream.write(outputStr.getBytes("UTF-8"));
                outputStream.close();
            }
            // 从输入流读取返回内容
            InputStream inputStream = conn.getInputStream();
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
            String str;
            StringBuilder buffer = new StringBuilder();
            while ((str = bufferedReader.readLine()) != null) {
                buffer.append(str);
            }
            // 释放资源
            bufferedReader.close();
            inputStreamReader.close();
            inputStream.close();
            conn.disconnect();
            return buffer.toString();
        } catch (ConnectException ce) {
            System.out.println("连接超时：{}");
        } catch (Exception e) {
            System.out.println("https请求异常：{}");
        }
        return null;
    }

    /**
     * 获取用户信息
     *
     * @param code
     * @return
     */
    public static String getOpenId(String code) {
        String appid = Const.APPID;
        String appsecret = Const.APPSECRET;
        String grant_type = "authorization_code";

        // 请求参数
        String params = "appid=" + appid + "&secret=" + appsecret + "&js_code=" + code + "&grant_type=" + grant_type;
        // 发送请求
        String preinfo = HttpKit.get("https://api.weixin.qq.com/sns/jscode2session?" + params);
        net.sf.json.JSONObject object = net.sf.json.JSONObject.fromObject(preinfo);

        logger.error("------------------------object=================" + object);
        System.out.println(object);
        // 判断openid是否存在
        boolean f = object.has("openid");
        if (!f) {
            return null;
        }
        String openid = object.getString("openid");

        return openid;
    }

    /**
     * 获取用户信息
     *
     * @param code
     * @return
     */
    public static String getUserInfo(String code) {
        String appid = Const.APPID;
        String appsecret = Const.APPSECRET;
        String grant_type = "authorization_code";
        // 请求参数
        String params = "appid=" + appid + "&secret=" + appsecret + "&code=" + code + "&grant_type=" + grant_type;
        // 发送请求
        String preinfo = HttpKit.get("https://api.weixin.qq.com/sns/oauth2/access_token?" + params);
        System.out.println(preinfo);
        JSONObject object = JSONObject.fromObject(preinfo);
        // 判断openid是否存在
        boolean f = object.has("openid");
        if (!f) {
            return null;
        }
        String openid = object.getString("openid");
        String accessToken = object.getString("access_token");
        System.out.println(accessToken);
        String url = "https://api.weixin.qq.com/sns/userinfo?access_token=" + accessToken + "&openid=" + openid
                + "&lang=zh_CN";
        return HttpKit.get(url);
    }

    /**
     * 微信验签
     *
     * @param url
     * @return
     */
    public static JSONObject getParameter(String url) {
        JSONObject jo = new JSONObject();
        //随机字符串
        String nonceStr = CommonUtil.createNoncestr(16);
        //时间
        String timeStamp = "" + System.currentTimeMillis();
        String access = wxUtil.redisService.get("accessToken");
        if (ObjectUtil.isNull(access)) {
            access = WxUtil.getAt();
        }
        //获取ticket
        String ur = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + access + "&type=jsapi";
        String users = HttpKit.get(ur);
        JSONObject obj = JSONObject.fromObject(users);
        String ticket = obj.getString("ticket");
        String sign = "jsapi_ticket=" + ticket + "&noncestr=" + nonceStr + "&timestamp=" + timeStamp + "&url=" + url;
        sign = CommonUtil.SHA1(sign);
        logger.info("分享签名" + sign);
        jo.put("appId", Const.APPID);
        jo.put("nonceStr", nonceStr);
        jo.put("timeStamp", timeStamp);
        jo.put("signature", sign);
        return jo;
    }

    @PostConstruct
    public void init() {
        wxUtil = this;
        //wxUtil.redisService =  this.redisService;
    }
}
