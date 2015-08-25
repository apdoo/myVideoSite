package com.hexor.repo;

/**
 * Created with IntelliJ IDEA.
 * User: Dong
 * Date: 14-8-27
 * Time: 下午2:00
 * To change this template use File | Settings | File Templates.
 * 网站会员类
 */
public class User extends BasePojo {
    private int id; //会员id
    private String username="";//会员登录账号
    private String password=""; //会员登录密码
    private String email="";//会员email
    private String signupTime="";//注册时间
    private int points=20;//会员余额
    private int type=0;//会员类型 0-会员 、1-vip会员、 5管理员 ，-1被封禁会员
    private String loginIp="";//上次登录的ip
    private String loginTime="";//上次登录的时间
    private String temp="0";//是否会员上传了自定义的头像图片 0-未上传 1-上传
    private String favoriteVideo="";//会员收藏的视频id
    private String favoriteTopical="";//会员收藏的主题id
    private String topicalIds="";//会员发布的主题的id 如pid1,pid2,pid3
//    private String uploadVideoIds="";//会员上传的视频的id 如:vid1,vid2,vid3
//


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", signupTime='" + signupTime + '\'' +
                ", points=" + points +
                ", type=" + type +
                ", loginIp='" + loginIp + '\'' +
                ", loginTime='" + loginTime + '\'' +
                ", temp='" + temp + '\'' +
                ", favoriteVideo='" + favoriteVideo + '\'' +
                ", favoriteTopical='" + favoriteTopical + '\'' +
                ", topicalIds='" + topicalIds + '\'' +
                '}';
    }

    public String getFavoriteVideo() {
        return favoriteVideo;
    }

    public void setFavoriteVideo(String favoriteVideo) {
        this.favoriteVideo = favoriteVideo;
    }

    public String getSignupTime() {
        return signupTime;
    }

    public void setSignupTime(String signupTime) {
        this.signupTime = signupTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public String getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(String loginTime) {
        this.loginTime = loginTime;
    }

    public String getTemp() {
        return temp;
    }

    public void setTemp(String temp) {
        this.temp = temp;
    }

    public String getFavoriteTopical() {
        return favoriteTopical;
    }

    public void setFavoriteTopical(String favoriteTopical) {
        this.favoriteTopical = favoriteTopical;
    }

    public String getTopicalIds() {
        return topicalIds;
    }

    public void setTopicalIds(String topicalIds) {
        this.topicalIds = topicalIds;
    }
}
