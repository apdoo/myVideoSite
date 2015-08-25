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

    <title>94lu-就是撸</title>
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
                <div class="header"><a href="${pageContext.request.contextPath}/">94lu社区</a> <span class="chevron">&nbsp;›&nbsp;</span> <a href="${pageContext.request.contextPath}/bbs/settings">设置</a> <span class="chevron">&nbsp;›&nbsp;</span> 头像上传</div>
                <div class="inner"><form method="post" action="${pageContext.request.contextPath}/user/modifyAvatar" enctype="multipart/form-data">
                    <table cellpadding="5" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="120" align="right">当前头像</td>
                            <td width="auto" align="left">
                                <c:if test="${userinfo.temp=='0'}">
                                    <img src="${pageContext.request.contextPath}/resources/forum-images/default_avatar.png" class="avatar" border="0" align="default">
                                </c:if>
                                <c:if test="${userinfo.temp!='0'}">
                                    <img src="${avatar_img_path}${userinfo.temp}" class="avatar" border="0" align="default">
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td width="120" align="right">选择一个图片文件</td>
                            <td width="auto" align="left"><input type="file" name="avatar"></td>
                        </tr>
                        <tr>
                            <td width="120" align="right"></td>
                            <td width="auto" align="left"><span class="gray">支持 2MB 以内的 PNG / JPG / GIF 文件</span></td>
                        </tr>
                        <tr>
                            <td width="120" align="right"></td>
                            <td width="auto" align="left"><span class="red">${msg}</span></td>
                        </tr>
                        <tr>
                            <td width="120" align="right"></td>
                            <td width="auto" align="left"><input type="hidden" value="24474" name="once"><input type="submit" class="super normal button" value="开始上传"></td>
                        </tr>
                        </tbody></table></form>
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