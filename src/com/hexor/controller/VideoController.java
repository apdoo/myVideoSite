package com.hexor.controller;

import com.hexor.repo.Pager;
import com.hexor.repo.User;
import com.hexor.repo.UserDownloadLog;
import com.hexor.repo.Video;
import com.hexor.service.IVideoService;
import com.hexor.service.impl.UserService;
import com.hexor.util.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
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
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
     * 观看最多的视频或者随机一组视频
     * @param count 查询的条数 默认13条
     * @param type 查询的排列类型 most-按照观看最多 random-随机查找
     * @param response
     */
    @RequestMapping(value = "viewVideosInfo")
    public void viewVideosInfo(@RequestParam(value = "count",required = true,defaultValue = "13") String count,@RequestParam(value = "type",required = true,defaultValue = "most") String type,HttpServletResponse response){
        int c=getIntPage(count, 13);
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
    @Deprecated
    @RequestMapping(value="videoslist")
    public void videoslist(@RequestParam(value = "page",required = true,defaultValue = "1") String page,HttpSession session,HttpServletRequest request){
        long count=videoService.getTotalCounts();//获得视频总数
        Pager pager=pagerSet(page, count);
        try{
            List<Video> list=videoService.limit(pager);
        }catch (Exception e){
            logger.error("获得列表失败" + e.getMessage());
        }
    }

    /**
     * 视频点赞
     * @param shareKey
     * @param session
     * @param response
     */
    @RequestMapping(value = "praiseVideo")
    public void praiseVideo(@RequestParam(value = "shareKey") String shareKey,HttpSession session,HttpServletResponse response){
        String trueVkey="";
        JSONObject json=new JSONObject();
        try{
            trueVkey = EncodeUtil.decodeString(shareKey);//解密出真正的vkey
        }catch (Exception e){
            json.put("msg","解析失败");
        }
        Map map=new HashMap();
        map.put("vkey", trueVkey);
        map.put("rate", "rate");
        json.put("msg","已赞");
        videoService.videoAddSelf(map);
        try {
            ResponseUtil.outWriteJson(response,json.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 用户收藏视频
     * @param shareKey
     * @param session
     * @param response
     */
    @RequestMapping(value="houseVideo")
    public void houseVideo(@RequestParam(value = "shareKey") String shareKey,HttpSession session,HttpServletResponse response){
        User user= getSessionUserinfo(session);//检查session中是否已经存在用户信息
        if(user==null) return;
        User trueUser=userService.getUserById(user.getId());//获得数据库中
        String trueVkey="";
        JSONObject json=new JSONObject();
        try{
            trueVkey = EncodeUtil.decodeString(shareKey);//解密出真正的vkey
        }catch (Exception e){
            json.put("msg","收藏失败");
        }
        Map map=new HashMap();
        map.put("vkey", trueVkey);
        map.put("favourite","favourite");
        if(!trueUser.getFavoriteVideo().contains(trueVkey)){//没有收藏该视频，则进行视频收藏
            trueUser.setFavoriteVideo((trueUser.getFavoriteVideo() + "," + trueVkey).replace(",,", ","));
            json.put("msg","取消收藏");
            videoService.videoAddSelf(map);
        }else {//收藏该视频，则进行取消收藏
            trueUser.setFavoriteVideo(trueUser.getFavoriteVideo().replace(","+trueVkey, "").replace(",,", ","));
            json.put("msg", "收藏");
            videoService.videoReduceSelf(map);
        }

            userService.updateFavoriteVideo(trueUser);
        try {
            ResponseUtil.outWriteJson(response,json.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * 下载文件接口
     * 如果参数不对的话 返回400错误
     * @param shareKey 下载的视频的加密后的vkey
     * @param session
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping(value="download")
    public HttpServletResponse download(@RequestParam(value = "shareKey")String shareKey,HttpSession session,HttpServletRequest request, HttpServletResponse response)  {
        User user= getSessionUserinfo(session);//检查session中是否已经存在用户信息

        try{
            if(user==null) {//当前是游客登录
                request.getRequestDispatcher("/bbs/downloadlimit").forward(request,response);//使用内部跳转重新定向
                return null;
            }else{
                User trueUser=userService.getUserById(user.getId());//获得实际表中的用户数据
                int videoDownloadValue=Integer.parseInt((String)Configurer.getContextProperty("video.download.value"));//下载视频扣除的积分
                if(trueUser.getType()>=1||(trueUser.getType()>=0&&(trueUser.getPoints()+videoDownloadValue)>=0)){//如果是vip会员或者普通会员且积分大于下载视频所扣除的积分
                    String savePath=(String) Configurer.getContextProperty("savePath");//获得当前存文件的本地跟路径
                    String trueVkey="";//真正的key
                    String path="";//文件物理路径
                    Video video=null;
                    trueVkey = EncodeUtil.decodeString(shareKey);//解密出真正的vkey
                    video=videoService.getOnlyVideoName(trueVkey);//获得视频信息
                    path=savePath+video.getVideoName();  // path是指欲下载的文件的路径。
                    File file = new File(path);
                    String filename = file.getName();  // 取得文件名。
                    String requestUrl =RequestUtil.buildOriginalURL(request);//获得下载的url
                    UserDownloadLog downloadLog=userDownloadLogService.checkDownloadUrl(requestUrl,trueUser.getId()); //检查该url是否已经被该用户下过
                    logger.info("user:"+trueUser.getUsername()+"download:"+requestUrl);
                    if(downloadLog==null){//没有当前下载记录，则插入下载记录与扣除当前用户的余额
                        UserDownloadLog log=new UserDownloadLog(trueUser.getId(),trueUser.getUsername(),path,filename,requestUrl);//记录下载日志
                        userDownloadLogService.insertUserDownloadLog(log); //插入下载日志记录表
                        userService.updatePointAndBalance(videoDownloadValue, trueUser.getId(), (String) Configurer.getContextProperty("balance.type.downloadVideo"), (String) Configurer.getContextProperty("balance.description.downloadVideo"), "reduce");//用户积分扣除
                    }
                    String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();   // 取得文件的后缀名。
                    InputStream fis = new BufferedInputStream(new FileInputStream(path));  // 以流的形式下载文件。
                    byte[] buffer = new byte[fis.available()];
                    fis.read(buffer);
                    fis.close();
                    response.reset(); // 清空response
                    String fileName_CN=video.getTitle();//给下载的文件命名为中文
                    // 设置response的Header
                    //        response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes()));
                    response.addHeader("Content-Disposition", "attachment;filename=" +  java.net.URLEncoder.encode(fileName_CN+"."+ext, "UTF-8")); //解决中文乱码问题
                    //        response.addHeader("Content-Disposition", "attachment;filename=" +  new String( fileName.getBytes("gb2312"), "ISO8859-1" ) ); 也可以
                    response.addHeader("Content-Length", "" + file.length());
                    OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
                    response.setContentType("application/octet-stream");
                    toClient.write(buffer);
                    toClient.flush();
                    toClient.close();
                }else{
                    //  response.sendRedirect(request.getContextPath()+"/viewlimit");
                    request.getRequestDispatcher("/bbs/downloadlimit").forward(request,response);//使用内部跳转重新定向
                    return null;
                }
            }

            }catch (Exception e){
                logger.error(e);
            }
            return response;
    }
}
