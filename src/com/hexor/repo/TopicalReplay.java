package com.hexor.repo;

import com.hexor.util.DateUtil;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-07
 * Time: 10:52
 * 主题回复
 */
public class TopicalReplay {
    private int id;//回复id
    private int topicalId;//主题id
    private int replayAuthorId;//回复的作者id
    private String author;//回复的作者
    private String content;//回复的内容
    private int authority=0;//回复被观看的权限 0-会员 1-vip会员
    private String time= DateUtil.getStrOfDateTime();//回复的时间
    private String replayAuthorAvatar;//回复的作者的头像



    public TopicalReplay() {
    }

    public TopicalReplay(int topicalId, int replayAuthorId, String author, String content) {
        this.topicalId = topicalId;
        this.replayAuthorId = replayAuthorId;
        this.author = author;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTopicalId() {
        return topicalId;
    }

    public void setTopicalId(int topicalId) {
        this.topicalId = topicalId;
    }

    public int getReplayAuthorId() {
        return replayAuthorId;
    }

    public void setReplayAuthorId(int replayAuthorId) {
        this.replayAuthorId = replayAuthorId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getAuthority() {
        return authority;
    }

    public void setAuthority(int authority) {
        this.authority = authority;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getReplayAuthorAvatar() {
        return replayAuthorAvatar;
    }

    public void setReplayAuthorAvatar(String replayAuthorAvatar) {
        this.replayAuthorAvatar = replayAuthorAvatar;
    }
}
