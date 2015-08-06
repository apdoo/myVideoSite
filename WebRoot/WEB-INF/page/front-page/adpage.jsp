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
        <div class="ad-sidebar">
        </div>
        <div class="admin-content">
            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">广告详情</strong> </div>
            </div>
            <hr class="ad-hr">
            <div class="am-g">
                <div class="am-u-sm-12 am-u-sm-centered">
                    <h2 class="ad-h">广告联系请发到　hh，请注意本站不通过任何代理接手广告，请直接联系邮箱。</h2>
                    <p class="ad-p">老客户请注意，续费前请首先Email确认。</p>
                    <p class="ad-p">标题请注明广告联系，必带上广告网址。不写明者将不予回复。</p>
                    <hr class="ad-hr">
                    <h2 class="ad-h">94LU网站是一直致力发展提供各类在线视频的网站交流环境网站。</h2>
                    <p class="ad-p">以下是网站广告大小和参数和广告投放说明，请详细阅读</p>
                    <p class="ad-p">    1、任何做假欺骗木马病毒插件捆绑类一经发现,
                        任何借用本站声名或任何字样相关者一经发现马上删除。
                        本站有权利去除广告并不给予退款
                        广告不提供试放，不承诺多少次点击。</p>
                    <p class="ad-p">2、所有广告图片类要由投放方自己制作。(gif.jpg不接受png)，请按照报价规格自行制作。
                        广告图片必须通过我们的审核才可投放 ( 如文件大小以及图片质量 )
                        图片颜色变化频率不能过快，以免影响浏览者视觉！ 因本站服务器使用缓存系统和数目多，所有广告付款成功后最迟在24小时内会更新显示广告。服务器默认自动更新缓存时间为18小时。</p>
                    <p class="ad-p">3、广告续费请提前三天付款!未能及时续费本站将有权利预定给其他广告商！
                        现有的广告本站有权预定给其它广告商或个人，如果已和本站口头约定要投放某个广告位，
                        但没有付款，那我们也有权预定给其它广告商或个人！</p>
                    <p class="ad-p">感谢支持！感谢有你！</p>
                    <hr class="ad-hr">
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
