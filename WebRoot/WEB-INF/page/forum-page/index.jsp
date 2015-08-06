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
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/forum-images/94lu-icon.png">
    <link href="${pageContext.request.contextPath}/resources/forum-css/style.css" rel="stylesheet" type="text/css"  media="all" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/forum-css/style.css" type="text/css" media="screen" />
    <!--[if lte IE 7]><link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/forum-css/ie_fixes.css" media="screen" /><![endif]-->
    -->
</head>

<body>
<div id="layout_wrapper">
    <div id="layout_edgetop"></div>
    <div id="layout_container">
        <div id="site_title">
            <h1 class="left"><a href="#">Website name</a></h1>
            <h2 class="right">Your slogan or perhaps a short introductional text</h2>
            <div class="clearer">&nbsp;</div>
        </div>
        <div id="top_separator"></div>
        <div id="navigation">
            <div id="tabs">
                <ul>
                    <li class="current_page_item"><a href="index.html"><span>Posts page</span></a></li>
                    <li><a href="comments.html"><span>Post comments</span></a></li>
                    <li><a href="page.html"><span>Sample test page</span></a></li>
                    <li><a href="archives.html"><span>Archives</span></a></li>
                    <li><a href="empty.html"><span>Empty page</span></a></li>
                </ul>
                <div class="clearer">&nbsp;</div>
            </div>
        </div>
        <div class="spacer h5"></div>
        <div id="main">

            <div class="left" id="main_left">

                <div id="main_left_content">

                    <div class="post">

                        <div class="post_title">
                            <h1 class="left"><a href="#">Porttitor posuere</a></h1>
                            <div class="post_date right">April 13th, 2008</div>
                            <div class="clearer">&nbsp;</div>
                        </div>

                        <div class="post_body">

                            <p>In hac habitasse platea dictumst. Duis porttitor. Sed vulputate elementum nisl. Vivamus et mi at arcu mattis iaculis. Nullam posuere tristique tortor. In bibendum. Aenean ornare, <a href="index.html">nunc eget pretium</a> porttitor, sem est pretium leo, non euismod nulla dui non diam. Pellentesque dictum faucibus leo. Vestibulum ac ante. Sed in est.</p>

                            <blockquote><p>Sed sodales nisl sit amet augue. Donec ultrices, augue ullamcorper posuere laoreet, turpis massa tristique justo, sed egestas metus magna sed purus.</p></blockquote>

                            <h2>Sollicitudin</h2>

                            <p>Aliquam risus justo, mollis in, laoreet a, consectetuer nec, risus. Nunc blandit sodales lacus. Nam luctus semper mi. In eu diam.</p>

                            <p>Fusce porta pede nec eros. Maecenas ipsum sem, interdum non, aliquam vitae, interdum nec, metus. Maecenas ornare lobortis risus. Etiam placerat varius mauris. Maecenas viverra. Sed feugiat. Donec mattis <a href="index.html">quam aliquam</a> risus. Nulla non felis sollicitudin urna blandit egestas. Integer et libero varius pede tristique ultricies. Cras nisl. Proin quis massa semper felis euismod ultricies.</p>

                            <div class="post_metadata">
                                <div class="content">
                                    <div class="left">
                                        Posted in <a href="#">Maecenas</a>, tagged: <a href="#">arcu</a>, <a href="#">eget</a>, <a href="#">pretium</a>, <a href="#">porttitor</a>
                                    </div>
                                    <div class="right">
                                        <span class="comment"><a href="#">4 Comments</a></span>
                                    </div>
                                    <div class="clearer">&nbsp;</div>
                                </div>
                            </div>

                        </div>

                        <div class="post_bottom"></div>

                    </div>

                    <div class="post">

                        <div class="post_title">
                            <h1 class="left"><a href="#">Adipiscing</a></h1>
                            <div class="post_date right">March 10th, 2008</div>
                            <div class="clearer">&nbsp;</div>
                        </div>

                        <div class="post_body">

                            <p>Aliquam risus justo, mollis in, laoreet a, consectetuer nec, risus. Nunc blandit sodales lacus. Nam luctus semper mi.</p>

                            <ul>
                                <li>Tristique</li>
                                <li>Aenean</li>
                                <li>Pretium</li>
                            </ul>

                            <p>In hac habitasse platea dictumst. Duis porttitor. Sed vulputate elementum nisl. Vivamus et mi at arcu mattis iaculis. Nullam posuere tristique tortor. In bibendum. Aenean ornare, nunc eget pretium porttitor, sem est pretium leo, non euismod nulla dui non diam. Pellentesque dictum faucibus leo. Vestibulum ac ante. Sed in est.</p>

                            <div class="post_metadata">
                                <div class="content">
                                    <div class="left">
                                        Posted in <a href="#">Vestibulum</a>, tagged: <a href="#">diam</a>, <a href="#">vulputate</a>, <a href="#">platea</a>
                                    </div>
                                    <div class="right">
                                        <span class="comment"><a href="#">11 Comments</a></span>
                                    </div>
                                    <div class="clearer">&nbsp;</div>
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="pagenavigation">
                        <div class="pagenav">
                            <div class="left"><a href="#">« Older Entries</a></div>
                            <div class="right"></div>
                            <div class="clearer">&nbsp;</div>
                        </div>
                        <div class="pagenav_bottom"></div>
                    </div>

                </div>

            </div>

            <div class="right" id="main_right">

                <div id="sidebar">

                    <div class="box">
                        <div class="box_title">Search</div>
                        <div class="box_body">
                            <form method="get" id="searchform" action="#">
                                <div>
                                    <table class="search">
                                        <tbody><tr>
                                            <td><input type="text" value="" name="s" id="s"></td>
                                            <td style="padding-left: 10px"><input type="image" src="img/button_go.gif"></td>
                                        </tr>
                                        </tbody></table>
                                </div>
                            </form>
                        </div>
                        <div class="box_bottom"></div>
                    </div>

                    <div class="box">
                        <div class="box_title">Archives</div>
                        <div class="box_body">
                            <ul>
                                <li><a href="#">December 2007</a> (5)</li>
                                <li><a href="#">June 2007</a> (2)</li>
                                <li><a href="#">May 2007</a> (6)</li>
                                <li><a href="#">March 2007</a> (12)</li>
                                <li><a href="#">February 2007</a> (8)</li>
                                <li><a href="#">May 2007</a> (10)</li>
                            </ul>
                        </div>
                        <div class="box_bottom"></div>
                    </div>

                    <div class="box">
                        <div class="box_title">Categories</div>
                        <div class="box_body">
                            <ul>
                                <li><a href="#">Single Column</a> (5)</li>
                                <li><a href="#">Three Columns</a> (2)</li>
                                <li><a href="#">Two Columns</a> (14)</li>
                            </ul>
                        </div>
                        <div class="box_bottom"></div>
                    </div>

                    <div class="box">
                        <div class="box_title">Links</div>
                        <div class="box_body">
                            <ul>
                                <li><a href="http://www.cssmoban.com/category/blogger-templates/">Blogger Templates</a></li>
                                <li><a href="http://www.cssmoban.com/category/joomla-templates/">Joomla Templates</a></li>
                                <li><a href="http://www.cssmoban.com/professional-templates/">Professional Templates</a></li>
                                <li><a href="http://www.cssmoban.com/category/website-templates/">Website Templates</a></li>
                                <li><a href="http://www.cssmoban.com/category/wordpress-themes/">Wordpress Themes</a></li>
                            </ul>
                        </div>
                        <div class="box_bottom"></div>
                    </div>

                    <div class="box">
                        <div class="box_title">Textbox</div>
                        <div class="box_body p10">
                            A box with some text.
                        </div>
                        <div class="box_bottom"></div>
                    </div>

                </div>
            </div>

            <div class="clearer">&nbsp;</div>

        </div>

        <div id="footer">

            <div class="left">© 2008 Website name</div>

            <div class="right"><a href="http://www.cssmoban.com/">Website template</a> from <a href="http://cssmoban.com/">cssMoban.com</a></div>

            <div class="clearer">&nbsp;</div>

        </div>

    </div>
    <div id="layout_edgebottom"></div>
</div>
</body>
</html>