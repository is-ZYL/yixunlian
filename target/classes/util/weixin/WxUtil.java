package util.weixin;

import com.yixunlian.service.RedisService;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import util.myutils.ObjectUtil;
import util.weixinpay.CommonUtil;
import util.weixinpay.HttpKit;

import javax.annotation.PostConstruct;

@Component
public class WxUtil {

    public static final Integer TWOHOUR = 60 * 60 * 2;
    public static final Logger logger = LoggerFactory.getLogger(WxUtil.class);
    public static WxUtil wxUtil;
    public static String AppCode = "f4e6b136e9f843b48a1eac27b3fcf8e6";
    @Autowired
    private RedisService redisService;

    /***
     * 获取access
     *
     * @return 返回access
     */
    public static String getAccessToken() {
        String access = wxUtil.redisService.get("accessToken");
        if (ObjectUtil.isEmpty(access)) {
            String path = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + Const.APPID + "&secret=" + Const.APPSECRET;
            String result = HttpKit.get(path);
            JSONObject object = JSONObject.fromObject(result);
            access = object.getString("access_token");
            //将获取到的access_token储存在redis中，避免每次都去获取（access_token有效时间为两个小时，避免错误，将保存时长设置的小一点）
            wxUtil.redisService.set("accessToken", access, TWOHOUR - 200);
        }
        return access;
    }

    /**
     * 获取用户信息
     *
     * @param code
     * @return
     */
    public static String getUserInfo(String code) {
        // 请求参数
        String params = "appid=" + Const.APPID + "&secret=" + Const.APPSECRET + "&code=" + code + "&grant_type=authorization_code";
        // 发送请求
        String preinfo = HttpKit.get("https://api.weixin.qq.com/sns/oauth2/access_token?" + params);
        JSONObject object = JSONObject.fromObject(preinfo);
        // 判断openid是否存在
        boolean f = object.has("openid");
        if (!f) {
            return null;
        }
        String openid = object.getString("openid");
        String accessToken = object.getString("access_token");
        System.out.println(accessToken);
        String url = "https://api.weixin.qq.com/sns/userinfo?access_token=" + accessToken + "&openid=" + openid + "&lang=zh_CN";
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
            access = WxUtil.getAccessToken();
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
