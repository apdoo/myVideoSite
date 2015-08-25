<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="Rightbar">
    <div class="sep20"></div>
    <c:if test="${userinfo.id==null}">
        <div class="box">
            <div class="cell">
                <strong>94lu社区</strong>
                <div class="sep5"></div>
                <span class="fade">94lu 是一个关于分享和探索的地方</span>
            </div>
            <div class="inner">
                <div class="sep5"></div>
                <div align="center"><a href="${pageContext.request.contextPath}/account" class="super normal button">现在注册</a>
                    <div class="sep5"></div>
                    <div class="sep10"></div>
                    已注册用户请 &nbsp;<a href="${pageContext.request.contextPath}/account">登录</a></div>
            </div>
        </div>
    </c:if>
    <c:if test="${userinfo.id!=null}">
        <div class="box">
            <div class="cell">
                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tbody><tr>
                        <td width="48" valign="top"><a href="${pageContext.request.contextPath}/bbs/member/${userinfo.username}">
                            <c:if test="${userinfo.temp=='0'}">
                                <img src="${pageContext.request.contextPath}/resources/forum-images/default_avatar.png" class="avatar" border="0" align="default" style="max-width: 48px; max-height: 48px;">
                            </c:if>
                            <c:if test="${userinfo.temp!='0'}">
                                <img src="${avatar_img_path}${userinfo.temp}" class="avatar" border="0" align="default" style="max-width: 48px; max-height: 48px;">
                            </c:if>
                        </a></td>
                        <td width="10" valign="top"></td>
                        <td width="auto" align="left"><span class="bigger"><a href="${pageContext.request.contextPath}/bbs/member/${userinfo.username}">${userinfo.username}</a></span>
                        </td>
                    </tr>
                    </tbody></table>
                <div class="sep10"></div>
                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tbody>
                    <tr>
                        <td width="50%" align="center"><a href="${pageContext.request.contextPath}/bbs/posts" class="dark" style="display: block;"><span class="bigger">${user_post_count}</span><div class="sep3"></div><span class="fade">发帖纪录</span></a></td>
                        <td width="50%" style="border-left: 1px solid rgba(100, 100, 100, 0.4); border-right: 0px solid rgba(100, 100, 100, 0.4);" align="center"><a href="${pageContext.request.contextPath}/bbs/topics" class="dark" style="display: block;"><span class="bigger">${user_topical_count}</span><div class="sep3"></div><span class="fade">主题收藏</span></a></td>
                    </tr>
                    </tbody></table>
            </div>
            <div class="cell" style="padding: 5px;">
                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tbody><tr>
                        <td width="32"><a href="${pageContext.request.contextPath}/bbs/newTopic"><img src="${pageContext.request.contextPath}/resources/forum-images/flat_compose.png" width="32" border="0"></a></td>
                        <td width="10"></td>
                        <td width="auto" valign="middle" align="left"><a href="${pageContext.request.contextPath}/bbs/newTopic">创作新主题</a></td>
                    </tr>
                    </tbody></table>
            </div>
            <div class="inner"><div class="fr" id="money"><a href="${pageContext.request.contextPath}/bbs/balance" class="balance_area" style="">${userinfo.points} <img src="${pageContext.request.contextPath}/resources/forum-images/gold.png" alt="S" align="absmiddle" border="0" style="padding-bottom: 2px;"> </a></div>
                级别:   <c:if test="${userinfo.type==0}">
                            会员
                        </c:if>
                        <c:if test="${userinfo.type==1}">
                            vip会员
                        </c:if>
                        <c:if test="${userinfo.type==5}">
                            管理员
                        </c:if>
            </div>
            <div class="cell" style="background-color: #f9f9f9; padding: 10px 10px 10px 20px;"></div>
        </div>
        <div class="sep20"></div>
        <div class="box"><div class="inner"><li class="fa fa-gift" style="color: #f90;"></li> &nbsp;<a href="${pageContext.request.contextPath}/bbs/daily">领取今日的登录奖励</a></div></div>
    </c:if>
    <div class="sep20"></div>
    <div class="box">
        <div class="cell"><span class="fade">社区公告</span></div>
        <div class="cell">
           想要查看主题或者发表主题(回复)，请先登录账号
        </div>
    </div>

    <div class="sep20"></div>
    <div class="box">
        <div class="cell"><span class="fade">社区运行状况</span></div>
        <div class="cell">
            <table cellpadding="5" cellspacing="0" border="0" width="100%">
                <tbody><tr>
                    <td width="50" align="right"><span class="gray">会员</span></td>
                    <td width="auto" align="left"><strong>${total_user_count}</strong></td>
                </tr>
                <tr>
                    <td width="50" align="right"><span class="gray">主题</span></td>
                    <td width="auto" align="left"><strong>${total_topical_count}</strong></td>
                </tr>
                <tr>
                    <td width="50" align="right"><span class="gray">回复</span></td>
                    <td width="auto" align="left"><strong>${total_topicalreplay_count}</strong></td>
                </tr>
                </tbody></table>
        </div>
    </div>
    <div class="sep20"></div>
</div>