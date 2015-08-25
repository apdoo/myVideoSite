package com.hexor.controller;

import com.hexor.repo.*;
import com.hexor.util.Configurer;
import com.hexor.util.DateUtil;
import com.hexor.util.MyStringUtil;
import com.hexor.util.ResponseUtil;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-13
 * Time: 22:17
 * 论坛控制器
 * 此controller配置有拦截器，所以session中都有用户信息
 * 注意bbs/**打头的请求都会被拦截器拦截
 * 如果不想被拦截的接口请求 使用topical/**打头的请求
 */
@Controller
public class ForumController extends BaseController{
    private static Logger logger = Logger.getLogger(ForumController.class);
    /**
     * 论坛回复
     * @param tid 主题帖子的id号
     * @return
     */
    @RequestMapping(value="bbs/replay")
    public ModelAndView replay(@RequestParam(value = "tid",required = true,defaultValue = "") String tid,@RequestParam(value = "wpage",required = true,defaultValue = "1") String wpage,HttpSession session){
        Map modelMap=new HashMap();
        User user=getSessionUserinfo(session);
        User trueUser=userService.getUserById(user.getId());//数据库中的用户session信息
        Pager pager=null;
        if(!tid.equals("")){
            topicalService.topicalViewsAdd(tid);//主题点击数自增
            Topical topical=topicalService.selectById(tid);//查询主题信息
            if(topical==null){
                //如果主题不存在，返回messagetips提示页面
                modelMap.put("msg","当前主题不存在！");
                return new ModelAndView("forum-page/messagetips",modelMap);
            }
            modelMap.put("topical",topical);
            long count=topicalReplayService.selectReplaysCount(tid);//查询主题回复数
            pager=pagerSet(wpage,tid,count,"50");//回复的条数默认查询50条
            List<TopicalReplay> list=topicalReplayService.selectReplaysLimit(pager);//分页查询主题回复
            for(int i=0;i<list.size();i++){
                User author=userService.getUserById(list.get(i).getReplayAuthorId());//查询该回复者是否有自定义头像图片
                if(author!=null&&!author.getTemp().equals("0")){//当前回复者有自定义头像
                    list.get(i).setReplayAuthorAvatar(Configurer.getContextProperty("avatar.root") + author.getTemp());//自定义图片的hhtp访问路径
                }else{
                    list.get(i).setReplayAuthorAvatar(Configurer.getContextProperty("avatar.root") + "default_avatar.png");//默认图片的路径
                }
            }
            modelMap.put("pager",pager);//分页信息
            modelMap.put("count",count);//回复总数
            modelMap.put("tid",tid);//主题id
            modelMap.put("replay_list",list);//回复list
            if(trueUser.getFavoriteTopical().contains(tid)){//用户收藏的主题id包含当前主题
                modelMap.put("favorite_topical","取消收藏");
            }else{//用户收藏的主题id不包含当前主题
                modelMap.put("favorite_topical","加入收藏");
            }

        }
        return new ModelAndView("forum-page/replay",modelMap);
    }

    /**
     * 下载失败提示页面
     * @return
     */
    @RequestMapping(value = "bbs/downloadlimit")
    public String downloadlimit(){
        return "forum-page/downloadlimit";
    }

    /**
     * 论坛新建主题页面
     * @return
     */
    @RequestMapping(value="bbs/newTopic")
    public String newTopic(){
        return "forum-page/newTopic";
    }

    /**
     * 每日登录奖励领取页面
     * @return
     */
    @RequestMapping(value = "bbs/daily")
      public String daily(HttpSession session,Model model){
        User user=getSessionUserinfo(session);
        int todayCount=userBalacneService.selectUserDaily(user.getId());//查询用户今日是否已经领取
        model.addAttribute("today_count",todayCount);//用户今日每日领取
        return "forum-page/daily";
    }

    /**
     * 当前账户余额页面
     * @param wpage 请求的页数
     * @param model  放入页面使用的参数
     * @return
     */
    @RequestMapping(value = "bbs/balance")
    public String balance(@RequestParam(value = "wpage",required = true,defaultValue = "1") String wpage,HttpSession session,Model model){
        User user=getSessionUserinfo(session);//获得session中的用户信息
        if(user==null) return null;
        long count=userBalacneService.selectUserTotalBalanceCount(user.getId());//用户收支信息总数
        Pager pager=pagerSet(wpage, user.getId() + "", count);//设置分页信息
        List<UserBalance> list=userBalacneService.limit(pager);//查找当前用户收支记录信息
        model.addAttribute("pager",pager);
        model.addAttribute("balance_list",list);
        return "forum-page/balance";
    }
    /**
     * 主题收藏页面
     */
    @RequestMapping(value = "bbs/topics")
    public String topics(@RequestParam(value = "wpage",required = true,defaultValue = "1") String wpage,HttpSession session,Model model){
        User user=getSessionUserinfo(session);//获得session中的用户信息 //分页查询当前用户收藏的帖子
        if(user==null) return null;
        User trueUser=userService.getUserById(user.getId());//查询数据库中的用户信息
        String ids=trueUser.getFavoriteTopical();
        long count= MyStringUtil.occurTimes(trueUser.getFavoriteTopical(), ",");
        Pager pager=pagerSet(wpage, count);
        List<Topical> list=topicalService.selectLimitInIds(ids, pager);//查到当前用户的发帖纪录信息
        model.addAttribute("pager",pager);
        model.addAttribute("topics_list",list);
        return "forum-page/topics";
    }

    /**
     * 发布主题记录页面
     * @return
     */
    @RequestMapping(value = "bbs/posts")
    public String posts(@RequestParam(value = "wpage",required = true,defaultValue = "1") String wpage,HttpSession session,Model model){
        User user=getSessionUserinfo(session);//获得session中的用户信息 //分页查询当前用户收藏的帖子
        if(user==null) return null;
        long count=topicalService.selectCountByAuthorId(user.getId());//该用户总共发帖数
        Pager pager=pagerSet(wpage, user.getId() + "", count);//设置分页信息
        List<Topical> list=topicalService.selectLimitByAuthorId(pager);//查到当前用户的发帖纪录信息
        model.addAttribute("pager",pager);
        model.addAttribute("posts_list",list);
        return "forum-page/posts";
    }

    /**
     * 充值页面
     * @return
     */
    @RequestMapping(value = "recharge")
    public String recharge(){
        return "forum-page/recharge";
    }

    /**
     * 广告页面
     * @return
     */
    @RequestMapping(value="advertise")
    public String advertise(){
        return "forum-page/advertise";
    }

    /**
     * 常见问题
     * @return
     */
    @RequestMapping(value="faq")
    public String faq(){
        return "forum-page/faq";
    }

    /**
     * 关于
     * @return
     */
    @RequestMapping(value="about")
    public String about(){
        return "forum-page/about";
    }

    /**
     * 用户中心
     * @param userName
     * @param model
     * @return
     */
    @RequestMapping(value="bbs/member/{userName}", method= RequestMethod.GET)
    public String member(@PathVariable String userName, Model model){
        model.addAttribute("userName", userName);
        return "forum-page/member";
    }

    /**
     * 信息提示页面
     * @return
     */
    @RequestMapping(value = "bbs/messagetips")
    public ModelAndView messagetips(@RequestParam(value = "msg") String msg ){
        Map modelMap=new HashMap();
        modelMap.put("msg",msg);
        return new ModelAndView("forum-page/messagetips",modelMap);
    }



    /**
     * 个人设置页面
     * @return
     */
    @RequestMapping(value = "bbs/settings")
    public String settings(){
        return "forum-page/settings";
    }

    @RequestMapping(value = "bbs/settings/avatar")
    public String settingsAvatar(){
        return "forum-page/avatar";
    }

    /********************************************************************************************************
     * 下面是接口类型的                                                                                     *
     * 注意bbs/**打头的请求都会被拦截器拦截                                                                 *
     * 如果不想被拦截的接口请求 使用topical/**打头的请求                                                    *
     ********************************************************************************************************/
    /**
     * 用户每日登录奖励领取接口
     * @param session
     */
    @RequestMapping(value = "balance/daily")
    public void balanceDaily(HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        User user=getSessionUserinfo(session);
        if(user!=null){//session中存在用户信息
            int dailyValue=Integer.parseInt((String)Configurer.getContextProperty("daily.value"));//每日登录领取的金币
            int todayCount=userBalacneService.selectUserDaily(user.getId());//查询用户今日是否已经领取
            if(todayCount==0){//今日没有领取
                userService.updatePointAndBalance(dailyValue,user.getId(),(String)Configurer.getContextProperty("balance.type.daily"),(String)Configurer.getContextProperty("balance.description.daily"),"add", DateUtil.getDateFolder());
            }
      }
        request.getRequestDispatcher("/bbs/daily").forward(request, response);//外部跳转
    }


    /**
     * 用户收藏主题
     * @param topicalId 主题的id
     * @param session
     * @param response
     */
    @RequestMapping(value="topical/houseTopical")
    public void houseTopical(@RequestParam(value = "topicalId") String topicalId,HttpSession session,HttpServletResponse response) {
        User user= getSessionUserinfo(session);//检查session中是否已经存在用户信息
        if(user==null) return;
        JSONObject json=new JSONObject();
        User trueUser=userService.getUserById(user.getId());//获得数据库中用户信息
        if(!trueUser.getFavoriteTopical().contains(topicalId)){//没有收藏该视频，则进行视频收藏
            trueUser.setFavoriteTopical((trueUser.getFavoriteTopical() + "," + topicalId).replace(",,", ","));
            json.put("msg", "取消收藏");
        }else {//收藏该视频，则进行取消收藏
            trueUser.setFavoriteTopical(trueUser.getFavoriteTopical().replace(","+topicalId, "").replace(",,", ","));
            json.put("msg", "加入收藏");
        }
        userService.updateFavoriteTopical(trueUser);
        try {
            ResponseUtil.outWriteJson(response, json.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * 主题发布接口
     * @param topical 主题bean
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping(value="topical/publishTopic")
    public String publishTopic(Topical topical,HttpServletRequest request,HttpServletResponse response,HttpSession session,Model model) throws IOException, ServletException {
        User user=getSessionUserinfo(session);
        if(user==null) {//这里还是用拦截器吧！！！！！
            request.getRequestDispatcher("/account").forward(request,response);//使用内部跳转
            return null;
        }
        User trueUser=userService.getUserById(user.getId());
        //此处加上当前论坛设置发帖会员的级别
        if(trueUser.getType()<Integer.parseInt((String)Configurer.getContextProperty("user.type.topical"))){
            model.addAttribute("msg", "当前版块禁止您所在的用户组发表主题");
            return "forum-page/messagetips";
        }
        topicalService.insertTopical(topical, trueUser);//插入到发帖区后 将id写入到topical这个bean中
        trueUser.setTopicalIds((trueUser.getTopicalIds() + "," + topical.getId()).replace(",,", ","));
        userService.updateTopicalIds(trueUser);//更新用户发帖纪录字段
        response.sendRedirect(request.getContextPath()+"/bbs/replay?tid="+topical.getId());//重新指向跳转到新发布的主题
        return null;
    }

    /**
     * 主题回复接口
     * @param content
     * @param request
     * @param response
     * @param session
     */
    @RequestMapping(value = "topical/publishReplay")
    public String publishReplay(@RequestParam(value = "tid",required = true) String tid,@RequestParam(value = "content",required = true,defaultValue = "顶") String content,HttpServletRequest request,HttpServletResponse response,HttpSession session,Model model) throws IOException, ServletException {
        User user=getSessionUserinfo(session);
        if(user==null) {//这里还是用拦截器吧！！！！！
            request.getRequestDispatcher("/account").forward(request, response);//使用内部跳转
            return null;
        }
        User trueUser=userService.getUserById(user.getId());
        //此处加上当前论坛设置发帖会员的级别
        if(trueUser.getType()<Integer.parseInt((String)Configurer.getContextProperty("user.type.topical.replay"))){
            model.addAttribute("msg","当前版块禁止您所在的用户组发表回复");
            return "forum-page/messagetips";
        }
        topicalReplayService.insertTopicalReplay(tid, content, trueUser);
        response.sendRedirect(request.getContextPath()+"/bbs/replay?tid="+tid);//重新指向跳转到新发布的主题
        return null;
    }
}
