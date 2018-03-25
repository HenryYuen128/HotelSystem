<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Login Form Template</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/form-elements.css">
<link rel="stylesheet" href="assets/css/style.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

<!-- Favicon and touch icons -->
<link rel="shortcut icon" href="assets/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="assets/ico/apple-touch-icon-57-precomposed.png">
</head>

<body>

	<!-- Top content -->
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h1>
							<strong>Bootstrap</strong> Login Form
						</h1>
						<div class="description">
							<p>
								This is a free responsive login form made with Bootstrap.
								Download it on <a href="http://azmind.com"><strong>AZMIND</strong></a>,
								customize and use it as you like!
							</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<h3>Login to our site</h3>
								<p>Enter your username and password to log on:</p>
							</div>
							<div class="form-top-right">
								<i class="fa fa-lock"></i>
							</div>
						</div>
						<div class="form-bottom">
							<form role="form" method="post" class="login-form" id="loginForm">
								<div class="form-group">
									<input type="text" id="login_input_username" onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')" name="input_username"placeholder="Username..." class="form-control" > <span class="help-block"></span>
								</div>
								<div class="form-group">

									<input type="password" onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')"name="input_password"
										placeholder="Password..." class="form-password form-control"
										id="login_input_password"> <span class="help-block"></span>
								</div>
								<button type="button" class="btn" id="signin_bt">Sign
									in!</button>
								<label for="or">Or Join Us!</label>
								<button type="button" class="btn" id="register_bt">Register!</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 注册模态框 -->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Register</h4>
      </div>
      <div class="modal-body">
        <form >
  			<div class="form-group">
    			<label for="exampleInputEmail1">Username</label>
    			<input name="username" type="text" id="register_username" class="form-control"  placeholder="Username" onKeyUp="value=value.replace(/[\W]/g,'')">
  				<span class="help-block"></span>
  			</div>
  			<div class="form-group">
   				 <label for="exampleInputPassword1">Password</label>
    			<input name="password" type="password" id="register_password" class="form-control"  placeholder="Password"  onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')">
  				<span class="help-block"></span>
  			</div>
  			<div class="form-group">
   			 	<label for="exampleInputEmail1">Email address</label>
   				 <input name="email" id="register_email" type="email" class="form-control"  placeholder="Email" onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')">
   				 <span class="help-block"></span>
  			</div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" id="close" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="register_save" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


	<!-- Javascript 加载文件-->
	<script src="assets/js/jquery-3.3.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/scripts.js"></script>


	<!-- 逻辑代码-->
	<script type="text/javascript">
	
	
	//显示校验结果的提示信息
	function show_validate_msg(ele, status, msg) {
		$(ele).parent().removeClass("has-success has-error");
		//next("span")紧跟的span元素
		$(ele).next("span").text("");
		if ("success" == status) {
			//$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
		} else if ("error" == status) {
			//$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
		}
	}
	
	function reset_form(ele){
		$(ele)[0].reset();
		//清空表单样式
		$(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text("");
	}
//=====================================================登陆模块============================================================
	
	//前端验证用户和密码
		function validate_user_password() {
			//获取输入框的文本值
			var inputUsername = $("#login_input_username").val();
			var inputPassword = $("#login_input_password").val();

			if (inputUsername == "" && inputPassword == "") {
				show_validate_msg("#login_input_username", "error", "请输入用户名");
				show_validate_msg("#login_input_password", "error", "请输入密码");
				return false;
			} else if (inputUsername == "") {
				show_validate_msg("#login_input_password", "success", "");
				show_validate_msg("#login_input_username", "error", "请输入用户名");
				return false;
			} else if (inputPassword == "") {
				show_validate_msg("#login_input_username", "success", "");
				show_validate_msg("#login_input_password", "error", "请输入密码");
				return false;
			}
			show_validate_msg("#login_input_password", "success", "");
			show_validate_msg("#login_input_username", "success", "");
			return true;

		}

		
		//改变输入状态
 		$("#login_input_password").change(function() {
			show_validate_msg("#login_input_password", "success", "");
		})
		
		$("#login_input_username").change(function() {
			show_validate_msg("#login_input_username", "success", "");
			show_validate_msg("#login_input_password", "success", "");
			})

		
		//点击登录
		$("#signin_bt").click(function() {
			
			//先验证表单数据是否正确再发ajax请求登录
			if (!validate_user_password()) {
				return false;
			}

			var str = $("#loginForm").serializeArray();
			var username = str[0].value;
			var password = str[1].value;

			//2、发送ajax请求登录
			$.ajax({
				url : "${APP_PATH}/login",
				xhrFields : {
					withCredentials : true
				},
				crossDomain : true,
				type : "POST",
				data : JSON.stringify({
					username : username,
					password : password
				}),
				dataType : "json",
				contentType : "application/json",
				//empAddModal的form标签
				success : function(result) {

					if (result.code == 100) {
						//成功登陆
						//跳转Controller,到主页面
						var username = result.extend.user.username;
 						document.write("<form action=${APP_PATH}/index method=POST name=form1 style='display:none'>");  
						document.write("<input type=hidden name=username value='"+username+"'/>");  
						document.write("</form>");  
						document.form1.submit();
						

						
						
					} else {
						
						reset_form("#loginForm");
						$("#login_input_password").next("span").text("用户名或密码错误");
						/*$("#login_input_password").parent().removeClass("has-success has-error");
						$("#login_input_username").parent().removeClass("has-success has-error"); */
					}
				}
			});
		});
//=============================================注册模块====================================================================
		
	//弹出注册框
		$("#register_bt").click(function(){
			reset_form("#loginForm");
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#registerModal form");
			$("#registerModal").modal({
				backdrop:"static"
			});
		});
		
		//校验用户名是否可用
		$("#register_username").change(function(){
			//输入框的输入值取出
			var username = this.value;
			//alert(username.length);
			if(username.length>5&&username.length<17){
				validate_register_name();
				//发送ajax请求校验用户名是否可用
				$.ajax({
				url:"${APP_PATH}/checkuser",
				//传进输入框的参数值
				data:"username="+username,
				type:"POST",
				dataType: "json",
				//msg是以JSON格式返回的，result就是返回的MSG
				success:function(result){
					//实行后端校验(查询是否重复)
					if(result.code==100){
						show_validate_msg("#register_username","success","用户名可用");
						$("#register_save").attr("ajax-name","ok");
					}else{
						show_validate_msg("#register_username","error","用户名不可用");
						$("#register_save").attr("ajax-name","error");
					}
				}
			}); }
			else {
				validate_register_name();
				$("#register_save").attr("ajax-name","error");
			}
 		
		});
		
		//校验用户名是否符合规则
		function validate_register_name(){
			//1、拿到要校验的数据，使用正则表达式
			//校验用户名
			var registerUsername = $("#register_username").val();
			//查jquery的api中的正则表达式
			var regName = /^[a-zA-Z0-9_-]{6,16}$/;
			if(!regName.test(registerUsername)){
				//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
				show_validate_msg("#register_username", "error", "用户名必须是6-16位英文或数字的组合");
				$("#register_save").attr("ajax-name","error");
				return false;
			}else{
				show_validate_msg("#register_username", "success", "");
			}
			return true;
			}
		//校验邮箱是否符合规则
		$("#register_email").change(function validate_register_email(){
			var email = $("#register_email").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				//alert("邮箱格式不正确");
				//应该清空这个元素之前的样式
				show_validate_msg("#register_email", "error", "邮箱格式错误");
				$("#register_save").attr("ajax-email","error");
				return false;
				}else{
				show_validate_msg("#register_email", "success", "");
				$("#register_save").attr("ajax-email","ok");
			} 
			return true;
		});
			
		//检验密码是否符合
 			$("#register_password").change(function validate_register_password(){
 				var regPassword = $("#register_password").val();
 				//alert(regPassword);
 				if(regPassword.length<6){
 					//alert("邮箱格式不正确");
 					//应该清空这个元素之前的样式
 					show_validate_msg("#register_password", "error", "请输入最少6位的密码");
 					$("#register_save").attr("ajax-pass","error");
 					//return false;
 					}else{
 					show_validate_msg("#register_password", "success", "");
 					$("#register_save").attr("ajax-pass","ok");
 				} 
 				return true;
 			});
		
		//点击保存
		$("#register_save").click(function(){
			
			//先验证表单数据是否正确再发ajax请求保存用户信息
			//1、模态框中填写的表单数据提交给服务器进行保存
			//1、先对要提交给服务器的数据进行校验
			//alert($("#registerModal form").serialize());

			//1、判断之前的ajax用户名校验是否成功。如果成功。
			if($(this).attr("ajax-name")==undefined||$(this).attr("ajax-name")=="error"||$(this).attr("ajax-pass")=="error"||$(this).attr("ajax-email")=="error"){
				show_validate_msg("#register_email", "error", "邮箱格式错误");
				show_validate_msg("#register_password", "error", "请输入最少6位的密码");
				show_validate_msg("#register_username","error","用户名必须是6-16位英文或数字的组合");
				return false;
			}
			
			//2、发送ajax请求保存用户
			$.ajax({
				url:"${APP_PATH}/register",
				type:"POST",
				data:$("#registerModal form").serialize(),
				success:function(result){
					//alert(result.msg);
					if(result.code == 100){
						$("#register_save").attr("ajax-name","error");
						$("#register_save").attr("ajax-email","error");
						$("#register_save").attr("ajax-pass","error");
					    $("#registerModal").modal('hide');
					 }
				}
			});
		});
	</script>
</body>

</html>