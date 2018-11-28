/**
 * Copyright (C), -, XXX有限公司
 * FileName: ListUtils
 * Author:   yuanyuana
 * Date:     // :
 * Description: java List 工具类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package util.myutils;

import com.google.common.base.Function;
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.ListMultimap;
import org.apache.commons.lang3.StringUtils;

import java.util.*;

/**
 * 〈一句话功能简述〉<br>
 * 〈java List 工具类〉
 *
 * @author yuanyuana
 * @create //
 * @since ..
 */
public class ListUtils {

    /**
     * list 中有一个为主键key
     *
     * @param list
     * @param function
     * @return
     */
    public static <K, V> Map<K, V> listToMap(List<V> list, Function<V, K> function) {
        Map<K, V> map = new HashMap<>();
        if (list == null) {
            return map;
        }
        for (V value : list) {
            K k = function.apply(value);
            map.put(k, value);
        }
        return map;
    }

    /**
     * list 元素转为另一个元素的list
     */
    public static <F, R> List<R> listConvert(List<F> list, Function<F, R> function) {
        List<R> listN = new ArrayList<>();
        if (list == null) {
            return listN;
        }
        for (F value : list) {
            R r = function.apply(value);
            if (r != null) {
                listN.add(r);
            }
        }
        return listN;
    }

    /**
     * list 元素过滤另一个元素的list
     */
    public static <F> List<F> filter(List<F> list, Function<F, Boolean> function) {
        List<F> listN = new ArrayList<>();
        if (list == null) {
            return listN;
        }
        for (F value : list) {
            Boolean r = function.apply(value);
            if (r) {
                listN.add(value);
            }
        }
        return listN;
    }

    /**
     * list 元素转为另一个元素的list并且去重,适合list数据量较小
     *
     * @param list
     * @param function
     * @param <F>
     * @param <R>
     * @return
     */
    public static <F, R> List<R> listConvertAndUnique(List<F> list, Function<F, R> function) {
        List<R> listN = new ArrayList<>();
        if (list == null) {
            return listN;
        }
        for (F value : list) {
            R r = function.apply(value);
            if (r != null && !listN.contains(r)) {
                listN.add(r);
            }
        }
        return listN;
    }

    /**
     * list 元素转为以seg分割的字符串
     */
    public static String split(List list, String seg) {
        StringBuilder sb = new StringBuilder();
        for (Object value : list) {
            sb.append(value.toString()).append(seg);
        }
        String t = sb.toString();
        if (t.endsWith(seg)) {
            int end = t.length() - seg.length();
            t = t.substring(0, end);
        }
        return t;
    }

    public static <V> Map<Integer, V> listToMapByHashCode(List<V> list) {
        Map<Integer, V> map = new HashMap<Integer, V>();
        for (V value : list) {
            map.put(value.hashCode(), value);
        }
        return map;
    }

    public static <K, V> Map<K, V> listToMapByFunction(List<V> list, Function<V, K> function) {
        Map<K, V> map = new HashMap<K, V>();
        for (V value : list) {
            map.put(function.apply(value), value);
        }
        return map;
    }

    /**
     * list to ListMultimap
     *
     * @param list
     * @param function
     * @param <K>
     * @param <V>
     * @return
     */
    public static <K, V> ListMultimap<K, V> listToListMultiMap(List<V> list, Function<V, K> function) {
        ListMultimap listMultimap = ArrayListMultimap.<K, V>create();
        for (V value : list) {
            listMultimap.put(function.apply(value), value);
        }
        return listMultimap;
    }

    public static <V> List<V> pageList(List<V> list, int pageIndex, int pageNum) {
        int size = list.size();
        int fromIndex = pageIndex * pageNum;
        if (fromIndex > size) {
            fromIndex = size;
        }
        int toIndex = fromIndex + pageNum;
        if (toIndex > size) {
            toIndex = size;
            return list.subList(fromIndex, toIndex);
        }
        return list.subList(fromIndex, toIndex);
    }

    public static <E> boolean isEmpty(List<E> list) {
        return list == null || list.isEmpty();
    }

    public static List<String> list(String s, String spe) {

        ArrayList<String> list = new ArrayList<>();
        if (StringUtils.isBlank(s)) {
            return list;
        }
        String[] e = s.split(spe);
        Collections.addAll(list, e);
        return list;

    }

    public static <T> List<T> toList(T... a) {

        if (a == null) {
            return null;
        }
        List<T> l = new ArrayList<>();
        Collections.addAll(l, a);
        return l;
    }

    /**
     * 数组去重
     *
     * @param list
     * @return
     */
    public static List removeDuplicate(List<?> list) {
        List listTemp = new ArrayList();
        for (Object aList : list) {
            if (!listTemp.contains(aList)) {
                listTemp.add(aList);
            }
        }
        return listTemp;
    }
}
