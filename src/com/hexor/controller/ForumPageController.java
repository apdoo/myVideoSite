package com.hexor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-20
 * Time: 23:17
 * 论坛页面控制器
 */
@Controller
@RequestMapping("/forum")
public class ForumPageController {
    /**
     *论坛首页
     * @param request
     * @param response
     */
    @RequestMapping(value="home")
    public String home(HttpServletRequest request,HttpServletResponse response){
        return "forum-page/home";
    }
}
