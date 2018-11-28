package util.weixin;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class EmojiStringUtils {
	/**
	 * @Title:判断是否存在特殊字符串
	 * @param
	 * @author:yanbing
	 * @date:2017-12-05 10:14
	 */
	public static boolean hasEmoji(String content) {
		Pattern pattern = Pattern.compile("[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\u2600-\u27ff]");
		Matcher matcher = pattern.matcher(content);
		if (matcher.find()) {
			return true;
		}
		return false;
	}

	/**
	 * @Title:替换字符串中的emoji字符
	 * @param
	 * @author:yanbing
	 * @date:2017-12-05 10:17
	 */
	public static String replaceEmoji(String str) {
		if (!hasEmoji(str)) {
			return str;
		} else {
			str = str.replaceAll("[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\u2600-\u27ff]", "");
			return str;
		}

	}
}