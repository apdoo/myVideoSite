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

    <title>94lu-就是撸</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="就是撸,94lu">
    <meta http-equiv="description" content="就是撸">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/94lu-icon.png">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css"  media="all" />
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
</head>

<body>
<!----start-wrap---->
<div class="wrap">
    <!--头部-->
    <%@ include file="common/header.jsp" %>
    <div class="clear"> </div>
    <!--内容-->
    <div class="content">
        <div class="section group">
            <div class="col span_1_of_3">

                <div class="company_address">
                    <h3>用户信息</h3>
                    <p>账号：${userinfo.username} 	<a href="${pageContext.request.contextPath}/user/loginout" class="tp_txt" id="loginout" onclick="loginout()">退出登录</a> </p>

                    <c:if test="${userinfo.type==0}">
                        <p>会员级别：会员</p>
                    </c:if>
                    <c:if test="${userinfo.type==1}">
                        <p>会员级别：高级会员</p>
                    </c:if>
                    <c:if test="${userinfo.type==2}">
                        <p>会员级别：赞助会员</p>
                    </c:if>
                    <c:if test="${userinfo.type==5}">
                        <p>会员级别：管理员</p>
                    </c:if>
                    <p>注册时间: ${userinfo.signupTime}</p>
                    <p>注册邮箱: ${userinfo.email}</p>
                    <p>上次登录时间: ${userinfo.loginTime}</p>
                    <p>上次登录ip: ${userinfo.loginIp}</p>


                </div>
            </div>
            <div class="col span_2_of_3">
                <div id="my_favorite_video" class="contact-form">
                    <h3>收藏视频列表</h3>
                    <c:forEach items="${favoriteVideos}" var="val">
                        <div style="float: left;padding: 1px;">
                            <a target="_blank" href="${pageContext.request.contextPath}/videoplay?vkey=${val.vkey}"><img style="width:160px;height: 120px;;" src="${val.imgName}" title="${val.title}"></a>
                            <p style="width: 160px; height:18px;overflow:hidden;" >${val.title}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <div class="clear"> </div>
</div>
    <!--尾部-->
    <%@ include file="common/footer.jsp" %>

</body>
</html>
