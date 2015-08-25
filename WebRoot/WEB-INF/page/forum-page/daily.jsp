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

    <title>94lu社区-每日登录奖励</title>
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
        <%@ include file="common/right-content.jsp" %>
        <div id="Main"  >
            <div class="sep20"></div>
            <div class="box">
                <div class="cell"><a href="${pageContext.request.contextPath}/bbs">94lu</a> <span class="chevron">&nbsp;›&nbsp;</span> 日常任务</div>

                <c:if test="${today_count==0}">
                    <div class="cell">
                        <h1>每日登录奖励 </h1>
                        <input type="button" class="super normal button" value="领取 5 金币" onclick="location.href ='${pageContext.request.contextPath}/balance/daily';">
                    </div>
                </c:if>
                <c:if test="${today_count>0}">
                    <div class="cell">
                        <h1>每日登录奖励已领取 </h1>
                        <input type="button" class="super normal button" value="查看我的账户余额" onclick="location.href = '${pageContext.request.contextPath}/bbs/balance';">
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    <div class="c"></div>
    <div class="sep20"></div>
</div>
<%@ include file="common/bottom.jsp" %>
</body>
</html>