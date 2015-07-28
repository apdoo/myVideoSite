package com.hexor.controller;
import com.hexor.repo.Pager;
import com.hexor.repo.Video;
import com.hexor.service.IVideoService;
import com.hexor.service.impl.UserService;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-06
 * Time: 13:34
 * 网站首页前端页面控制器
 */
@Controller
public class ForntSitePageController extends BaseController{
    @Autowired
    @Qualifier("com.hexor.service.impl.UserService")
    private UserService userService = null;
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    @Autowired
    @Qualifier("com.hexor.service.impl.VideoService")
    private IVideoService videoService;
    public void setVideoService(IVideoService videoService) {
        this.videoService = videoService;
    }

    private static Logger logger = Logger.getLogger(ForntSitePageController.class);


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
            case 1:pager=pagerSet(wpage, count);break;//设置分页
            case 2:pager=pagerSet(wpage,"views",count);break;
            case 3:pager=pagerSet(wpage,"favourite",count);break;
            case 4:pager=pagerSet(wpage,"rate",count);break;
            default:pager=pagerSet(wpage, count);break;
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
    /**
     * 网站动态
     * 包含介绍 微博微信等
     */
    @RequestMapping(value="introduce")
    public String announce(){
        return "front-page/introduce";
    }
}
