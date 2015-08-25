package com.hexor.repo;

import com.hexor.util.DateUtil;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-07
 * Time: 10:43
 * 论坛主题bean
 */
public class Topical {
    private int id;//主题id号
    private int authorId;//作者id
    private String author="";//作者
    private String tags="";//主题标签
    private String vkey="";//主题的vkey 用来给下载区检测唯一主题
    private String title;//标题
    private String content;//内容
    private String time= DateUtil.getStrOfDateTime();//主题发布时间
    private int authority=0;//主题观看权限 0-会员 1-vip会员
    private int views=0;//主题点击次数(即主题查看次数)
    private int type=0;//主题类型 0-普通 1-置顶
    private int orderIndex=0;//排序索引 9-0 如果帖子是置顶类型的 按照降序排列 置顶的顺序
    private long replays=0;//当前主题的回复总数。不存数据库 只是在首页进行前端展示
    private String authorAvatar="";//当前主题作者的自定义头像图片名字

    public Topical() {
    }

    public Topical(int authorId, String author, String tags, String title, String content) {
        this.authorId = authorId;
        this.author = author;
        this.tags = tags;
        this.title = title;
        this.content = content;
    }
    public Topical(int authorId, String author, String tags,String vkey, String title, String content) {
        this.authorId = authorId;
        this.author = author;
        this.tags = tags;
        this.title = title;
        this.content = content;
        this.vkey=vkey;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getAuthority() {
        return authority;
    }

    public void setAuthority(int authority) {
        this.authority = authority;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getOrderIndex() {
        return orderIndex;
    }

    public void setOrderIndex(int orderIndex) {
        this.orderIndex = orderIndex;
    }

    public String getVkey() {
        return vkey;
    }

    public void setVkey(String vkey) {
        this.vkey = vkey;
    }

    public long getReplays() {
        return replays;
    }

    public void setReplays(long replays) {
        this.replays = replays;
    }

    public String getAuthorAvatar() {
        return authorAvatar;
    }

    public void setAuthorAvatar(String authorAvatar) {
        this.authorAvatar = authorAvatar;
    }
}
