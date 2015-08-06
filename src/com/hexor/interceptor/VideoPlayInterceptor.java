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
public class VideoPlayInterceptor implements HandlerInterceptor {
    private static Logger logger = Logger.getLogger(VideoPlayInterceptor.class);
    public String[] allowUrls;//还没发现可以直接配置不拦截的资源，所以在代码里面来排除
    public void setAllowUrls(String[] allowUrls) {
        this.allowUrls = allowUrls;
    }

    @Autowired
    @Qualifier("com.hexor.service.impl.VistLogService")
    private VistLogService service = null;
    public void setService(VistLogService service) {
        this.service = service;
    }

    @Autowired
    @Qualifier("com.hexor.service.impl.UserService")
    private UserService userService = null;

    public void setUserService(UserService userService) {
        this.userService = userService;
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
        //记录访问日志
        VistLogBean vistLog=new VistLogBean();
        String url= httpServletRequest.getRequestURL().toString()+"?vkey="+httpServletRequest.getParameter("vkey").toString();
        String ip = IpUtil.getIpAddr(httpServletRequest);
        vistLog.setTime(DateUtil.getStrOfDateTime());
        vistLog.setIp(ip);
        vistLog.setUrl(url);
        //获得当前session访问的用户信息
        User user=(User)httpServletRequest.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo")) ;
        if(user!=null){
            vistLog.setUsername(user.getUsername());
            //从数据库中查找到用户信息
            User dbUser=userService.getUserByUsername(user.getUsername());
            //如果用户为会员查看用户是否是付费会员--推荐在Task里进行操作数据库，将到期的付费会员改变为不是付费会员
            //当用户为普通会员且积分大于10
            if(dbUser!=null&&"0".equals(dbUser.getType()+"")&&dbUser.getPoints()>=10){
                //从数据库中查找用户的积分进行扣除
                userService.reducePointsById(dbUser.getId()+"");
            }
            //会员到期 通过task定时器任务去做会员变更
            else if(dbUser!=null&&("12345".contains(dbUser.getType()+""))){
            }
            else{
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/viewlimit");
            }

        }//当时游客的时候，只能看三次
        else{
            long count=service.getIpVistCounts(ip);
//           int vistlimit=Integer.parseInt((String) Configurer.getContextProperty("user.vistcount"));
            int vistlimit=3;
            if(count>vistlimit){
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/viewlimit");
            }
        }
        logger.info(vistLog.toString());
        service.insertVistLog(vistLog);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
