package com.hexor.controller;
import com.hexor.repo.Pager;
import com.hexor.repo.User;
import com.hexor.repo.Video;
import com.hexor.service.IVideoService;
import com.hexor.service.impl.UserService;
import com.hexor.util.Configurer;
import com.hexor.util.EncodeUtil;
import com.hexor.util.ModelMapUtil;
import com.hexor.util.ResponseUtil;
import net.sf.json.JSONArray;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.management.MonitorInfo;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-06
 * Time: 13:34
 * 页面控制器
 */
@Controller
public class PageController extends BaseController{
    private static Logger logger = Logger.getLogger(PageController.class);
    /**
     *视频列表页面
     * @param categories 观看目录选择 1- 最新视频 2-观看最多 3-收藏最多 4-最高评分
     * @param wpage 想要访问的页数
     * @param request
     * @param response
     */
    @RequestMapping(value="videoList")
    public ModelAndView videoList(@RequestParam(value = "categories",required = true,defaultValue = "1") String categories,@RequestParam(value = "wpage",required = true,defaultValue = "1") String wpage,HttpServletRequest request,HttpServletResponse response){
        Map modelMap =new HashMap();
        int ca=getIntCategories(categories,1,4);//想要观看的目录
        long count=videoService.getTotalCounts();//获得视频总数
        Pager pager=null;
        switch (ca){
            case 1:pager=pagerSet(wpage, count);   modelMap.put("categories_title","最新视频");break;//设置分页
            case 2:pager=pagerSet(wpage,"views",count);   modelMap.put("categories_title","观看最多");break;
            case 3:pager=pagerSet(wpage,"favourite",count);   modelMap.put("categories_title","收藏最多");break;
            case 4:pager=pagerSet(wpage,"rate",count);   modelMap.put("categories_title","最高评分");break;
            default:pager=pagerSet(wpage, count);   modelMap.put("categories_title","最新视频");break;
        }
      try{
          List<Video> list=videoService.limit(pager);
          modelMap.put("pager",pager);
          JSONArray jsonArray = JSONArray.fromObject(list);
          String result = jsonArray.toString();//转换为json字符串形式给前端js转化生成
          modelMap.put("list",result);//分页视频列表
      }catch (Exception e){
          logger.error("获得视频列表连接错误"+e.getMessage());
      }
        modelMap.put("categories",ca);
        return  new ModelAndView("front-page/categories",modelMap);
    }
    @RequestMapping(value="searchContinue")
    public ModelAndView searchContinue(@RequestParam(value = "search",required = true,defaultValue = "") String search,@RequestParam(value = "wpage",required = true,defaultValue = "1") String wpage,HttpSession session,HttpServletRequest request) throws UnsupportedEncodingException {
        search = new String(search.getBytes("iso8859-1"),"UTF-8");
        return searchvideos(search,wpage,session,request);
    }
    /**
     * 视频搜索页面
     * @return
     */
    @RequestMapping(value="searchvideos")
    public ModelAndView searchvideos(@RequestParam(value = "search",required = true,defaultValue = "") String search,@RequestParam(value = "wpage",required = true,defaultValue = "1") String wpage,HttpSession session,HttpServletRequest request){
        User user= (User) session.getAttribute((String) Configurer.getContextProperty("session.userinfo"));//检查session中是否已经存在用户信息
        Map modelMap =new HashMap();
        Pager pager=null;
        if(user==null){//session中没有用户信息
            return  new ModelAndView("front-page/searchvideos",modelMap);//错误提示页面
        }else{
            try{
                long count=videoService.searchTotalCounts(search);//获得视频总数
                pager=pagerSet(wpage,search,count);//此处pager的type用来模糊匹配搜索视频的title
                List<Video> list=videoService.searchVideosLimit(pager);
                modelMap.put("pager",pager);
                JSONArray jsonArray = JSONArray.fromObject(list);
                String result = jsonArray.toString();//转换为json字符串形式给前端js转化生成
                modelMap.put("list",result);//分页视频列表
            }catch (Exception e){
                logger.error(e);
            }
            return  new ModelAndView("front-page/searchvideos",modelMap);//查询结果页面
        }

    }
    /**
     * 用户信息中心页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value="myaccount")
    public ModelAndView myaccount(HttpServletRequest request,HttpServletResponse response,HttpSession session){
        User user= (User) session.getAttribute((String) Configurer.getContextProperty("session.userinfo"));
        if(user==null){
            return new ModelAndView("front-page/account");
        }else{
            User result=userService.checkUser(user.getUsername());
            Map modelMap=new HashMap();
            modelMap.put("userinfo",result);
            modelMap.put("favoriteVideos",getUserFavoriteVideos(result));
            //查询用户收藏的视频列表
            return new ModelAndView("front-page/myaccount", modelMap);
        }
    }

    /**
     * 视频播放页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value="videoplay")
    public ModelAndView videoplay(@RequestParam(value = "vkey") String vkey,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception {
        Map modelMap =new HashMap();
        modelMap.put("shareKey",vkey);
        modelMap.put("favorite","收藏");
        String trueVkey= EncodeUtil.decodeString(vkey);//解密出真正的vkey
        Map map=new HashMap();
        map.put("vkey", trueVkey);
        map.put("views", "views");
        videoService.videoAddSelf(map);//观看数+1
        Video video=videoService.selectByVkey(trueVkey);//使用解密出来的vkey查询出视频信息
        User user= (User) session.getAttribute((String) Configurer.getContextProperty("session.userinfo"));//检查session中是否已经存在用户信息
        if(user!=null&&user.getFavoriteVideo().contains(trueVkey)){//当前用户已经登录，查看该用户收藏列表中是否收藏了该视频
                modelMap.put("favorite","取消收藏");
        }
        modelMap.put("video",video);//视频信息
        return  new ModelAndView("front-page/videoplay",modelMap);
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
    /**
     * 网站动态
     * 包含介绍 微博微信等
     */
    @RequestMapping(value="introduce")
    public String announce(){
        return "front-page/introduce";
    }

    /**
     * 网站动态
     * 包含介绍 微博微信等
     */
    @RequestMapping(value="bbs")
    public String bbs(){
        return "forum-page/index";
    }


}
