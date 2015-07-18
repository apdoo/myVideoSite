<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!----start-Header---->
<div class="header">
    <!----start-Logo---->
    <div class="logo">
        <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/images/logo.png" title="logo" /></a>
    </div>
    <!----End-Logo---->
    <!----start-top-nav---->
    <div class="top-nav">
        <ul>
            <li><a href="${pageContext.request.contextPath}">就是撸</a><p>网站首页</p></li>
            <li><a href="${pageContext.request.contextPath}/account">账号</a><p>注册与登录</p></li>
            <li><a href="${pageContext.request.contextPath}/videoList">视频</a><p>在线视频列表</p></li>
            <li><a href="#">关注</a><p>微博与微信</p></li>
            <li><a href="#">论坛</a><p>我们的论坛</p></li>
            <li><a href="${pageContext.request.contextPath}/contact">留言板</a><p>联系我们</p></li>
        </ul>
    </div>
    <div class="clear"> </div>
    <!----End-top-nav---->
</div>
<!----End-Header---->