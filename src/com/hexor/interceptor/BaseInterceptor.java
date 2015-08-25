package com.hexor.interceptor;

import com.hexor.repo.User;
import com.hexor.service.impl.UserService;
import com.hexor.service.impl.VistLogService;
import com.hexor.util.Configurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import javax.servlet.http.HttpServletRequest;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-13
 * Time: 20:20
 * 拦截器基础类
 */
@Deprecated
public class BaseInterceptor {
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
     * 获得session中的用户信息
     * @param request
     * @return
     */
    public User getSessionUserinfo(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute((String) Configurer.getContextProperty("session.userinfo"));
        return user;
    }
}
