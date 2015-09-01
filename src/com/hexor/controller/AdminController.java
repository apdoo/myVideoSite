package com.hexor.controller;

import com.hexor.repo.*;
import com.hexor.util.Configurer;
import com.hexor.util.DateUtil;
import com.hexor.util.EncodeUtil;
import com.hexor.util.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-17
 * Time: 14:37
 * 管理员控制器
 */
@Controller
@RequestMapping(value="admin94lu")
public class AdminController extends BaseController{
    private String videoRoot=(String) Configurer.getContextProperty("video.root");//视频路径
    private String imageRoot=(String) Configurer.getContextProperty("image.root");//视频图片根路径

    /**
     * 管理员
     * @return
     */
    @RequestMapping(value="adminHome")
    public String adminHome(){
        return "forum-page/adminPage";
    }

    /**
     * 同步今日采集的video给topical表
     * @param response
     * @throws IOException
     * @throws InterruptedException
     */
    @RequestMapping(value="synchroVideoToday")
    public void synchroVideoForToday(HttpServletResponse response,HttpServletRequest request) throws IOException, InterruptedException{
        List<Video> list=videoService.selectByToday(DateUtil.getCurrentDay());
        int i=0;//同步的数量
        int j=0;//已经存在的数量
        for(Video video:list){
            Thread.sleep(200);
            Topical topical=topicalService.checkVkey(video.getVkey());//检测当前topical表中是否已经存在该数据
            if(topical==null){//不存在则插入一条
                String shareKey= EncodeUtil.encodeString(video.getVkey());
                String content="<p><strong>"+video.getTitle()+"</strong></p><p><strong><img src=\""+imageRoot+video.getImgName()+"\" alt=\""+video.getTitle()+"\" width=\"140\" height=\"140\" /><br /></strong></p><p><strong>下载链接：<a href=\""+request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/video/download?shareKey="+shareKey+"\">点击打开链接</a><span style='color:#ff0000;'>[提示:下载将会扣除3金币,重复下载不扣除]</span><br /></strong></p>";
                Topical newTopical=new Topical( 1,  "admin",  "下载区", video.getVkey(),  video.getTitle(),  content);
                topicalService.insertTopical(newTopical);
                i++;
            }else{
                j++;
            }
        }
        JSONObject json=new JSONObject();
        json.put("msg","总共:"+list.size()+" 同步:"+i+" 已经存在:"+j);
        ResponseUtil.outWriteJson(response, json.toString());
    }
    /**
     * 同步视频表video给topical表
     */
    @RequestMapping(value="synchroVideo")
    public void synchroVideoForBbsDownloads(HttpServletResponse response,HttpServletRequest request) throws IOException, InterruptedException {
        List<Video> list=videoService.selectAll();//查找所有视频的列表
        int i=0;//同步的数量
        int j=0;//已经存在的数量
        for(Video video:list){
            Thread.sleep(200);
            Topical topical=topicalService.checkVkey(video.getVkey());//检测当前topical表中是否已经存在该数据
            if(topical==null){//不存在则插入一条
                String shareKey= EncodeUtil.encodeString(video.getVkey());
                String content="<p><strong>"+video.getTitle()+"</strong></p><p><strong><img src=\""+imageRoot+video.getImgName()+"\" alt=\""+video.getTitle()+"\" width=\"140\" height=\"140\" /><br /></strong></p><p><strong>下载链接：<a href=\""+request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/video/download?shareKey="+shareKey+"\">点击打开链接</a><span style='color:#ff0000;'>[提示:下载将会扣除3金币,重复下载不扣除]</span><br /></strong></p>";
                Topical newTopical=new Topical( 1,  "admin",  "下载区", video.getVkey(),  video.getTitle(),  content);
                topicalService.insertTopical(newTopical);
                i++;
            }else{
                j++;
            }
        }
        JSONObject json=new JSONObject();
        json.put("msg","总共:"+list.size()+" 同步:"+i+" 已经存在:"+j);
        ResponseUtil.outWriteJson(response,json.toString());
    }

    /**
     * 用户vip操作
     * @param username
     * @param response
     */
    @RequestMapping(value="vip")
    public void vip(@RequestParam(value = "username") String username,@RequestParam(value = "type") int type,HttpServletResponse response) throws IOException {
        userService.updateUserType(username,type);
        User user=userService.getUserByUsername(username);
        JSONObject json=new JSONObject();
        if(user==null){
            json.put("msg","用户:不存在");
        }else{
            json.put("msg","用户:"+user.toString());
        }

        ResponseUtil.outWriteJson(response,json.toString());
    }

    /**
     * 用户金币操作
     * @param username
     * @param gold
     * @param response
     */
    @RequestMapping(value="gold")
    public void gold(@RequestParam(value = "username") String username,@RequestParam(value = "gold") int gold,HttpServletResponse response) throws IOException {
        userService.updateUserPoints(username, gold);
        User user=userService.getUserByUsername(username);
        JSONObject json=new JSONObject();
        if(user==null){
            json.put("msg","用户:不存在");
        }else{
            if(gold>0){
                UserBalance userBalance=new UserBalance(user.getId(),"购买金币",gold,"金币购买");
                userBalacneService.insertUserBalance(userBalance);
            }
            json.put("msg", "用户:" + user.toString());
        }
        ResponseUtil.outWriteJson(response, json.toString());
    }

    /**
     * 帖子删除 移除帖子与帖子回复的内容
     * @param tid
     * @param response
     * @throws IOException
     */
    @RequestMapping(value="topicalRemove")
    public void topicalRemove(@RequestParam(value = "tid") String tid,HttpServletResponse response) throws IOException {
            int t=  topicalService.deleteTopical(tid);
            int r= topicalReplayService.deleteTopicalReplays(tid);
            JSONObject json=new JSONObject();
            json.put("msg","删除帖子数:"+t+"删除帖子对应的回复数:"+r);
            ResponseUtil.outWriteJson(response, json.toString());
     }

    /**
     * 帖子置顶
     * @param tid 帖子id
     * @param type 帖子类型 0-普通 1-置顶
     * @param order 帖子排序 置顶的帖子9到0这种 降序
     * @param response
     * @throws IOException
     */
    @RequestMapping(value="topicalTop")
    public void topicalTop(@RequestParam(value = "tid") String tid,@RequestParam(value = "type") String type,@RequestParam(value = "order") String order,HttpServletResponse response) throws IOException {
            int t=topicalService.topicalTop(tid, type, order);
            JSONObject json=new JSONObject();
            json.put("msg","帖子操作:"+tid+"type:"+type+"返回:"+t);
            ResponseUtil.outWriteJson(response, json.toString());
     }

    /**
     * 用户信息查询
     * @param username
     */
    @RequestMapping(value = "userInfoWatch")
    public void userInfoWatch(@RequestParam(value = "username") String username,HttpServletResponse response) throws IOException {
        User user=userService.getUserByUsername(username);
        JSONObject json=new JSONObject();
        if(user!=null){
            List<Topical> topicalList=topicalService.selectByUserId(user.getId() + "");//用户发帖记录
            List<TopicalReplay> replayList=topicalReplayService.selectByUserId(user.getId()+"");//用户回复记录
            List<UserBalance> userBalanceList=userBalacneService.selectBalacneByUserId(user.getId());//用户收支记录
            List<UserDownloadLog> userDownloadLogList=userDownloadLogService.selectByUserId(user.getId() + ""); //用户下载记录
            List<VistLogBean> vistLogBeanList=vistLogService.selectByUserUserName(username) ;   //用户观看记录
            json.put("msg","用户user信息:"+user.toString()+"发帖信息:"+ JSONArray.fromObject(topicalList)+"回复信息:"+JSONArray.fromObject(replayList)
                    +"收支记录"+JSONArray.fromObject(userBalanceList) +"下载记录"+JSONArray.fromObject(userDownloadLogList) +"观看记录"+JSONArray.fromObject(vistLogBeanList)
            );
        }else{
            json.put("msg","没有查到用户:"+username);
        }



        ResponseUtil.outWriteJson(response, json.toString());
    }
}
