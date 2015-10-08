package com.hexor.controller;
import com.hexor.repo.*;
import com.hexor.service.IVideoService;
import com.hexor.service.impl.UserService;
import com.hexor.util.*;
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
import java.util.ArrayList;
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
        int ca=getFormatInt(categories, 1, 4);//想要观看的目录
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
        User user= getSessionUserinfo(session);//获得session中的用户信息
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
     * 观看视频限制页面
     * @return
     */
    @RequestMapping(value = "viewlimit")
    public String viewlimit(){
        return "front-page/viewlimit";
    }

    /**
     * 会员观看视频限制页面
     * @return
     */
    @RequestMapping(value = "memberlimit")
    public String memberlimit(){
        return "front-page/memberlimit";
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
       Topical topical=topicalService.checkVkey(trueVkey); //查询中topical的对应的主题信息
        modelMap.put("topical",topical);
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
     * 广告页面
      * @return
     */
    @RequestMapping(value="ad")
    public String ad(){
        return "front-page/adpage";
    }


    /**
     *  论坛主页
     *  交流区，种子区，建议区，下载区，图片区 五个大区
     *  根据参数不同，查询返回不同区的主题
     *  @param tab 1-交流区 2-种子区 3-建议区 4-下载区 5-图片区 6 最热访问的板块的参数
     */
    @RequestMapping(value="bbs")
    public ModelAndView bbs(@RequestParam(value = "tab",required = true,defaultValue = "1") String tab,@RequestParam(value = "wpage",required = true,defaultValue = "1") String wpage,HttpServletRequest request,HttpServletResponse response,HttpSession session){
        int t=getFormatInt(tab,1,6);//限制了tab只能是1-6的数字
        Map modelMap=new HashMap();
        Pager pager;//分页
        long count;//当前板块的总数
        String cn_name;//访问的板块中文名称
        switch (t){
            case 1:cn_name="交流区";count=topicalService.selectByTagsCount(cn_name);pager=pagerSet(wpage,cn_name,count);break;//交流区
            case 2:cn_name="建议区";count=topicalService.selectByTagsCount(cn_name);pager=pagerSet(wpage,cn_name,count);break;//种子区
            case 3:cn_name="图片区";count=topicalService.selectByTagsCount(cn_name);pager=pagerSet(wpage,cn_name,count);break;//建议区
            case 4:cn_name="种子区";count=topicalService.selectByTagsCount(cn_name);pager=pagerSet(wpage,cn_name,count);break;//下载区
            case 5:cn_name="下载区";count=topicalService.selectByTagsCount(cn_name);pager=pagerSet(wpage,cn_name,count);break;//下载区
            case 6:cn_name="最热";count=topicalService.selectTotalCount();pager=pagerSet(wpage,count);break;//最热
            default:cn_name="交流区";count=topicalService.selectByTagsCount(cn_name);pager=pagerSet(wpage,cn_name,count);break;//默认-交流区
        }
        List<Topical> list=new ArrayList<Topical>();
        if(t==6){
            list=topicalService.selectByViewsLimit(pager);//最热分页 按照点击量排序
        }else{
            list=topicalService.selectByTagsLimit(pager);//分页查找的主题 按照置顶、发布时间排序
        }
        for(int i=0;i<list.size();i++){//循环当前板块的主题
            long tid_replay=topicalReplayService.selectReplaysCount(list.get(i).getId()+"");//当前主题的回复总数
            list.get(i).setReplays(tid_replay);
            User author=userService.getUserById(list.get(i).getAuthorId());//查询该作者是否有自定义头像图片
            if(author!=null&&!author.getTemp().equals("0")){//当前作者有自定义头像
                list.get(i).setAuthorAvatar(Configurer.getContextProperty("avatar.root")+author.getTemp());//自定义图片的hhtp访问路径
            }else{
                list.get(i).setAuthorAvatar(Configurer.getContextProperty("avatar.root")+"default_avatar.png");//默认图片的路径
            }
        }
        modelMap.put("count",count);//当前版块主题总数
        modelMap.put("cn_name",cn_name);//板块中文名
        modelMap.put("tab",t);//板块id
        modelMap.put("pager",pager);//分页信息
        modelMap.put("topical_list",list);//分页主题列表信息
        //--右侧使用的参数 因为拦截器不拦截论坛首页，所以此处单独查询一下。
        modelMap.put("total_topical_count", topicalService.selectTotalCount());//总的主题总数
        modelMap.put("total_topicalreplay_count", topicalReplayService.selectTotalCount());//总的回复总数
        modelMap.put("total_user_count", userService.getUsersCount());//总的注册会员总数
        //--用户头像存储路径
        modelMap.put("avatar_img_path", Configurer.getContextProperty("avatar.root"));
        //--用户实时信息
        User user=getSessionUserinfo(session);
        if(user!=null){//如果首页是登录的用户
            User trueUser=userService.getUserById(user.getId());
            modelMap.put((String) Configurer.getContextProperty("session.userinfo"), trueUser);
            //-- 发帖纪录 主题收藏 下载记录参数
            modelMap.put("user_post_count",topicalService.selectCountByAuthorId(user.getId()));//发帖纪录
            modelMap.put("user_topical_count", MyStringUtil.occurTimes(trueUser.getFavoriteTopical(), ","));//收藏的主题的记录
        }

        return new ModelAndView("forum-page/index",modelMap);
    }


    /**
     * 如果在controller最外层 @throws Exception 此处抛出的Exception是抛出被tomcat捕获了 所以error信息要到tomcat的logs文件夹里查看
     */


}
