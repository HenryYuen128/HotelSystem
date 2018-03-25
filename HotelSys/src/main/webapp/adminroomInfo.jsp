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
                        <a class="list-group-item active">
                            查看房间信息
                        </a>
                        <a class="list-group-item" href="${APP_PATH}/adminTransport.jsp">
                            安排接送服务
                        </a>
                        <a class="list-group-item" href="${APP_PATH }/adminDuty.jsp">
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
                            房间信息
                        </div>
                        <div class="panel-body">
                            <nav class="navbar navbar-default">
                                <div class="container-fluid">
                                    <!-- Brand and toggle get grouped for better mobile display -->
                                    <!-- Collect the nav links, forms, and other content for toggling -->
                                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                        <form class="navbar-form navbar-left">
                                            <div class="form-group">
                                                <input class="form-control" placeholder="输入房号查找" type="text" id="searchname" 
                                                onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                                </input>
                                            </div>
                                            <button class="btn btn-default" type="button" id="search_btn">
                                                查找
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </nav>
                            <table class="table table-hover">
                                <thead>
                                    <tr id="tr">
                                        <td>
                                            房间号
                                        </td>
                                        <td>
                                            类型
                                        </td>
                                        <td>
                                            是否可预订
                                        </td>
                                        <td>
              	 价格/晚                        
                                        </td>
                                        <td>
              	设施、服务                   
                                        </td>
                                        <td>
                                        入住记录
                                        </td>
                                        <td>
              	修改房间信息                  
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
        
    <!-- 修改房间信息模态框 -->
	<div class="modal fade" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modal-title">修改房间信息</h4>
				</div>
				<div class="modal-body table-responsive" id="modal-body">
						<form class="form-horizontal" id="editForm">
						<!-- 房号输入框 -->
							<div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">房号</label>
							    <div class="col-sm-10">
							      <input name="roomnumber" style="width:30%;"  type="text" class="form-control" id="inputRoom" readonly>
							    </div>
							</div>
							  <!-- 房型选择框 -->
							<div class="form-group">
							    <label class="col-sm-2 control-label">房型</label>
							    <div class="col-sm-10">
							      <label class="radio-inline">
									  <input type="radio" name="size" id="size1_add_input" value="1"> 单人房
									</label>
									<label class="radio-inline">
									  <input type="radio" name="size" id="size2_add_input" value="2"> 标准房
									</label>
									<label class="radio-inline">
									  <input type="radio" name="size" id="size3_add_input" value="3"> 豪华房
									</label>
							    </div>
							</div>
							  <!-- 价格输入框 -->
							<div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label">价格</label>
							    <div class="col-sm-10">
							      <input style="width:30%;" name="price" type="text" class="form-control" id="inputPrice" 
							      onkeyup="value=value.replace(/[^\d]/g,'')">
							      <span class="help-block"></span>
							    </div>
						    </div>

						<!-- 电脑选择框 -->
							<div class="form-group">
							    <label class="col-sm-2 control-label">电脑</label>
							    <div class="col-sm-10">
							      <label class="radio-inline">
									  <input type="radio" name="pc" id="pc0_add_input" value="0"> 无
									</label>
									<label class="radio-inline">
									  <input type="radio" name="pc" id="pc1_add_input" value="1"> 有
									</label>
							    </div>
							</div>
							<!-- 花园选择框 -->
							<div class="form-group">
							    <label class="col-sm-2 control-label">露台花园</label>
							    <div class="col-sm-10">
							      <label class="radio-inline">
									  <input type="radio" name="garden" id="garden0_add_input" value="0"> 无
									</label>
									<label class="radio-inline">
									  <input type="radio" name="garden" id="garden1_add_input" value="1"> 有
									</label>
							    </div>
							</div>
							<!-- 早餐选择框 -->
							<div class="form-group">
							    <label class="col-sm-2 control-label">免费早餐</label>
							    <div class="col-sm-10">
							      <label class="radio-inline">
									  <input type="radio" name="meal" id="meal0_add_input" value="0"> 无
									</label>
									<label class="radio-inline">
									  <input type="radio" name="meal" id="meal1_add_input" value="1"> 有
									</label>
									
							    </div>
							</div>
							<!-- 清洁选择框 -->
							<div class="form-group">
							    <label  class="col-sm-2 control-label">房间清洁</label>
							    <div class="col-sm-10">
							      <label class="radio-inline">
									  <input type="radio" name="clean" id="clean0_add_input" value="0"> 无
									</label>
									<label class="radio-inline">
									  <input type="radio" name="clean" id="clean1_add_input" value="1"> 有
									</label>
							    </div>
							</div>
<!-- 							 <div class="form-group">
							    <label  class="col-sm-2 control-label" for="exampleInputFile">上传图片</label>
							    <div class="col-sm-10">
							    <input name="file" type="file" id="exampleInputFile">
							    <p class="help-block">Example block-level help text here.</p>
							    </div>
							 </div> -->
						</form>
				
				
				</div>
				<div class="modal-footer" id="modal-footer">
					
					<button type="button" class="btn btn-success"  id="confirm">确认</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 修改成功模态框 -->
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="successModal">
		  <div class="modal-dialog modal-sm" role="document">
		    <div class="modal-content">
			    <div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       			 <h4 class="modal-title">信息</h4>
	      		</div>
	      		<div class="modal-body">
	        		<h2>已更新房间信息</h2>
	      		</div>
	     		 <div class="modal-footer">
	        		<button type="button" class="btn btn-default" data-dismiss="modal" id="editSuccess">确认</button>
	      		</div>
		    </div>
		  </div>
	</div>
	

	    <!-- 入住记录框 -->
	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" id="myModal2">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modal-title">入住记录</h4>
				</div>
				<div class="modal-body table-responsive" id="modal-body2">
						<table class="table table-hover">
							<thead>
							 	<tr>
							 		<td>订单号</td>
							 		<td>下单账号</td>
							 		<td>登记姓名</td>
							 		<td>电子邮箱</td>
							 		<td>电话号码</td>
							 		<td>订单创建时间</td>
							 		<td>入住时间</td>
							 		<td>退房时间</td>
							 		<td>特殊要求</td>
							 		<td>入住晚数</td>
							 		<td>单价</td>
							 		<td>原价</td>
							 		<td>折扣</td>
							 		<td>实付</td>
							 		<td>已退房</td>
							 	</tr>
							</thead>
							<tbody id="tbody2">
							</tbody>
						</table>
				
				
				</div>
				<div class="modal-footer" id="modal-footer1">
					
					<button type="button" class="btn btn-success" data-dismiss="modal">确认</button>
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
			to_page(1,searchname);
			
			
		});
        
		function to_page(pn,name){
 			$.ajax({
				url : "${APP_PATH}/getRooms",
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
					build_rooms_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			}); 
		}
		
		
		function build_rooms_table(result) {
			//因为ajax是不刷新页面加载数据，所以每次进入页面都要先清空
			//清空table表格
			$("#tbody").empty();
			var rooms = result.extend.pageInfo.list;
			//jquery的遍历函数
			//index是索引,item是当前对象
			$.each(rooms, function(index, room) {
				//var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				//创建一个<td>元素
				//var orerId = $("<td></td>").append(order.orderid);
				//var roomNoTd = $("<td></td>").append(item.roomnumber);

				//var roomSize = "建议入住人数：" + item.size + "人";

				//indate = getDate(order.checkintime);
				//outdate = getDate(order.checkouttime);

			//	var intime = $("<td></td>").append(indate);
				//var outtime = $("<td></td>").append(outdate);

				var detail = $("<button></button>").addClass("btn btn-primary").append("入住记录");
				var detailBtn = $("<td></td>").append(detail);
				detail.attr("roomnumber",room.roomnumber);
				
				
				if(flag==1){
					var edit = $("<button></button>").addClass("btn btn-warning").append("修改信息");
					var editBtn = $("<td></td>").append(edit);
					edit.attr("roomnumber",room.roomnumber);	
				}else{
					var edit = $("<button></button>").addClass("btn btn-warning").attr("disabled","disabled").append("修改信息");
					var editBtn = $("<td></td>").append(edit);
					edit.attr("roomnumber",room.roomnumber);	
				}
	
				
				
				
				
				var roomnumber = $("<td></td>").append(room.roomnumber);
				
				
				
				var btn = $("<td></td>").append(detailBtn);
				
				
				if(room.size==1){
					var size = $("<td></td>").append("单人房");
				}else if(room.size==2){
					var size = $("<td></td>").append("标准房");
				}else{
					var size = $("<td></td>").append("豪华房");
				}
				
				if(room.book==0){
					var book = $("<td></td>").append("✓");
				}else{
					var book = $("<td></td>").append("×");
				}

				var price = $("<td></td>").append(room.price);
				
				if(room.computer==0){
					var computer = $("<p></p>").append("电脑：×");
				}else{
					var computer = $("<p></p>").append("电脑：✓");
				}
				
				if(room.garden==0){
					var garden = $("<p></p>").append("花园：×");
				}else{
					var garden = $("<p></p>").append("花园：✓");
				}
				
				if(room.freebreakfast==0){
					var freebreakfast = $("<p></p>").append("免费早餐：×");
				}else{
					var freebreakfast = $("<p></p>").append("免费早餐：✓");
				}
				
				if(room.dailyclean==0){
					var dailyclean = $("<p></p>").append("房间清洁：×");
				}else{
					var dailyclean = $("<p></p>").append("房间清洁：✓");
				}
				
				
				
				var service = $("<td></td>").append(computer).append(garden).append(freebreakfast).append(dailyclean);
				$("<tr></tr>").append(roomnumber).append(size).append(book).append(price).append(service).append(detailBtn).append(editBtn)
						.appendTo("#tbody");
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
		
	
		$(document).on("click", ".btn-warning",function(){
			//alert("编辑房间信息"+$(this).attr("roomnumber"));
			$("#editForm")[0].reset();
			//$("input").attr("checked",false);
			$("#confirm").attr("room",$(this).attr("roomnumber"));
			$("#myModal").modal({
				 backdrop : "static"
			        });
			getRoom($(this).attr("roomnumber"));
		});
		
		function getRoom(room){
			$.ajax({
				url:"${APP_PATH}/getRoom/"+room,
				type:"GET",
				success:function(result){
					//console.log(result);
					var roomData = result.extend.room;
					

					$("#inputRoom").val(roomData.roomnumber);
					$("#inputPrice").val(roomData.price);
					
					if(roomData.computer==1){
						$("#pc1_add_input").attr("checked","checked");
					}else{
						$("#pc0_add_input").attr("checked","checked");
					}
					
					if(roomData.garden==1){
						$("#garden1_add_input").attr("checked","checked");
					}else{
						$("#garden0_add_input").attr("checked","checked");
					}
					
					if(roomData.freebreakfast==1){
						$("#meal1_add_input").attr("checked","checked");
					}else{
						$("#meal0_add_input").attr("checked","checked");
					}
					
					if(roomData.dailyclean==1){
						$("#clean1_add_input").attr("checked","checked");
					}else{
						$("#clean0_add_input").attr("checked","checked");
					}
					
					if(roomData.size==1){
						$("#size1_add_input").attr("checked","checked");
					}else if(roomData.size==2){
						$("#size2_add_input").attr("checked","checked");
					}else if(roomData.size==3){
						$("#size3_add_input").attr("checked","checked");
					}
				}
			});
		}
		
		
		
		$('#myModal').on('hidden.bs.modal', function (e) {
			$("input").attr("checked",false);
			});
		
		$("#confirm").click(function() {
			//alert($("#editForm").serialize());
			
			if($("#inputPrice").val()==""){
				$("span").append("请输入价格");
				alert("请输入密码");
				return false;
			}else{
				$("span").empty();
			}
			
			$.ajax({
				url:"${APP_PATH}/updateRoom",
				type:"POST",
				data:$("#editForm").serialize(),
				success:function(result){
					//alert(result.msg);
					//1、关闭对话框
					//$("#empUpdateModal").modal("hide");
					//2、回到本页面
					//to_page(currentPage);
					if (result.code==100) {
						alert("update success");
						$("#successModal").modal({
							 backdrop : "static"
						        });
						
						//$("#modal-body").empty();
						//$("#modal-body").append($("<h2></h2>").append("已更新房间信息"));
						//$("#confirm").attr("data-dismiss","modal");
						//$("#modal-footer").empty();
					}
					
				}
			});
		})
		
				$('#successModal').on('hidden.bs.modal', function (e) {
					$('#myModal').modal('hide');
					to_page(1,name);
					
			});
		
		
		
		//=====================================================入住记录查询===============================
		//点击入住记录按钮
		$(document).on("click",".btn.btn-primary",function(){
			var name = $(this).attr("roomnumber");
			$.ajax({
				url : "${APP_PATH}/getRoomRecord",
				//参数是pn
				data : "roomnumber="+name,
				type : "POST",
				dataType : "json",
				success : function(result) {
					//alert("查询成功");
					alert("入住记录");
					build_roomRecords_table(result);
					$("#myModal2").modal({
						 backdrop : "static"
					        });
					
					
					
					
				}
			});
			
		});
		
		
		function build_roomRecords_table(result) {
			//因为ajax是不刷新页面加载数据，所以每次进入页面都要先清空
			//清空table表格
			$("#tbody2").empty();
			var orders = result.extend.orders;
			//jquery的遍历函数
			//index是索引,item是当前对象
			$.each(orders, function(index, order) {
				//var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				//创建一个<td>元素
				var orderId = $("<td></td>").append(order.orderid);
				var username = $("<td></td>").append(order.orderUsername);
				//var roomNoTd = $("<td></td>").append(item.roomnumber);
  				var realname = $("<td></td>").append(order.realname);
				//var roomSize = "建议入住人数：" + item.size + "人";
				var email = $("<td></td>").append(order.email);
				var tel = $("<td></td>").append(order.tel);
				
				if(order.addRequest==""){
					var addrequest =  $("<td></td>").append("无");
				}else{
					var addrequest =  $("<td></td>").append(order.addRequest);
				}
				var originalprice = $("<td></td>").append(order.originalprice);
				var price = $("<td></td>").append(order.price);
				if(order.discount==1){
					var discount = $("<td></td>").append("无");
				}else if(order.discount==0.9){
					var discount = $("<td></td>").append("9折");
				}else if (order.discount==0.8){
					var discount = $("<td></td>").append("8 折");
				}
				
				if(order.end==0){
					var end = $("<td></td>").append("否");
				}else{
					var end = $("<td></td>").append("是");
				}

				var orderTime = $("<td></td>").append(formatDateTime(order.orderCreatetime));
				
				var intime = $("<td></td>").append(getDate(order.checkintime));
				var outtime = $("<td></td>").append(getDate(order.checkouttime));

				var nights =  $("<td></td>").append(order.nights);
				var pernight = $("<td></td>").append(order.price/order.nights);
				
				$("<tr></tr>").append(orderId).append(username).append(realname).append(email).append(tel).append(orderTime).append(intime).append(outtime)
				.append(addrequest).append(nights).append(pernight).append(originalprice).append(discount).append(price).append(end).appendTo("#tbody2");
			});
		}
		
		
        </script>
        
        
        
    </body>
</html>



