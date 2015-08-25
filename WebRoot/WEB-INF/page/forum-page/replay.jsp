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

    <title>94lu社区-${topical.title}</title>
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
        <div id="Main"  >
            <div class="sep20"></div>
            <div class="box" style="border-bottom: 0px;">
                <div class="header"><div class="fr"></div>
                    <a href="${pageContext.request.contextPath}/bbs">94lu</a> <span class="chevron">&nbsp;›&nbsp;</span>
                    <c:if test="${topical.tags=='交流区'}">
                        <a href="${pageContext.request.contextPath}/bbs?tab=1">${topical.tags}</a>
                    </c:if>
                    <c:if test="${topical.tags=='建议区'}">
                        <a href="${pageContext.request.contextPath}/bbs?tab=2">${topical.tags}</a>
                    </c:if>
                    <c:if test="${topical.tags=='图片区'}">
                        <a href="${pageContext.request.contextPath}/bbs?tab=3">${topical.tags}</a>
                    </c:if>
                    <c:if test="${topical.tags=='种子区'}">
                        <a href="${pageContext.request.contextPath}/bbs?tab=4">${topical.tags}</a>
                    </c:if>
                    <c:if test="${topical.tags=='下载区'}">
                        <a href="${pageContext.request.contextPath}/bbs?tab=5">${topical.tags}</a>
                    </c:if>
                    <div class="sep10"></div>
                    <h1>${topical.title}</h1>
                    <div   class="votes">
                      </div> &nbsp; <small class="gray">${topical.author} · ${topical.time} · ${topical.views} 次点击 &nbsp; </small>
                </div>

                <div class="cell">

                    <div class="topic_content">
                        <div class="markdown_body">
                                ${topical.content}
                        </div>
                    </div>
                </div>
                <div class="topic_buttons"><div class="fr gray f11" style="line-height: 12px; padding-top: 3px; text-shadow: 0px 1px 0px #fff;">${topical.views}  次点击 &nbsp; </div><a id="favorite_topical" href="#" onclick="favorite_topical('${topical.id}','${userinfo.id}','${pageContext.request.contextPath}');return false"  class="tb">${favorite_topical}</a> </div>
            </div>
            <div class="sep20"></div>
            <div class="box">
                <div class="cell"> <span class="gray">${count} 回复 &nbsp;<strong class="snow">|</strong> &nbsp;</span>
                </div>
                <c:forEach items="${replay_list}" var="replay">
                    <div  class="cell">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tbody><tr>
                                <td width="48" valign="top" align="center"><img src="${replay.replayAuthorAvatar}" class="avatar" border="0" align="default"></td>
                                <td width="10" valign="top"></td>
                                <td width="auto" valign="top" align="left">
                                    <div class="sep3"></div>
                                    <strong><a href="/member/mhycy" class="dark">${replay.author}</a></strong>&nbsp; &nbsp;<span class="fade small">${replay.time}</span>
                                    <div class="sep5"></div>
                                    <div class="reply_content">${replay.content}</div>
                                </td>
                            </tr>
                            </tbody></table>
                    </div>
               </c:forEach>
                <!--分页评论-->
                <div class="inner" style="border-top: 1px solid #e2e2e2; text-align: center;">
                    <c:if test="${count!=0}">
                        <c:forEach var="i" begin="1" end="${pager.pageCount}">
                            <c:if test="${i==pager.currentPage}">
                                <span class="page_current">${i}</span>
                            </c:if>
                            <c:if test="${i!=pager.currentPage}">
                                <a href="${pageContext.request.contextPath}/bbs/replay?tid=${tid}&wpage=${i}" class="page_normal">${i}</a>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
            <div class="sep20"></div>

            <div class="box">
                <div class="cell"><div class="fr"><a href="#" onclick="back_to_top();return false;"><strong>↑</strong> 回到顶部</a></div>
                    添加一条新回复
                </div>
                <div class="cell">
                    <form method="post" action="${pageContext.request.contextPath}/topical/publishReplay">
                        <input type="hidden" name="tid" value="${tid}"/>
                        <textarea name="content" maxlength="250" class="mll" id="reply_content" style="overflow: hidden; word-wrap: break-word; resize: none; height: 112px;"></textarea>
                        <div class="sep10"></div>
                        <div class="fr"><div class="sep5"></div><span class="gray">请尽量让自己的回复能够对别人有帮助</span></div>
                        <input type="submit" value="回复" class="super normal button">
                        <script type="text/javascript">
                            $("#reply_content").keydown(function(e) {
                                if ((e.ctrlKey || e.metaKey) && e.which === 13) {
                                    e.preventDefault();
                                    $("#reply_content").parent().submit();
                                }
                            });
                        </script>
                  </form>
                </div>
                <div class="inner">
                    <div class="fr"><a href="#" onclick="history.go(-1) ;return false;">← 94lu</a></div>
                    &nbsp;
                </div>
            </div>
        </div>
    </div>
    <div class="c"></div>
    <div class="sep20"></div>
</div>
<%@ include file="common/bottom.jsp" %>
<script type="text/javascript">

    function back_to_top(){
        $('body,html').animate({scrollTop:0},500);
    }
    /**
    *主题收藏
     */
    function favorite_topical(topicalId,uid,root){
        if(uid==""){
            alert("请登录用户后进行收藏！");
        }else{//视频收藏
            $.ajax({
                type : "POST",
                url : root+"/topical/houseTopical",
                data:{
                    topicalId:topicalId
                },
                dataType:"json",
                success : function(data) {
                    $("#favorite_topical").text(data.msg);
                },
                //请求出错的处理
                error:function(){
                }
            });

        }
    }

</script>
</body>
</html>