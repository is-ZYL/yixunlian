/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: UserUtils
 * Author:   yuanyuana
 * Date:     2018/9/29 10:08
 * Description: 用户工具类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package util.myutils.userutils;

import util.myutils.ObjectUtil;
import com.yixunlian.pojo.User;

/**
 * 〈一句话功能简述〉<br>
 * 〈用户工具类〉
 *
 * @author yuanyuana
 * @create 2018/9/29
 * @since 1.0.0
 */
public class UserUtils {

    /**
     * 检查用户是否处于封号状态
     *
     * @return
     */
    public static Boolean checkUserIsOk(User user) {
        if (ObjectUtil.isNull(user)) {
            return false;
        }
        return user.getClosedUserStatus() != 1;
    }

}
