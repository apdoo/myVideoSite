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
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/94lu-icon.png">
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
            <!--注册-->
            <div class="col span_account">
                <div class="contact-form">
                    <h3>注册账号</h3>
                    <form  action="${pageContext.request.contextPath}/user/signup" method="post" id="signup_form" >
                        <div>
                            <span ><label>账号名(用户名以字母开头，可以包含数字、下划线，长度不小于5位)</label></span>
                            <span id="username_tip"></span>
                            <span><input tabindex="1" type="text" name="username" id="newusername" value="" maxlength="20"></span>
                        </div>
                        <div>
                            <span ><label>密码(密码可以包含字母，数字，区分大小写，长度不小于6位)</label></span>
                            <span id="password_tip"></span>
                            <span><input type="password" name="password" id="newpassword"  maxlength="20"></span>
                        </div>
                        <div>
                            <span><label>确定密码</label></span>
                            <span><input type="password" name="cpassword" id="cpassword"  maxlength="20"></span>
                        </div>
                        <div>
                            <span ><label>邮箱</label></span>
                            <span id="email_tip"></span>
                            <span><input type="text" name="email" id="email" maxlength="30"></span>
                        </div>
                        <div>
                            <img id="vimg"  src="${pageContext.request.contextPath}/validation/one" />
                        </div>
                        <div>
                            <span ><label>验证码</label></span>
                            <span id="vcode_tip"></span>
                            <span><input type="text" id="verification_code" name="vcode" maxlength="6"></span>
                        </div>
                        <div>
                            <span> <input id="saveCookieSign" type="checkbox" value="" />记住密码<input id="reg" type="button"   class="button blue" value="注 册" tabindex="5"></span>
                        </div>
                    </form>
                </div>
            </div>
             <!--登录-->
            <div class="col span_account">
                <div class="contact-form">
                    <h3>登录</h3>
                    <form id="login_form" method="post" action="${pageContext.request.contextPath}/user/login" >
                        <div>
                            <span><label>账号名</label></span>
                            <span><input name="username" type="text" id="login_username"  maxlength="20"></span>
                            <span id="login_username_tip"></span>
                        </div>
                        <div>
                            <span><label>密码</label></span>
                            <span><input name="password" type="password" id="login_password"  maxlength="20"></span>
                            <span id="login_password_tip"></span>
                        </div>
                        <div>
                            <span><label><input id="saveCookie" type="checkbox" value="" />记住密码</label>  <input id="login" type="button"  class="button blue" value="登 录" tabindex="5"></span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"> </div>
</div>
    <!--尾部-->
    <%@ include file="common/bottom.jsp" %>
<script type="text/javascript">
    /**
     * 点击切换验证码图片
     * */
    $("#vimg").click(function() {
        //带上一个参数，防止请求被缓存
        $("#vimg").attr("src","${pageContext.request.contextPath}/validation/one?random="+Math.random());
    });
</script>
</body>
</html>
