<%@page import="java.awt.event.ItemEvent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
    <head>
        <meta charset="utf-8">
            <meta content="IE=edge" http-equiv="X-UA-Compatible">
                <meta content="width=device-width, initial-scale=1" name="viewport">
                    <title>
                        管理员首页
                    </title>
                    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
                        <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js">
                        </script>
                        <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js">
                        </script>
                    </link>
                </meta>
            </meta>
        </meta>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<style>
td  
{  
 white-space: nowrap;  
}  
</style>
    </head>
    <body>
        <div class="container">
            <div class="row clearfix" style="margin-top: 20px">
                <div class="col-md-8 column">
                    <div class="col-md-4 column">
                        <h3 style="margin-top: 10px">
                            XX酒店管理系统
                        </h3>
                    </div>
                    <div class="col-md-8 column">
                    </div>
                </div>
                <div class="col-md-4 column">
                    <!-- <div class="col-md-6 column"><p style="margin-right: 20px">test</p></div>
                    <div class="col-md-6 column" > -->
                    <div class="col-md-3 col-md-offset-9">
                        <div class="btn-group">
                            <button aria-expanded="false" aria-haspopup="true" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" type="button" id="user_bt">
                                <span class="caret">
                                </span>
                            </button>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="AdminLogin.jsp">
                                        注销
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row clearfix" style="margin-top: 3%">
                <div class="col-md-3">
                    <div class="list-group">
                        <a class="list-group-item" href="${APP_PATH}/adminhomepage.jsp">
                            查询用户信息
                        </a>
                        <a class="list-group-item" href="${APP_PATH}/adminroomInfo.jsp">
                            查看房间信息
                        </a>
                        <a class="list-group-item" href="${APP_PATH}/adminTransport.jsp">
                            安排接送服务
                        </a>
                        <a class="list-group-item" href="${APP_PATH }/adminDuty.jsp">
                            轮班表
                        </a>
                        <a class="list-group-item active">
                            修改密码
                        </a>
                        <a class="list-group-item" href="${APP_PATH}/adminAddDelete.jsp" id="adminEdit" style="display: none">
                            添加/删除管理员
                        </a>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            修改密码
                        </div>
                        <div class="panel-body">
							<form id="editPw">
									<div class="form-group">
										<label for="exampleInputEmail1"> 旧密码 </label> <input
											type="password"
											onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')"
											name="curPassword" placeholder="旧密码"
											class="form-password form-control" id="curPassword"
											pw-check="no"> <span class="help-block"></span>
									</div>


									<!-- 新密码 -->
									<div class="form-group">
										<label for="exampleInputEmail1"> 新密码 </label> <input
											type="password"
											onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')"
											name="password1" placeholder="新密码"
											class="form-password form-control" id="password1"
											pw-check="no"> <span class="help-block"></span>
									</div>

									<!-- 二次验证 -->
									<div class="form-group">
										<label for="exampleInputEmail1"> 确认新密码 </label> <input
											type="password"
											onkeyup="this.value=this.value.replace(/^\s+|\s+$/g,'')"
											name="password2" placeholder="在此输入新密码"
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
        
        <!-- JS代码 -->
        <script>
        var admin = "<%=session.getAttribute("adminname")%>";
        var superuser = "<%=session.getAttribute("superusername")%>";
        var searchname = $("#searchname").val();
        //超级管理员可以编辑房间信息
		$(function index() {
			if(superuser!=""){
				$("#adminEdit").css("display","block");
				$("#user_bt").prepend(superuser);
				//console.log(superuser);
				window.flag = 1;
				//alert("超级管理员页面");
			}
			if(superuser==""){
				$("#adminEdit").css("display","none");
				$("#user_bt").prepend(admin);
				window.flag=0;
				//alert("普通管理员页面");
				//console.log(superuser);
				//console.log(admin);
			}
			//用户信息首页
			
			
			
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
					if(flag==1){
						
						$.ajax({
						url : "${APP_PATH}/updateSuperuserPassword",
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
					else if(flag==0){
						$.ajax({
							url : "${APP_PATH}/updateAdminPassword",
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
	
				}

				});
		
		
        </script>
        
        
        
    </body>
</html>



