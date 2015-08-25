package com.hexor.repo;

import com.hexor.util.DateUtil;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-17
 * Time: 15:44
 * 用户下载记录表
 * 作为用户重复下载不扣除金币的依据
 */
public class UserDownloadLog {
    private int id;//id号
    private int userId;//会员id
    private String userName;//会员名
    private String localPath="";//本地文件路径
    private String title;//下载的文件标题
    private String url;//下载的链接地址
    private String time= DateUtil.getStrOfDateTime();//下载的时间

    public UserDownloadLog() {
    }

    public UserDownloadLog(int userId, String userName, String localPath, String title, String url) {
        this.userId = userId;
        this.userName = userName;
        this.localPath = localPath;
        this.title = title;
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getLocalPath() {
        return localPath;
    }

    public void setLocalPath(String localPath) {
        this.localPath = localPath;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
