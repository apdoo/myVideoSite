package com.hexor.controller;

import com.hexor.repo.Pager;
import com.hexor.repo.User;
import com.hexor.repo.Video;
import com.hexor.service.IVideoService;
import com.hexor.service.impl.UserService;
import com.hexor.util.PagerUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

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
    @Autowired
    @Qualifier("com.hexor.service.impl.UserService")
    protected UserService userService = null;
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    @Autowired
    @Qualifier("com.hexor.service.impl.VideoService")
    protected IVideoService videoService;
    public void setVideoService(IVideoService videoService) {
        this.videoService = videoService;
    }

    /**
     * 返回设置好的分页实例
     * @param wantPage 想要查找的页数
     * @param type limit的desc的字段 或者视频搜索中的搜索内容
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
     * 转换目录的格式
     * @param categories
     * @param defaultCategories
     * @param maxCategories
     * @return
     */
    public int getIntCategories(String categories,int defaultCategories,int maxCategories){
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
        List<Video> videoList=null;
        for(int i=0;i<temp.length;i++){
            if(!temp[i].equals(""))  list.add(temp[i]);
        }
        try {
            if(list!=null&&list.size()>0){
                videoList= videoService.selectVideosInVkeys(list);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return videoList;
    }
}
