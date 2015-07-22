package com.hexor.controller;
import com.hexor.service.impl.UserService;
import com.hexor.util.ResponseUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-06
 * Time: 13:34
 * 网站首页前端页面控制器
 */
@Controller
public class ForntSitePageController {
    @Autowired
    @Qualifier("com.hexor.service.impl.UserService")
    private UserService userService = null;
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    private static Logger logger = Logger.getLogger(ForntSitePageController.class);


    /**
     *视频列表页面
     * @param request
     * @param response
     */
    @RequestMapping(value="videoList")
    public String videoList(HttpServletRequest request,HttpServletResponse response){
        return "front-page/categories";
    }

    /**
     * 用户信息中心页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value="myaccount")
    public String myaccount(HttpServletRequest request,HttpServletResponse response){
        return "front-page/myaccount";
    }

    /**
     * 视频播放页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value="videoplay")
    public String videoplay(HttpServletRequest request,HttpServletResponse response){
        return "front-page/videoplay";
    }



    /**
     * 账号注册于登录页面
     * @param request
     * @param response
     */
    @RequestMapping(value="account")
    public String account(HttpServletRequest request,HttpServletResponse response){
        return "front-page/account";
    }
    /**
     * 联系我们
     * @param request
     * @param response
     */
    @RequestMapping(value="contact")
    public String contact(HttpServletRequest request,HttpServletResponse response){
        return "front-page/contact";
    }
}
