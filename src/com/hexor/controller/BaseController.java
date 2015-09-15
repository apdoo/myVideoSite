package com.hexor.controller;

import com.hexor.repo.Pager;
import com.hexor.repo.User;
import com.hexor.repo.Video;
import com.hexor.service.*;
import com.hexor.service.impl.UserDownloadLogService;
import com.hexor.service.impl.UserService;
import com.hexor.service.impl.VistLogService;
import com.hexor.util.Configurer;
import com.hexor.util.PagerUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-24
 * Time: 9:40
 * 基础控制器
 */
public class BaseController {

    /**
     * 邀请码service
     */
    @Autowired
    @Qualifier("com.hexor.service.impl.CodeService")
    protected ICodeService codeService = null;
    public void setCodeService(ICodeService codeService) {
        codeService = codeService;
    }
    /**
     * 用户收支信息记录service
     */
    @Autowired
    @Qualifier("com.hexor.service.impl.UserBalanceService")
    protected IUserBalanceService userBalacneService = null;

    public void setUserBalacneService(IUserBalanceService userBalacneService) {
        this.userBalacneService = userBalacneService;
    }

    /**
     * 用户下载记录service
     */
    @Autowired
    @Qualifier("com.hexor.service.impl.UserDownloadLogService")
    protected IUserDownloadLogService userDownloadLogService = null;
    public void setUserDownloadLogService(UserDownloadLogService userDownloadLogService) {
        this.userDownloadLogService = userDownloadLogService;
    }
    /**
     * 用户service层
     */
    @Autowired
    @Qualifier("com.hexor.service.impl.UserService")
    protected IUserService userService = null;
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    /**
     * 视频信息service层
     */
    @Autowired
    @Qualifier("com.hexor.service.impl.VideoService")
    protected IVideoService videoService;
    public void setVideoService(IVideoService videoService) {
        this.videoService = videoService;
    }
    /**
     * 主题帖子service层
     */
    @Autowired
    @Qualifier("com.hexor.service.impl.TopicalService")
    protected ITopicalService topicalService;
    public void setTopicalService(ITopicalService topicalService) {
        this.topicalService = topicalService;
    }
    /**
     * 主题回复service层
     */
    @Autowired
    @Qualifier("com.hexor.service.impl.TopicalReplayService")
    protected ITopicalReplayService topicalReplayService;
    public void setTopicalReplayService(ITopicalReplayService topicalReplayService) {
        this.topicalReplayService = topicalReplayService;
    }

    /**
     * 用户访问记录service
     */
    @Autowired
    @Qualifier("com.hexor.service.impl.VistLogService")
    protected IVistLogService vistLogService = null;

    public void setVistLogService(IVistLogService vistLogService) {
        this.vistLogService = vistLogService;
    }

    /**
     * 返回设置好的分页
     * @param wantPage 请求的页数
     * @param type pager的type字段
     * @param count 总数
     * @param data 自定义的一页所包含的信息条数
     * @return
     */
    public Pager pagerSet(String wantPage,String type,long count,String data){
        Pager pager=null;
        if(wantPage==null) wantPage="1";//
        try{
            pager= PagerUtil.build(PagerUtil.SetPager(count, Integer.parseInt(wantPage.trim()),Integer.parseInt(data.trim())));
        }catch(Exception e){
            pager=PagerUtil.build(PagerUtil.SetPager(count, 1));
        }finally {
            if(!type.equals("")) pager.setType(type);//如果有设置type
        }
        return pager;
    }
    /**
     * 返回设置好的分页实例
     * @param wantPage 想要查找的页数
     * @param type limit的desc的字段 或者视频搜索中的搜索内容或者论坛回复中的主题id
     * @param count 总数
     */
    public Pager pagerSet(String wantPage,String type,long count){
        Pager pager=null;
        if(wantPage==null) wantPage="1";//
        try{
            pager= PagerUtil.build(PagerUtil.SetPager(count, Integer.parseInt(wantPage.trim())));
        }catch(Exception e){
            pager=PagerUtil.build(PagerUtil.SetPager(count, 1));
        }finally {
            if(!type.equals("")) pager.setType(type);//如果有设置type
        }
        return pager;
    }

    /**
     * 返回设置好的分页实例
     * @param wantPage 想要查找的页数
     * @param count 总数
     */
    public Pager pagerSet(String wantPage,long count){
      return pagerSet(wantPage,"",count);
    }

    /**
     * String类型访问页数转换为int类型访问页数
     * @param wantPage 想要访问的页数
     * @param defaultPage 转换报错的时候，默认页数
     * @return
     */
    public int getIntPage(String wantPage,int defaultPage){
        int page=defaultPage;
        try{
            page=Integer.parseInt(wantPage.trim());
        }catch (Exception e){
            page=defaultPage;
        }
        return page;
    }

    /**
     * 转换String类型的数字的
     * @param categories 传入string类型的参数
     * @param defaultCategories 默认的
     * @param maxCategories 最大的
     * @return
     */
    public int getFormatInt(String categories,int defaultCategories,int maxCategories){
        int result=1;
        try{
            result=Integer.parseInt(categories.trim());
            if(result>maxCategories){
                result=defaultCategories;
            }
        }catch (Exception e){
            result=1;
        }
        return result;
    }

    /**
     * 获得用户收藏的视频列表信息
     * @param user
     * @return
     */
    public  List<Video>  getUserFavoriteVideos(User user) {
       String videos=user.getFavoriteVideo();
        String []temp=videos.split(",");
        List<String> list=new ArrayList<String>();
        List<Video> videoList=new ArrayList<Video>();
        for(int i=0;i<temp.length;i++){
            if(!temp[i].equals(""))  list.add(temp[i]);
        }
        try {
            if(list!=null&&list.size()>0){
                videoList= videoService.selectVideosInVkeys(list);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            return videoList;
        }
    }

    /**
     * 获得session中的用户信息
     * @param session
     * @return
     */
    public User getSessionUserinfo(HttpSession session){
        User user= (User) session.getAttribute((String) Configurer.getContextProperty("session.userinfo"));
        return user;
    }

}
