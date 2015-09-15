<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/forum-css/style.css">
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/forum-css/desktop.css">
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/forum-css/basic.css">
<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/forum-css/highlight.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/forum-css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/forum-css/select2.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/forum-css/jquery.textcomplete.css" rel="stylesheet">
<div id="Top">
    <div class="content">
        <div style="padding-top: 6px;">
                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tbody><tr>
                        <td width="110" align="left"><a href="${pageContext.request.contextPath}/bbs"   title="way to explore"><img src="${pageContext.request.contextPath}/resources/images/logo-94lu.png" border="0" align="default" alt="94lu" width="94" height="35"></a></td>
                        <c:if test="${userinfo.id==null}">
                            <td width="570" align="right" style="padding-top: 2px;"><a href="${pageContext.request.contextPath}/videoList" class="top">视频站首页</a>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/bbs" class="top">社区首页</a>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/bbs/member/${userinfo.username}" class="top">${userinfo.username}</a>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/account" class="top">注册</a>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/account" class="top">登录</a></td>
                        </c:if>
                        <c:if test="${userinfo.id!=null}">
                            <td width="570" align="right" style="padding-top: 2px;"><a href="${pageContext.request.contextPath}/videoList" class="top">视频站首页</a>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/bbs" class="top">社区首页</a>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/bbs/member/${userinfo.username}" class="top">${userinfo.username}</a>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/bbs/settings" class="top">设置</a>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/loginout?from=bbs" onclick="if (confirm('确定要从 94lu 登出？')) { location.href= '${pageContext.request.contextPath}/bbs'; }" class="top">登出</a></td>
                        </c:if>

                    </tr>
                    </tbody>
                </table>

        </div>
    </div>
</div>