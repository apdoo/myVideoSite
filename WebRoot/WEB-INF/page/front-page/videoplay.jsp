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
        <div class="inner-page">
            <div class="title">
                <h3>${video.title}</h3>
                <ul>
                    <li><h4>By:</h4></li>
                    <li><a href="#">94lu-就是撸</a></li>
                    <c:if test="${userinfo.type>=0}">
                        <li><a href="${pageContext.request.contextPath}/bbs/replay?tid=${topical.id}"    ><img src="${pageContext.request.contextPath}/resources/images/re1.png" title="下载"/>下载</a></li>
                    </c:if>
                    <c:if test="${userinfo.type==null}">
                        <li><a href="#" onclick="vist_tips(); return false"><img src="${pageContext.request.contextPath}/resources/images/re1.png" title="下载"/>下载</a></li>
                    </c:if>
                    <li><a href="#" id="favorite_title" onclick="houseVideo('${shareKey}','${userinfo.id}','${pageContext.request.contextPath}');return false"><img src="${pageContext.request.contextPath}/resources/images/sub.png" title="${favorite}" />${favorite}</a></li>
                    <li><a href="#" id="praise_title" onclick="praiseVideo('${shareKey}','${pageContext.request.contextPath}');return false;"><img src="${pageContext.request.contextPath}/resources/images/likes1.png" title="赞一个" />赞一个</a></li>
                </ul>
            </div>
            <div class="video-inner">
                <div id='myplayer'></div>
            </div>
            <div class="viwes">
                <div class="view-links">
                    <ul>
                        <li><h4>分享:</h4></li>
                        <input type="text" value="http://${header['host']}${pageContext.request.contextPath}/videoplay?vkey=${shareKey}" name="s" class="chain">
                    </ul>
                </div>
                <div class="views-count">
                    <p><span>${video.views}</span> 观看</p>
                </div>
                <div class="clear"> </div>
            </div>
            <div class="clear"> </div>
            <div class="video-details">
                <ul>
                    <li><p>更新时间:  ${video.updatetime}</p></li>
                    <li><span></span></li>
                </ul>
            </div>
            <div class="clear"> </div>
            <div class="tags">
                <ul>
                    <li><h3>标签:${video.tags}</h3></li>
                </ul>
            </div>
            <div class="clear"> </div>
            <%@include file="common/below-content.jsp"%>
            <div class="clear"> </div>
        </div>
        <%@include file="common/right-content.jsp"%>
    <div class="clear"> </div>
    </div>
</div>
    <!--尾部-->
    <%@ include file="common/bottom.jsp" %>
<!--js放在div的后面 才能正确加载-->
<script src="${pageContext.request.contextPath}/js/jwplayer/jwplayer.js"></script>
<script type="text/javascript">
    $(function(){
        var root="${pageContext.request.contextPath}";
        init_right_content_randomview_video(root);//加载右侧
        init_below_content_video(root);
    });
    jwplayer('myplayer').setup({
        file:"${video.videoName}" ,
        width: '630',
        height: '500',
        image:"${video.imgName}",//视频预览图片
        //controlbar: "over",//控制条位置
        controlbar: "none",
        screencolor :"#fff"//播放器颜色
    });
function vist_tips(){
    alert("请先登录账号后进行下载！");
}
</script>
</body>
</html>
