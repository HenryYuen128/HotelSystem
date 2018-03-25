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
                        接机服务安排
                    </title>
                    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet" />
                    <link rel="stylesheet" type="text/css" media="all" href="assets/datetimepicker/daterangepicker.css" />
                    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
                    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
					<script type="text/javascript" src="assets/datetimepicker/moment.js"></script>
					<script type="text/javascript" src="assets/datetimepicker/daterangepicker.js"></script>
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
                        <a class="list-group-item" href="${APP_PATH}/adminDuty.jsp">
                            轮班表
                        </a>
                        <a class="list-group-item" href="${APP_PATH}/adminPassword.jsp">
                            修改密码
                        </a>
                        <a class="list-group-item active">
                            添加/删除管理员
                        </a>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                             添加/删除管理员
                        </div>
                        <div class="panel-body">
                            <nav class="navbar navbar-default">
                                <div class="container-fluid">
                                    <!-- Brand and toggle get grouped for better mobile display -->
                                    <!-- Collect the nav links, forms, and other content for toggling -->
                                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                        <form class="navbar-form navbar-left">
                                            <div class="form-group">
                                                <input class="form-control" placeholder="输入员工姓名查找" type="text" id="searchname" 
                                                onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                                </input>
                                            </div>
                                             <button class="btn btn-default" type="button" id="search_btn">
                                                查找
                                            </button>
                                            
                                            
                                            
                                         </form>
                                            <form class="navbar-form navbar-left">
                                            <button  class="btn btn-default" type="button" id="add_btn">
                                               添加
                                            </button>
                                            
                                        </form>
                                    </div>
                                </div>
                            </nav>
                            <table class="table table-hover">
                                <thead>
                                    <tr id="tr">
                                    <td>
                                    用户名
                                    </td>
                                        <td>
                                           员工姓名
                                        </td>
                                        

                                        <td>
                                            删除
                                        </td>
                                      
                                       
                                    </tr>
                                </thead>
                                <tbody id=tbody>
                                </tbody>
                            </table>
                        <div class="row">
							<!--分页文字信息  -->
							<div class="col-md-6" id="page_info_area"></div>
							<!-- 分页条信息 -->
							<div class="col-md-6" id="page_nav_area"></div>
						</div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
            <!-- 添加管理员模态框 -->
	<div class="modal fade" 
		aria-labelledby="mySmallModalLabel" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modal-title">添加管理员</h4>
				</div>
				<div class="modal-body table-responsive" id="modal-body">
						<form class="form-horizontal" id="addForm">
						
							<div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
							    <div class="col-sm-10">
							      <input name="inputName" style="width:30%;"  type="text" class="form-control" id="username">
							      <span id="helpBlock1" class="help-block"></span>
							    </div>
							</div>
						<!-- 姓名输入框 -->
							<div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
							    <div class="col-sm-10">
							      <input name="inputName" style="width:30%;"  type="text" class="form-control" id="name">
							      <span id="helpBlock2" class="help-block"></span>
							    </div>
							</div>
	
							<div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">密码</label>
							    <div class="col-sm-10">
							      <input name="inputName" style="width:30%;"  type="password" class="form-control" id="password1">
							      <span id="helpBlock3" class="help-block"></span>
							    </div>
							</div>
							
							<div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">确认密码</label>
							    <div class="col-sm-10">
							      <input name="inputName" style="width:30%;"  type="password" class="form-control" id="password2">
							      <span id="helpBlock4" class="help-block"></span>
							    </div>
							</div>
							
						</form>
				</div>
 				<div class="modal-footer" id="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-success"  id="confirm" check="0">确认</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="successModal">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	    	<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modal-title">信息</h4>
			</div>
			<div class="modal-body table-responsive" id="modal-body">
	      添加成功
			</div>
			<div class="modal-footer" id="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">确认</button>
					
			</div>
	    </div>
	  </div>
	</div>
	
	<!--确认删除框  -->
		<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="deleteModal">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	    	<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modal-title">信息</h4>
			</div>
			<div class="modal-body table-responsive" id="delete-modal-body">
	      确认删除吗
			</div>
			<div class="modal-footer" id="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-success"  id="deleteConfirm">确认</button>
			</div>
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
				$("#add_btn").css("display","block");
				//console.log(superuser);
				window.flag = 1;
				//alert("超级管理员页面");
			}
			if(superuser==""){
				$("#adminEdit").css("display","none");
				$("#user_bt").prepend(admin);
				$("#add_btn").css("display","none");
				window.flag=0;
				//alert("普通管理员页面");
				//console.log(superuser);
				//console.log(admin);
			}
			//用户信息首页
			to_page(1,searchname);
			
			
		});
        
		function to_page(pn,name){
 			$.ajax({
				url : "${APP_PATH}/getAdminList",
				//参数是pn
				data : "pn=" + pn + "&searchname="+name,
				type : "POST",
				dataType : "json",

				success : function(result) {
					//每页全选框初始是没选中的
					//$("#check_all").attr("checked",false);
					//result是服务器返回给浏览器的数据
					//console.log(result);
					//alert("success");
					//1、解析并显示员工数据
					build_admin_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			}); 
		}
		
		
		function build_admin_table(result) {
			//因为ajax是不刷新页面加载数据，所以每次进入页面都要先清空
			//清空table表格
			$("#tbody").empty();
			var emps = result.extend.pageInfo.list;
			//jquery的遍历函数
			//index是索引,item是当前对象
			$.each(emps, function(index, emp) {
				//var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				//创建一个<td>元素
				//var orerId = $("<td></td>").append(order.orderid);
				//var roomNoTd = $("<td></td>").append(item.roomnumber);

				//var roomSize = "建议入住人数：" + item.size + "人";

				//indate = getDate(order.checkintime);
				//outdate = getDate(order.checkouttime);

			//	var intime = $("<td></td>").append(indate);
				//var outtime = $("<td></td>").append(outdate);

				var username = $("<td></td>").append(emp.username);
				var name = $("<td></td>").append(emp.realname);
				
				
				
				
				
				
					var dele_btn = $("<button></button>").addClass("btn btn-warning").append("删除");
					dele_btn.attr("realname",emp.realname);
					dele_btn.attr("username",emp.username);
					var dele = $("<td></td>").append(dele_btn);
					

				
				
				
				
				$("<tr></tr>").append(username).append(name).append(dele).appendTo("#tbody");
			});
		}
		//解析显示分页条
		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"当前" + result.extend.pageInfo.pageNum + "页,总"
							+ result.extend.pageInfo.pages + "页,总"
							+ result.extend.pageInfo.total + "条记录");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}
		//解析显示分页条，点击分页要能去下一页....
		function build_page_nav(result) {
			//page_nav_area
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");

			//构建元素
			//<li>标签里加<a>标签,<a>标签里加 首页 两个字
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				//为元素添加点击翻页的事件
				firstPageLi.click(function() {
					to_page(1,searchname);
				});
				prePageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum - 1,searchname);
				});
			}

			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				nextPageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum + 1,searchname);
				});
				lastPageLi.click(function() {
					to_page(result.extend.pageInfo.pages,searchname);
				});
			}

			//添加首页和前一页 的提示
			ul.append(firstPageLi).append(prePageLi);
			//1,2，3遍历给ul中添加页码提示
			$.each(result.extend.pageInfo.navigatepageNums, function(index, item) {

				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					//现在是第几页，就高亮
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item,searchname);
				});
				ul.append(numLi);
			});
			//添加下一页和末页 的提示
			ul.append(nextPageLi).append(lastPageLi);

			//把ul加入到nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		
		
		$("#search_btn").click(function(){
			//alert($("#searchname").val());
			var name = $("#searchname").val();
				to_page(1,name);	
		});
		
		//添加管理员
		$("#add_btn").click(function(){
			$("#myModal").modal({
				backdrop:"static"
			});

		});
		
		//验证用户名是否可用
$("#username").change(function () {
		if($("#username").val()!=""){
			$("#helpBlock1").text("");
		}
		});
		
$("#name").change(function () {
	if($("#name").val()!=""){
		$("#helpBlock2").text("");
	}
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
		//$(ele).attr("pw-check", "no");

		return false;
	} else if (pw.length >= 6) {
		show_validate_msg(ele, "success", "");
		//$(ele).attr("pw-check", "yes");
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
		//$("#password1").attr("pw-check", "yes");
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
		//$("#password2").attr("pw-check", "yes");
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
	




/* 		function checkUsername() {
 			$.ajax({
				url : "${APP_PATH}/existUsername",
				//参数是pn
				data : "name="+$("#username").val(),
				type : "POST",
				dataType : "json",

				success : function (result) {
					if(result.code==200){
						$("#helpBlock1").text("用户名已被使用");
						$("#confirm").attr("check","0");
					}else if(result.code==100){
						$("#helpBlock1").text("用户名可用");
						$("#confirm").attr("check","1");
					}
				}
			});
		}; */
		

		$("#username").change(function(){
			$("#helpBlock1").text("");
		});
			
		
		
		$("#confirm").click(function() {
			
			
			var name = $("#name").val();
			var username = $("#username").val();
			
			if(username==""){
				$("#helpBlock1").text("请输入用户名");
				return false;
			}
			
			
			if(name==""){
				$("#helpBlock2").text("请输入姓名");
				return false;
			}
			
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
			} else{
				$.ajax({
					url : "${APP_PATH}/addAdmin",
					data : "name="+$("#name").val()+"&username="+$("#username").val()+"&password="+$("#password2").val(),
					type : "POST",
					dataType : "JSON",
					
					success : function(result) {
						//alert("sucess");
						if (result.code == 100) {
							$("#successModal").modal({
								backdrop : "static"
							});
							
							//$("#modal-body").empty();
							//$("#modal-body").append("修改成功");
							reset_form("#addForm");
							//alert("修改成功");
						} else if (result.code==200) {
							$("#helpBlock1").text("用户名已被使用");
						}
					}

				});
			}

		});
		
		$("#successModal").on('hidden.bs.modal', function (e) {
			$('#myModal').modal('hide');
			$("#confirm").attr("check","0");
			to_page(1,searchname);
			reset_form("#addForm");
			});
		
		$("#myModal").on('hidden.bs.modal', function (e) {
			reset_form("#addForm");
			});
		

		
		
		//删除值班	
		$(document).on("click", ".btn-warning", function(){
			$("#deleteModal").modal({
				backdrop:"static"
			});
			
			$("#deleteConfirm").attr("username",$(this).attr("username"));
			$("#deleteConfirm").attr("realname",$(this).attr("realname"));
			
		});
		
		//确认删除值班
		$("#deleteConfirm").click(function() {
			
 			$.ajax({
				url : "${APP_PATH}/deleteAdmin",
				//参数是pn
				data : "name="+$(this).attr("realname")+"&username="+$(this).attr("username"),
				type : "POST",
				dataType : "json",

				success : function(result) {
						if(result.code==100){
							$('#deleteModal').modal('hide');
															
								to_page(1,searchname);
							
					}
				}
			});
		});
		
		$("#deleteModal").on('hidden.bs.modal', function (e) {								
			to_page(1,searchname);
		});
		

		
	

		
		
		
		
        </script>
        
        
        
    </body>
</html>



