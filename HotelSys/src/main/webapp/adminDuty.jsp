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
                        <a class="list-group-item active">
                            轮班表
                        </a>
                        <a class="list-group-item" href="${APP_PATH}/adminPassword.jsp">
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
                            查看轮班表
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
                                    姓名
                                    </td>
                                        <td>
                                           上班时间
                                        </td>
                                        <td>
                                           下班时间
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
        
            <!-- 添加值班模态框 -->
	<div class="modal fade" 
		aria-labelledby="mySmallModalLabel" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modal-title">添加值班员工</h4>
				</div>
				<div class="modal-body table-responsive" id="modal-body">
						<form class="form-horizontal" id="editForm">
						<!-- 姓名输入框 -->
							<div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
							    <div class="col-sm-10">
							      <input name="inputName" style="width:30%;"  type="text" class="form-control" id="inputName">
							      <span id="helpBlock" class="help-block"></span>
							    </div>
							</div>
	
							  <!-- 时间选择框 -->
							<div class="form-group">
							    <label class="col-sm-2 control-label">上班时间</label>
							    <div class="col-sm-10">
									<input name="dutyName" type="text" style="width:30%;" id="dutyTime" class="form-control"></input>
							    </div>
							</div>
							
														<div class="form-group">
							    <label class="col-sm-2 control-label">下班时间</label>
							    <div class="col-sm-10">
									<input name="dutyName2" type="text" style="width:30%;" id="dutyTime2" class="form-control"></input>
									<span id="helpBlock2" class="help-block"></span>
							    </div>
							</div>
						</form>
				</div>
 				<div class="modal-footer" id="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-success"  id="confirm">确认</button>
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
				url : "${APP_PATH}/getDutyList",
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
					build_duty_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			}); 
		}
		
		
		function build_duty_table(result) {
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

				var name = $("<td></td>").append(emp.realname);
				
				
				var ontime = $("<td></td>").append(formatDateTime(emp.ondutytime));
				var offtime = $("<td></td>").append(formatDateTime(emp.offdutytime));
				
				
				
				if(flag==1){
					var dele_btn = $("<button></button>").addClass("btn btn-warning").append("删除");
					dele_btn.attr("realname",emp.realname);
					dele_btn.attr("ondutytime",formatDateTime(emp.ondutytime));
					dele_btn.attr("offdutytime",formatDateTime(emp.offdutytime));
					var dele = $("<td></td>").append(dele_btn);
					

					
					
				}else if(flag==0){
					var dele_btn = $("<button></button>").addClass("btn btn-warning").attr("disabled","disabled").append("删除");
					dele_btn.attr("realname",emp.realname);
					dele_btn.attr("ondutytime",formatDateTime(emp.ondutytime));
					dele_btn.attr("offdutytime",formatDateTime(emp.offdutytime));
					
					var dele = $("<td></td>").append(dele_btn);
					
	
				}
				
				
				
				
				$("<tr></tr>").append(name).append(ontime).append(offtime).append(dele).appendTo("#tbody");
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
		
		//添加员工值班表
		$("#add_btn").click(function(){
			$("#myModal").modal({
				backdrop:"static"
			});
			$("#helpBlock").text("");
			$("#helpBlock2").text("");
			$("#inputName").val("");
		});
		

/* 		$("#myModal").on('hidden.bs.modal', function (e) {
			$("#helpBlock").empty();
			$("#inputName").empty();
			}); */
		
		//获取当前时间
		var myDate = new Date();
		var curDate = myDate.toLocaleDateString();

		$('#dutyTime2')
		.daterangepicker(
				{
					"timePickerIncrement" : 5,
					"singleDatePicker" : true,
					"timePicker" : true,
					"timePicker24Hour" : true,
					"autoApply" : true,
					"locale" : {
						"direction" : "ltr",
						"format" : "YYYY-MM-DD HH:mm",
						"separator" : " - ",
						"applyLabel" : "确定",
						"cancelLabel" : "取消",
						"fromLabel" : "From",
						"toLabel" : "To",
						"customRangeLabel" : "Custom",
						"daysOfWeek" : [ "日", "一", "二", "三", "四", "五", "六" ],
						"monthNames" : [ "一月", "二月", "三月", "四月", "五月",
								"六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ],
						"firstDay" : 1
					},
					"minDate" : curDate,
					"endDate" : "02/07/2018"
				},
				function(start, end, label) {
					console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
				});
		
		$('#dutyTime')
				.daterangepicker(
						{
							"timePickerIncrement" : 5,
							"singleDatePicker" : true,
							"timePicker" : true,
							"timePicker24Hour" : true,
							"autoApply" : true,
							"locale" : {
								"direction" : "ltr",
								"format" : "YYYY-MM-DD HH:mm",
								"separator" : " - ",
								"applyLabel" : "确定",
								"cancelLabel" : "取消",
								"fromLabel" : "From",
								"toLabel" : "To",
								"customRangeLabel" : "Custom",
								"daysOfWeek" : [ "日", "一", "二", "三", "四", "五", "六" ],
								"monthNames" : [ "一月", "二月", "三月", "四月", "五月",
										"六月", "七月", "八月", "九月", "十月", "十一月", "十二月" ],
								"firstDay" : 1
							},
							"minDate" : curDate,
							"endDate" : "02/07/2018"
						},
						function(start, end, label) {
							console
									.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
						});
		
		
		$("#confirm").click(function() {
			
			var name = $("#inputName").val();
			var time = $("#dutyTime").val();
			var time2 = $("#dutyTime2").val();
			
			if(name==""){
				$("#helpBlock").text("请输入姓名");
				return false;
			}else{
				$("#helpBlock").text("");
			}
			
			
			//alert(time>time2);
			 if(time>=time2){
					$("#helpBlock2").text("上班时间大于等于下班时间")
					return false;
			}else $("#helpBlock2").text("");
			
			

			//校验是否存在此用户
 			$.ajax({
				url : "${APP_PATH}/addDuty",
				//参数是pn
				data : "name="+name+"&time="+time+"&time2="+time2,
				type : "POST",
				dataType : "json",

				success : function(result) {
					if(result.code==200){
						$("#helpBlock").text("不存在此员工");
					}else if(result.code==100){
						$("#helpBlock").text("");
						
						$("#successModal").modal({
							backdrop:"static"
						});
						
						$("#successModal").on('hidden.bs.modal', function (e) {
							$('#myModal').modal('hide');
							to_page(1,searchname);
							});
					}
				}
			});
		})
		
		
		//删除值班	
		$(document).on("click", ".btn-warning", function(){
			$("#deleteModal").modal({
				backdrop:"static"
			});
			
			$("#deleteConfirm").attr("realname",$(this).attr("realname"));
			$("#deleteConfirm").attr("ondutytime",$(this).attr("ondutytime"));
			$("#deleteConfirm").attr("offdutytime",$(this).attr("offdutytime"));
			
		});
		
		//确认删除值班
		$("#deleteConfirm").click(function() {
			
 			$.ajax({
				url : "${APP_PATH}/deleteDuty",
				//参数是pn
				data : "name="+$(this).attr("realname")+"&ontime="+$(this).attr("ondutytime")+"&offtime="+$(this).attr("offdutytime"),
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
		
		function formatDateTime(inputTime) {
			var date = new Date(inputTime);
			var y = date.getFullYear();
			var m = date.getMonth() + 1;
			m = m < 10 ? ('0' + m) : m;
			var d = date.getDate();
			d = d < 10 ? ('0' + d) : d;
			var h = date.getHours();
			h = h < 10 ? ('0' + h) : h;
			var minute = date.getMinutes();
			var second = date.getSeconds();
			minute = minute < 10 ? ('0' + minute) : minute;
			second = second < 10 ? ('0' + second) : second;
			return y + '-' + m + '-' + d + ' ' + h + ':' + minute + ':' + second;
		};

		
		function getDate(nS) {
		
			//return new Date(parseInt(("/Date("+nS+")/").substr(6, 13))).toLocaleDateString();
			return new Date(nS).toLocaleDateString();
		}
		
	

		
		
		
		
        </script>
        
        
        
    </body>
</html>



