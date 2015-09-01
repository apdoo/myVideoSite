<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>94lu社区-充值</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="就是撸,94lu">
    <meta http-equiv="description" content="就是撸">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/forum-images/94lu-icon.png">
    <link href="${pageContext.request.contextPath}/resources/forum-css/style.css" rel="stylesheet" type="text/css"  media="all" />
</head>
<body>
<%@ include file="common/header.jsp" %>
<div id="Wrapper">
    <div class="content">
        <div id="Leftbar"></div>
        <%@ include file="common/simply-right-content.jsp" %>
        <div id="Main"  >
            <div class="sep20"></div>
            <div class="box">
                <div class="cell"><a target="_blank" href="${pageContext.request.contextPath}/bbs">94lu社区</a> <span class="chevron">&nbsp;›&nbsp;</span> 常见问题</div>
                <div class="cell topic_content">
                    <h2>视频网址总是被屏蔽，怎么办？</h2>
                    <p>关注94lu<a href="http://weibo.com/u/5688400952/">官方微博</a>，发布最新的视频网址。或者发送邮件到 94luvideo@gmail.com即可获得最新的访问网址</p>
                    <h2>94lu金币规则与如何获得金币？</h2>
                    <p>普通会员观看在线视频扣除1金币，下载种子扣除1金币，下载视频扣除3金币。通过领取每日的登录奖励可以获得5金币,或者在建议区给我们提供相关建议或信息，一旦采用，将会奖励100金币到您的账户下。或者直接进行金币充值。详情点击<a href="${pageContext.request.contextPath}/recharge">充值详细页</a></p>
                    <h2>如何获得vip账号？</h2>
                    <p>你可以通过支付宝转账方式向 94lu 充值。详情点击<a href="${pageContext.request.contextPath}/recharge">充值详细页</a></p>
                    <h2>vip会员与会员的区别？</h2>
                    <p>普通会员观看在线视频与下载相关资源都会扣除相应的金币，vip会员则没有此限制。一次性充值200元即可获得永久vip会员资格，并且加入专属vip会员群。</p>
                    <h2>忘记了用户名或者密码怎么办？</h2>
                    <p>只要你记住你的用户名或者邮箱就可以了。当然你要保证你的邮箱是有效的。</p>
                </div>

            </div>
        </div>
    </div>
    <div class="c"></div>
    <div class="sep20"></div>
</div>
<%@ include file="common/bottom.jsp" %>
</body>
</html>