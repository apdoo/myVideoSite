<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>94lu社区-个人中心</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="就是撸,94lu">
    <meta http-equiv="description" content="就是撸">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/forum-images/94lu-icon.png">
    <link href="${pageContext.request.contextPath}/resources/forum-css/style.css" rel="stylesheet" type="text/css"  media="all" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
</head>
<body>
用户名: <input type="text" id="username" value="" /> <input type="button"  onclick="userInfoWatch()" value="用户信息查询"/> <input type="button" id="addVip_button" onclick="addVip()" value="添加vip"/> <input type="button" id="removeVip_button" onclick="removeVip()" value="移除vip"/> <input type="button"  id="banUser_button" onclick="banUser()" value="用户禁止"/><br/><br/>
用户名: <input type="text" id="gold_username" value="" />  金币:<input type="text"   id="gold" value="" /> <input id="gold_button" type="button" onclick="addGold()" value="金币操作"/><br/><br/>
帖子tid: <input type="text" id="tid" value="" /> 置顶排序: <input type="text" id="order" value="1" /> <input type="button"  id="topicalTop_button" onclick="topicalTop('1')" value="帖子置顶"/> <input type="button"  id="topicalTop_cancel_button" onclick="topicalTop('0')" value="取消置顶"/>    <input type="button"  id="topicalRemove_button" onclick="topicalRemove()" value="帖子删除"/> <br/><br/>
<input type="button"  id="synchroVideoToday_button" onclick="synchroVideoToday()" value="同步今天采集的视频"/>
<input type="button"  id="synchroVideo_button" onclick="synchroVideo()" value="同步所有的视频"/>
<div id="tips">
</div>
<script type="text/javascript">

    $(function() {

    });
    /**
    * 会员级别调整
    * @param username
    * @param type
     */
    function vip(username,type){
        $.ajax({
            type : "POST",
            url : "${pageContext.request.contextPath}/admin94lu/vip",
            dataType:"json",
            data:{
                username:username,
                type:type
            },
            success : function(data) {
                $("#tips").html(data.msg);
            },
            //请求出错的处理
            error:function(){
            }
        });
    }
    /**
    * 会员金币调整
    * @param username
    * @param gold
     */
    function goldu(username,gold){
        $.ajax({
            type : "POST",
            url : "${pageContext.request.contextPath}/admin94lu/gold",
            dataType:"json",
            data:{
                username:username,
                gold:gold
            },
            success : function(data) {
                $("#tips").html(data.msg);
            },
            //请求出错的处理
            error:function(){
            }
        });
    }
    /**
     * 帖子操作删除
     * */
    function topicalR(tid){
        $.ajax({
            type : "POST",
            url : "${pageContext.request.contextPath}/admin94lu/topicalRemove",
            dataType:"json",
            data:{
                tid:tid
            },
            success : function(data) {
                $("#tips").html(data.msg);
            },
            //请求出错的处理
            error:function(){
            }
        });
    }
    /**
     * 帖子置顶
     * */
    function topicalT(tid,type,order){
        $.ajax({
            type : "POST",
            url : "${pageContext.request.contextPath}/admin94lu/topicalTop",
            dataType:"json",
            data:{
                tid:tid,
                type:type,
                order:order
            },
            success : function(data) {
                $("#tips").html(data.msg);
            },
            //请求出错的处理
            error:function(){
            }
        });
    }
    /**
    * 增加vip会员
     */
    function addVip(){
        var vip_username=$("#username").val();
        if (confirm('确定要要增加？')){
            vip(vip_username,1);//增加vip
        }

    }
    /**
    * 移除vip会员
     */
    function removeVip(){
        var remove_username=$("#username").val();
        if (confirm('确定要要移除？')){
            vip(remove_username,0);
        }

    }
    /**
    * 金币增加与减少
     */
    function addGold(){
        var gold_username=$("#gold_username").val();
        var gold=$("#gold").val();
        if (confirm('确定要要操作？')){
            goldu(gold_username,gold);
        }

    }
    /**
    * 用户禁止登录
     */
    function banUser(){
        var ban_username=$("#username").val();
        if (confirm('确定要要禁止？')){
            vip(ban_username,-1);//增加vip
        }

    }
    /**
     * 用户信息查询
     * */
    function userInfoWatch(){
        var username=$("#username").val();
        $.ajax({
            type : "POST",
            url : "${pageContext.request.contextPath}/admin94lu/userInfoWatch",
            dataType:"json",
            data:{
                username:username
            },
            success : function(data) {
                $("#tips").html(data.msg);
            },
            //请求出错的处理
            error:function(){
            }
        });

    }
    /**
    *帖子移除
     */
    function topicalRemove(){
        var del_tid=$("#tid").val();
        if (confirm('确定要要删除？')){
            topicalR(del_tid);
        }
    }

    /**
      * 用户置顶
      */
    function topicalTop(type){
         var top_tid=$("#tid").val();
         var top_order=$("#order").val();
         if (confirm('确定要操作？')){
             topicalT(top_tid,type,top_order);
         }
    }
    /**
     * 同步今天采集的视频
     * */
    function synchroVideoToday(){
        if (confirm('是否确认同步今天采集的视频？')){
            $.ajax({
                type : "POST",
                url : "${pageContext.request.contextPath}/admin94lu/synchroVideoToday",
                dataType:"json",
                success : function(data) {
                    $("#tips").html(data.msg);
                },
                //请求出错的处理
                error:function(){
                }
            });
            $("#synchroVideoToday_button").attr({"disabled":"disabled"});
        }
    }
    /**
    * 同步所有的视频
     */
    function synchroVideo(){
        if (confirm('是否确认同步？')){
            $.ajax({
                type : "POST",
                url : "${pageContext.request.contextPath}/admin94lu/synchroVideo",
                dataType:"json",
                success : function(data) {
                    $("#tips").html(data.msg);
                },
                //请求出错的处理
                error:function(){
                }
            });
            $("#synchroVideo_button").attr({"disabled":"disabled"});
        }
    }

</script>
</body>
</html>