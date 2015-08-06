package com.hexor.controller;

import com.hexor.repo.User;
import com.hexor.service.impl.UserService;
import com.hexor.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-21
 * Time: 15:02
 * 用户控制器
 */
@Controller
@RequestMapping(value="user")
public class UserController extends BaseController{
  /**
     * 登录接口
     * @return
     */
    @RequestMapping(value="login")
    public ModelAndView login(User user,HttpSession session,HttpServletRequest request){
        User result=userService.checkLogin(user);
        //当数据库检验用户名密码
        if(result==null){
            ModelAndView modelAndView=new ModelAndView();
            modelAndView.setViewName("front-page/messagetip");
            modelAndView.addObject("msg", " 用户名或密码错误");
            return modelAndView;
        }
        //登录成功
        try{
            result.setLoginIp(IpUtil.getIpAddr(request));
            result.setLoginTime(DateUtil.getStrOfDateTime());
            userService.loginUpdate(result);
        }catch (Exception e){
            return new ModelAndView("front-page/messagetip", ModelMapUtil.getMsg("登录异常！"));
        }
        session.setAttribute((String) Configurer.getContextProperty("session.userinfo"), result);
        Map modelMap=new HashMap();
        modelMap.put("userinfo",result);
        modelMap.put("favoriteVideos", getUserFavoriteVideos(result));
        ModelAndView modelAndView=new ModelAndView("front-page/myaccount",modelMap) ;
        return modelAndView;
    }
    /**
     * 注册接口
     * @param session
     */
    @RequestMapping(value="signup")
    public ModelAndView signup(User user,HttpSession session,HttpServletRequest request){
        String vcode=(String)session.getAttribute("validation_code");//从session拿去服务端所存的验证码
        User result=userService.checkUser(user.getUsername());//
        if(result!=null)  return new ModelAndView("front-page/messagetip", ModelMapUtil.getMsg("已经存在用户名！")); //当数据库中存在同名用户的时候
        if(vcode!=null&&user.getVcode()!=null){
            //转换大小写
            vcode=vcode.toLowerCase();
            String in=user.getVcode().toLowerCase();
            if(!in.equals(vcode)){
                return new ModelAndView("front-page/messagetip",ModelMapUtil.getMsg("验证码输入错误！"));
            }
        }
        try{
            user.setLoginIp(IpUtil.getIpAddr(request));
            user.setSignupTime(DateUtil.getStrOfDateTime());
            user.setLoginTime(DateUtil.getStrOfDateTime());
            //验证成功，加入用户信息岛session与插入到数据库
            session.setAttribute((String) Configurer.getContextProperty("session.userinfo"), user);
            userService.insertUser(user);
        }catch (Exception e){
            Map map=ModelMapUtil.getMsg("注册失败!");
            return new ModelAndView("front-page/messagetip",map);
        }
        return  new ModelAndView("front-page/myaccount",ModelMapUtil.getUserMap(user)) ;
    }
    /**
     * 登出接口
     * @param session
     * @return
     */
    @RequestMapping(value="loginout")
    public ModelAndView loginout(HttpSession session){
        session.removeAttribute((String) Configurer.getContextProperty("session.userinfo"));
        return new ModelAndView("front-page/account");
    }
    /**
     * 自动登录
     * @param user
     * @param response
     * @param session
     * @param request
     */
    @RequestMapping(value = "autoLogin")
    public void autoLogin(User user,HttpServletResponse response,HttpSession session,HttpServletRequest request){
        Map map=new HashMap();
        map.put("msg","success");
        User suser= (User) session.getAttribute((String) Configurer.getContextProperty("session.userinfo"));//检查session中是否已经存在用户信息
        if(suser!=null)   return ; //已经登录了 则直接返回
        User result=userService.checkLogin(user);
        session.setAttribute((String) Configurer.getContextProperty("session.userinfo"), result);
        //当数据库中存在此用户
        if(result!=null){
            try {
                result.setLoginIp(IpUtil.getIpAddr(request));
                result.setLoginTime(DateUtil.getStrOfDateTime());
                userService.loginUpdate(result);
                ResponseUtil.outWriteJsonMessage(response, map);
            } catch (IOException e) {

            }
        }
    }
}
