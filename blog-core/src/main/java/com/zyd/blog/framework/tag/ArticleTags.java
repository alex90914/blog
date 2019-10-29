/**
 * MIT License
 * <p>
 * Copyright (c) 2018 yadong.zhang
 * <p>
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * <p>
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * <p>
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
package com.zyd.blog.framework.tag;

import com.github.pagehelper.PageInfo;
import com.zyd.blog.business.entity.Article;
import com.zyd.blog.business.enums.ArticleStatusEnum;
import com.zyd.blog.business.service.BizArticleService;
import com.zyd.blog.business.vo.ArticleConditionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.Map;

/**
 * 文章相关的自定义标签
 *
 * @author yadong.zhang (yadong.zhang0415(a)gmail.com)
 * @version 1.0
 * @website https:// www.dreamatach.com
 * @date 2018/4/16 16:26
 * @since 1.0
 * @modify by zhyd 2018-09-20
 *      调整实现，所有自定义标签只需继承BaseTag后通过构造函数将自定义标签类的className传递给父类即可。
 *      增加标签时，只需要添加相关的方法即可，默认自定义标签的method就是自定义方法的函数名。
 *      例如：<@articleTag method="recentArticles" ...></@articleTag>就对应 {{@link #recentArticles(Map)}}方法
 */
@Component
public class ArticleTags extends BaseTag {

    @Autowired
    private BizArticleService articleService;

    public ArticleTags() {
        super(ArticleTags.class.getName());
    }

    public Object recentArticles(Map params) {
        int pageSize = this.getPageSize(params);
        return articleService.listRecent(pageSize);
    }

    public Object recommendedList(Map params) {
        int pageSize = this.getPageSize(params);
        return articleService.listRecommended(pageSize);
    }

    public Object randomList(Map params) {
        int pageSize = this.getPageSize(params);
        return articleService.listRandom(pageSize);
    }

    public Object hotList(Map params) {
        int pageSize = this.getPageSize(params);
        return articleService.listHotArticle(pageSize);
    }

    public Object typeList(Map params) {
        int pageSize = this.getPageSize(params);
        long typeId = -1;
        String typeStr = getParam(params, "typeId");
        if (!StringUtils.isEmpty(typeStr)) {
            typeId = Long.parseLong(typeStr);
        }
        // 按文章分类查询
        ArticleConditionVO vo = new ArticleConditionVO();
        vo.setTypeId(typeId);
        // 已发布状态
        vo.setStatus(ArticleStatusEnum.PUBLISHED.getCode());
        vo.setPageSize(pageSize);
        PageInfo<Article> pageInfo = articleService.findPageBreakByCondition(vo);
        return null == pageInfo ? null : pageInfo.getList();
    }
}
