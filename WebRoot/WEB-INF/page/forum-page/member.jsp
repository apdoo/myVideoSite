<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>94lu社区-个人中心</title>
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
                <div class="cell">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody>
                        <tr>
                            <td width="73" valign="top" align="center">
                                <c:if test="${userinfo.temp=='0'}">
                                    <img src="${pageContext.request.contextPath}/resources/forum-images/default_avatar.png" class="avatar" border="0" align="default">
                                </c:if>
                                <c:if test="${userinfo.temp!='0'}">
                                    <img src="${avatar_img_path}${userinfo.temp}" class="avatar" border="0" align="default">
                                </c:if>
                                <div class="sep10"></div>
                            </td>
                            <td width="10"></td>
                            <td width="auto" valign="top" align="left">
                                <h1 style="margin-bottom: 5px;">${userinfo.username}</h1>
                                <div class="sep10"></div>
                                <span class="gray"><li class="fa fa-time"></li> &nbsp; 94lu社区 第 ${userinfo.id} 号会员，加入于 ${userinfo.signupTime}</span>
                            </td>
                        </tr>
                        </tbody></table>
                    <div class="sep5"></div>
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