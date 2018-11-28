/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: ArticlesMessage
 * Author:   yuanyuana
 * Date:     2018/11/3 22:32
 * Description: 图文消息类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.weixin.resp;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.yixunlian.entity.weixin.req.BaseMessage;

import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈图文消息类〉
 *
 * @author yuanyuana
 * @create 2018/11/3
 * @since 1.0.0
 */
@XStreamAlias("xml")
public class ArticlesMessage extends BaseMessage {
    @XStreamAlias("ArticleCount")
    private int ArticleCount;

    @XStreamAlias("Articles")
    private List<ArticlesItem> Articles;

    public int getArticleCount() {
        return ArticleCount;
    }

    public void setArticleCount(int articleCount) {
        ArticleCount = articleCount;
    }

    public List<ArticlesItem> getArticles() {
        return Articles;
    }

    public void setArticles(List<ArticlesItem> articles) {
        Articles = articles;
    }
}

