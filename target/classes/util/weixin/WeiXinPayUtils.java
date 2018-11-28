/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: WeiXinPayUtils
 * Author:   yuanyuana
 * Date:     2018/10/8 16:01
 * Description: 微信支付工具类、
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package util.weixin;

import util.myutils.ObjectUtil;
import com.google.gson.Gson;
import com.yixunlian.pojo.User;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import util.HttpUtils;
import util.UtilTrim;
import util.XMLUtil;

import javax.net.ssl.SSLContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.net.InetAddress;
import java.security.*;
import java.security.cert.CertificateException;
import java.util.*;

/**
 * 〈一句话功能简述〉<br>
 * 〈微信支付工具类、〉
 *
 * @author yuanyuana
 * @create 2018/10/8
 * @since 1.0.0
 */
public class WeiXinPayUtils {

    public static String weixinpay(HttpServletRequest request, BigDecimal money, User user) {
        String ipAddress;
        if (ObjectUtil.isNull(request.getHeader("x-forwarded-for"))) {
            ipAddress = request.getRemoteAddr();
        } else {
            if (request.getHeader("x-forwarded-for").length() > 15) {
                String[] aStr = request.getHeader("x-forwarded-for").split(",");
                ipAddress = aStr[0];
            } else {
                ipAddress = request.getHeader("x-forwarded-for");
            }
        }
        String openid = user.getOpenId();
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
        Map map = null;
        try {
            map = XMLUtil.doXMLParse(resXml);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String prepayId = (String) map.get("prepay_id");
        SortedMap<Object, Object> packageP = new TreeMap<>();
        // ！！！注意，这里是appId,上面是appid，
        packageP.put("appId", appids);
        // 时间戳
        packageP.put("nonceStr", times);
        // 必须把package写成 "prepay_id="+prepay_id这种形式
        packageP.put("package", "prepay_id=" + prepayId);
        // paySign加密
        packageP.put("signType", "MD5");
        packageP.put("timeStamp", (System.currentTimeMillis() / 1000) + "");
        // 得到paySign
        String paySign = PayCommonUtil.createSign("UTF-8", packageP, stringSignTemp);
        packageP.put("paySign", paySign);
        // 将packageP数据返回给小程序
        Gson gson = new Gson();
        return gson.toJson(packageP);
    }

    /**
     * @param openid 收款人的openID(微信的openID)
     * @param amount 付款金额
     * @param desc   付款描述
     * @return map{
     * {state:SUCCESS/FAIL}
     * {payment_no:'支付成功后，微信返回的订单号'}
     * {payment_time:'支付成功的时间'}
     * {err_code:'支付失败后，返回的错误代码'}
     * {err_code_des:'支付失败后，返回的错误描述'}
     * }
     * @Description：微信支付，企业向个人付款
     */
    public static Map<String, String> transfer(String openid, BigDecimal amount, String desc) {
        // 定义一个返回MAP
        Map<String, String> map = new HashMap<>();
        try {
            // 读取配置文件信息，包括微信支付的APPID，商户ID和证书路径
            InputStream configFile = PayCommonUtil.class.getResourceAsStream("weixin.config.xml");
            SAXReader reader = new SAXReader();
            Document doc = reader.read(configFile);
            Element config = doc.getRootElement();
            String url = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";
            InetAddress ia = InetAddress.getLocalHost();
            // 获取本机IP地址
            String ip = ia.getHostAddress();
            // 随机获取UUID
            String uuid = UUID.randomUUID().toString().toUpperCase().replaceAll("-", "");
            // 微信分配的公众账号ID（企业号corpid即为此appId）
            String appid = config.elementTextTrim("appKey");
            // 微信支付分配的商户号
            String mchid = config.elementTextTrim("mchid");
            // 设置支付参数
            SortedMap<Object, Object> signParams = new TreeMap<>();
            // 微信分配的公众账号ID（企业号corpid即为此appId）
            signParams.put("mch_appid", appid);
            // 微信支付分配的商户号
            signParams.put("mchid", mchid);
            // 随机字符串，不长于32位
            signParams.put("nonce_str", uuid);
            // 商户appid下，某用户的openid
            signParams.put("openid", openid);
            // NO_CHECK：不校验真实姓名
            signParams.put("check_name", "NO_CHECK");
            // FORCE_CHECK：强校验真实姓名（未实名认证的用户会校验失败，无法转账）
            // OPTION_CHECK：针对已实名认证的用户才校验真实姓名（未实名认证用户不校验，可以转账成功）

            // 企业付款金额，单位为分
            signParams.put("amount", amount);
            // 企业付款操作说明信息。必填。
            signParams.put("desc", desc);
            // 调用接口的机器Ip地址
            signParams.put("spbill_create_ip", ip);
            // 生成支付签名，要采用URLENCODER的原始值进行MD5算法！
            String sign = PayCommonUtil.createSign("UTF-8", signParams);
            String data = "<xml><mch_appid>";
            data += appid + "</mch_appid><mchid>"; // APPID
            data += mchid + "</mchid><nonce_str>"; // 商户ID
            data += uuid + "</nonce_str><partner_trade_no>"; // 随机字符串
            data += openid + "</openid><check_name>NO_CHECK</check_name><amount>"; // 是否强制实名验证
            data += amount + "</amount><desc>"; // 企业付款金额，单位为分
            data += desc + "</desc><spbill_create_ip>"; // 企业付款操作说明信息。必填。
            data += ip + "</spbill_create_ip><sign>";// 调用接口的机器Ip地址
            data += sign + "</sign></xml>";// 签名
            System.out.println("---------金额提現---------");
            // 获取证书，发送POST请求；
            KeyStore keyStore = KeyStore.getInstance("PKCS12");
            // 从配置文件里读取证书的路径信息
            FileInputStream instream = new FileInputStream(new File(config.elementTextTrim("cert_path")));
            // 证书密码是商户ID
            keyStore.load(instream, mchid.toCharArray());
            instream.close();
            SSLContext sslcontext = SSLContexts.custom().loadKeyMaterial(keyStore, mchid.toCharArray()).build();
            SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslcontext, new String[]{"TLSv1"}, null, SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
            CloseableHttpClient httpclient = HttpClients.custom().setSSLSocketFactory(sslsf).build();
            HttpPost httpost = new HttpPost(url);
            httpost.addHeader("Connection", "keep-alive");
            httpost.addHeader("Accept", "*/*");
            httpost.addHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
            httpost.addHeader("Host", "api.mch.weixin.qq.com");
            httpost.addHeader("X-Requested-With", "XMLHttpRequest");
            httpost.addHeader("Cache-Control", "max-age=0");
            httpost.addHeader("User-Agent", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0) ");
            httpost.setEntity(new StringEntity(data, "UTF-8"));
            CloseableHttpResponse response = httpclient.execute(httpost);
            HttpEntity entity = response.getEntity();
            String jsonStr = EntityUtils.toString(response.getEntity(), "UTF-8");
            System.out.println("------------提现--------------");
            response.close();
            EntityUtils.consume(entity);
            // 把返回的字符串解释成DOM节点
            Document dom = DocumentHelper.parseText(jsonStr);
            Element root = dom.getRootElement();
            String returnCode = root.element("result_code").getText(); // 获取返回代码
            if (StringUtils.equals(returnCode, "SUCCESS")) { // 判断返回码为成功还是失败
                String payment_no = root.element("payment_no").getText(); // 获取支付流水号
                String payment_time = root.element("payment_time").getText(); // 获取支付时间
                map.put("state", returnCode);
                map.put("payment_no", payment_no);
                map.put("payment_time", payment_time);
                return map;
            } else {
                String err_code = root.element("err_code").getText(); // 获取错误代码
                String err_code_des = root.element("err_code_des").getText();// 获取错误描述
                map.put("state", returnCode);// state
                map.put("err_code", err_code);// err_code
                map.put("err_code_des", err_code_des);// err_code_des
                return map;
            }
        } catch (DocumentException | UnrecoverableKeyException | KeyManagementException | CertificateException | KeyStoreException | NoSuchAlgorithmException | IOException ex) {
            ex.printStackTrace();
            return map;
        }
    }
}
