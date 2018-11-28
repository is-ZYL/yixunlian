package com.yixunlian.pojo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import java.util.UUID;

/**
 * td_sensitive_words
 */
@Table(name = "td_sensitive_words")
public class SensitiveWords extends BasePojo {
    /**
     * 敏感词库表
     */
    @Id
    private String sensitiveWordsId;

    /**
     * 敏感词库内容
     */
    private String sensitiveWordsContext;

    /**
     * 敏感词库表
     * @return sensitive_words_id 
     */
    public String getSensitiveWordsId() {
        return sensitiveWordsId;
    }

    /**
     * 敏感词库表
     * @param sensitiveWordsId 
     */
    public void setSensitiveWordsId(String sensitiveWordsId) {
        this.sensitiveWordsId = sensitiveWordsId == null ? null : sensitiveWordsId.trim();
    }

    /**
     * 敏感词库内容
     * @return sensitive_words_context 
     */
    public String getSensitiveWordsContext() {
        return sensitiveWordsContext;
    }

    /**
     * 敏感词库内容
     * @param sensitiveWordsContext 
     */
    public void setSensitiveWordsContext(String sensitiveWordsContext) {
        this.sensitiveWordsContext = sensitiveWordsContext == null ? null : sensitiveWordsContext.trim();
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
    }

    public void init() {
        this.sensitiveWordsId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        this.setCreated(date);
        this.setUpdated(date);
    }
}