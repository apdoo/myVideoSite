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

    <title>94lu社区-个人设置</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="就是撸,94lu">
    <meta http-equiv="description" content="就是撸">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/forum-images/94lu-icon.png">
    <link href="${pageContext.request.contextPath}/resources/forum-css/style.css" rel="stylesheet" type="text/css"  media="all" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
</head>
<body>
<%@ include file="common/header.jsp" %>
<div id="Wrapper">
    <div class="content">
        <div id="Leftbar"></div>
        <%@ include file="common/right-content.jsp" %>
        <div id="Main"  >
            <div class="sep20"></div>
            <div class="box">
                <div class="cell"><div class="fr"></div>头像上传</div>
                <div class="cell">
                    <table cellpadding="5" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="120" align="right">当前头像</td>
                            <c:if test="${userinfo.temp=='0'}">
                                <td width="auto" align="left"><img src="${pageContext.request.contextPath}/resources/forum-images/default_avatar.png" class="avatar" border="0" align="default"></td>
                            </c:if>
                            <c:if test="${userinfo.temp!='0'}">
                                <td width="auto" align="left"><img src="${avatar_img_path}${userinfo.temp}" class="avatar" border="0" align="default"></td>
                            </c:if>
                        </tr>
                        <tr>
                            <td width="120" align="right"></td>
                            <td width="auto" align="left"><input type="hidden" value="24474" name="once"><input type="button" onclick="location.href = '${pageContext.request.contextPath}/bbs/settings/avatar';" class="super normal button" value="上传新头像"></td>
                        </tr>
                        </tbody></table>
                </div>
                <div class="inner">
                    关于头像的规则
                    <ul>
                        <li>94lu社区 禁止使用任何低俗或者敏感图片作为头像</li>
                        <li>如果你是男的，请不要用女人的照片作为头像，这样可能会对其他会员产生误导</li>
                    </ul>
                </div>
            </div>
            <div class="sep20"></div>
            <div class="box">
                <div class="cell"><div class="fr"><span class="fade">如果你不打算更改密码，请留空以下区域</span></div>更改密码</div>
               <c:if test="${msg!=null&&msg!='success'}">
                   <div class="problem">更改密码的过程中遇到一些问题：<ul><li>${msg}</li></ul></div>
               </c:if>
                <div class="inner">
                    <form onsubmit="return change_password_check()" method="post" action="${pageContext.request.contextPath}/user/changePassword">
                        <table cellpadding="5" cellspacing="0" border="0" width="100%">
                            <tbody>
                            <tr>
                                <td width="120" align="right">当前密码</td>
                                <td width="auto" align="left"><input type="password" class="sl" id="current_password" name="vcode" value=""></td>
                            </tr>
                            <tr>
                                <td width="120" align="right">新密码</td>
                                <td width="auto" align="left"><input type="password" class="sl" id="new_password" name="password" value="">&nbsp;<span id="current_password_tip" style="color: red"></span></td>
                            </tr>
                            <tr>
                                <td width="120" align="right">再次输入新密码</td>
                                <td width="auto" align="left"><input type="password" class="sl" id="c_password" name="cpassword" value="">&nbsp;<span id="cp_password_tip" style="color: red"></span></td>
                            </tr>
                            <tr>
                                <td width="120" align="right"></td>
                                <td width="auto" align="left"><input type="hidden" value="24474" name="once"><input type="submit" class="super normal button" value="更改密码"></td>
                            </tr>
                            </tbody></table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="c"></div>
    <div class="sep20"></div>
</div>
<%@ include file="common/bottom.jsp" %>
<script type="text/javascript">
    /**
    *修改密码检查
     */
    function change_password_check(){
        var password=$("#new_password").val();//新密码
        var oldpassword=$("#current_password").val();//旧密码
        var cpassword=$("#c_password").val();//确认密码
      if(!checkPwd(password)){
            $("#current_password_tip").text("新密码不符合密码规则！");
            return false;
        }else if(cpassword!=password){
          $("#current_password_tip").text("");
          $("#cp_password_tip").text("两次输入的密码不一致！");
            return false;
        }
        return true;
    }
</script>
</body>
</html>