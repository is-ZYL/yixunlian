/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ObjectUtil
 * Author:   yuanyuana
 * Date:     2018/9/25 15:40
 * Description: 对象工具类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package util.myutils;

/**
 * 〈一句话功能简述〉<br>
 * 〈对象工具类〉
 *
 * @author yuanyuana
 * @create 2018/9/25
 * @since 1.0.0
 */

import org.apache.commons.lang3.StringUtils;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.*;

public class ObjectUtil {

    /**
     * 判断该对象的属性是否全部为空: 返回ture表示所有属性为null  返回false表示不是所有属性都是null
     *
     * @param entryParam
     * @return
     */
    public static boolean isAllFieldNull(Object entryParam) {
        // 对象为空，直接返回false
        if (null == entryParam) {
            return false;
        }
        // 判断entryParam对象各个变量是否为空,（有一个不为空，返回true）
        for (Field f : entryParam.getClass().getDeclaredFields()) {
            try {
                // 变量设置为可获取
                f.setAccessible(true);
                // 如果是字符串，如果不为空,返回true
                // getType是字段的类型
                if (f.getType() == String.class) {
                    if (StringUtils.isNotBlank((String) f.get(entryParam))) {
                        return false;
                    }
                    //Integer类型
                } else if (f.getType() == Integer.class && f.get(entryParam) != null) {
                    return false;
                } else if (f.getType() == Date.class && f.get(entryParam) != null) {
                    return false;
                } else if (f.getType() == BigDecimal.class && f.get(entryParam) != null) {
                    return false;
                }
            } catch (Exception e) {
                e.printStackTrace();
                // 异常验证下一个
                continue;
            }
        }
        return true;
    }

    /**
     * 方法描述 如果对象为非空返回true 否则返回false
     *
     * @param obj
     * @return
     */
    public static boolean isNotNull(Object obj) {
        return null != obj && "" != obj || !"null".equals(obj);
    }

    /**
     * 方法描述 如果对象为空返回 true 否则返回false
     *
     * @param obj
     * @return
     */
    public static boolean isNull(Object obj) {
        return null == obj || "" == obj || "null".equals(obj);
    }

    /**
     * 检测字符串是否不为空(null,"","null")
     *
     * @param s
     * @return 不为空则返回true，否则返回false
     */
    public static boolean notEmpty(String s) {
        return null != s && !"".equals(s) && !"null".equals(s);
    }

    /**
     * 检测字符串是否为空(null,"","null")
     *
     * @param s
     * @return 为空则返回true，不否则返回false
     */
    public static boolean isEmpty(String s) {
        return null == s || "".equals(s) || "null".equals(s);
    }

    /**
     * 方法描述 判断Map集合非null 非空 返回true 否则返回false
     *
     * @param map
     * @return
     */
    public static boolean isNotNull(Map<Object, Object> map) {
        return null != map && !map.isEmpty();
    }

    /**
     * 方法描述 判断Map集合是null或者空 返回true 否则返回false
     *
     * @param map
     * @return
     */
    public static boolean isNull(Map<Object, Object> map) {
        return null == map || map.isEmpty();
    }

    /**
     * 方法描述 判断Map集合非null 非空 返回true 否则返回false
     *
     * @param list
     * @return
     */
    public static boolean isNotNull(List<Object> list) {
        return null != list && !list.isEmpty();
    }

    /**
     * 方法描述 判断Map集合是null或者空 返回true 否则返回false
     *
     * @param list list
     * @return
     */
    public static boolean isNull(List<Object> list) {
        return null == list || list.isEmpty();
    }

    /**
     * 将对象转成map
     *
     * @param obj
     * @return
     */
    public static Map<String, Object> objToMap(Object obj) {
        Map<String, Object> map = new HashMap<>(10000);
        // 获取f对象对应类中的所有属性域
        Field[] fields = getAllFields(obj);
        for (Field field : fields) {
            String varName = field.getName();
            //将key置为小写，默认为对象的属性
            //varName = varName.toLowerCase();
            try {
                // 获取原来的访问控制权限
                boolean accessFlag = field.isAccessible();
                // 修改访问控制权限
                field.setAccessible(true);
                // 获取在对象f中属性fields[i]对应的对象中的变量
                Object o = field.get(obj);
                if (o != null) {
                    map.put(varName, o.toString());
                }
                // System.out.println("传入的对象中包含一个如下的变量：" + varName + " = " + o);
                // 恢复访问控制权限
                field.setAccessible(accessFlag);
            } catch (IllegalArgumentException | IllegalAccessException ex) {
                ex.printStackTrace();
            }
        }
        return map;
    }

    /**
     * 返回对象的Field（包括私有的和父类的）
     */
    private static Field[] getAllFields(Object object) {
        Class clazz = object.getClass();
        List<Field> fieldList = new ArrayList<>();
        while (clazz != null) {
            fieldList.addAll(new ArrayList<>(Arrays.asList(clazz.getDeclaredFields())));
            clazz = clazz.getSuperclass();
        }
        Field[] fields = new Field[fieldList.size()];
        fieldList.toArray(fields);
        return fields;
    }
}