package util.weixinpay;

import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import util.MD5;
import util.weixin.Const;

import javax.net.ssl.SSLContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.InetAddress;
import java.security.KeyStore;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;
import java.util.Map.Entry;

public class CommonUtil {
    private static final String hexDigits[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};

    /**
     * 创建随机数
     *
     * @param length
     * @return
     */
    public static String createNoncestr(int length) {
        String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder res = new StringBuilder();
        Random rd = new Random();
        for (int i = 0; i < length; i++) {
            res.append(chars.charAt(rd.nextInt(chars.length() - 1)));
        }
        return res.toString();
    }

    /**
     * 创建随机数，16位
     *
     * @return
     */
    public static String createNoncestr() {
        return createNoncestr(16);
    }

    /**
     * 对参数进行md5加密
     *
     * @param characterEncoding
     * @param parameters
     * @return
     */
    @SuppressWarnings("rawtypes")
    public static String createSign(String characterEncoding, SortedMap<Object, Object> parameters) {
        StringBuilder sb = new StringBuilder();
        Set es = parameters.entrySet();
        for (Object e : es) {
            Entry entry = (Entry) e;
            String k = (String) entry.getKey();
            Object v = entry.getValue();
            if (null != v && !"".equals(v) && !"sign".equalsIgnoreCase(k) && !"key".equalsIgnoreCase(k)) {
                sb.append(k).append("=").append(v).append("&");
            }
        }
        sb.append("key=1356646602");
        return MD5.MD5Encode(sb.toString(), "utf-8").toUpperCase();
    }

    /**
     * 将参数封装为xml信息
     *
     * @param parameters
     * @return
     */
    @SuppressWarnings("rawtypes")
    public static String getRequestXml(SortedMap<Object, Object> parameters) {
        StringBuffer sb = new StringBuffer();
        sb.append("<xml>");
        Set es = parameters.entrySet();
        for (Object e : es) {
            Entry entry = (Entry) e;
            String k = (String) entry.getKey();
            String v = (String) entry.getValue();
            // if ("attach".equalsIgnoreCase(k) || "body".equalsIgnoreCase(k)
            // || "sign".equalsIgnoreCase(k)) {
            // sb.append("<" + k + ">" + "<![CDATA[" + v + "]]></" + k + ">");
            // } else {
            sb.append("<").append(k).append(">").append(v).append("</").append(k).append(">");
            // }
        }
        sb.append("</xml>");
        return sb.toString();
    }

    /**
     * xml字符串转成map
     *
     * @param xml
     * @return
     * @throws Exception
     */
    public static Map<String, String> setXMLToMap(String xml) throws Exception {
        Map<String, String> map = new HashMap<>();

        Document document = DocumentHelper.parseText(xml);
        Element root = document.getRootElement();
        CommonUtil.listChild(map, root);

        return map;
    }

    /**
     * 设置单独的一条xml信息
     *
     * @param return_code
     * @param return_msg
     * @return
     */
    public static String setXML(String return_code, String return_msg) {
        return "<xml><return_code><![CDATA[" + return_code + "]]></return_code><return_msg><![CDATA[" + return_msg + "]]></return_msg></xml>";
    }

    /**
     * 获取请求的ip地址
     *
     * @param request
     * @return
     */
    public static String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if ("0:0:0:0:0:0:0:1%0".equals(ip)) {
            ip = "127.0.0.1";
        }
        return ip;
    }

    private static String byteArrayToHexString(byte b[]) {
        StringBuilder resultSb = new StringBuilder();
        for (byte aB : b) resultSb.append(MD5.byteToHexString(aB));
        return resultSb.toString();
    }

    @SuppressWarnings("unchecked")
    public static void listChild(Map<String, String> map, Element e) {
        if (!"xml".equals(e.getName())) {
            map.put(e.getName(), e.getText());
        }
        List<Element> list = e.elements();
        for (Element child : list) {
            listChild(map, child);
        }
    }

    /**
     * xml解析
     * <p>
     * <strong>Description:</strong> parseXML
     * </p>
     *
     * @param request
     * @return
     * @author <a href="mailto:wanglvwei@chinasofti.com">Wang Lvwei</a>
     * @update 日期: 2014-6-18
     */
    public static Map<String, String> parseXML(HttpServletRequest request) throws Exception {

        Map<String, String> map = new HashMap<>();

        InputStream input = request.getInputStream();

        // 读取输入流
        SAXReader reader = new SAXReader();
        // Document document = reader.read(new
        // File("E:\\Workspaces\\MyEclipse 8.5\\YeeknetWeChat\\WebRoot\\jobTest.xml"));
        Document document = reader.read(input);
        // 获取root
        Element root = document.getRootElement();
        // 获取所有子节点
        // List<Element> elementList = root.elements();
        // 遍历节点
        listChild(map, root);
        input.close();
        return map;
    }

    /**
     * 将普通map转为sortmap便于进行签名
     *
     * @param requestMap
     * @return
     */
    public static SortedMap<Object, Object> mapToSortMap(Map<String, String> requestMap) {
        SortedMap<Object, Object> map = new TreeMap<Object, Object>();
        for (Entry<String, String> entry : requestMap.entrySet()) {
            map.put(entry.getKey(), entry.getValue());
        }
        return map;
    }

    /**
     * 校验微信返回消息的签名是否正确
     *
     * @param map
     * @return
     */
    public static boolean isWxSignVali(Map<String, String> map) {
        if (map.get("sign") == null) {
            return false;
        }
        String signTemp = map.get("sign");

        SortedMap<Object, Object> sortedMap = mapToSortMap(map);

        String sign = createSign("utf-8", sortedMap);
        return signTemp.equals(sign);
    }

    /**
     * 获取证书加密链接
     *
     * @return
     * @throws Exception
     */
    public static CloseableHttpClient getSSLHttpClient() throws Exception {
        KeyStore keyStore = KeyStore.getInstance("PKCS12");

        String classPath = CommonUtil.class.getResource("/").getPath();
        // /D:/TEST/WebRoot/WEB-INF/classes/pack/
        classPath = classPath.substring(0, classPath.indexOf("classes") + 7) + "/";

        try (FileInputStream instream = new FileInputStream(new File(classPath + "apiclient_cert.p12"))) {
            keyStore.load(instream, Const.MCH_ID.toCharArray());
        }

        // Trust own CA and all self-signed certs
        SSLContext sslcontext = SSLContexts.custom().loadKeyMaterial(keyStore, Const.MCH_ID.toCharArray()).build();
        // Allow TLSv1 protocol only
        SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslcontext, new String[]{"TLSv1"}, null,
                SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
        return HttpClients.custom().setSSLSocketFactory(sslsf).build();
    }

    /**
     * 获取本机的ip地址
     *
     * @return
     * @throws Exception
     */
    public static String getLoacalIP() throws Exception {
        InetAddress addr = InetAddress.getLocalHost();
        // 获得本机IP
        return addr.getHostAddress();
    }

    public static String SHA1(String decript) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-1");
            digest.update(decript.getBytes());
            byte[] messageDigest = digest.digest();
            // Create Hex String  
            StringBuilder hexString = new StringBuilder();
            // 字节数组转换为 十六进制 数  
            for (byte aMessageDigest : messageDigest) {
                String shaHex = Integer.toHexString(aMessageDigest & 0xFF);
                if (shaHex.length() < 2) {
                    hexString.append(0);
                }
                hexString.append(shaHex);
            }
            return hexString.toString();

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return "";
    }
}
