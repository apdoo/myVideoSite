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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/button.css">
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
        <div class="section group">
            <div class="col span_1_of_3">
                <div class="contact_info">
                    <h3>Find Us Here</h3>
                    <div class="map">
                    </div>
                </div>
                <div class="company_address">
                    <h3>Company Information :</h3>
                    <p>500 Lorem Ipsum Dolor Sit,</p>
                    <p>22-56-2-9 Sit Amet, Lorem,</p>
                    <p>USA</p>
                    <p>Phone:(00) 222 666 444</p>
                    <p>Fax: (000) 000 00 00 0</p>
                    <p>Email: <span>info@mycompany.com</span></p>
                    <p>Follow on: <span>Facebook</span>, <span>Twitter</span></p>
                </div>
            </div>
            <div class="col span_2_of_3">
                <div class="contact-form">
                    <h3>留言板</h3>
                    <form>
                        <div>
                            <span><label>NAME</label></span>
                            <span><input type="text" value=""></span>
                        </div>
                        <div>
                            <span><label>E-MAIL</label></span>
                            <span><input type="text" value=""></span>
                        </div>
                        <div>
                            <span><label>MOBILE.NO</label></span>
                            <span><input type="text" value=""></span>
                        </div>
                        <div>
                            <span><label>内容</label></span>
                            <span><textarea> </textarea></span>
                        </div>
                        <div>
                            <%--<span><input type="submit" value="提交"></span>--%>
                            <span>    <input type="button"  class="button blue" value="注 册" tabindex="5"></span>
                        </div>
                    </form>
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
