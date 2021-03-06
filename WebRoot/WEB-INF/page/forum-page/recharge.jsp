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

    <title>94lu社区-充值</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="就是撸,94lu">
    <meta http-equiv="description" content="就是撸">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/forum-images/94lu-icon.png">
    <link href="${pageContext.request.contextPath}/resources/forum-css/style.css" rel="stylesheet" type="text/css"  media="all" />
</head>
<body>
<%@ include file="common/header.jsp" %>
<div id="Wrapper">
    <div class="content">
        <div id="Leftbar"></div>
        <%@ include file="common/simply-right-content.jsp" %>
        <div id="Main"  >
            <div class="sep20"></div>
            <div class="box">
                <div class="cell"><a href="${pageContext.request.contextPath}/bbs">94lu社区</a> <span class="chevron">&nbsp;›&nbsp;</span> <a href="${pageContext.request.contextPath}/bbs/balance">账户余额</a> <span class="chevron">&nbsp;›&nbsp;</span> 支付宝充值</div>

                <div class="cell">
                    <div class="topic_content"><div class="fr"></div>
                        你可以通过支付宝转账方式向 94lu社区充值。请联系邮箱:94luvideo@gmail.com获得付款方式 目前的实现方式是手工的，我们在收到你的充值之后，就会尽快向你的账户发放金币及开通充值会员的额外功能。<strong>请在支付宝的付款说明中填入你的 94lu 用户名。</strong>充值金额越大，获得的金币就会越多。推荐使用支付宝的移动客户端支付，目前可以免除手续费。
                        <div class="sep10"></div>
                        如果你在扫码支付的过程中，忘记了或者没有机会填入你的 94lu社区 用户名的话，你可以在支付结束后在 <a href="${pageContext.request.contextPath}/bbs?tab=1">交流区的置顶主题</a> 发表回复告诉我们，并且附上交易尾号的末 4 位。
                        <div class="sep10"></div>
                        目前支持开通vip会员充值。vip会员具有如下特权：
                        <ul>
                            <li>观看 视频 无限制 / <span class="gray">普通会员每次消耗1金币</span></li>
                            <li>下载 视频/种子 无限制 / <span class="gray">普通会员每次下载消耗相应的金币</span></li>
                            <li>加入专属的vip服务QQ群</li>
                            <li>优先获得94lu手机客户端的内测机会</li>
                        </ul>
                    </div>
                </div>
                   <div class="cell">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="auto" align="left" valign="middle" style="font-size: 16px;">
                                &nbsp;充值 10 元获得 300 金币
                            </td>
                            <td width="200" align="right">
                            </td>
                        </tr></tbody></table>
                </div>
                <div class="cell">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="auto" align="left" valign="middle" style="font-size: 16px;">
                                &nbsp;充值 30 元获得 1000 金币
                            </td>
                            <td width="200" align="right">
                            </td>
                        </tr></tbody></table>
                </div>
                <div class="cell">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="auto" align="left" valign="middle" style="font-size: 16px;">
                                &nbsp;充值 60 元获得 2500 金币
                            </td>
                            <td width="200" align="right">
                            </td>
                        </tr></tbody></table>
                </div>
                <div class="cell">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="auto" align="left" valign="middle" style="font-size: 16px;">
                                &nbsp;充值 100 元获得 4500 金币
                            </td>
                            <td width="200" align="right">
                            </td>
                        </tr></tbody></table>
                </div>
                <div class="cell">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="auto" align="left" valign="middle" style="font-size: 16px;">
                                &nbsp;充值 200 元获得 永久vip会员<!--s>200元</s--><!--span style="color: red">(限时促销33元)</span 获得 永久vip会员。已经充值购买金币的，可以联系邮箱94luvideo@gmail.com免费转换为vip会员-->
                            </td>
                            <td width="200" align="right">
                            </td>
                        </tr></tbody></table>
                </div>

                <div class="cell">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="auto" align="left" valign="middle" style="font-size: 16px;">
                                &nbsp;充值 500 元获得 永久vip会员+搜索采集器(视频/种子/图片)94lu官方版本永久使用和更新
                            </td>
                            <td width="200" align="right">
                            </td>
                        </tr></tbody></table>
                </div>


            </div>
        </div>
    </div>
    <div class="c"></div>
    <div class="sep20"></div>
</div>
<%@ include file="common/bottom.jsp" %>
</body>
</html>