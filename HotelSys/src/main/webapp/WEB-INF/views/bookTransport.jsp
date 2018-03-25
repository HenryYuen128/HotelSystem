<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1" name="viewport">
<title>Document</title>

<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css"
	rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="assets/bootstrap/css/bootstrap-select.min.css">
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" media="all"
	href="assets/datetimepicker/daterangepicker.css" />
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js">
	
</script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js">
	
</script>

<script src="assets/bootstrap/js/bootstrap-select.min.js"></script>
<!-- <script src="assets/bootstrap/js/i18n/defaults-*.min.js"></script> -->
<script type="text/javascript" src="assets/datetimepicker/moment.js"></script>
<script type="text/javascript"
	src="assets/datetimepicker/daterangepicker.js"></script>

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
		<div class="row clearfix" style="margin-top: 20px">
			<div class="col-md-8 column">
				<div class="col-md-4 column">
					<a href="${APP_PATH }/homepage">
						<img src="image/logo.jpg">
					</a>
				</div>
				<div class="col-md-8 column">
					<ul class="nav nav-pills">
						<li  role="presentation"><a href="${APP_PATH}/homepage"> 房间 </a></li>
						<li class="active" role="presentation"><a href="#"> 机场接送 </a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-4 column">
				<!-- <div class="col-md-6 column"><p style="margin-right: 20px">test</p></div>
                    <div class="col-md-6 column" > -->
				<div class="col-md-3 col-md-offset-9">
					<div class="btn-group">
						<button aria-expanded="false" aria-haspopup="true"
							class="btn btn-danger dropdown-toggle" data-toggle="dropdown"
							type="button">
							<%=session.getAttribute("username")%>
							<span class="caret"> </span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="editUserInfo.jsp"> 修改账号信息 </a></li>
							<li><a href="UserOrdersInfo"> 订单记录 </a></li>
							<li class="divider" role="separator"></li>
							<li><a href="#"> 退出 </a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<hr />
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="jumbotron">
						<h1>Hello, world!</h1>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Panel title</h3>
					</div>
					<div class="panel-body">
						<div class="row clearfix">
							<div class="col-md-6 column">
								
									<div>
										<label> 上车机场 </label>
									</div>
									<div>
										<select id="airport" class="selectpicker">
											<option>广州白云机场，1号航站楼</option>
											<option>广州白云机场，2号航站楼</option>
											<option>广州白云机场，3号航站楼</option>
											<option>广州白云机场，4号航站楼</option>
											<option>广州白云机场，5号航站楼</option>

										</select>
									</div>
									<div style="float: left;">
										<div>
											<label> 下机时间 </label>
										</div>
										<div>
											<input type="text" id="arrivalTime" class="form-control">
										</div>
									</div>

									<div class="clear" style="float: left; margin-left: 6%">
										<div>
											<label> 人数 </label>
										</div>
										<div>
											<select id="people" class="selectpicker">
												<option>1</option>
												<option>2</option>
												<option>4</option>
												<option>5</option>
												<option>6</option>
												<option>7</option>
												<option>8</option>
											</select>

										</div>
									</div>
								

								<div style="clear: both;"></div>
								<br>
								<div style="margin-left: 37%">
									<button class="btn btn-primary" id="confirm">确认</button>
								</div>
								</br>
							</div>
							<div class="col-md-6 column" style="background-color: yellow">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 确认订单信息模态框 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="confirmInfo" aria-labelledby="mySmallModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header" id="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" >
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">请确认预订信息</h4>
				</div>
				<div class="modal-body" id="modal-body">
					
				</div>
				<div class="modal-footer" id="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal" id="cancel">取消</button>
					<button type="button" class="btn btn-primary" id="save">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->




</body>
<script type="text/javascript">
	$('#people').selectpicker({
		style : 'btn-default',
		size : 7,
		width : "auto"
	});

	$('#people').on('changed.bs.select', function(e) {
		alert($('#people').val());
		//alert($("#arrivalTime").val());
	});

	$('#airport').selectpicker({
		style : 'btn-default',
		size : 7,
		width : "47%"
	});

	$('#airport').on('changed.bs.select', function(e) {
		alert($('#airport').val());
		//alert($("#arrivalTime").val());
	});

	//获取当前时间
	var myDate = new Date();
	var curDate = myDate.toLocaleDateString();

	$('#arrivalTime')
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
	

	
	$("#confirm").click(function(){
		$("#confirmInfo").modal({
			backdrop:"static"
		});
		//$("#modal-body")[0].reset();
		$("<p></p>").append("上车地点："+$('#airport').val()).appendTo("#modal-body");
		$("<p></p>").append("上车时间："+$('#arrivalTime').val()).appendTo("#modal-body");
		$("<p></p>").append("人数："+$('#people').val()+"人").appendTo("#modal-body");
	});
	//模态框确认按钮
	$("#save").click(function(){
		//$("#modal-body").empty();
		var orderId = '<%=session.getAttribute("orderId")%>';
		var airport = $('#airport').val();
		var arrivalTime = $('#arrivalTime').val();
		var people = $('#people').val();
		$.ajax({
			url : "${APP_PATH}/transportOrder",
			data : "orderId="+orderId+"&airport="+airport+"&arrivalTime="+arrivalTime+"&people="+people,
			type : "POST",
			dataType : "json",
			//contentType : "application/json",
			success : function(result) {
				alert("预定成功");
				$("#modal-header").empty();
				$("#modal-body").empty();
				$("#modal-footer").empty();
				$("<h4></h4>").append("信息").appendTo("#modal-header");
				$("<p></p>").append("预定成功").appendTo("#modal-body");
				$("<button></button>").addClass("btn btn-primary").append("返回首页").attr("id", "toHomepage").appendTo("#modal-footer");
			}
		});
	});
	
	//模态框取消按钮
	$("#cancel").click(function(){
		$("#modal-body").empty();
	});
	
	$(".close").click(function(){
		$("#modal-body").empty();
	});
	
	$(document).one("click","#toHomepage", function() {
		location.href="${APP_PATH}/homepage";
	})
</script>



</html>