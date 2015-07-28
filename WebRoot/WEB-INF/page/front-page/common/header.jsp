<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<div class="header">
    <!----start-Logo---->
    <div class="logo">
        <a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/images/logo.png" title="logo" /></a>
    </div>
    <!----End-Logo---->
    <!----start-top-nav---->
    <div class="top-nav">
        <ul>
            <li><a href="${pageContext.request.contextPath}">网站首页</a><p></p></li>
            <c:if test="${!empty userinfo}">
                <li><a name="headr_account" href="${pageContext.request.contextPath}/myaccount">个人中心</a><p></p></li>
            </c:if>
            <c:if test="${empty userinfo}">
                <li><a name="headr_account" href="${pageContext.request.contextPath}/account">登录/注册</a><p></p></li>
            </c:if>

            <li><a href="${pageContext.request.contextPath}/videoList">视频列表</a><p></p></li>
            <li><a href="${pageContext.request.contextPath}/introduce">网站动态</a><p></p></li>
            <li><a href="${pageContext.request.contextPath}/contact">商务合作</a><p></p></li>
            <li><a href="${pageContext.request.contextPath}/contact">交流论坛</a><p></p></li>

        </ul>
    </div>
    <div class="clear"> </div>
    <!----End-top-nav---->
</div>
<script type="text/javascript">
    $(function() {
        var root="${pageContext.request.contextPath}";
        var uid="${userinfo.id}";
        if(uid==""){  //如果当前session中没有用户信息，则判断cookie中是否有用户信息 调用自动登录
            checkLogin(root);
        }

    });
    //登出
    function loginout(){
        //清除cookie
        deleteCookie("username","/");
        deleteCookie("password","/");
    }
</script>
<!----End-Header---->