package com.hexor.controller;

import com.hexor.repo.User;
import com.hexor.repo.Video;
import com.hexor.service.IVideoService;
import com.hexor.util.Configurer;
import com.hexor.util.ResponseUtil;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
public class VideoController {

    @Autowired
    @Qualifier("com.hexor.service.impl.VideoService")
    private IVideoService videoService;
    public void setVideoService(IVideoService videoService) {
        this.videoService = videoService;
    }

    /**
     * 获得最新的视频列表
     * @param session
     * @param request
     */
    @RequestMapping(value="recentlyVideos")
    public void recentlyVideos(HttpSession session,HttpServletResponse response,HttpServletRequest request) throws IOException {
        List<Video> list= videoService.selectRecently();
        JSONArray jsonArray = JSONArray.fromObject(list);
        String result = jsonArray.toString();
        try {
            ResponseUtil.outWriteJson(response, result);
        } catch (IOException e) {
            System.out.println("获得列表失败");
        }
    }

}
