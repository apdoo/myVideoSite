package com.hexor.controller;

import com.hexor.repo.Pager;
import com.hexor.repo.User;
import com.hexor.repo.Video;
import com.hexor.service.IVideoService;
import com.hexor.util.Configurer;
import com.hexor.util.ResponseUtil;
import net.sf.json.JSONArray;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-07-21
 * Time: 21:15
 * 视频信息控制器
 */
@Controller
@RequestMapping(value="video")
public class VideoController extends BaseController{
    private static Logger logger = Logger.getLogger(VideoController.class);
    @Autowired
    @Qualifier("com.hexor.service.impl.VideoService")
    private IVideoService videoService;
    public void setVideoService(IVideoService videoService) {
        this.videoService = videoService;
    }

    /**
     * 获得最新的视频列表
     */
    @RequestMapping(value="recentlyVideos")
    public void recentlyVideos(HttpServletResponse response)  {
        try {
        List<Video> list= videoService.selectRecently();
        JSONArray jsonArray = JSONArray.fromObject(list);
        String result = jsonArray.toString();
        ResponseUtil.outWriteJson(response, result);
        } catch (Exception e) {
           logger.error("获得最新视频列表失败"+e.getMessage());
        }
    }

    /**
     * 观看最多的视频
     * @param count 查询的条数 默认13条
     * @param type 查询的排列类型 most-按照观看最多 random-随机查找
     * @param response
     */
    @RequestMapping(value = "viewVideosInfo")
    public void viewVideosInfo(@RequestParam(value = "count",required = true,defaultValue = "13") String count,@RequestParam(value = "type",required = true,defaultValue = "most") String type,HttpServletResponse response){
        int c=getIntPage(count,13);
        List<Video> list=null;
        try{
            if(type.equals("most")){
                list=videoService.getMostViewsVideos(c);
            }else if(type.equals("random")){
                list=videoService.selectRand(c);
            }
            JSONArray jsonArray = JSONArray.fromObject(list);
            String result = jsonArray.toString();
            ResponseUtil.outWriteJson(response, result);
        }catch (Exception e){
            logger.error("获得观看最多列表失败"+e.getMessage());
        }
    }

    /**
     * 分页查询视频列表
     * @param page
     * @param session
     * @param request
     */
    @RequestMapping(value="videoslist")
    public void videoslist(@RequestParam(value = "page",required = true,defaultValue = "1") String page,HttpSession session,HttpServletRequest request){
        long count=videoService.getTotalCounts();//获得视频总数
        Pager pager=pagerSet(page, count);
        try{
            List<Video> list=videoService.limit(pager);
            System.out.println(list.size());
        }catch (Exception e){
            logger.error("获得列表失败"+e.getMessage());
        }
    }

}
