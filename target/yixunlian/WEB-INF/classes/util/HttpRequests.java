package util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class HttpRequests {
	public static String HttpRequest(String string, String path, Object object) {
		 StringBuffer buffer = new StringBuffer();    
	        try {    
	            URL url = new URL(path);    
	            HttpURLConnection httpUrlConn = (HttpURLConnection) url.openConnection();    
	     
	            httpUrlConn.setDoOutput(true);    
	            httpUrlConn.setDoInput(true);    
	            httpUrlConn.setUseCaches(false);    
	            httpUrlConn.setConnectTimeout(50000);  
	            httpUrlConn.setReadTimeout(50000);  
	            httpUrlConn.setRequestMethod("GET");   
	           // httpUrlConn.setRequestProperty("Accept", "image/png,image/*;q=0.8,*/*;q=0.5");  
	           // httpUrlConn.setRequestProperty("Accept-Encoding", "gzip");    
	           //httpUrlConn.setRequestProperty("Referer", "http://www.hao123.com/");  
	            httpUrlConn.connect();  //发送请求  
	            if (httpUrlConn.getResponseCode() == 200) {  
	                  
	                // 将返回的输入流转换成字符串    
	                InputStream inputStream = httpUrlConn.getInputStream();    
	                InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");    
	                BufferedReader bufferedReader = new BufferedReader(inputStreamReader);    
	         
	                String str = null;    
	                while ((str = bufferedReader.readLine()) != null) {    
	                    buffer.append(str);    
	                }    
	                bufferedReader.close();    
	                inputStreamReader.close();    
	                // 释放资源    
	                inputStream.close();    
	                inputStream = null;    
	                httpUrlConn.disconnect();  
	                              
	            }       
	     
	        } catch (Exception e) {    
	            System.out.println(e.getStackTrace());    
	        }    
	        return buffer.toString();
	}
}
