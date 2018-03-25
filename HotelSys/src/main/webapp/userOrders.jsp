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
					<li class="list-group-item active">查看订单</li> 
					<a class="list-group-item" href="${APP_PATH}/serviceOrders.jsp">查看接送预订 </a>
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
									<td>入住时间</td>
									<td>退房时间</td>
									<td>订单详情</td>
									<td>退房</td>
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

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" id="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modal-title"></h4>
				</div>
				<div class="modal-body" id="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

				</div>
			</div>
		</div>
	</div>

	<!-- 退房模态框 -->
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" id="myModal1">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modal-title">退房</h4>
				</div>
				<div class="modal-body" id="modal-body1">
				<p id="p">确认退房吗</p>
				</div>
				<div class="modal-footer" id="modal-footer1">
					<button type="button" class="btn btn-default" data-dismiss="modal">不，谢谢</button>
					<button type="button" class="btn btn-success" data-dismiss="modal">是的</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 退房完成提示 -->
		<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" id="myModal2">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modal-title">退房成功</h4>
				</div>
				<div class="modal-body" id="modal-body1">
				<p id="p">已成功退房，欢迎下次光临</p>
				</div>
				<div class="modal-footer" id="modal-footer1">
					
					<button type="button" class="btn btn-default" data-dismiss="modal">好的</button>
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
			url : "${APP_PATH}/getOrders",
			//参数是pn
			data : "pn=" + pn + "&username=" + username,
			type : "POST",
			dataType : "json",

			success : function(result) {
				//每页全选框初始是没选中的
				//$("#check_all").attr("checked",false);
				//result是服务器返回给浏览器的数据
				//console.log(result);
				//alert("success");
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
		var orders = result.extend.pageInfo.list;
		//jquery的遍历函数
		//index是索引,item是当前对象
		$.each(orders, function(index, order) {
			//var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
			//创建一个<td>元素
			var orerId = $("<td></td>").append(order.orderid);
			//var roomNoTd = $("<td></td>").append(item.roomnumber);

			//var roomSize = "建议入住人数：" + item.size + "人";

			indate = getDate(order.checkintime);
			outdate = getDate(order.checkouttime);

			var intime = $("<td></td>").append(indate);
			var outtime = $("<td></td>").append(outdate);

			var detailBtn = $("<button></button>").addClass("btn btn-primary")
					.append("详细信息");
			detailBtn.attr("orderId", order.orderid);
		
			
			var btn = $("<td></td>").append(detailBtn);

			if (order.end == 0) {
				var checkout = $("<button></button>")
						.addClass("btn btn-danger").append("退房");
				var ckbtn = $("<td></td>").append(checkout);
				checkout.attr("orderId", order.orderid);
			} else if (order.end == 1) {
				var checkout = $("<button></button>").addClass(
						"btn btn-default").append("已退房").attr("disabled",
						"disabled");
				var ckbtn = $("<td></td>").append(checkout);
				//checkout.attr("orderId", order.orderid);
			}
			
			/* var info = $("<td></td>").append(
					$("<h2</h2>").append(roomSize).css("font-weight", "900"))
					.append($("<p></p>").append(gardenTd)).append(
							$("<p></p>").append(computerTd)).append(
							$("<p></p>").append(breakfastTd)).append(
							$("<p></p>").append(cleanTd)); */

			//为编辑按钮添加一个自定义的属性，来表示当前员工id
			/* 			bookBtn.prop("book-roomnumber", item.roomnumber); */

			/* 			bookBtn.attr("roomnumber", item.roomnumber);
			 bookBtn.attr("roomsize", item.size);
			 bookBtn.attr("roomprice", item.price); */

			//bookBtn.attr("id","bookBtn");
			//var btn = $("<td></td>").append("￥" + item.price).append(bookBtn);
			$("<tr></tr>").append(orerId).append(intime).append(outtime)
					.append(btn).append(ckbtn).appendTo("#tbody1");
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

	//信息信息按钮事件
	$(document).on("click",".btn.btn-primary",function() {
						var orderId = $(this).attr("orderid");
						//alert(orderId);
						
						$.ajax({
									url : "${APP_PATH}/getOrderDetail",
									//参数是pn
									data : "orderId=" + orderId,
									type : "POST",
									dataType : "json",
									success : function(result) {
										//alert("detail");
										$("#modal-title").empty();
										$("#modal-body").empty();
										$("#modal-title").empty();
										$("#modal-title").append("订单详细信息");
										var clientname = $("<p></p>")
												.append("入住登记姓名："+ result.extend.order.realname);
										var email = $("<p></p>").append("预留邮箱："+ result.extend.order.email);
										var tel = $("<p></p>").append("预留电话："+ result.extend.order.tel);
										var orderTime = $("<p></p>").append("下单时间："+ formatDateTime(result.extend.order.orderCreatetime));
										var room = $("<p></p>").append("入住房间："+ result.extend.order.orderRoom);
										var intime = $("<p></p>").append("入住时间："+ getDate(result.extend.order.checkintime));
										var outtime = $("<p></p>").append("退房时间："+ getDate(result.extend.order.checkouttime));
										var originalPrice = $("<p></p>").append("原价：RMB "+ result.extend.order.originalprice);
										if (result.extend.order.originalprice == 1) {
											var discount = $("<p></p>").append("折扣：无");
										} else if (result.extend.order.originalprice == 0.9) {
											var discount = $("<p></p>").append("折扣：9折");
										} else {
											var discount = $("<p></p>").append("折扣：8折");
										}

										var price = $("<p></p>").append("实付：RMB "+ result.extend.order.price);
										var request = result.extend.order.addRequest;
										if(request==""){
											var request1 = $("<p></p>").append("特殊要求： 无");
										}else{
											var request1 = $("<p></p>").append("特殊要求： "+ request);
										}
										
										
										$("#modal-body").append(clientname).append(email).append(tel).append(orderTime).append(room).append(intime).append(outtime)
												.append(originalPrice).append(discount).append(price).append(request1);
										
										$("#myModal").modal({
											backdrop : "static"
										});
									}
								});
	});
	
		//退房按钮事件绑定
		$(document).on("click", ".btn.btn-danger", function() {
			var orerId = $(this).attr("orderid");
			
			$(".btn.btn-success").attr("orderid", orerId);
			
			$("#myModal1").modal({
				backdrop : "static"
			});
		});
		
		//确认退房
		$(document).on("click", ".btn.btn-success", function() {
			var orderId = $(this).attr("orderid");
			$.ajax({
				url : "${APP_PATH}/checkout",
				data : "orderId=" + orderId,
				type : "POST",
				dataType : "json",
				success : function(result) {
					//alert("已成功退房");
				$("#myModal2").modal({
				 backdrop : "static"
			        });
					
				}
			});
		});
		
		
		$('#myModal2').on('hidden.bs.modal', function () {
			document.location.reload();
			});
		

</script>


</html>
