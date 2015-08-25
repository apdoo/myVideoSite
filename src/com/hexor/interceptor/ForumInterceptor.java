package com.hexor.interceptor;

import com.hexor.repo.User;
import com.hexor.util.Configurer;
import com.hexor.util.MyStringUtil;
import com.hexor.util.RequestUtil;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: hexor
 * Date: 2015-08-13
 * Time: 20:17
 * 论坛登录拦截器
 * 主要用来拦截用户登录
 */
public class ForumInterceptor extends BaseHandlerInterceptorAdapter {
    public String[] allowUrls;//还没发现可以直接配置不拦截的资源，所以在代码里面来排除
    public void setAllowUrls(String[] allowUrls) {
        this.allowUrls = allowUrls;
    }
    /**
     * 预处理回调方法
     * reHandle方法是进行处理器拦截用的，顾名思义，该方法将在Controller处理之前进行调用，SpringMVC中的Interceptor拦截器是链式的，可以同时存在
     * 多个Interceptor，然后SpringMVC会根据声明的前后顺序一个接一个的执行，而且所有的Interceptor中的preHandle方法都会在
     * Controller方法调用之前调用。SpringMVC的这种Interceptor链式结构也是可以进行中断的，这种中断方式是令preHandle的返
     * 回值为false，当preHandle的返回值为false的时候整个请求就结束了。
     * 注意post与get请求重定向的statuscode是不一样的
     * 所以get请求直接能使用sendRedirect post请求需要内部forward跳转
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @return true表示继续流程（如调用下一个拦截器或处理器）   false表示流程中断（如登录检查失败），不会继续调用其他的拦截器或处理器，此时我们需要通过response来产生响应
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        User user=getSessionUserinfo(httpServletRequest);//获得session中的用户信息
        String method=httpServletRequest.getMethod();
        if (user==null) {//当前用户不是登录状态
            String requestUrl = RequestUtil.buildOriginalURL(httpServletRequest);//当前请求的路径
            httpServletRequest.getSession().setAttribute((String)Configurer.getContextProperty("session.pre_url"),requestUrl);//将该请求存入session中
            if(method.equals("POST")){//注意 如果是post请求
                httpServletRequest.getRequestDispatcher("/account").forward(httpServletRequest,httpServletResponse);//使用内部跳转
                return false;
            }else{//get请求直接重定向
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/account");//get请求直接重定向
                return false;
            }
        }
        return true;
    }

    /**
     * 后处理回调方法，实现处理器的后处理（但在渲染视图之前），此时我们可以通过modelAndView（模型和视图对象）对模型数据进行处理或对视图进行处理，modelAndView也可能为null
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        /**
         * 在此处处理一些公用的参数
         * */
        //--右侧使用的参数
        modelAndView.getModelMap().put("total_topical_count", topicalService.selectTotalCount());//总的主题总数
        modelAndView.getModelMap().put("total_topicalreplay_count", topicalReplayService.selectTotalCount());//总的回复总数
        modelAndView.getModelMap().put("total_user_count",userService.getUsersCount());//注册会员总数
        //--用户头像存储路径
        modelAndView.getModelMap().put("avatar_img_path",Configurer.getContextProperty("avatar.root"));
        //--用户实时信息
        User user=getSessionUserinfo(httpServletRequest);
        if(user!=null) {
            User trueUser=userService.getUserById(user.getId());
            modelAndView.getModelMap().put((String)Configurer.getContextProperty("session.userinfo"),trueUser);
            //--发帖纪录 主题收藏 下载记录参数
            modelAndView.getModelMap().put("user_post_count", topicalService.selectCountByAuthorId(user.getId()));//发帖纪录
            modelAndView.getModelMap().put("user_topical_count", MyStringUtil.occurTimes(trueUser.getFavoriteTopical(), ","));//收藏的主题的记录
        }

    }

    /**
     * 整个请求处理完毕回调方法，即在视图渲染完毕时回调，如性能监控中我们可以在此记录结束时间并输出消耗时间，还可以进行一些资源清理
     * 这个方法只会在当前这个Interceptor的preHandle方法返回值为true的时候才会执行。postHandle是进行处理器拦截用的，它的执行时间是在处理器进行处理之
     * 后，也就是在Controller的方法调用之后执行，但是它会在DispatcherServlet进行视图的渲染之前执行，也就是说在这个方法中你可以对ModelAndView进行操
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @param e
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
