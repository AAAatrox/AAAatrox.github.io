---
title: hexo主题制作
updated: 1556932881
date: 2019-05-02 17:24:56
tags:
 - hexo
 - javascript
 - html
 - css
 - swig
 - ejs
---

# 笔记

## 结构

```
{theme_name}-+-_config.yml
             |
             +-layout/---_partial/
             |
             +-scripts/
             |
             +-languages/
             |
             `-source/-+-css/
                       |
                       +-js
                       |
                       `-fonts(???)
```

## 变量

- `config.{XXX}`:站点配置`_config.yml`里面的变量`{XXX}`
- `theme.{XXX}`:主题配置`_config.yml`(需要`hexo s`)

## 函数

- [iterator遍历](https://www.jb51.net/article/70106.htm)

## 脚本

### 本地搜索功能

使用google的api

- 原插件搜索到的文章链接解码:

```javascript
str += "<li><a href='" + unescape(decodeURI(data_url)) + "' class='search-result-title'>" + data_title + "</a>";
```

### 分页器

js:`blog/node_modules/hexo-generator-index/`

配置:`blog/_config.yml`

## 其他

### `tags`和`categories`

`next`主题需要在`index.md`中定义`type: "tags"`/`type: "categories"`

其余一般都是`layout: "tag"`/`layout: "category"`

`source/`下的`{name}/index.md`的排版方式是和其中定义的`layout`一致的(如`layout: tags`的排版方式就是`layout/`下的`tags.xxx`)

# ejs

- [教程参考](https://segmentfault.com/a/1190000008040387)
- [辅助函数](https://www.jianshu.com/p/81ea81d291fd)

## tag

# swig
