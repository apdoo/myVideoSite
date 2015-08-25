package com.hexor.controller;

import com.hexor.repo.User;
import com.hexor.service.impl.UserService;
import com.hexor.util.*;
import net.sf.json.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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
    public ModelAndView login(User user,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException {
        User result=userService.checkLogin(user);
        //当数据库检验用户名密码
        if(result==null){
            ModelAndView modelAndView=new ModelAndView();
            modelAndView.setViewName("front-page/messagetip");
            modelAndView.addObject("msg", " 用户名或密码错误");
            return modelAndView;
        }if(result.getType()==-1){
            ModelAndView modelAndView=new ModelAndView();
            modelAndView.setViewName("front-page/messagetip");
            modelAndView.addObject("msg", " 该用户已被禁止登录！");
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
        if(session.getAttribute((String)Configurer.getContextProperty("session.pre_url"))!=null&&!session.getAttribute((String)Configurer.getContextProperty("session.pre_url")).equals("")){
            response.sendRedirect((String)session.getAttribute((String)Configurer.getContextProperty("session.pre_url")));
        }
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
     * 修改密码接口
     * @param user
     * @param session
     * @param request
     */
    @RequestMapping(value="changePassword")
    public String changePassword(User user,HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model) throws ServletException, IOException {
          User session_user=getSessionUserinfo(session);  //获得session中的用户信息
        if(session_user==null) return null;
          User trueUser=userService.getUserById(session_user.getId());//拿到数据库中的user
          if(user.getVcode().equals(trueUser.getPassword())){//当session中有用户信息且旧的密码等于新的密码
                trueUser.setPassword(user.getPassword());
                userService.updateUserPassword(trueUser);//更改用户密码
               model.addAttribute("msg","修改密码成功");
              return "forum-page/messagetips";
          }else{
                model.addAttribute("msg","当前密码输入错误");
              return "forum-page/settings";
          }

    }
    /**
     * 登出接口
     * 根据传来的参数确定返回那个页面
     * @param from  bbs-从论坛退出 返回论坛首页   video -从视频站退出 返回视频站登录注册页面
     * @param session
     * @return
     */
    @RequestMapping(value="loginout")
    public ModelAndView loginout(@RequestParam(value = "from",required = true,defaultValue = "bbs") String from,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException {
        session.removeAttribute((String) Configurer.getContextProperty("session.userinfo"));
        if(from.equals("bbs")){
            response.sendRedirect(request.getContextPath() + "/bbs");//get请求直接重定向
            return null;
        }else{
            return new ModelAndView("front-page/account");
        }

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
        User result=userService.checkLogin(user);//查询数据库中的用户
        session.setAttribute((String) Configurer.getContextProperty("session.userinfo"), result);
        //当数据库中存在此用户
        if(result!=null){
            if(result.getType()==-1){//该用户被禁止登录
                session.removeAttribute((String) Configurer.getContextProperty("session.userinfo"));//清除缓存
            }
            try {
                result.setLoginIp(IpUtil.getIpAddr(request));
                result.setLoginTime(DateUtil.getStrOfDateTime());
                userService.loginUpdate(result);
                ResponseUtil.outWriteJsonMessage(response, map);
            } catch (IOException e) {
            }
        }
    }

    /**
     * 用户头像上传修改接口
     * @return
     */
    @RequestMapping(value = "modifyAvatar")
    public String  modifyAvatar(HttpServletRequest request, HttpServletResponse response,HttpSession session,Model model) throws ServletException, IOException {
        User user= getSessionUserinfo(session);//检查session中是否已经存在用户信息
        if(user==null)   return null; //没有用户登录则直接返回
        String avatorPath=(String) Configurer.getContextProperty("avatar.img.savePath");//拿到用户的本地存储路径
        DiskFileItemFactory fac = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(fac);
        upload.setHeaderEncoding("utf-8");
        List fileList = null;//文件列表list
        try {
            fileList = upload.parseRequest(request);//解析request请求中的文件列表
        } catch (FileUploadException ex) {
            ex.printStackTrace();
            model.addAttribute("msg","上传头像发生错误!");
          return "forum-page/avatar";
        }
        Iterator<FileItem> it = fileList.iterator();   //获得当前传入的文件列表
        String name = "";//文件名
        String extName = "";//文件扩展名
        while (it.hasNext()) {        //判断是否文件列表有下一个文件
            FileItem item = it.next();
            if (!item.isFormField()) {
                name = item.getName();
//                System.out.println("sss"+item.getSize()+"bbb"+item.getSize()/(1024*1024));
                long size = item.getSize()/(1024);//KB为单位
                if(size>=1024*2){//大于2MB的话
                    model.addAttribute("msg","图片文件太大，请选择小于2MB的文件!");
                    return "forum-page/avatar";
                }//判断文件大小
                String type = item.getContentType();//image起头的就是图片文件
                if(!type.startsWith("image")){
                    model.addAttribute("msg","该文件不是图片文件，请重新选择!");
                    return "forum-page/avatar";
                }
//                System.out.println(name+" "+size + " " + type);
                if (name == null || name.trim().equals("")) {
                    model.addAttribute("msg","该文件不是图片文件，请重新选择!");
                    return "forum-page/avatar";
                }
                //扩展名格式：
                if (name.lastIndexOf(".") >= 0)
                 extName = name.substring(name.lastIndexOf(".")+1);//获得扩展名
                File saveFile = new File(avatorPath + user.getId()+"."+extName);
                try {
                    item.write(saveFile);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                userService.updateUserAvator(user.getId(),user.getId()+"."+extName);//temp标志修改
            }
        }
        model.addAttribute("msg","修改头像成功");
        return "forum-page/messagetips";
    }
}
