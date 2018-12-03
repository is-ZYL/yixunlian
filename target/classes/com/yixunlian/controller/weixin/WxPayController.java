package com.yixunlian.controller.weixin;

import util.myutils.ObjectUtil;
import com.google.gson.Gson;
import com.yixunlian.controller.base.BaseController;
import com.yixunlian.pojo.User;
import com.yixunlian.service.RedisService;
import com.yixunlian.service.UserService;
import net.sf.json.JSONObject;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import util.UtilTrim;
import util.XMLUtil;
import util.myutils.TokenUtils;
import util.HttpUtils;
import util.weixin.PayCommonUtil;
import util.weixin.Const;
import util.weixin.WxUtil;
import util.weixinpay.CommonUtil;
import util.weixinpay.HttpKit;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

@Controller
@RequestMapping("app/weixin/")
public class WxPayController extends BaseController {
    private static final ObjectMapper MAPPER = new ObjectMapper();
    private static final Integer REDIS_TIME = 60 * 60 * 24 * 20;
    private static final String RESULT = "<xml><return_code><![CDATA[ SUCCESS ]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";

    @Resource(name = "userService")
    private UserService wus;
    @Resource(name = "redisService")
    private RedisService rService;

    @RequestMapping(value = "weixinpay", method = RequestMethod.POST)
    public ResponseEntity<String> weixinpay(HttpServletRequest request, @RequestParam("token") String token, @RequestParam("money") BigDecimal money) {
        try {
            String data = TokenUtils.getDataByKey(token);
            if (ObjectUtil.isNull(data)) {
                // token不正确 返回204
                return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
            }
            User u = MAPPER.readValue(data, User.class);
            String ipAddress;
            if (request.getHeader("x-forwarded-for") == null) {
                ipAddress = request.getRemoteAddr();
            } else {
                if (request.getHeader("x-forwarded-for").length() > 15) {
                    String[] aStr = request.getHeader("x-forwarded-for").split(",");
                    ipAddress = aStr[0];
                } else {
                    ipAddress = request.getHeader("x-forwarded-for");
                }
            }
            String openid = u.getOpenId();
            // 生成时间戳
            String times = System.currentTimeMillis() + "";
            // 订单标题
            String title = "易迅连";
            String appids = Const.APPID;
            // Onlyyou521314Onlyyou21314Onlyyou
            // 秘钥：9fbd99835218c118659f5abcb5fc657b
            SortedMap<Object, Object> packageParams = new TreeMap<>();
            packageParams.put("appid", appids);
            packageParams.put("mch_id", "1511891401");
            // 时间戳
            packageParams.put("nonce_str", times);
            // 支付主体
            packageParams.put("body", title);
            // 编号
            packageParams.put("out_trade_no", UtilTrim.getRandomFileName());
            // 价格
            packageParams.put("total_fee", money);
            // 这里之前加了ip，但是总是获取sign失败，原因不明，之后就注释掉了
            packageParams.put("spbill_create_ip", ipAddress);
            // 支付返回地址，
            packageParams.put("notify_url", "app/weixin/paynotify");
            // 这个api有，固定的
            packageParams.put("trade_type", "JSAPI");
            // openid
            packageParams.put("openid", openid);
            String stringSignTemp = "Chengdu2018michlifmini0813future";
            String sign = PayCommonUtil.createSign("UTF-8", packageParams, stringSignTemp);
            packageParams.put("sign", sign);
            // 转成xml字符串
            String requestXML = PayCommonUtil.getRequestXml(packageParams);
            String resXml = HttpUtils.postData("https://api.mch.weixin.qq.com/pay/unifiedorder", requestXML);
            @SuppressWarnings("rawtypes")
            Map map = XMLUtil.doXMLParse(resXml);
            String prepay_id = (String) map.get("prepay_id");
            SortedMap<Object, Object> packageP = new TreeMap<>();
            // ！！！注意，这里是appId,上面是appid，
            packageP.put("appId", appids);
            // 时间戳
            packageP.put("nonceStr", times);
            // 必须把package写成 "prepay_id="+prepay_id这种形式
            packageP.put("package", "prepay_id=" + prepay_id);
            // paySign加密
            packageP.put("signType", "MD5");
            packageP.put("timeStamp", (System.currentTimeMillis() / 1000) + "");
            // 得到paySign
            String paySign = PayCommonUtil.createSign("UTF-8", packageP, stringSignTemp);
            packageP.put("paySign", paySign);
            // 将packageP数据返回给小程序
            Gson gson = new Gson();
            String json = gson.toJson(packageP);
            return ResponseEntity.ok(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }

    @RequestMapping("paynotify")
    public String paynotify(HttpServletRequest request) {
        logger.debug("支付成功获取微信参数" + request.toString());

        return RESULT;
    }

    @RequestMapping(value = "getAccessToken", method = RequestMethod.GET)
    public ResponseEntity<String> getAccessToken() {
        try {
            String appid = Const.APPID;
            String appsecret = Const.APPSECRET;
            // 请求参数
            String params = "grant_type=client_credential&appid=" + appid + "&secret=" + appsecret;
            // 发送请求
            String preinfo = HttpKit.get("https://api.weixin.qq.com/cgi-bin/token?" + params);
            JSONObject object = JSONObject.fromObject(preinfo);
            String accessToken = object.getString("access_token");
            return ResponseEntity.ok(accessToken);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }

    @RequestMapping("/getParamter")
    public ResponseEntity<JSONObject> getParamter(@RequestParam("url") String url) {
        JSONObject jo = new JSONObject();
        String nonce_str = CommonUtil.createNoncestr(16);// 随机字符串
        String timeStamp = "" + System.currentTimeMillis();// 时间
        String access = rService.get("accessToken");
        if (ObjectUtil.isNull(access)) {
            access = WxUtil.getAccessToken();
        }
        // 获取ticket
        String ur = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + access + "&type=jsapi";
        String users = HttpKit.get(ur);
        JSONObject obj = JSONObject.fromObject(users);
        String ticket = obj.getString("ticket");
        String sign = "jsapi_ticket=" + ticket + "&noncestr=" + nonce_str + "&timestamp=" + timeStamp + "&url=" + url;
        sign = CommonUtil.SHA1(sign);
        jo.put("nonce_str", nonce_str);
        jo.put("timeStamp", timeStamp);
        jo.put("signature", sign);
        return ResponseEntity.ok(jo);
    }

    @RequestMapping("/getCustomer")
    public ResponseEntity<String> getCustomer() {
        String access = rService.get("accessToken");
        if (ObjectUtil.isNull(access)) {
            access = WxUtil.getAccessToken();
        }
        logger.info("access_token=" + access);
        String result2 = HttpKit.get("https://api.weixin.qq.com/cgi-bin/customservice/getkflist?access_token=" + access);
        return ResponseEntity.ok(result2);
    }

}
