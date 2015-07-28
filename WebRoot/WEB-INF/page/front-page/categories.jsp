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
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/pageicon.png">
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
     <div class="content">
         <div class="categories">
             <div class="categories-list">
                 <div class="content-sidebar">
                     <h4><img src="${pageContext.request.contextPath}/resources/images/fi.png" alt="" />目录</h4>
                     <ul>
                         <li><a id="categories_1" href="${pageContext.request.contextPath}/videoList?categories=1">最新视频</a></li>
                         <li><a id="categories_2" href="${pageContext.request.contextPath}/videoList?categories=2">观看最多</a></li>
                         <li><a id="categories_3" href="${pageContext.request.contextPath}/videoList?categories=3">收藏最多</a></li>
                         <li><a id="categories_4" href="${pageContext.request.contextPath}/videoList?categories=4">最高评分</a></li>
                     </ul>
                 </div>
             </div>
             <div class="categories-types">
                 <div class="recent-videos">
                     <div class="searchbar">
                         <div class="search-left">
                             <p>最新上传的视频</p>
                         </div>
                         <div class="search-right">
                             <form>
                                 <input type="text"><input type="submit" value="">
                             </form>
                         </div>
                         <div class="clear"> </div>
                     </div>
                     <!--最新视频列表-->
                     <div  id="categories_box"></div>
                     <div class="clear"> </div>
                 </div>
             </div>
             <div class="recent-videos">
                 <!--分页-->
                 <ul id="categories_page" class="dc_pagination dc_paginationA dc_paginationA03">
                 </ul>
             </div>
         </div>
     </div>
    <div class="clear"> </div>
    </div>
<div class="clear"> </div>
</div>
<!--头部-->
<%@ include file="common/footer.jsp" %>

<!----End-wrap---->
<script type="text/javascript">
    $(function(){
        var root="${pageContext.request.contextPath}";
        var categories="${categories}";//目录
        var path="/videoList?categories="+categories+"&wpage=";
        var current=${pager.currentPage};      //当前页数
        var pageCount=${pager.pageCount};  //总页数
        var list=${list};       //视频列表 json格式
        $("#categories_"+categories).addClass("active");
        init_categories_box(list);
        pagecreat(root,path,current,pageCount)
    });
</script>
</body>
</html>
