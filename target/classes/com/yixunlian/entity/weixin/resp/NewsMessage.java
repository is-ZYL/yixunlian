/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: NewsMessage
 * Author:   yuanyuana
 * Date:     2018/11/4 17:45
 * Description: 响应消息之图文消息
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.yixunlian.entity.weixin.resp;

import com.alipay.api.domain.Article;

import java.util.List;

/**
 * 〈一句话功能简述〉<br>
 * 〈响应消息之图文消息 〉
 *
 * @author yuanyuana
 * @create 2018/11/4
 * @since 1.0.0
 */
public class NewsMessage extends BaseMessage {
    /**
     * 图文消息个数，限制为10条以内
     */
    private int ArticleCount;
    /**
     * 多条图文消息信息，默认第一个item为大图
     */
    private List<Article> Articles;

    public int getArticleCount() {
        return ArticleCount;
    }

    public void setArticleCount(int articleCount) {
        ArticleCount = articleCount;
    }

    public List<Article> getArticles() {
        return Articles;
    }

    public void setArticles(List<Article> articles) {
        Articles = articles;
    }
}

