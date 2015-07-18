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
	<meta http-equiv="keywords" content="就是撸,video">
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
	  <%@ include file="WEB-INF/page/front-page/common/header.jsp" %>
	  <div class="clear"> </div>
	  <div class="content">
		  <div class="left-content">
			  <div class="searchbar">
				  <div class="search-left">
					  <p>最新上传的视频</p>
				  </div>
				  <div class="search-right">
					  <form>
						  <input type="text"><input type="submit" value="" />
					  </form>
				  </div>
				  <div class="clear"> </div>
			  </div>
			  <div class="box">
				  <div class="grids">
					  <div class="grid">
						  <h3>Consectetur adipisicing elit</h3>
						  <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g1 copy.png" title="video-name" /></a>
						  <div class="time">
							  <span>00:10</span>
						  </div>
						  <div class="grid-info">
							  <div class="video-share">
								  <ul>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/likes.png" title="links" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/link.png" title="Link" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/views.png" title="Views" /></a></li>
								  </ul>
							  </div>
							  <div class="video-watch">
								  <a href="single.html">Watch Now</a>
							  </div>
							  <div class="clear"> </div>
							  <div class="lables">
								  <p>Labels:<a href="categories.html">Lorem</a></p>
							  </div>
						  </div>
					  </div>
					  <div class="grid">
						  <h3>Consectetur adipisicing elit</h3>
						  <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g2 copy.png" title="video-name" /></a>
						  <div class="time">
							  <span>2:10</span>
						  </div>
						  <div class="grid-info">
							  <div class="video-share">
								  <ul>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/likes.png" title="links" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/link.png" title="Link" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/views.png" title="Views" /></a></li>
								  </ul>
							  </div>
							  <div class="video-watch">
								  <a href="single.html">Watch Now</a>
							  </div>
							  <div class="clear"> </div>
							  <div class="lables">
								  <p>Labels:<a href="categories.html">Lorem</a></p>
							  </div>
						  </div>
					  </div>
					  <div class="grid">
						  <h3>Consectetur adipisicing elit</h3>
						  <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g4.jpg" title="video-name" /></a>
						  <div class="time">
							  <span>10:10</span>
						  </div>
						  <div class="grid-info">
							  <div class="video-share">
								  <ul>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/likes.png" title="links" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/link.png" title="Link" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/views.png" title="Views" /></a></li>
								  </ul>
							  </div>
							  <div class="video-watch">
								  <a href="single.html">Watch Now</a>
							  </div>
							  <div class="clear"> </div>
							  <div class="lables">
								  <p>Labels:<a href="categories.html">Lorem</a></p>
							  </div>
						  </div>
					  </div>
				  </div>
				  <div class="clear"> </div>
				  <div class="grids">
					  <div class="grid">
						  <h3>Consectetur adipisicing elit</h3>
						  <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g3.jpg" title="video-name" /></a>
						  <div class="time">
							  <span>2:30</span>
						  </div>
						  <div class="grid-info">
							  <div class="video-share">
								  <ul>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/likes.png" title="links" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/link.png" title="Link" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/views.png" title="Views" /></a></li>
								  </ul>
							  </div>
							  <div class="video-watch">
								  <a href="single.html">Watch Now</a>
							  </div>
							  <div class="clear"> </div>
							  <div class="lables">
								  <p>Labels:<a href="categories.html">Lorem</a></p>
							  </div>
						  </div>
					  </div>
					  <div class="grid">
						  <h3>Consectetur adipisicing elit</h3>
						  <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g5.jpg" title="video-name" /></a>
						  <div class="time">
							  <span>5:10</span>
						  </div>
						  <div class="grid-info">
							  <div class="video-share">
								  <ul>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/likes.png" title="links" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/link.png" title="Link" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/views.png" title="Views" /></a></li>
								  </ul>
							  </div>
							  <div class="video-watch">
								  <a href="single.html">Watch Now</a>
							  </div>
							  <div class="clear"> </div>
							  <div class="lables">
								  <p>Labels:<a href="categories.html">Lorem</a></p>
							  </div>
						  </div>
					  </div>
					  <div class="grid">
						  <h3>Consectetur adipisicing elit</h3>
						  <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g4.jpg" title="video-name" /></a>
						  <div class="time">
							  <span>2:00</span>
						  </div>
						  <div class="grid-info">
							  <div class="video-share">
								  <ul>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/likes.png" title="links" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/link.png" title="Link" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/views.png" title="Views" /></a></li>
								  </ul>
							  </div>
							  <div class="video-watch">
								  <a href="single.html">Watch Now</a>
							  </div>
							  <div class="clear"> </div>
							  <div class="lables">
								  <p>Labels:<a href="categories.html">Lorem</a></p>
							  </div>
						  </div>
					  </div>
				  </div>
				  <div class="clear"> </div>
				  <div class="grids">
					  <div class="grid">
						  <h3>Consectetur adipisicing elit</h3>
						  <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g6.jpg" title="video-name" /></a>
						  <div class="time">
							  <span>12:10</span>
						  </div>
						  <div class="grid-info">
							  <div class="video-share">
								  <ul>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/likes.png" title="links" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/link.png" title="Link" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/views.png" title="Views" /></a></li>
								  </ul>
							  </div>
							  <div class="video-watch">
								  <a href="single.html">Watch Now</a>
							  </div>
							  <div class="clear"> </div>
							  <div class="lables">
								  <p>Labels:<a href="categories.html">Lorem</a></p>
							  </div>
						  </div>
					  </div>
					  <div class="grid">
						  <h3>Consectetur adipisicing elit</h3>
						  <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g7.jpg" title="video-name" /></a>
						  <div class="time">
							  <span>20:10</span>
						  </div>
						  <div class="grid-info">
							  <div class="video-share">
								  <ul>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/likes.png" title="links" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/link.png" title="Link" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/views.png" title="Views" /></a></li>
								  </ul>
							  </div>
							  <div class="video-watch">
								  <a href="single.html">Watch Now</a>
							  </div>
							  <div class="clear"> </div>
							  <div class="lables">
								  <p>Labels:<a href="categories.html">Lorem</a></p>
							  </div>
						  </div>
					  </div>
					  <div class="grid">
						  <h3>Consectetur adipisicing elit</h3>
						  <a href="single.html"><img src="${pageContext.request.contextPath}/resources/images/g8.jpg" title="video-name" /></a>
						  <div class="time">
							  <span>2:50</span>
						  </div>
						  <div class="grid-info">
							  <div class="video-share">
								  <ul>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/likes.png" title="links" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/link.png" title="Link" /></a></li>
									  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/views.png" title="Views" /></a></li>
								  </ul>
							  </div>
							  <div class="video-watch">
								  <a href="single.html">Watch Now</a>
							  </div>
							  <div class="clear"> </div>
							  <div class="lables">
								  <p>Labels:<a href="categories.html">Lorem</a></p>
							  </div>
						  </div>
					  </div>
				  </div>
				  <div class="clear"> </div>
			  </div>
			  <div class="clear"> </div>
			  <ul class="dc_pagination dc_paginationA dc_paginationA03">
				  <li><a href="#" class="first">First</a></li>
				  <li><a href="#" class="previous">Previous</a></li>
				  <li><a href="#">1</a></li>
				  <li><a href="#">2</a></li>
				  <li><a href="#" class="current">3</a></li>
				  <li><a href="#">4</a></li>
				  <li><a href="#">5</a></li>
				  <li><a href="#" class="next">Next</a></li>
				  <li><a href="#" class="last">Last</a></li>

			  </ul>
			  <div class="clear"> </div>
		  </div>
		  <div class="right-content">
			  <div class="popular">
				  <h3>最受欢迎视频</h3>
				  <p><img src="${pageContext.request.contextPath}/resources/images/l1.png" title="likes" /> 10,000</p>
				  <div class="clear"> </div>
			  </div>
			  <div class="grid1">
				  <h3>Consectetur adipisicing elit</h3>
				  <a href="#"><img src="${pageContext.request.contextPath}/resources/images/g7.jpg" title="video-name" /></a>
				  <div class="time1">
					  <span>2:50</span>
				  </div>

				  <div class="grid-info">
					  <div class="video-share">
						  <ul>
							  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/likes.png" title="links" /></a></li>
							  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/link.png" title="Link" /></a></li>
							  <li><a href="#"><img src="${pageContext.request.contextPath}/resources/images/views.png" title="Views" /></a></li>
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
			  <div class="clear"> </div>
			  <div class="Recent-Vodeos">
				  <h3>观看最多视频</h3>
				  <div class="video1">
					  <img src="${pageContext.request.contextPath}/resources/images/r1.jpg" title="video2" />
					  <span>Lorem ipsum dolor sit amet,</span>
					  <p>s consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
					  <div class="clear"> </div>
				  </div>
				  <div class="video1 video2">
					  <img src="${pageContext.request.contextPath}/resources/images/r2.jpg" title="video2" />
					  <span>Lorem ipsum dolor sit amet,</span>
					  <p>s consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
					  <div class="clear"> </div>
				  </div>
				  <div class="r-all">
					  <a href="#">View All</a>
				  </div>
			  </div>
		  </div>
		  <div class="clear"> </div>
	  </div>
	  <div class="clear"> </div>
  </div>
  <!--尾部-->
  <%@ include file="WEB-INF/page/front-page/common/footer.jsp" %>

  </body>
</html>
