<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>94lu社区-账户余额</title>
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
                <div class="cell"><div class="fr" style="margin: -3px -8px 0px 0px"><a href="${pageContext.request.contextPath}/recharge" class="tab">充值</a></div><a href="${pageContext.request.contextPath}/bbs">94lu</a> <span class="chevron">&nbsp;›&nbsp;</span> 账户余额</div>
                <div class="cell">
                    <table cellpadding="10" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="200">
                                <span class="gray">当前账户余额</span>
                                <div class="sep10"></div>
                                <div class="sep5"></div>
                                <div class="balance_area" style="font-size: 24px; line-height: 24px;">${userinfo.points} <img src="${pageContext.request.contextPath}/resources/forum-images/gold.png" alt="S" align="absmiddle" border="0" style="padding-bottom: 2px;"> </div></td>
                        </tr>
                        </tbody></table>
                </div>
                <div>
                    <table cellpadding="5" cellspacing="0" border="0" width="100%" class="data">
                        <tbody><tr>
                            <td width="130" class="h">时间</td>
                            <td width="80" class="h">类型</td>
                            <td width="60" class="h">数额</td>
                            <td width="auto" class="h" style="border-right: none;">描述</td>
                        </tr>
                    <c:forEach items="${balance_list}" var="balance">
                        <tr>
                            <td class="d"><small class="gray">${balance.time}</small></td>
                            <td class="d">${balance.type}</td>
                            <c:if test="${fn:contains(balance.amount, '-')}">
                                <td class="d" style="text-align: right;"><span class="negative"><strong>${balance.amount}</strong></span></td>
                            </c:if>
                            <c:if test="${!fn:contains(balance.amount, '-')}">
                                <td class="d" style="text-align: right;"><span class="positive"><strong>${balance.amount}</strong></span></td>
                            </c:if>
                            <td class="d" style="border-right: none;"><span class="gray">${balance.description}</span></td>
                        </tr>
                     </c:forEach>
                        </tbody></table>
                </div>
                <div class="inner">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="120" align="left"><c:if test="${pager.currentPage<=pager.pageCount&&pager.currentPage>1}"><input type="button" onclick="location.href ='${pageContext.request.contextPath}/bbs/balance?wpage=${pager.currentPage-1}';" value="‹ 上一页" class="super normal button"></c:if></td>
                            <td width="auto" align="center"><strong class="fade">${pager.currentPage}/${pager.pageCount}</strong></td>
                            <td width="120" align="right">    <c:if test="${pager.currentPage!=pager.pageCount}"> <input type="button" onclick="location.href ='${pageContext.request.contextPath}/bbs/balance?wpage=${pager.currentPage+1}';" value="下一页 ›" class="super normal button"> </c:if></td>
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