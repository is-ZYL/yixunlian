/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: Articles
 * Author:   yuanyuana
 * Date:     2018/11/3 22:33
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.weixin.resp;

import com.thoughtworks.xstream.annotations.XStreamAlias;

import java.util.List;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author yuanyuana
 * @create 2018/11/3
 * @since 1.0.0
 */
@XStreamAlias("Articles")
public class Articles {
    private List<ArticlesItem> Articles;
}
