package com.hexor.interceptor;

import com.hexor.repo.User;
import com.hexor.service.ITopicalReplayService;
import com.hexor.service.ITopicalService;
import com.hexor.service.impl.UserService;
import com.hexor.service.impl.VistLogService;
import com.hexor.util.Configurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-14
 * Time: 11:39
 * 继承 HandlerInterceptorAdapter
 */
public class BaseHandlerInterceptorAdapter extends HandlerInterceptorAdapter {
    /**
     * 获得session中的用户信息
     * @param request
     * @return
     */
    public User getSessionUserinfo(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));
        return user;
    }

    @Autowired
    @Qualifier("com.hexor.service.impl.VistLogService")
    protected VistLogService service = null;
    public void setService(VistLogService service) {
        this.service = service;
    }

    @Autowired
    @Qualifier("com.hexor.service.impl.UserService")
    protected UserService userService = null;
    public void setUserService(UserService userService) {
        this.userService = userService;
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
}
