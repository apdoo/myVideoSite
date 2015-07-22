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
    <!--内容-->

    <div class="content">
        <div class="inner-page">
            <div class="searchbar">
                <div class="search-left">
                    <p>搜索视频</p>
                </div>
                <div class="search-right">
                    <form>
                        <input type="text"><input type="submit" value="" />
                    </form>
                </div>
                <div class="clear"> </div>
            </div>
            <div class="title">
                <h3>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </h3>
                <ul>
                    <li><h4>By:</h4></li>
                    <li><a href="#">Author</a></li>
                    <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/sub.png" title="subscribe" />subscribe</a></li>
                </ul>
            </div>
            <div class="video-inner">
                <a href="#"><img src="${pageContext.request.contextPath}/resources/images/b11.png" title="videoname" /><span>10:00</span></a>
            </div>
            <div class="viwes">
                <div class="view-links">
                    <ul>
                        <li><h4>Share on:</h4></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/f1.png" title="facebook" /></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/t1.png" title="Twitter" /></a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/s1.png" title="Google+" /></a></li>
                    </ul>
                    <ul class="comment1">
                        <li><a href="#">Comment(1)</a></li>
                        <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/re.png" title="report" /><span>Report</span></a></li>
                    </ul>
                </div>
                <div class="views-count">
                    <p><span>2,500</span> Views</p>
                </div>
                <div class="clear"> </div>
            </div>
            <div class="clear"> </div>
            <div class="video-details">
                <ul>
                    <li><p>Uploaded on <a href="#">June 21, 2013</a> by <a href="#">Lorem</a></p></li>
                    <li><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span></li>
                </ul>
                <ul class="other-links">
                    <li><a href="#">youtube.com/videos-tube</a></li>
                    <li><a href="#">facebook.com/videos-tube</a></li>
                    <li><a href="#">Twitter.com/videos-tube</a></li>
                </ul>
            </div>
            <div class="clear"> </div>
            <div class="tags">
                <ul>
                    <li><h3>Tags:</h3></li>
                    <li><a href="#">Games</a> ,</li>
                    <li><a href="#">HD-Videos</a></li>
                </ul>
            </div>
            <div class="clear"> </div>
            <div class="related-videos">
                <h6>Related-Videos</h6>
                <div class="grids">
                    <div class="grid">
                        <h3>Consectetur adipisicing elit</h3>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/g3.jpg" title="video-name"></a>
                        <div class="time">
                            <span>2:30</span>
                        </div>
                        <div class="grid-info">
                            <div class="video-share">
                                <ul>
                                    <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/likes.png" title="links"></a></li>
                                    <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/link.png" title="Link"></a></li>
                                    <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/views.png" title="Views"></a></li>
                                </ul>
                            </div>
                            <div class="video-watch">
                                <a href="#">Watch Now</a>
                            </div>
                            <div class="clear"> </div>
                            <div class="lables">
                                <p>Labels:<a href="#">Lorem</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="grid">
                        <h3>Consectetur adipisicing elit</h3>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/g5.jpg" title="video-name"></a>
                        <div class="time">
                            <span>5:10</span>
                        </div>
                        <div class="grid-info">
                            <div class="video-share">
                                <ul>
                                    <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/likes.png" title="links"></a></li>
                                    <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/link.png" title="Link"></a></li>
                                    <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/views.png" title="Views"></a></li>
                                </ul>
                            </div>
                            <div class="video-watch">
                                <a href="#">Watch Now</a>
                            </div>
                            <div class="clear"> </div>
                            <div class="lables">
                                <p>Labels:<a href="#">Lorem</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="grid">
                        <h3>Consectetur adipisicing elit</h3>
                        <a href="#"><img src="${pageContext.request.contextPath}/resources/images/g4.jpg" title="video-name"></a>
                        <div class="time">
                            <span>2:00</span>
                        </div>
                        <div class="grid-info">
                            <div class="video-share">
                                <ul>
                                    <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/likes.png" title="links"></a></li>
                                    <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/link.png" title="Link"></a></li>
                                    <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/views.png" title="Views"></a></li>
                                </ul>
                            </div>
                            <div class="video-watch">
                                <a href="#">Watch Now</a>
                            </div>
                            <div class="clear"> </div>
                            <div class="lables">
                                <p>Labels:<a href="#">Lorem</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear"> </div>
        </div>
        <%@include file="common/right-content.jsp"%>
    <div class="clear"> </div>
</div>
    <!--尾部-->
    <%@ include file="common/footer.jsp" %>

</body>
</html>
