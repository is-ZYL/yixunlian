package util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class VoiceDownload {

    /**
     * 根据文件id下载文件
     *
     * @param mediaId 媒体id
     * @throws Exception
     */

    public static InputStream getInputStream(String accessToken, String mediaId) {
        InputStream is = null;
        String url = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=" + accessToken + "&media_id=" + mediaId;
        try {
            URL urlGet = new URL(url);
            HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();
            // 必须是get方式请求
            http.setRequestMethod("GET");
            http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            http.setDoOutput(true);
            http.setDoInput(true);
            System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒
            System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒
            http.connect();
            // 获取文件转化为byte流
            is = http.getInputStream();
            return is;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return is;

    }

    /**
     * @param mediaId 文件的id
     * @throws Exception type 1为音频 2为图片
     */

    public static void saveImageToDisk(String accessToken, String mediaId, String picName, String picPath, Integer type)
            throws Exception {

        InputStream inputStream = getInputStream(accessToken, mediaId);
        byte[] data = new byte[10240];
        int len = 0;
        FileOutputStream fileOutputStream = null;
        try {
            if (type == 1) {
                fileOutputStream = new FileOutputStream(picPath + ".mp3");

            } else if (type == 2) {
                fileOutputStream = new FileOutputStream(picPath);
            }
            while ((len = inputStream.read(data)) != -1) {
                fileOutputStream.write(data, 0, len);
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (fileOutputStream != null) {
                try {
                    fileOutputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }

}
