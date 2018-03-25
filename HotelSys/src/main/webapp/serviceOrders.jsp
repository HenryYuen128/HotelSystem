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
		<div class="row clearfix" style="margin-top: 3%">
			<div class="col-md-3">
				<div class="list-group">
					<a class="list-group-item" href="${APP_PATH}/editUserInfo.jsp">
						账号信息 </a>
					<a class="list-group-item" href="${APP_PATH}/userOrders.jsp">
						查看订单 </a>
					<li class="list-group-item active">查看接送预订</li> 
				</div>
			</div>
			<div class="col-md-9">
				<div class="panel panel-primary">
					<div class="panel-heading">修改个人信息</div>
					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<td>订单编号</td>
									<td>上车点</td>
									<td>预约时间</td>
									<td>人数</td>
								</tr>
							</thead>
							<tbody id="tbody1">

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



</body>

<script type="text/javascript">
var username = "<%=session.getAttribute("username")%>";
	//加载页面后马上发送ajax请求
	$(function index() {
		//alert("123");
		//去查询结果的第一页
		to_page(1);

	});

	function to_page(pn) {
		$.ajax({
			url : "${APP_PATH}/getTransportOrders",
			//参数是pn
			data : "pn=" + pn + "&username=" + username,
			type : "POST",
			dataType : "json",

			success : function(result) {
				//每页全选框初始是没选中的
				//$("#check_all").attr("checked",false);
				//result是服务器返回给浏览器的数据
				//console.log(result);
				alert("success");
				//1、解析并显示员工数据
				build_orders_table(result);
				//2、解析并显示分页信息
				build_page_info(result);
				//3、解析显示分页条数据
				build_page_nav(result);
			}
		});
	}

	//时间戳转换日期
	/* 	function getDate(nS) {     
	 return new Date(parseInt(nS) * 1000).toLocaleString().substr(0,17)
	 };   */

	function getDate(nS) {

		//return new Date(parseInt(("/Date("+nS+")/").substr(6, 13))).toLocaleDateString();
		return new Date(nS).toLocaleDateString();
	}

	function build_orders_table(result) {
		//因为ajax是不刷新页面加载数据，所以每次进入页面都要先清空
		//清空table表格
		$("#tbody1").empty();
		var services = result.extend.pageInfo.list;
		//jquery的遍历函数
		//index是索引,item是当前对象
		$.each(services, function(index, service) {
			//var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
			//创建一个<td>元素
			var orerId = $("<td></td>").append(service.orderId);
			var location = $("<td></td>").append(service.airport);
			var arrivalTime = $("<td></td>").append(formatDateTime(service.arrivaltime));
			var people = $("<td></td>").append(service.people);
			
			$("<tr></tr>").append(orerId).append(location).append(arrivalTime)
			.append(people).appendTo("#tbody1");
			
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
				to_page(1);
			});
			prePageLi.click(function() {
				to_page(result.extend.pageInfo.pageNum - 1);
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
				to_page(result.extend.pageInfo.pageNum + 1);
			});
			lastPageLi.click(function() {
				to_page(result.extend.pageInfo.pages);
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
				to_page(item);
			});
			ul.append(numLi);
		});
		//添加下一页和末页 的提示
		ul.append(nextPageLi).append(lastPageLi);

		//把ul加入到nav
		var navEle = $("<nav></nav>").append(ul);
		navEle.appendTo("#page_nav_area");
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

	

	
		
		

</script>


</html>
