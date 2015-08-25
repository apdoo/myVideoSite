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

    <title>94lu社区-发帖记录</title>
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
                <div class="header"><a href="${pageContext.request.contextPath}/bbs">94lu社区</a> <span class="chevron">&nbsp;›&nbsp;</span> 我发布过的主题<div class="fr f12"><span class="snow">主题总数&nbsp;</span> <strong class="gray">${user_post_count}</strong></div></div>
                <c:forEach items="${posts_list}" var="topical">
                    <div class="cell item" style=""><div style="position: absolute; margin: -10px -10px 0px 650px;"></div>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tbody><tr>
                                <td width="48" valign="top" align="center"><a href="${pageContext.request.contextPath}/bbs/replay?tid=${topical.id}"><img src="${pageContext.request.contextPath}/resources/forum-images/default_avatar.png" class="avatar" border="0" align="default"></a></td>
                                <td width="10"></td>
                                <td width="auto" valign="middle"><span class="item_title"><a href="${pageContext.request.contextPath}/bbs/replay?tid=${topical.id}">${topical.title}</a></span>
                                    <div class="sep5"></div>
                                    <span class="small fade"><div class="votes"></div><span class="node">${cn_name}</span> &nbsp;•&nbsp; <strong><a href="#" onclick="return false;">作者：${topical.author}</a></strong> &nbsp;•&nbsp; ${topical.time} &nbsp;•&nbsp;${topical.views}  次点击&nbsp;•&nbsp; </span>
                                </td>
                                <td width="70" align="right" valign="middle">
                                    <a href="${pageContext.request.contextPath}/bbs/replay?tid=${topical.id}" class="count_livid">${topical.replays}</a>
                                </td>
                            </tr>
                            </tbody></table>
                    </div>
                </c:forEach>
                <div class="inner">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="120" align="left"><c:if test="${pager.currentPage<=pager.pageCount&&pager.currentPage>1}"><input type="button" onclick="location.href ='${pageContext.request.contextPath}/bbs/posts?wpage=${pager.currentPage-1}';" value="‹ 上一页" class="super normal button"></c:if></td>
                            <td width="auto" align="center"><strong class="fade">${pager.currentPage}/${pager.pageCount}</strong></td>
                            <td width="120" align="right">    <c:if test="${pager.currentPage!=pager.pageCount}"> <input type="button" onclick="location.href ='${pageContext.request.contextPath}/bbs/posts?wpage=${pager.currentPage+1}';" value="下一页 ›" class="super normal button"> </c:if></td>
                        </tr>
                        </tbody></table>
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