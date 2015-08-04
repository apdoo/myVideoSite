/**
 * 网站前端通用的js
 */
$(function() {
    /**
     * 留言板提交点击
     */
    $("#contact_submit").click(function(){

    });

    /***
     * 登录方法
     * */
    $("#login").click(function(){
        var username= $("#login_username").val();
        var password=$("#login_password").val();

        if(!checkUser(username)){
            $("#login_username_tip").html("<label style='color: red'>账号名不符合规则!</label>");
            return false;
        }else if(!checkPwd(password)){
            $("#login_password_tip").html("<label style='color: red'>密码不符合规则!</label>");
            return false;
        }
        //勾选了记住密码选项-设置cookie
        if( $("#saveCookie").is(':checked')){
//            alert("saveCookie"+username);
            setCookie("username",username,24,"/");
            setCookie("password",password,24,"/");
        }
        $("#login_form").submit();

    });
    /**
     * 注册方法
     */
    $("#reg").click(function(){
        var username= $("#newusername").val();
        var password=$("#newpassword").val();
        var cpassword=$("#cpassword").val();
        var email=$("#email").val();
        if(!checkUser(username)){
            $("#username_tip").html("<label style='color: red'>账号名不符合规则!</label>");
            return false;
        }else if(!checkPwd(password)){
            $("#username_tip").html("");
            $("#password_tip").html("<label style='color: red'>密码不符合规则!</label>");
            return false;
        }else if(cpassword!=password){
            $("#password_tip").html("<label style='color: red'>两次输入的密码不一致!</label>");
            return false;
        }else if(!checkEmail(email)){
            $("#password_tip").html("");
            $("#email_tip").html("<label style='color: red'>邮箱输入不符合规则!</label>");
            return false;
        }
        $("#email_tip").html("");
        //勾选了记住密码选项-设置cookie
        if( $("#saveCookieSign").is(':checked')){
            setCookie("username",username,24,"/");
            setCookie("password",password,24,"/");
        }
        $("#signup_form").submit();
    }) ;
});
/**
 * 视频播放页面下部分随机视频列表加载
 * @param root
 */
function init_below_content_video(root){
    $.ajax({
        type : "POST",
        url : root+"/video/viewVideosInfo",
        data:{
            count:"9",
            type:"random"//获得是随机一组的视频信息
        },
        dataType:"json",
        success : function(data) {
            var content="";
            $.each(data,function(key,val){
                content=content+" <div class=\"grid\"><h3>"+val.title+"</h3>"+
                      "<a  href=\""+root+"/videoplay?vkey="+val.vkey+"\"><img  style=\"width:255;\" src=\""+val.imgName+"\" title=\""+val.title+"\" /></a>"+
                      "<div class=\"time\"><span>"+val.infotime+"</span> </div>"+" <div class=\"grid-info\"><div class=\"video-share\">"+val.updatetime+"</div><div class=\"video-watch\"> "+val.views+" 观看</div> <div class=\"clear\"> </div> <div class=\"lables\"> <p>标签: "+val.tags+"</p></div></div></div>";
            });
            $("#below_videos").html(content);
        },
        //请求出错的处理
        error:function(){
//               alert("请求出错");
        }
    });
}
/**
 * 右侧加载随机推荐的一组视频
 * @param root
 */
function init_right_content_randomview_video(root){
    $.ajax({
        type : "POST",
        url : root+"/video/viewVideosInfo",
        data:{
            type:"random"//获得是随机一组的视频信息
        },
        dataType:"json",
        success : function(data) {
            var pre="  <div class=\"popular\">  <h3>大家都在看</h3>  <div class=\"clear\"> </div> </div>";
            var after="<div class=\"r-all\"> <a href=\""+root+"/videoList\">查看更多</a> </div>";
            var content="";
            $.each(data,function(key,val){
                content=content+"<div class=\"video1\">"+
                "<a href=\""+root+"/videoplay?vkey="+val.vkey+"\"><img src=\""+val.imgName+"\" title=\""+val.title+"\" /></a>"+
                "<span>"+val.title+"</span>"+
                "<p>"+val.updatetime+"</p>"+
                "<p>"+val.views+" 观看</p>"+
                "<div class=\"clear\"> </div></div>";
            });
            content=pre+content+after;
            $("#random_views").html(content);

        },
        //请求出错的处理
        error:function(){
//               alert("请求出错");
        }
    });
}

/**
 * 首页右侧加载观看最多
 * @param root
 */
function init_right_content_mostview_video(root){
    $.ajax({
        type : "POST",
        url : root+"/video/viewVideosInfo",
        data:{
            type:"most"//获得是观看最多的视频信息
        },
        dataType:"json",
        success : function(data) {
            var pre="  <div class=\"popular\">  <h3>观看最多的视频</h3>  <div class=\"clear\"> </div> </div>";
            var after="<div class=\"r-all\"> <a href=\""+root+"/videoList\">查看更多</a> </div>";
            var content="";
            $.each(data,function(key,val){
                content=content+"<div class=\"video1\">"+
                "<a href=\""+root+"/videoplay?vkey="+val.vkey+"\"><img src=\""+val.imgName+"\" title=\""+val.title+"\" /></a>"+
                "<span>"+val.title+"</span>"+
                "<p>"+val.updatetime+"</p>"+
                "<p>"+val.views+" 观看</p>"+
                "<div class=\"clear\"> </div></div>";
            });
            content=pre+content+after;
            $("#most_views").html(content);
        },
        //请求出错的处理
        error:function(){
//               alert("请求出错");
        }
    });
}
/**
 * 视频列表加载视频信息
 * @param data
 */
function init_categories_box(root,data){
    $("#categories_box").html(videos_init(root,data));
}
/**
 * 首页加载最新视频信息
 * @param root
 */
function init_index_video(root){
    $.ajax({
        type : "POST",
        url : root+"/video/recentlyVideos",
        dataType:"json",
        success : function(data) {
            $("#video_box").html(videos_init(root,data));
        },
        //请求出错的处理
        error:function(){
//               alert("请求出错");
        }
    });
}
/**
 * 通用获得视频列表
 * @param data 视频信息json串
 * @returns {string}
 */
function videos_init(root,data){
    var i=1;
    var grids_pre="<div class=\"grids\">";
    var grids_after="</div>";
    var content="";
    $.each(data,function(key,val){
        if((i-1)%3==0){
            //因为首页样式是3行一个
            content=content+grids_pre;
        }
        content=content+"<div class=\"grid\"><h3>"+val.title+"</h3><a href=\""+root+"/videoplay?vkey="+val.vkey+"\">" +
        "<img src=\""+val.imgName+"\" title=\""+val.title+"\" style=\"width:355;\"/></a>"+" <div class=\"time\"> <span>"+val.infotime+"</span> </div>"+
        "<div class=\"grid-info\"><div class=\"video-share\">"+val.updatetime+"</div>"+"<div class=\"video-watch\"> "+val.views+" 观看</div>"+" <div class=\"clear\"> </div>"+
        " <div class=\"lables\"> <p>标签: "+val.tags+" </p></div></div></div>";
        if((i-1)%3==2){
            content=content+grids_after+"<div class=\"clear\"> </div>";
        }
        i++;
    });
    return content;
}
/**
 * 分页生成方法
 */
function pagecreat(root,path,current,pageCount){
    var first="";
    var last="";
    var content="";
    var count=9;
    if(pageCount<=count){
        count=pageCount;
    }
      if(current<=5){//当前页小于等于5页
          for(var i=1;i<=count;i++){   //因为采集的信息肯定大于9页，就偷懒这么写了 直接循环9页
              if(i==current){
                  content=content+" <li><a class=\"current\" href=\""+root+path+i+"\">"+i+"</a></li>";
              }else{
                  content=content+" <li><a  href=\""+root+path+i+"\">"+i+"</a></li>";
              }
          }
      }else if(current>5){//当前页大于5页
          var t=current+4;
          if(current+4>pageCount) t=pageCount;//限制生成的分页不大于最大的页数
          for(var i=(current-4);i<=t;i++){//生成当前页的前后四页
              if(i==current){
                  content=content+" <li><a class=\"current\" href=\""+root+path+i+"\">"+i+"</a></li>";
              }else{
                  content=content+" <li><a  href=\""+root+path+i+"\">"+i+"</a></li>";
              }
          }
      }
    if(current==1){
        first="<li><a href=\""+root+path+1+"\" class=\"first\">首页</a></li> <li><a href=\""+root+path+1+"\"  class=\"previous\"><<</a></li>" ;
    }else{
        first="<li><a href=\""+root+path+1+"\" class=\"first\">首页</a></li> <li><a href=\""+root+path+(current-1)+"\"  class=\"previous\"><<</a></li>" ;
    }
    if(current==pageCount){
        last=" <li><a href=\""+root+path+pageCount+"\" class=\"next\">>></a></li> <li><a href=\""+root+path+pageCount+"\" class=\"last\">"+pageCount+"</a></li>";
    }else{
        last=" <li><a href=\""+root+path+(current+1)+"\" class=\"next\">>></a></li> <li><a href=\""+root+path+pageCount+"\" class=\"last\">"+pageCount+"</a></li>";
    }
    $("#categories_page").html(first+content+last);
}
//登出
function loginout(){
    //清除cookie
    deleteCookie("username","/");
    deleteCookie("password","/");
}
/**
 * 视频点赞
 * */
function praiseVideo(shareKey,root){
    var praise_title=$("#praise_title").text();
    if(praise_title.indexOf("已赞")>0){
        return false;//点过赞不能再点了
    }

    $.ajax({
        type : "POST",
        url : root+"/video/praiseVideo",
        data:{
            shareKey:shareKey
        },
        dataType:"json",
        success : function(data) {
            $("#praise_title").html("<img src=\""+root+"/resources/images/likes1.png\" title=\"subscribe\" />已赞");
        },
        //请求出错的处理
        error:function(){
        }
    });
}
/**
 *收藏视频
 */
function houseVideo(shareKey,uid,root){
    if(uid==""){
        alert("请登录用户后进行收藏视频！");
    }else{//视频收藏
        $.ajax({
            type : "POST",
            url : root+"/video/houseVideo",
            data:{
                shareKey:shareKey
            },
            dataType:"json",
            success : function(data) {
                $("#favorite_title").html("<img src=\""+root+"/resources/images/sub.png\" title=\"subscribe\" />"+data.msg);
            },
            //请求出错的处理
            error:function(){
            }
        });

    }
}
//验证规则：字母、数字、下划线组成，字母开头，5-16位。
function checkUser(str){
    var re = /^[a-zA-z]\w{4,15}$/;
    if(re.test(str)){
        return true;
    }else{
        return false;
    }
}
//验证规则 密码为6~16个字符，区分大小写
function checkPwd(str){
    var re=/[a-zA-Z0-9]{6,16}/
    if(re.test(str)){//符合
        return true;
    }else {
        return false;
    }
}
//校验email
function checkEmail(str){
    if( str.length <6 || str.indexOf('@') ==-1 || str.indexOf('.') ==-1){
        return false
    }
    return true;
}
//自动登录
function checkLogin(root){
    //验证cookie是否记住
    var username=getCookieValue("username");
    var password=getCookieValue("password");
    if(username!=""&&password!=""){
        //console.info(username+password);
        //获得cookie信息后发送到服务端验证
        $.ajax({
            type : "POST",
            url : root+"/user/autoLogin",
            data : {
                username : username,
                password : password
            },
            dataType:"json",
            success : function(data) {
                if(data.msg){
                    //表示自动登录成功
                    $("a[name='headr_account']").text("个人中心");
                    $("a[name='headr_account']").attr("href",root+"/myaccount");
                }
            },
            //请求出错的处理
            error:function(){
//                       alert("请求出错");
            }
        });
    }
}