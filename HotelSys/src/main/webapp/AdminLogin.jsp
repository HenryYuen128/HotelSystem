<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1" name="viewport">

<title>管理员登陆</title>


<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/crud
 -->

<link rel="stylesheet" href="static/css/font-awesome.min.css">

<link rel='stylesheet prefetch' href="static/css/bootstrap.min.css"/>

<link rel="stylesheet" href="static/css/style.css" media="screen" type="text/css" />
	
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css"
	rel="stylesheet" />
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js">
	
</script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js">
</script>

	

</head>
<body class="login-page">

<div class="login-form">

		<div class="login-content">

			<div class="form-login-error">
				<h3>Invalid login</h3>
				<p>Enter <strong>demo</strong>/<strong>demo</strong> as login and password.</p>
			</div>

			<form id="loginForm">

				<div class="form-group">

					<div class="input-group">
						<div class="input-group-addon">
							<i class="fa fa-user"></i>
						</div>

						<input type="text" class="form-control" name="username" id="login_input_username" placeholder="Username" autocomplete="off" />
						<span class="help-block"></span>
					</div>
					

				</div>

				<div class="form-group">

					<div class="input-group">
						<div class="input-group-addon">
							<i class="fa fa-key"></i>
						</div>

						<input type="password" class="form-control" name="password" id="login_input_password" placeholder="Password" autocomplete="off" />
						<span class="help-block"></span>
					</div>

				</div>

				<div class="form-group">
					<button type="button" class="btn btn-primary btn-block btn-login" id="signin_bt">
						<i class="fa fa-sign-in"></i>
						Login In
					</button>
				</div>
			</form>
		</div>
	</div>
 
 
 <!-- 逻辑代码-->


</body>
	<script>
	
	
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

		
		//点击登录发送请求
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
				url : "${APP_PATH}/adminlogin",
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
						//alert("success");
						//成功登陆
						//跳转Controller,到主页面
/* 						var username = result.extend.admin.username;
 						document.write("<form action=${APP_PATH}/adminindex method=POST name=form1 style='display:none'>");  
						document.write("<input type=hidden name=username value='"+username+"'/>");  
						document.write("</form>");  
						document.form1.submit(); */
						alert("login success");
						location.href = "${APP_PATH}/adminhomepage.jsp";					

						
						
					} else {
						alert("fail");
						reset_form("#loginForm");
						$("#login_input_password").next("span").text("用户名或密码错误");
						/*$("#login_input_password").parent().removeClass("has-success has-error");
						$("#login_input_username").parent().removeClass("has-success has-error"); */
					}
				}
			});
		});
</script>


</html>