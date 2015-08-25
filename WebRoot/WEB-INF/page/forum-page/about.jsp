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
                <div class="cell"><a href="${pageContext.request.contextPath}/bbs">94lu社区</a> <span class="chevron">&nbsp;›&nbsp;</span> About</div>
                <div class="inner">
                    <div class="page">
                        <h1>About 94lu</h1>
                        <div class="sep10"></div>
                        94lu致力于打造一个在线视频观看与各类资源下载共享的专业平台网站。
                        <br/> <br/>
                        如果您有好的建议或者好的站点推荐，请在建议区发布主题，将站点推荐给我们，我们会安排技术人员破解该网站资源。   一旦您的建议被我们采用，将会奖励100金币到您的账户下。
                        <br/> <br/>
                        希望大家能够多多分享自己正在做的有趣事物、交流想法，在这里找到朋友甚至新的机会。并且，最重要的是，在这一切的过程中，保持对他人的友善。
                        <div class="sep10"></div>
                    </div>
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