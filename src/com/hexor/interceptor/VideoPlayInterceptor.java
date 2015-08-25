package com.hexor.interceptor;

import com.hexor.repo.User;
import com.hexor.repo.VistLogBean;
import com.hexor.service.impl.UserService;
import com.hexor.service.impl.VistLogService;
import com.hexor.util.Configurer;
import com.hexor.util.DateUtil;
import com.hexor.util.IpUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-05
 * Time: 21:57
 * 视频播放拦截器
 * 拦截
 */
public class VideoPlayInterceptor extends BaseHandlerInterceptorAdapter{
    private static Logger logger = Logger.getLogger(VideoPlayInterceptor.class);
    public String[] allowUrls;//还没发现可以直接配置不拦截的资源，所以在代码里面来排除
    public void setAllowUrls(String[] allowUrls) {
        this.allowUrls = allowUrls;
    }

    /**
     * 只有返回true的时候 下面两个方法才会继续
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        User user=getSessionUserinfo(httpServletRequest) ;  //获得当前session访问的用户信息
        String url= httpServletRequest.getRequestURL().toString()+"?vkey="+httpServletRequest.getParameter("vkey").toString();//访问的视频播放页面url
        httpServletRequest.getSession().setAttribute((String) Configurer.getContextProperty("session.pre_url"), url);//将该请求存入session中，给被拦截登录后自动跳转到该url
        String ip = IpUtil.getIpAddr(httpServletRequest);//拿到当前访问的ip地址
        VistLogBean vistLog=new VistLogBean();//访问日志
        vistLog.setIp(ip);
        vistLog.setUrl(url);
        if(user!=null){//当前session已经登录了用户
            vistLog.setUsername(user.getUsername());//设置访问日志的访问用户
            User trueUser=userService.getUserById(user.getId());   //从数据库中查找到用户信息
            int videoViewValue=Integer.parseInt((String) Configurer.getContextProperty("video.view.value"));//观看视频扣除的积分
            if(trueUser.getType()>=1||(trueUser.getType()>=0&&(trueUser.getPoints()+videoViewValue)>=0)){//如果是vip会员或者普通会员且积分大于观看视频所扣除的积分
                userService.updatePointAndBalance(videoViewValue, trueUser.getId(), (String) Configurer.getContextProperty("balance.type.viewVideo"), (String) Configurer.getContextProperty("balance.description.viewVideo"), "reduce");//扣除积分 在对应的mapper.xml中写死了只扣除普通会员的积分
            }else{//会员不符合观看条件的时候
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/memberlimit");
            }
        }else {//当前是游客
            long count=service.getTodayIpVistCount(ip, DateUtil.getDateFolder());//当前ip访问的记录
            long vistlimit=Integer.parseInt((String)Configurer.getContextProperty("vist.views.limit"));
            if(count>=vistlimit){//游客不符合观看条件的时候
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/viewlimit");
            }
        }
        logger.info(vistLog.toString());
        service.insertVistLog(vistLog);//记录访问日志
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
