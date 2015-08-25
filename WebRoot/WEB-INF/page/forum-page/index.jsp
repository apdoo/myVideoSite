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

    <title>94lu社区-${cn_name}</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="就是撸,94lu">
    <meta http-equiv="description" content="就是撸">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/forum-images/94lu-icon.png">
</head>
<body>
<%@ include file="common/header.jsp" %>
<div id="Wrapper">
    <div class="content">
        <div id="Leftbar"></div>
        <%@ include file="common/right-content.jsp" %>
        <div id="Main">
            <div class="sep20"></div>
            <div class="box">
                <div class="header"><div class="fr f12"><span class="fade">共 ${count} 个主题</span></div><a href="${pageContext.request.contextPath}/bbs">94lu社区</a> <span class="chevron">&nbsp;›&nbsp;</span> ${cn_name}</div>
                <div class="inner" style="background-color: #fff; border-top-left-radius: 3px; border-top-right-radius: 3px;" id="Tabs">
                    <a href="${pageContext.request.contextPath}/bbs?tab=1" class="tab_current">交流区</a><a href="${pageContext.request.contextPath}/bbs?tab=2" class="tab">建议区</a><a href="${pageContext.request.contextPath}/bbs?tab=3" class="tab">图片区</a><a href="${pageContext.request.contextPath}/bbs?tab=4" class="tab">种子区</a><a href="${pageContext.request.contextPath}/bbs?tab=5" class="tab">下载区</a><a href="${pageContext.request.contextPath}/bbs?tab=6" class="tab">最热</a>
                </div>
                <c:forEach items="${topical_list}" var="topical">
                <div class="cell item" style=""><div style="position: absolute; margin: -10px -10px 0px 650px;"></div>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="48" valign="top" align="center"><a href="${pageContext.request.contextPath}/bbs/replay?tid=${topical.id}"><img  src="${topical.authorAvatar}"  class="avatar" border="0" align="default"></a></td>
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
            <div class="sep20"></div>
                <div class="inner">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="120" align="left"><c:if test="${pager.currentPage<=pager.pageCount&&pager.currentPage>1}"><input type="button" onclick="pre_page()" value="‹ 上一页" class="super normal button"></c:if></td>
                            <td width="auto" align="center"><strong class="fade">${pager.currentPage}/${pager.pageCount}</strong></td>
                            <td width="120" align="right">    <c:if test="${pager.currentPage!=pager.pageCount}"> <input type="button" onclick="next_page()" value="下一页 ›" class="super normal button"> </c:if></td>
                        </tr>
                        </tbody></table>
                </div>
        </div>
    </div>
    <div class="c"></div>
    <div class="sep20"></div>
</div>
<%@ include file="common/bottom.jsp" %>
 <script type="text/javascript" >
     var cn_name="${cn_name}";
     var tab="${tab}";
     var currentPage=${pager.currentPage};
     var bbs_root="${pageContext.request.contextPath}/bbs";
     $(function(){
         $("#Tabs").find("a").each(function(key,val){
             if($(val).text()==cn_name){
                 $(val).removeClass("tab");
                 $(val).addClass("tab_current");
             }else{
                 $(val).removeClass("tab_current");
                 $(val).addClass("tab");
             }
         });
     });
    /**
    * 上一页按钮
     */
     function pre_page(){
        window.location.href=bbs_root+"?tab="+tab+"&wpage="+(currentPage-1);
     }
     /**
     * 下一页按钮
      */
     function next_page(){
         window.location.href=bbs_root+"?tab="+tab+"&wpage="+(currentPage+1);
     }
 </script>
</body>
</html>