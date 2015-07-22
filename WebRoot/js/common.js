/**
 * 网站前端通用的js
 */
$(function() {

    /**
     * 点击切换验证码图片
     * */
    $("#vimg").click(function() {
        //带上一个参数，请求会被缓存
        $("#vimg").attr("src","${pageContext.request.contextPath}/validation/one?random="+Math.random());
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
        //设置cookie
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
        //保存cookie
        if( $("#saveCookieSign").is(':checked')){
            setCookie("username",username,24,"/");
            setCookie("password",password,24,"/");
        }
        $("#signup_form").submit();
    }) ;
});
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
            var i=1;
            var grids_pre="<div class=\"grids\">";
            var grids_after="</div>";
            var content="";
            $.each(data,function(key,val){
                //console.info(i+".."+(i-1)%3);
                if((i-1)%3==0){
                    //因为首页样式是3行一个
                    content=content+grids_pre;
                }
                content=content+"<div class=\"grid\"><h3>"+val.title+"</h3><a href=\"single.html\">" +
                "<img src=\""+val.imgName+"\" title=\"video-name\" style=\"width:255;\"/></a>"+" <div class=\"time\"> <span>"+val.infotime+"</span> </div>"+
                "<div class=\"grid-info\"><div class=\"video-share\"><ul><li><a href=\"#\"><img src=\""+root+"/resources/images/likes.png\" title=\"links\" /></a></li>"+
                "<li><a href=\"#\"><img src=\""+root+"/resources/images/link.png\" title=\"Link\" /></a></li>"+
                " <li><a href=\"#\"><img src=\""+root+"/resources/images/views.png\" title=\"Views\" /></a></li></ul></div>"+"  <div class=\"clear\"> </div>"+
                " <div class=\"lables\"> <p>Labels:<a href=\"categories.html\">Lorem</a></p></div></div></div>";
                if((i-1)%3==2){
                    content=content+grids_after+"<div class=\"clear\"> </div>";
                }
                i++;
            });
            $("#video_box").html(content);

        },
        //请求出错的处理
        error:function(){
//               alert("请求出错");
        }
    });
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
                    $("#my").html(username);
                    $("#rp_loginpad").hide();
                }
            },
            //请求出错的处理
            error:function(){
//                       alert("请求出错");
            }
        });
    }
}