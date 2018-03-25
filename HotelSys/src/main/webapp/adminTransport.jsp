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
                        <a class="list-group-item active">
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
                            接送服务
                        </div>
                        <div class="panel-body">
                            <nav class="navbar navbar-default">
                                <div class="container-fluid">
                                    <!-- Brand and toggle get grouped for better mobile display -->
                                    <!-- Collect the nav links, forms, and other content for toggling -->
                                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                        <form class="navbar-form navbar-left">
                                            <div class="form-group">
                                                <input class="form-control" placeholder="输入用户名或单号查找" type="text" id="searchname" 
                                                onkeyup="this.value=this.value.replace(/\s+/g,'')">
                                                </input>
                                            </div>
                                             <button class="btn btn-default" type="button" id="search_btn">
                                                查找
                                            </button>
                                            
                                            
                                            
                                         </form>
                                            <form class="navbar-form navbar-left">
                                            <button  class="btn btn-default" type="button" id="all_btn">
                                                所有预约
                                            </button>
                                            <button class="btn btn-default" type="button" id="done_btn">
                                                已完成接送
                                            </button>
                                            <button class="btn btn-default" type="button" id="notdone_btn">
                                                未安排的接送
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </nav>
                            <table class="table table-hover">
                                <thead>
                                    <tr id="tr">
                                    <td>
                                    预约用户
                                    </td>
                                        <td>
                                            订单号
                                        </td>
                                        <td>
                                            上车点
                                        </td>
                                        <td>
                                            预约时间
                                        </td>
                                        <td>
              		 人数                       
                                        </td>
                                        <td>
                                       是否完成
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
				$("#adminEdit").css("display","block");
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
				url : "${APP_PATH}/getAllTransport",
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
					build_transport_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			}); 
		}
		
		
		function build_transport_table(result) {
			//因为ajax是不刷新页面加载数据，所以每次进入页面都要先清空
			//清空table表格
			$("#tbody").empty();
			var trans = result.extend.pageInfo.list;
			//jquery的遍历函数
			//index是索引,item是当前对象
			$.each(trans, function(index, tran) {
				//var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				//创建一个<td>元素
				//var orerId = $("<td></td>").append(order.orderid);
				//var roomNoTd = $("<td></td>").append(item.roomnumber);

				//var roomSize = "建议入住人数：" + item.size + "人";

				//indate = getDate(order.checkintime);
				//outdate = getDate(order.checkouttime);

			//	var intime = $("<td></td>").append(indate);
				//var outtime = $("<td></td>").append(outdate);

				var name = $("<td></td>").append(tran.orderName);
				var orderid = $("<td></td>").append(tran.orderId);
				var location = $("<td></td>").append(tran.airport);
				var time = $("<td></td>").append(formatDateTime(tran.arrivaltime));
				var people = $("<td></td>").append(tran.people);
				
				if(tran.ok==0){
					var ok = $("<td></td>").append("未完成");
				}else if(tran.ok==1){
					var ok = $("<td></td>").append("已完成");
				}
				
				
				$("<tr></tr>").append(name).append(orderid).append(location).append(time).append(people).append(ok).appendTo("#tbody");
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
		
		$("#all_btn").click(function(){
				to_page(1,"");	
		});
		
		$("#notdone_btn").click(function(){
			
			
			to_page_done_notdone(1,"not");	
	});
		
		$("#done_btn").click(function(){
			
			
			to_page_done_notdone(1,"done");	
	});
		function to_page_done_notdone(pn,done){
 			$.ajax({
				url : "${APP_PATH}/getDoneOrNotTransport",
				//参数是pn
				data : "pn=" + pn + "&done="+done,
				type : "POST",
				dataType : "json",

				success : function(result) {
					//每页全选框初始是没选中的
					//$("#check_all").attr("checked",false);
					//result是服务器返回给浏览器的数据
					//console.log(result);
					//alert("success");
					//1、解析并显示员工数据
					build_transport_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			}); 
		}
		
		
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



