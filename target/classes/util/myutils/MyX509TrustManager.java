/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: MyX509TrustManager
 * Author:   yuanyuana
 * Date:     2018/10/31 18:20
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package util.myutils;

import javax.net.ssl.X509TrustManager;
import java.security.cert.X509Certificate;

/**
 * 〈一句话功能简述〉<br>
 * 〈信任管理器〉
 *
 * @author yuanyuana
 * @create 2018/10/31
 * @since 1.0.0
 */

public class MyX509TrustManager implements X509TrustManager {

    @Override
    public void checkClientTrusted(java.security.cert.X509Certificate[] x509Certificates, String s) throws java.security.cert.CertificateException {

    }

    @Override
    public void checkServerTrusted(java.security.cert.X509Certificate[] x509Certificates, String s) throws java.security.cert.CertificateException {

    }

    @Override
    public X509Certificate[] getAcceptedIssuers() {
        return new X509Certificate[0];
    }

}
