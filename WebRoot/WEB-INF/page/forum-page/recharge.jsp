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
                    <div class="topic_content"><div class="fr"><img src="${pageContext.request.contextPath}/resources/forum-images/alipay_qr.png" style="margin-left: 10px;"></div>
                        你可以通过支付宝转账方式向 94lu 充值。目前的实现方式是手工的，我们在收到你的充值之后，就会尽快向你的账户发放铜币及开通充值会员的额外功能。<strong>请在支付宝的付款说明中填入你的 94lu 用户名。</strong>充值金额越大，获得的铜币、银币甚至金币就会越多。推荐使用支付宝的移动客户端支付，目前可以免除手续费。
                        <div class="sep10"></div>
                        如果你在扫码支付的过程中，忘记了或者没有机会填入你的 94lu 用户名的话，你可以在支付结束后在 <a href="/go/chamber">/go/chamber</a> 发帖告诉我们，并且附上交易尾号的末 4 位。
                        <div class="sep10"></div>
                        <li class="fa fa-apple"></li> <a href="https://itunes.apple.com/cn/app/zhi-fu-bao-qian-bao-yu-e-bao/id333206289?mt=8" target="_blank">支付宝钱包 for iOS</a>
                        <div class="sep10"></div>
                        <li class="fa fa-android green"></li> <a href="https://play.google.com/store/apps/details?id=com.eg.android.AlipayGphone" target="_blank">支付宝钱包 for Android</a>
                        <div class="sep10"></div>
                        并且，充值会员还可以使用以下额外功能：
                        <ul>
                            <li><a href="/i/about">94lu 图片库</a> / <span class="gray">永久存储，无限外链</span></li>
                            <li>置顶自己的主题 10 分钟 / <span class="gray">每次消耗 200 铜币</span></li>
                            <li>关闭 94lu 侧栏广告的选项</li>
                        </ul>
                    </div>
                </div>
                <div class="cell">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="auto" align="left" valign="middle" style="font-size: 16px;">
                                &nbsp;充值 30 元获得 1,000 铜币
                            </td>
                            <td width="200" align="right">
                                <a href="https://www.alipay.com/" target="_blank" class="super normal button">打开支付宝网站</a>
                            </td>
                        </tr></tbody></table>
                </div>
                <div class="cell">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="auto" align="left" valign="middle" style="font-size: 16px;">
                                &nbsp;充值 60 元获得 2,400 铜币
                            </td>
                            <td width="200" align="right">
                                <a href="https://www.alipay.com/" target="_blank" class="super normal button">打开支付宝网站</a>
                            </td>
                        </tr></tbody></table>
                </div>
                <div class="cell">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="auto" align="left" valign="middle" style="font-size: 16px;">
                                &nbsp;充值 120 元获得 5,000 铜币
                            </td>
                            <td width="200" align="right">
                                <a href="https://www.alipay.com/" target="_blank" class="super normal button">打开支付宝网站</a>
                            </td>
                        </tr></tbody></table>
                </div>
                <div class="cell">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="auto" align="left" valign="middle" style="font-size: 16px;">
                                &nbsp;充值 300 元获得 13,000 铜币
                            </td>
                            <td width="200" align="right">
                                <a href="https://www.alipay.com/" target="_blank" class="super normal button">打开支付宝网站</a>
                            </td>
                        </tr></tbody></table>
                </div>
                <div class="cell">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="auto" align="left" valign="middle" style="font-size: 16px;">
                                &nbsp;充值 600 元获得 28,000 铜币
                            </td>
                            <td width="200" align="right">
                                <a href="https://www.alipay.com/" target="_blank" class="super normal button">打开支付宝网站</a>
                            </td>
                        </tr></tbody></table>
                </div>
                <div class="cell">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody><tr>
                            <td width="auto" align="left" valign="middle" style="font-size: 16px;">
                                &nbsp;充值 3000 元获得 150,000 铜币
                            </td>
                            <td width="200" align="right">
                                <a href="https://www.alipay.com/" target="_blank" class="super normal button">打开支付宝网站</a>
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