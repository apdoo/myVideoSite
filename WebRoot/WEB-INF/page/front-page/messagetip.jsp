<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
        <div class="ad-sidebar">
        </div>
        <div class="admin-content">
            <div class="am-cf am-padding">
            </div>
            <hr class="ad-hr">
            <div class="am-g">
                <div class="am-u-sm-12 am-u-sm-centered" >
                    <h2 class="ad-h">信息提示</h2>
                    <p class="ad-p">${msg}</p>
                    <hr class="ad-hr">
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
