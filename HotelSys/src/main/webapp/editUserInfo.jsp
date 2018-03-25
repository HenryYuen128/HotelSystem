<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1" name="viewport">
<title>Document</title>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css"
	rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js">
	
</script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js">
	
</script>
</link>
</meta>
</meta>
</meta>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>
<body>
	<div class="container">
		<div class="row clearfix" style="margin-top: 3%">
			<div class="col-md-3 column">
				<a href="${APP_PATH }/homepage">
					<img src="image/logo.jpg">
				</a>
			</div>
			<div class="col-md-9 column">
			
				<address class="text-right">
				<span class="glyphicon glyphicon-headphones" aria-hidden="true"></span>
  <strong>联系我们</strong><br>
  1355 Market Street, Suite 900<br>
  <abbr title="Phone">电话：</abbr> (123) 456-7890
</address>
			</div>
		</div>
		<hr/>
		<div class="row clearfix" style="margin-top: 3%">
			<div class="col-md-3">
				<div class="list-group">
					<li class="list-group-item active">账号信息</li>
					 <a class="list-group-item" href="${APP_PATH }/userOrders.jsp"> 查看订单 </a>
					<a class="list-group-item" href="${APP_PATH}/serviceOrders.jsp">查看接送预订 </a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="panel panel-primary">
					<div class="panel-heading">修改个人信息</div>
					<div class="panel-body">

						<div>
							<button class="btn btn-primary" type="button"
								data-toggle="collapse" data-target="#collapseExample"
								aria-expanded="false" aria-controls="collapseExample">
								修改密码</button>
						</div>


						<div class="collapse" id="collapseExample">
							<div class="well">
								<!-- 旧密码 -->
								<form id="editPw">
									<div class="form-group">
										<label for="exampleInputEmail1"> 旧密码 </label> <input
											type="password"
											onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')"
											name="curPassword" placeholder="Password..."
											class="form-password form-control" id="curPassword"
											pw-check="no"> <span class="help-block"></span>
									</div>


									<!-- 新密码 -->
									<div class="form-group">
										<label for="exampleInputEmail1"> 新密码 </label> <input
											type="password"
											onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')"
											name="password1" placeholder="Password..."
											class="form-password form-control" id="password1"
											pw-check="no"> <span class="help-block"></span>
									</div>

									<!-- 二次验证 -->
									<div class="form-group">
										<label for="exampleInputEmail1"> 确认新密码 </label> <input
											type="password"
											onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')"
											name="password2" placeholder="Password..."
											class="form-password form-control" id="password2"
											pw-check="no"> <span class="help-block"></span>
									</div>

									<div>
										<button type="button" class="btn btn-primary" id="savePw"
											style="margin-left: 93%">保存</button>
									</div>
								</form>


							</div>


						</div>

						<hr />



						<!-- 邮箱 -->
						<div class="form-group">
							<label for="exampleInputEmail1"> 电子邮箱 </label> <input
								class="form-control" id="inputEmail" placeholder="Email"
								type="email" email-check="no"> </input> <span class="help-block"></span>
						</div>
						<div>
							<button type="button" class="btn btn-primary" id="saveEmail"
								style="margin-left: 90%">修改邮箱</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">信息</h4>
				</div>
				<div class="modal-body" id="modal-body"></div>
				<!--       <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div> -->
			</div>
		</div>
	</div>


</body>


<script type="text/javascript">
	//校验邮箱
	function validate_email() {
		var email = $("#inputEmail").val();
		//alert(email)
		var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if (!regEmail.test(email) || email == "") {
			//alert("邮箱格式不正确");
			//应该清空这个元素之前的样式
			show_validate_msg("#inputEmail", "error", "邮箱格式不正确");
			$("#inputEmail").attr("email-check", "no");
			/* $("#email_add_input").parent().addClass("has-error");
			$("#email_add_input").next("span").text("邮箱格式不正确"); */
			return false;
		} else {
			show_validate_msg("#inputEmail", "success", "");
			$("#inputEmail").attr("email-check", "yes");
		}
		return true;
	};

	$(document).on("change", "#inputEmail", function() {
		//alert($('#date-range25').val());
		validate_email();

	});

	//校验密码是否为空
	function validate_password(ele) {
		var pw = $(ele).val();
		//alert(email)
		//var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if (pw == "") {
			//alert("请输入密码");
			//应该清空这个元素之前的样式
			show_validate_msg(ele, "error", "请输入密码");
			$(ele).attr("pw-check", "no");

			return false;
		} else if (pw.length >= 6) {
			show_validate_msg(ele, "success", "");
			$(ele).attr("pw-check", "yes");
		}
		return true;
	};
	//密码1长度校验
	$("#password1").change(function validate_register_password1() {
		var regPassword1 = $("#password1").val();
		//alert(regPassword);
		if (regPassword1.length < 6) {
			//alert("邮箱格式不正确");
			//应该清空这个元素之前的样式
			show_validate_msg("#password1", "error", "请输入最少6位的密码");
			//$("#register_save").attr("ajax-pass", "error");
			return false;
		} else {
			show_validate_msg("#password1", "success", "");
			$("#password1").attr("pw-check", "yes");
			return true;
			//$("#register_save").attr("ajax-pass", "ok");
		}
	});

	//密码2长度校验
	$("#password2").change(function validate_register_password2() {
		var regPassword2 = $("#password2").val();
		//alert(regPassword);
		if (regPassword2.length < 6) {
			//alert("邮箱格式不正确");
			//应该清空这个元素之前的样式
			show_validate_msg("#password2", "error", "请输入最少6位的密码");
			//$("#register_save").attr("ajax-pass", "error");
			return false;
		} else {
			show_validate_msg("#password2", "success", "");
			$("#password2").attr("pw-check", "yes");
			return true;
			//$("#register_save").attr("ajax-pass", "ok");
		}
	});
	
	$("#curPassword").change(function validate_register_curpassword() {
		var curPassword = $("#curPassword").val();
		//alert(regPassword);
		if (curPassword!="") {
			
			show_validate_msg("#curPassword", "success", "");
			
		}
	});

	/* 		$("#password2").change(function() {
	 validate_register_password2();
	 }); */

	//显示校验结果的提示信息
	function show_validate_msg(ele, status, msg) {
		//清除当前元素的校验状态
		$(ele).parent().removeClass("has-success has-error");
		//next("span")紧跟的span元素
		$(ele).next("span").text("");
		if ("success" == status) {
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
		} else if ("error" == status) {
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
		}
	}
	 
	 function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}

	/* 	$("#curPassword").change(function() {
	 validate_password("#curPassword");}
	 );
	
	 $("#password1").change(function() {
	 validate_password("#password1");}
	 );
	
	 $("#password2").change(function() {
	 validate_password("#password2");}
	 ); */

	//保存Email
	$("#saveEmail").click(function() {
		var email = $("#inputEmail").val();
		if (!validate_email()) {
			show_validate_msg("#inputEmail", "error", "邮箱格式不正确");
			return false;
		};
		
		$.ajax({
			url : "${APP_PATH}/updateEmail",
			data : "email="+email,
			type : "POST",
			dataType : "JSON",
			success : function(result) {
				//alert("sucess");
				if (result.code == 100) {
					$("#myModal").modal({
						backdrop : "static"
					});
					$("#modal-body").empty();
					$("#modal-body").append("修改成功");
					$("#inputEmail").val("");
					//alert("修改成功");
				}
			}

		});
	});

	//保存密码
	$("#savePw").click(function() {
		//alert($("#editPw").serialize());
		var curPw = $("#curPassword").val();
		var pw1 = $("#password1").val();
		var pw2 = $("#password2").val();

		//var curCheck = $("#curPassword").attr("pw-check");
		var pw1Check = $("#password1").attr("pw-check");
		var pw2Check = $("#password2").attr("pw-check");

		if (!validate_password("#curPassword")) {
			return false;
		}
		;

		if (!validate_password("#password1")) {
			return false;
		}
		;

		if (!validate_password("#password2")) {
			return false;
		}
		;

		if ($("#password1").val() != $("#password2").val()) {
			show_validate_msg("#password2", "error", "两次输入的密码不相同");
		} else {
			$.ajax({
				url : "${APP_PATH}/updatePassword",
				data : JSON.stringify({
					curPw : curPw,
					pw1 : pw1,
					pw2 : pw2
				}),
				type : "POST",
				dataType : "JSON",
				contentType : "application/json",
				success : function(result) {
					//alert("sucess");
					if (result.code == 100) {
						$("#myModal").modal({
							backdrop : "static"
						});
						$("#modal-body").empty();
						$("#modal-body").append("修改成功");
						reset_form("#editPw");
						//alert("修改成功");

					} else if (result.code == 200) {
						$("#myModal").modal({
							backdrop : "static"
						});
						$("#modal-body").empty();
						$("#modal-body").append("旧密码错误");
					}
				}

			});
		}

		/* 		if (curCheck == "yes" && pw1Check == "yes" && pw2Check == "yes") {
		 $.ajax({
		 url : "${APP_PATH}/changePassword",
		 data : JSON.stringify({
		 curPw : curPw,
		 pw1 : pw1,
		 pw2 : pw2
		 }),
		 type : "POST",
		 dataType : "JSON",
		 contentType : "application/json",
		 success : function(result) {
		 alert("sucess");
		 }

		 });
		 } else {
		 alert("信息不完整");
		 } */

	});
</script>


</html>