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

                <div class="company_address">
                    <h3>刊登广告</h3>
                    <p>广告联系请发到Email: <span>info@mycompany.com</span></p>
                    <p>标题请注明广告联系，请带上广告网址。不写明者将不予回复。广告详情请查阅<a href="${pageContext.request.contextPath}/ad"><span>广告联络详情</span></a></p>
                    <p> 欢迎关注我们的微博与微信</p>
                    <p>新浪微博:<span>Facebook</span>  微信公众号:<span>Twitter</span></p>
                </div>
            </div>
            <div class="col span_2_of_3">
                <div class="contact-form">
                    <h3>留言板</h3>
                    <form  action="${pageContext.request.contextPath}/user/signup" method="post" id="contact_form">
                        <div>
                            <span><label>主题</label></span>
                            <span><input type="text" value="" maxlength="30"></span>
                        </div>
                        <div>
                            <span><label>您的联系方式(电子邮箱/QQ/手机)</label></span>
                            <span><input type="text" value="" maxlength="30"></span>
                        </div>
                        <div>
                            <span><label>内容</label></span>
                            <span><textarea > </textarea></span>
                        </div>
                        <div>
                            <%--<span><input type="submit" value="提交"></span>--%>
                            <span>    <input type="button" id="contact_submit" class="button blue" value="提 交 " tabindex="5"></span>
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
