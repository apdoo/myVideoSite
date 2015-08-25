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

    <title>94lu社区-新主题</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="就是撸,94lu">
    <meta http-equiv="description" content="就是撸">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/forum-images/94lu-icon.png">
</head>
<body>
<%@ include file="common/header.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xheditor/xheditor-1.2.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xheditor/zh-cn.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/selectordie/selectordie.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/selectordie/selectordie_theme_03.css">
<script src="${pageContext.request.contextPath}/js/selectordie/selectordie.min.js"></script>

<div id="Wrapper">
    <div class="content">

        <div id="Leftbar"></div>
        <div id="Rightbar">
            <div class="sep20"></div>

            <div class="box">
                <div class="cell">发帖提示</div>
                <div class="inner">
                    <ul style="margin-top: 0px;">
                        <li><span class="f13">主题标题</span><div class="sep10"></div>
                            请在标题中描述内容要点。如果一件事情在标题的长度内就已经可以说清楚，那就没有必要写正文了。
                            <div class="sep10"></div>
                        </li>
                        <li><div class="fr" style="margin-top: -5px; margin-right: 5px;"> </div><span class="f13">正文</span><div class="sep10"></div>
                            可以在正文中为你要发布的主题添加更多细节
                        </li>
                        <li><span class="f13">选择对应主题区</span><div class="sep10"></div>
                            在最后，请为你的主题选择一个主题区。恰当的归类会让你发布的信息更加有用。
                        </li>
                    </ul>
                </div>
            </div>
            <div class="sep20"></div>
            <div class="box">
                <div class="cell">社区指导原则</div>
                <div class="inner">
                    <ul style="margin-top: 0px;">
                        <li><span class="f13">尊重原创</span><div class="sep10"></div>
                            请不要在94Lu上发布广告或者攻击反动信息。
                            <div class="sep10"></div>
                        </li>
                        <li><span class="f13">友好互助</span><div class="sep10"></div>
                            保持对陌生人的友善。用知识去帮助别人。
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <div id="Main">
            <div class="sep20"></div>

            <div class="box" id="box">
                <div class="cell"><a href="${pageContext.request.contextPath}/bbs">94lu</a> <span class="chevron">&nbsp;›&nbsp;</span> 创作新主题</div>
                <form onsubmit="return newTopic_form_check()" method="post" action="${pageContext.request.contextPath}/topical/publishTopic" id="compose">
                    <div class="cell"><div class="fr fade" ></div>
                        主题标题
                    </div>
                    <div class="cell" style="padding: 0px; background-color: #fff;"><textarea class="msl" rows="1" maxlength="120" id="topic_title"  name="title" autofocus="autofocus" placeholder="请输入主题标题，如果标题能够表达完整内容，则正文可以为空"></textarea></div>
                    <div class="cell"><div class="fr fade" ></div>
                        正文
                    </div>
                    <textarea id="topic_content" name="content" class="xheditor-simple" rows="12" cols="80" maxlength="3000" style="width: 100%">
	                </textarea>
                    <div class="cell">
                        <div class="select">
                            选择分区:
                            <select class="myselect" name="tags">
                                <option value="交流区">交流区</option>
                                <option value="建议区">建议区</option>
                            </select>
                        </div>
                    </div>

                <div class="cell"><div class="fr"><span id="error_message"></span> &nbsp; <input type="submit" value="发布主题" class="super normal button"  ></div>
                    <button  class="super normal button" onclick="history.go(-1) ;return false;">取消</button>
                </div>
                </form>
            </div>

        </div>

    </div>
    <div class="c"></div>
    <div class="sep20"></div>
</div>
<script type="text/javascript">
    $(function(){
        $('select').selectOrDie();//下拉框初始化
    });
    /**
    * 发布主题的check
     */
    function newTopic_form_check(){
            var title=$("#topic_title").val();
            var content=$("#topic_content").val();
        if(title=="") {
            alert("主题标题不能为空！");
            return false;
        }
        if(content=="") {
            alert("主题内容不能为空");
            return false;
        }
    }
</script>
<%@ include file="common/bottom.jsp" %>
</body>
</html>