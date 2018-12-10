/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: TokenUtils
 * Author:   yuanyuana
 * Date:     2018/9/25 11:18
 * Description: token工具类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package util.myutils;

import com.yixunlian.pojo.User;
import com.yixunlian.service.RedisService;
import org.apache.commons.codec.digest.DigestUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.IOException;

/**
 * 〈一句话功能简述〉<br>
 * 〈token工具类〉
 *
 * @author yuanyuana
 * @create 2018/9/25
 * @since 1.0.0
 */
@Component
public class TokenUtils {
    private static final Integer REDIS_TIME = 60 * 60 * 24 * 365;
    private static final Integer CODE_TIME = 60 * 60;
    private static final ObjectMapper MAPPER = new ObjectMapper();

    //工具类注入需要的对象方法：
    
    @Autowired
    private  RedisService rService;
    public static TokenUtils tokenUtils;

    @PostConstruct
    public void init() {
        tokenUtils = this;
        //tokenUtils.rService =  this.rService;
    }

    /**
     * 查找此token对应的值
     *
     * @param token
     * @return
     */
    public static String getDataByKey(String token) {
        String key = "TOKEN_" + token;
        return tokenUtils.rService.get(key);
    }

    /**
     * 查找此手机号对应的验证码
     *
     * @param Uphone
     * @return
     */
    public static String getDataByuPhone(String Uphone) {
        String key = "CHECK" + Uphone;
        return tokenUtils.rService.get(key);
    }

    /**
     * 查找此手机号请求的验证码次数
     *
     * @param Uphone
     * @return
     */
    public static String getCodeCountByUphone(String Uphone) {
        String key = "COUNT_" + Uphone;
        return tokenUtils.rService.get(key);
    }

    /**
     * 生成用户token，并存放至redis中
     *
     * @param user
     * @return
     */
    public static String setDataByUser(User user) {
        // 把用户信息放到rides中
        String token1 = null;
        try {
            token1 = DigestUtils.md5Hex(System.currentTimeMillis() + user.getOpenId());
            tokenUtils.rService.set("TOKEN_" + token1, MAPPER.writeValueAsString(user), REDIS_TIME);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return token1;
    }

    /**
     * 根据已有token，存放数据至redis中
     *
     * @param user
     * @return
     */
    public static void setDataByUser(User user, String token) {
        try {
            tokenUtils.rService.set("TOKEN_" + token, MAPPER.writeValueAsString(user), REDIS_TIME);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除token
     *
     * @param token
     * @return
     */
    public static void delToken(String token) {
        tokenUtils.rService.del("TOKEN_" + token);
    }

}
