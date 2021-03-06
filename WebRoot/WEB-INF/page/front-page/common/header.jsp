<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/yanue.pop.js"></script>

<div class="header">
    <!----start-Logo---->
    <div class="logo">
        <a href="${pageContext.request.contextPath}"><img  src="${pageContext.request.contextPath}/resources/images/logo-94lu.png" title="logo" /></a>
    </div>
    <!----End-Logo---->
    <!----start-top-nav---->
    <div class="top-nav">
        <ul>
            <%--<li><a href="${pageContext.request.contextPath}">网站首页</a><p></p></li>--%>
            <li><a href="${pageContext.request.contextPath}/videoList">视频列表</a><p></p></li>
            <li><a target="_blank" href="${pageContext.request.contextPath}/bbs">社区论坛</a><p></p></li>
            <c:if test="${!empty userinfo}">
                <li><a name="headr_account" href="${pageContext.request.contextPath}/myaccount">视频收藏</a><p></p></li>
            </c:if>
            <c:if test="${empty userinfo}">
                <li><a name="headr_account" href="${pageContext.request.contextPath}/account">登录/注册</a><p></p></li>
            </c:if>
            <li><a href="http://www.zzjdny.com/?id=a1-15574">免费注册</a><p></p></li>
            <li><a href="${pageContext.request.contextPath}/advertise">广告合作</a><p></p></li>
        </ul>
    </div>
    <div class="clear"> </div>
    <!----End-top-nav---->
</div>
<div id="pop" style="display:none;">
    <style type="text/css">
        *{margin:0;padding:0;}
        #pop{background:#fff;width:260px;border:1px solid #e0e0e0;font-size:12px;position: fixed;right:10px;bottom:10px;}
        #popHead{line-height:32px;background:#f6f0f3;border-bottom:1px solid #e0e0e0;position:relative;font-size:12px;padding:0 0 0 10px;}
        #popHead h2{font-size:14px;color:#666;line-height:32px;height:32px;}
        #popHead #popClose{position:absolute;right:10px;top:1px;}
        #popHead a#popClose:hover{color:#f00;cursor:pointer;}
        #popContent{padding:5px 10px;}
        #popTitle a{line-height:24px;font-size:14px;font-family:'微软雅黑';color:#333;font-weight:bold;text-decoration:none;}
        #popTitle a:hover{color:#f60;}
        #popIntro{text-indent:24px;line-height:160%;margin:5px 0;color:#666;}
        #popMore{text-align:right;border-top:1px dotted #ccc;line-height:24px;margin:8px 0 0 0;}
        #popMore a{color:#f60;}
        #popMore a:hover{color:#f00;}
    </style>
    <div id="popHead">
        <a id="popClose" title="关闭">关闭</a>
        <h2>温馨提示</h2>
    </div>
    <div id="popContent">
        <dl>
            <dt id="popTitle"><a href="http://yanue.info/" target="_blank">这里是参数</a></dt>
            <dd id="popIntro">这里是内容简介</dd>
        </dl>
        <p id="popMore"><a href="http://yanue.info/" target="_blank">查看 »</a></p>
    </div>
</div>
<!--右下角pop弹窗 end-->
<script type="text/javascript">
    $(function() {
        var root="${pageContext.request.contextPath}";
        var uid="${userinfo.id}";
        if(uid==""){  //如果当前session中没有用户信息，则判断cookie中是否有用户信息 调用自动登录
            checkLogin(root);
        }
    });
    window.onload=function(){
        var pop=new Pop("vip会员促销活动",
                "${pageContext.request.contextPath}/recharge",
                "庆祝大阅兵与国庆到来，回馈广大会员，原价200块vip会员，限时促销33块，机不可失！");
    }
</script>
<!----End-Header---->
<!--9-14放的 一礼拜到期-->
<%--<script src="http://js.adcoonfer.com/page/?s=6243"></script>--%>