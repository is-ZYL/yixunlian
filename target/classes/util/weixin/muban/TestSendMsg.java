package util.weixin.muban;

import net.sf.json.JSONObject;

public class TestSendMsg {

	public static void main(String[] args) {

		String appId = "wxab19f";
		String secret = "9d190e23bb";

		//AccessToken token = WeChatUtils.getAccessToken(appId, secret);
		//System.out.println(token.toString());
		// String token = "waAZ4Eo8RU_wR9GeL7Y6HLw0YqYq5uAUCaACAAZH";

		String URL = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
		//String url = URL.replace("ACCESS_TOKEN", (CharSequence) token);

		JSONObject jsobj1 = new JSONObject();
		JSONObject jsobj2 = new JSONObject();
		JSONObject jsobj3 = new JSONObject();
		JSONObject jsobj4 = new JSONObject();
		JSONObject jsobj5 = new JSONObject();
		JSONObject jsobj6 = new JSONObject();

		jsobj1.put("touser", "o5WL36u7QNM");
		jsobj1.put("template_id", "kMCqqUUTsfjHiDmQC2OSi3Z6tdjOZC6rIb1BAtsqiRY ");

		jsobj3.put("value", "你好");
		jsobj3.put("color", "#173177");
		jsobj2.put("first", jsobj3);

		jsobj4.put("value", "6666");
		jsobj4.put("color", "#173177");
		jsobj2.put("keyword1", jsobj4);

		jsobj5.put("value", "2564659879813214796416");
		jsobj5.put("color", "#173177");
		jsobj2.put("keyword2", jsobj5);

		jsobj6.put("value", "模板消息");
		jsobj6.put("color", "#173177");
		jsobj2.put("remark", jsobj6);

		jsobj1.put("data", jsobj2);
		System.out.println(jsobj1);

		//WeChatUtils.PostSendMsg(jsobj1, url);

	}

}
