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
                <div class="cell"><a href="${pageContext.request.contextPath}/bbs">94lu社区</a> <span class="chevron">&nbsp;›&nbsp;</span> 广告投放 </div>
                <div class="cell">
                    <h1 style="padding-top: 0px;">在 94lu 投放广告</h1>
                    <div class="sep20"></div>
                    <span class="bigger" style="line-height: 150%;">广告联系请发到　94luvideo@gmail.com 请注意本站不通过任何代理接手广告，请直接联系邮箱。标题请注明广告联系，必带上广告网址。不写明者将不予回复。</span>
                    <div class="sep20"></div>
                    <span class="bigger" style="line-height: 150%;">老客户请注意，续费前请首先Email确认。</span>
                    <div class="sep20"></div>
                    <div class="bar">广告投放流程</div>
                    <div class="sep10"></div>
                    <ol style="line-height: 22px; color: #445; font-size: 13px; width: 500px">
                        <li>给我们的邮箱发送电子邮件</li>
                        <li>我们将在回信中告知可行的投放开始时间及付款方式</li>
                        <li>选择一种你觉得方便的付款方式进行付款</li>
                        <li>将广告物料发送给我们</li>
                        <li>开始投放！</li>
                    </ol>
                    <div class="sep20"></div>
                    <div style="background-color: #ffffe2; font-size: 13px; line-height: 22px; text-align: center; color: #333; padding: 10px; -moz-border-radius: 4px; -webkit-border-radius: 4px;">94lu 所获得的广告收入，将用于支付所运行在的服务器平台所产生的各种费用，帮助社区能够持续发展。</div>
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