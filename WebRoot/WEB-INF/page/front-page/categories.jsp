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
     <div class="content">
         <div class="categories">
             <div class="categories-list">
                 <div class="content-sidebar">
                     <h4><img src="${pageContext.request.contextPath}/resources/images/fi.png" alt="" />目录</h4>
                     <ul>
                         <li><a id="categories_1" href="${pageContext.request.contextPath}/videoList?categories=1">最新视频</a></li>
                         <li><a id="categories_2" href="${pageContext.request.contextPath}/videoList?categories=2">观看最多</a></li>
                         <li><a id="categories_3" href="${pageContext.request.contextPath}/videoList?categories=3">收藏最多</a></li>
                         <li><a id="categories_4" href="${pageContext.request.contextPath}/videoList?categories=4">点赞最多</a></li>
                     </ul>
                 </div>
             </div>
             <div class="categories-types">
                 <div class="recent-videos">
                     <div class="searchbar">
                         <div class="search-left">
                             <p>${categories_title}的视频</p>
                         </div>
                         <div class="search-right">
                                 <form onsubmit="return categories_search_from_check()" method="post"  action="${pageContext.request.contextPath}/searchvideos">
                                     <input   value="" name="search" type="text" value=""><input  type="submit"  value="">
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
        init_categories_box(root,list);
        pagecreat(root,path,current,pageCount)
    });
    /**
    * 检测用户是否登录
    * @returns {boolean}
     */
    function categories_search_from_check(){
        var uid="${userinfo.id}";
        //判断是否是游客，游客不允许搜索
        if(uid==""){  //如果当前session中没有用户信息，则判断cookie中是否有用户信息 调用自动登录
            alert("对不起，游客暂时不支持搜索功能，请先注册或者登录。");
            return false;
        }
        return true;
    }

</script>
</body>
</html>
