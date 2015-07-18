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
    <div class="content">
        <div class="categories">
            <div class="categories-list">
                <div class="content-sidebar">
                    <h4><img src="${pageContext.request.contextPath}/resources/images/fi.png" alt="" />Categories</h4>
                    <ul>
                        <li><a href="#">Arts &amp; Media</a></li>
                        <li><a href="#">Business &amp; Finance</a></li>
                        <li><a href="#">Careers &amp; Education</a></li>
                        <li><a href="#">Cars &amp; Transportation</a></li>
                        <li><a href="#">Crafts &amp; Hobbies</a></li>
                        <li><a href="#">Environment</a></li>
                        <li><a href="#">First Aid &amp; Safety</a></li>
                        <li><a href="#">Food &amp; Drink</a></li>
                        <li><a href="#">Games</a></li>
                        <li><a href="#">Health &amp; Nutrition</a></li>
                        <li><a href="#">Holidays &amp; Celebrations</a></li>
                        <li><a href="#">House &amp; Garden</a></li>
                        <li><a href="#">Kids</a></li>
                        <li><a href="#">Language &amp; Reference</a></li>
                        <li><a href="#">Mind &amp; Body</a></li>
                        <li><a href="#">Parenting &amp; Family</a></li>
                        <li><a href="#">Performing Arts</a></li>
                        <li><a href="#">Sports &amp; Fitness</a></li>
                        <li><a href="#">Technology</a></li>
                        <li><a href="#">Travel</a></li>
                    </ul>
                </div>
            </div>
            <div class="categories-types">
                <div class="recent-videos">
                    <h5><img src="${pageContext.request.contextPath}/resources/images/recent.png" alt="" />Recent-videos</h5>
                    <div class="grids grids2">
                        <div class="grid grid2">
                            <h3>Consectetur adipisicing elit</h3>
                            <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g1 copy.png" title="video-name"></a>
                            <div class="time">
                                <span>00:10</span>
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
                                    <a href="single.html">Watch Now</a>
                                </div>
                                <div class="clear"> </div>
                                <div class="lables">
                                    <p>Labels:<a href="#">Lorem</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="grid grid2">
                            <h3>Consectetur adipisicing elit</h3>
                            <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g2 copy.png" title="video-name"></a>
                            <div class="time">
                                <span>2:10</span>
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
                                    <a href="single.html">Watch Now</a>
                                </div>
                                <div class="clear"> </div>
                                <div class="lables">
                                    <p>Labels:<a href="#">Lorem</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="grid grid2">
                            <h3>Consectetur adipisicing elit</h3>
                            <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g4.jpg" title="video-name"></a>
                            <div class="time">
                                <span>10:10</span>
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
                                    <a href="single.html">Watch Now</a>
                                </div>
                                <div class="clear"> </div>
                                <div class="lables">
                                    <p>Labels:<a href="#">Lorem</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="clear"> </div>
                    </div>
                    <div class="grids grids2">
                        <div class="grid grid2">
                            <h3>Consectetur adipisicing elit</h3>
                            <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g1 copy.png" title="video-name"></a>
                            <div class="time">
                                <span>00:10</span>
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
                                    <a href="single.html">Watch Now</a>
                                </div>
                                <div class="clear"> </div>
                                <div class="lables">
                                    <p>Labels:<a href="#">Lorem</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="grid grid2">
                            <h3>Consectetur adipisicing elit</h3>
                            <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g2 copy.png" title="video-name"></a>
                            <div class="time">
                                <span>2:10</span>
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
                                    <a href="single.html">Watch Now</a>
                                </div>
                                <div class="clear"> </div>
                                <div class="lables">
                                    <p>Labels:<a href="#">Lorem</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="grid grid2">
                            <h3>Consectetur adipisicing elit</h3>
                            <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g4.jpg" title="video-name"></a>
                            <div class="time">
                                <span>10:10</span>
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
                                    <a href="single.html">Watch Now</a>
                                </div>
                                <div class="clear"> </div>
                                <div class="lables">
                                    <p>Labels:<a href="#">Lorem</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="clear"> </div>
                    </div>
                </div>
                <div class="recent-videos">
                    <h5><img src="${pageContext.request.contextPath}/resources/images/recent.png" alt="" />Most-View-videos</h5>
                    <div class="grids">
                        <div class="grid grid2">
                            <h3>Consectetur adipisicing elit</h3>
                            <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g1 copy.png" title="video-name"></a>
                            <div class="time">
                                <span>00:10</span>
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
                                    <a href="single.html">Watch Now</a>
                                </div>
                                <div class="clear"> </div>
                                <div class="lables">
                                    <p>Labels:<a href="#">Lorem</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="grid grid2">
                            <h3>Consectetur adipisicing elit</h3>
                            <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g2 copy.png" title="video-name"></a>
                            <div class="time">
                                <span>2:10</span>
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
                                    <a href="single.html">Watch Now</a>
                                </div>
                                <div class="clear"> </div>
                                <div class="lables">
                                    <p>Labels:<a href="#">Lorem</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="grid grid2">
                            <h3>Consectetur adipisicing elit</h3>
                            <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g4.jpg" title="video-name"></a>
                            <div class="time">
                                <span>10:10</span>
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
                                    <a href="single.html">Watch Now</a>
                                </div>
                                <div class="clear"> </div>
                                <div class="lables">
                                    <p>Labels:<a href="#">Lorem</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="clear"> </div>
                    </div>
                    <div class="clear"> </div>
                    <div class="grids">
                        <div class="grid grid2">
                            <h3>Consectetur adipisicing elit</h3>
                            <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g1 copy.png" title="video-name"></a>
                            <div class="time">
                                <span>00:10</span>
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
                                    <a href="single.html">Watch Now</a>
                                </div>
                                <div class="clear"> </div>
                                <div class="lables">
                                    <p>Labels:<a href="#">Lorem</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="grid grid2">
                            <h3>Consectetur adipisicing elit</h3>
                            <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g2 copy.png" title="video-name"></a>
                            <div class="time">
                                <span>2:10</span>
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
                                    <a href="single.html">Watch Now</a>
                                </div>
                                <div class="clear"> </div>
                                <div class="lables">
                                    <p>Labels:<a href="#">Lorem</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="grid grid2">
                            <h3>Consectetur adipisicing elit</h3>
                            <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g4.jpg" title="video-name"></a>
                            <div class="time">
                                <span>10:10</span>
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
                                    <a href="single.html">Watch Now</a>
                                </div>
                                <div class="clear"> </div>
                                <div class="lables">
                                    <p>Labels:<a href="#">Lorem</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="clear"> </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clear"> </div>
    </div>
</div>
<div class="clear"> </div>
</div>
<!--头部-->
<%@ include file="common/footer.jsp" %>

<!----End-wrap---->
</body>
</html>
