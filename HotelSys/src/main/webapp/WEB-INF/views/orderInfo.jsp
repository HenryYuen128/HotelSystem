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

<link rel="stylesheet" href="assets/datetimepicker/dist/daterangepicker.min.css">
<script type="text/javascript" src="assets/datetimepicker/dist/moment.min.js"></script>

<script type="text/javascript" src="assets/datetimepicker/dist/jquery.daterangepicker.min.js"></script>
</link>
</meta>
</meta>
</meta>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<script type="text/javascript">

var username = "<%=session.getAttribute("username")%>";
var roomnumber = "<%=request.getAttribute("roomnumber")%>";
var roomsize = "<%=request.getAttribute("roomsize")%>";
var attrPrice = "<%=request.getAttribute("roomprice")%>";
var roomprice = parseFloat(attrPrice);

	$(function() {

		//去首页
		//alert(username);
		$.ajax({
			url : "${APP_PATH}/getUserType",
			//参数是pn
			data : "username=" + username,
			type : "POST",
			dataType : "json",
			success : function(result) {
				$("#panelheading").css("display", "block");
				$("#panelbody").css("display", "block");
				$("#continue").css("display", "block");
				
				//每页全选框初始是没选中的
				//alert("FindType");
				var userType = result.extend.userType;

				//alert(discount);
				$("#roomnumber").append("房间号：" + roomnumber);
				//打折信息
				if (userType == 0) {
					$("#discount").append("无");
					window.discount = 1;
				} else if (userType == 1) {
					$("#discount").append("9折");
					window.discount = 0.9;
				} else {
					$("#discount").append("8折");
					window.discount = 0.8;
				}

				//房间信息
				if (roomsize == 1) {
					$("#detailRoomType").append("1x单人房");
					$("#detailRoomCapacity").append("1名成人和一名儿童(0~12岁)");
					$("#detailRoomSquare").append("15平米");
				} else if (roomsize == 2) {
					$("#detailRoomType").append("1x标准房")
					$("#detailRoomCapacity").append("两名成人和两名儿童(0~12岁)");
					$("#detailRoomSquare").append("30平米");
				} else {
					$("#detailRoomType").append("1x豪华房")
					$("#detailRoomCapacity").append("四名成人和四名儿童(0~12岁)")
					$("#detailRoomSquare").append("60平米");
				}
				
				$("#pricePerNight").append("RMB "+roomprice);
				$("#actualPrice").append("RMB "+accMul(roomprice,discount));
			}
		});
	});
	//校验姓名
	function validate_name(ele){
		var name = $(ele).val();
		//查jquery的api中的正则表达式
		var regName = /^[a-zA-Z\u4e00-\u9fa5]+$/;
		if(!regName.test(name)||name==""){
			
			show_validate_msg(ele, "error", "格式不正确");
			$(ele).attr("name-check", "no");
			return false;
		}else{
			show_validate_msg(ele, "success", "");
			$(ele).attr("name-check", "yes");
			return true;
		};
	};
	
	
	//校验手机号
	function validate_tel(){
		var tel = $("#inputTel").val();
		//查jquery的api中的正则表达式
		var regName = /^[0-9]+$/;
		if(!regName.test(tel)||tel==""){
			//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
			show_validate_msg("#inputTel", "error", "请输入正确的手机号");
			$("#inputTel").attr("tel-check", "no");
			return false;
		}else{
			show_validate_msg("#inputTel", "success", "");
			$("#inputTel").attr("tel-check", "yes");
			return true;
		};
	};
	
	//校验邮箱信息
	function validate_email(){
		var email = $("#inputEmail").val();
		//alert(email)
		var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if(!regEmail.test(email)||email==""){
			//alert("邮箱格式不正确");
			//应该清空这个元素之前的样式
			show_validate_msg("#inputEmail", "error", "邮箱格式不正确");
			$("#inputEmail").attr("email-check","no");
			/* $("#email_add_input").parent().addClass("has-error");
			$("#email_add_input").next("span").text("邮箱格式不正确"); */
			return false;
		}else{
			show_validate_msg("#inputEmail", "success", "");
			$("#inputEmail").attr("email-check","yes");
		}
		return true;
	}
	
	//校验卡号
	function validate_cardnumber(){
		var number = $("#numberInput").val();
		//查jquery的api中的正则表达式
		var regName = /^[0-9]+$/;
		if(!regName.test(number)||number==""){
			//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
			show_validate_msg("#numberInput", "error", "请输入正确的卡号");
			$("#numberInput").attr("number-check", "no");
			return false;
		}else{
			show_validate_msg("#numberInput", "success", "");
			$("#numberInput").attr("number-check", "yes");
			return true;
		};
	};
	
	//校验cvc码
	function validate_cvc(){
		var cvccode = $("#cvccode").val();
		//alert(email)
		//var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if(cvccode==""){
			//alert("邮箱格式不正确");
			//应该清空这个元素之前的样式
			show_validate_msg("#cvccode", "error", "请输入CVC码");
			$("#cvccode").attr("cvc-check","no");
			/* $("#email_add_input").parent().addClass("has-error");
			$("#email_add_input").next("span").text("邮箱格式不正确"); */
			return false;
		}else{
			show_validate_msg("#cvccode", "success", "");
			$("#cvccode").attr("cvc-check","yes");
		}
		return true;
	}
	
	//校验验证码
	function validate_code(){
		var code = $("#code").val();
		//alert(email)
		//var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if(code==""){
			//alert("邮箱格式不正确");
			//应该清空这个元素之前的样式
			show_validate_msg("#code", "error", "请输入验证码");
			$("#code").attr("code-check","no");
			/* $("#email_add_input").parent().addClass("has-error");
			$("#email_add_input").next("span").text("邮箱格式不正确"); */
			return false;
		}else{
			show_validate_msg("#code", "success", "");
			$("#code").attr("code-check","yes");
		}
		return true;
	}
	
	function validate_paytel(){
		var tel = $("#paytel").val();
		//alert(email)
		//var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if(tel==""){
			//alert("邮箱格式不正确");
			//应该清空这个元素之前的样式
			show_validate_msg("#paytel", "error", "请输入正确的手机号");
			$("#paytel").attr("tel-check","no");
			/* $("#email_add_input").parent().addClass("has-error");
			$("#email_add_input").next("span").text("邮箱格式不正确"); */
			return false;
		}else{
			show_validate_msg("#paytel", "success", "");
			$("#paytel").attr("tel-check","yes");
		}
		return true;
	}
	
	function show_validate_msg(ele,status,msg){
		//清除当前元素的校验状态
		$(ele).parent().removeClass("has-success has-error");
		//next("span")紧跟的span元素
		$(ele).next("span").text("");
		if("success"==status){
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
		}else if("error" == status){
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
		}
	}
	
	$(document).on("change","#inputEmail",function(){
			//alert($('#date-range25').val());
		validate_email();
	
		});
		
	$(document).on("change","#inputTel",function(){
		//alert($('#date-range25').val());
	validate_tel();
	});
	
	
	$(document).on("change","#inputName",function(){
		//alert($('#date-range25').val());
	validate_name("#inputName");
	});
	
	$(document).on("change","#datepicker",function(){
		//alert($('#date-range25').val());
	$("#datepicker").attr("date-check","yes");
	});
	
	//支付选择界面
	$(document).on("change","#holdernameInput",function(){
		//alert($('#date-range25').val());
	validate_name("#holdernameInput");
	});
	
	$(document).on("change","#code",function(){
		//alert($('#date-range25').val());
	validate_code();
	});
	
	$(document).on("change","#cvccode",function(){
		//alert($('#date-range25').val());
	validate_cvc();
	});
	
	$(document).on("change","#numberInput",function(){
		//alert($('#date-range25').val());
		validate_cardnumber();
	});
	
	
	//点击按钮局部刷新
	$(document).on("click","#continue",function(){
		//alert($('#date-range25').val());
		var namecheck = $("#inputName").attr("name-check");
		var telcheck = $("#inputTel").attr("tel-check");
		var emailcheck = $("#inputEmail").attr("email-check");
		var datecheck = $("#datepicker").attr("date-check");
		//alert(namecheck);
		if (namecheck=="yes"&&telcheck=="yes"&&emailcheck=="yes"&&datecheck=="yes") {
			$("#panelheading").css("display", "none");
			$("#panelbody").css("display", "none");
			$("#continue").css("display", "none");
			
			
			$("#confirmpay").css("display", "block");
			$("#back").css("display", "block");
			$("#paymethod").css("display", "block");
			$("#paypanelbody").css("display", "block");
			
			$("#orderInfoBar").addClass("progress-bar-info");
			$("#payBar").removeClass("progress-bar-info");
		}else {
			if ($("#inputEmail").val()=="") {
				show_validate_msg("#inputEmail", "error", "邮箱格式不正确");
			}
			if ($("#inputName").val()=="") {
				show_validate_msg("#inputName", "error", "请输入姓名");
			}
			if ($("#inputTel").val()=="") {
				alert("???");
				show_validate_msg("#inputTel", "error", "请输入手机号");
			}
			if (datecheck=="no") {
				$("#helpblock").text("请选择日期");
			}
		}

	});

			
	$(document).on("click","#back",function() {
				$("#confirmpay").css("display", "none");
				$("#back").css("display", "none");
				$("#paymethod").css("display", "none");
				$("#paypanelbody").css("display", "none");
				
				$("#panelheading").css("display", "block");
				$("#panelbody").css("display", "block");
				$("#continue").css("display", "block");
				
				$("#orderInfoBar").removeClass("progress-bar-info");
				$("#payBar").addClass("progress-bar-info");

			});
		
	$(document).on("click","#confirmpay",function() {
				var cvccheck = $("#cvccode").attr("cvc-check");
				var numbercheck = $("#numberInput").attr("number-check");
				var namecheck = $("#holdernameInput").attr("name-check");
				var codecheck = $("#code").attr("code-check");
				var telcheck = $("#paytel").attr("tel-check");
				if(cvccheck=="yes"&&numbercheck=="yes"&&namecheck=="yes"&&codecheck=="yes"&&telcheck=="yes"){
						//发送Post请求生成订单
						//alert($("#inputTel").val());
						var realname = $("#inputName").val();
						//alert($("#inputName").val());
						var email = $("#inputEmail").val();
						var tel = $("#inputTel").val();
						var addRequest = $("#inputAddRequest").val();

/* 						$.ajax({
							url:"${APP_PATH}/generateOrder",
							data:"username="+username+"&realname="+realname+"&email="+email+"&tel="+tel+
							"&addRequest="+addRequest+"&roomnumber="+roomnumber+"&startDate="+startDate+
							"&nights="+nights+"&endDate="+endDate+"&originalPrice="+originalPrice+
							"&discount="+discount+"&lastPrice="+lastPrice,
							type: "POST",
							success:function(){
								alert("已生成订单");
							}
						}); */
						
						

						$.post({
							url:"${APP_PATH}/generateOrder",
							data:"username="+username+"&realname="+realname+"&email="+email+"&tel="+tel+
							"&addRequest="+addRequest+"&roomnumber="+roomnumber+"&startDate="+startDate+
							"&nights="+nights+"&endDate="+endDate+"&originalPrice="+originalPrice+
							"&discount="+discount+"&lastPrice="+lastPrice,
							success:function(result){
								alert("post 请求");
							location.href="${APP_PATH}/orderComplete.jsp";
							}
						});
				}
				else {
					if(cvccheck=="no"){ validate_cvc();}
					if(numbercheck=="no"){ validate_cardnumber();}
					if(namecheck=="no"){ validate_name("#holdernameInput");}
					if(codecheck=="no"){ validate_code();}
					if(telcheck=="no"){ validate_paytel();}
				}
			});
			
	
		
	function accMul(arg1, arg2) {
	    if (isNaN(arg1)) {
	        arg1 = 0;
	    }
	    if (isNaN(arg2)) {
	        arg2 = 0;
	    }
	    arg1 = Number(arg1);
	    arg2 = Number(arg2);
	    
	    var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
	    try {
	        m += s1.split(".")[1].length;
	    }
	    catch (e) {
	    }
	    try {
	        m += s2.split(".")[1].length;
	    }
	    catch (e) {
	    }
	    return Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m);
	}
	
	
	
</script>


</head>
<body>

	<div class="container">
		<div class="row clearfix">
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
		<br>
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="progress">
					<div class="progress-bar progress-bar-info " style="width: 25%">
						选择房间</div>
					<div class="progress-bar" style="width: 25%" id="orderInfoBar">订单信息</div>
					<div class="progress-bar progress-bar-info"  id="payBar" style="width: 25%">
						支付</div>
					<div class="progress-bar progress-bar-info " style="width: 25%">
						预约服务</div>
				</div>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-8 column" id="leftdiv">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">入住房间信息</h3>
					</div>
					<div class="panel-body">
						<div class="col-md-6">
							<h5 id="roomnumber"></h5>

							
								<h5>
									入住日期和退房时间：
								</h5>
								<form class="form-inline">
									<input class="form-control" id="datepicker" size="23"  
									placeholder="年-月-日 到 年-月-日" date-check="no" date-check="no"></input>
									<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
								</form>
								<span id="helpblock" class="help-block"></span>
								<div id="divnights">
								</div>
							

							<!-- <h5 id="nights">入住晚数：</h5> -->
						</div>

						<div class="col-md-6"></div>
					</div>
				</div>
				<!--个人信息填写板块-->
				<div class="panel panel-primary" id="personInfo">
				<!-- 原本隐藏 -->
					<div class="panel-heading" style="display: none;" id="panelheading">
						<h3 class="panel-title">个人信息</h3>
					</div>
					
					<div class="panel-heading" style="display: none;" id="paymethod">
						<h3 class="panel-title">付款方式（银行卡支付或扫描QR code使用支付宝支付）</h3>
						
					</div>
					
					<div class="panel-body" id="panelbody" style="display: none;">
							<!--姓名输入框-->
							<div class="form-group">
								<label  for="inputWarning1"> 姓名 </label> 
								<input
									class="form-control" id="inputName" type="text"
									name-check = "no"> 
									</input>
									<span class="help-block"></span>
							</div>
							<!--Email输入框-->
							<div class="form-group">
								<label for="exampleInputEmail1"> Email address </label> <input
									class="form-control" id="inputEmail"
									placeholder="Email" type="email" email-check="no"> </input>
									<span class="help-block"></span>
							</div>
							<!--电话号码输入框-->
							<div class="form-group">
								<label  for="inputWarning1"> 电话号码 </label>
								<input class="form-control" id="inputTel" type="text" tel-check="no">
								</input>
								<span class="help-block"></span>
							</div>
							<!--额外需求填写框-->
							<div>
								<!--额外需求框-->
								<button aria-controls="collapseExample" aria-expanded="false"
									class="btn btn-primary" data-target="#collapseExample"
									data-toggle="collapse" type="button">特殊要求</button>
								<div class="collapse" id="collapseExample">
									<div class="well">

										<div>
											<label> 请输入您的特别要求，我们会尽快联络您 </label>
										</div>
										<div id="textArea">
											<input class="form-control" id="inputAddRequest" type="text">
											</input>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 支付信息 -->
						<div class="panel-body" id="paypanelbody" style="display: none;">
							<div class="col-md-6">
							<!-- 支付方式选择 -->
							<div class="form-group">
								<button class="btn btn-default" id="alipay">支付宝支付</button>
								<button class="btn btn-default" id="wechatpay">微信支付</button>
								<button class="btn btn-default" id="cradintro">银行卡支付指南</button>
							</div>	
							
							
							<!--卡号输入框-->
								<div class="form-group">
									<label  for="inputWarning1"> 银行卡号 </label> 
									<input
									class="form-control" id="numberInput" type="text"
									number-check = "no" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"> 
									</input>
									<span class="help-block"></span>
								</div>	
							<!-- 持卡人姓名 -->		
								<div class="form-group">
								<label  for="inputWarning1"> 姓名 </label> 
								<input
									class="form-control" id="holdernameInput" type="text"
									name-check = "no"> 
									</input>
									<span class="help-block"></span>
								</div>
							<!--CV码输入框-->
								<div class="form-group">
								<label  for="inputWarning1"> CVC码 </label>
								<input class="form-control" id="cvccode" type="text" cvc-check="no" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" placeholder="yy/MM" maxlength="4">
								</input>
								<span class="help-block"></span>
								</div>
							<!-- 手机号 -->
							<div class="form-group">
								<label  for="inputWarning1">手机号 </label>
								<input class="form-control" id="paytel" type="text" tel-check="no" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" maxlength="11">
								</input>
								<span class="help-block"></span>
								<button class="btn btn-default">发送验证码</button>
								</div>	
								
							<!--验证码码输入框-->
								<div class="form-group">
									<label  for="inputWarning1"> 验证码 </label>
									<input class="form-control" id="code" type="text" code-check="no" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" maxlength="4">
									</input>
									<span class="help-block"></span>
								</div>	
															
							</div>
								
							<div class="col-md-6">
									<div id="aliimg">
									   <img src="image/alipay.png"></img>
									</div>
									
									<div style="display: none" id="wechatimg">
										<img src="image/wechatpay.png"></img>
									</div>
								</div>
															
							</div>

						</div>
						
						<div class="row clearfix">
							<div class="col-md-2 col-md-offset-7" id="backdiv" >
								<button id="back" class="btn btn-danger" style="display: none;">重写信息</button>
							</div>
							<div class="col-md-3" id="goPay" >
								<button id="continue" class="btn btn-primary" style="display: none;">去支付</button>
								<button id="confirmpay" class="btn btn-primary" style="display: none;">确认付款</button>
								
							</div>
						</div>
					</div>					
				
			<!--右侧面板-->
			<div class="col-md-4 column">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row clearfix">
							<div class="col-md-4 column">
								<center>
									<h4>
										<b> 入住时间 </b>
									</h4>
								</center>
								<center>
									<label> 12:00后 </label>
								</center>
							</div>
							<div class="col-md-4 column">
								<center>
									<h2>></h2>
								</center>
							</div>
							<div class="col-md-4 column">
								<center>
									<h4>
										<b> 退房时间 </b>
									</h4>
								</center>
								<center>
									<label> 14:00前 </label>
								</center>
							</div>
						</div>
						<hr />
						<div id="roomDetail">
							<div class="row clearfix">
								<div class="col-md-4">
									<p>房型：</p>
									<p>人数限制：</p>
									<p>客房面积：</p>
								</div>
								<div class="col-md-8">
									<p id="detailRoomType"></p>
									<p id="detailRoomCapacity"></p>
									<p id="detailRoomSquare"></p>
								</div>
							</div>
						</div>
						<hr>
						<div class="row clearfix" style="margin-top: 5%">
							<div class="col-md-3">
								 <p>原价</p> 
								<p>优惠</p>
								<hr />
								<p>应付</p>
							</div>
							<div id="pricedetail" class="col-md-9">
								<div id="originalTotalPrice">
									<p class="text-right" id="pricePerNight"></p>
								</div>
								
								<p class="text-right" id="discount"></p>
								<hr />
								<div id="finalPrice">
								<p class="text-right" id="actualPrice"></p>
								</div>
								
							</div>
						</div>
						</hr>
					</div>
				</div>
			</div>
		</div>
		</br>
	</div>
				

<div class="modal fade" tabindex="-1" role="dialog" id="cardModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">银行卡CVC码</h4>
      </div>
      <div class="modal-body">
        <img src="image/card.png"></img>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">我知道了</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
						
					

					
	
	<script type="text/javascript">
	
	function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + seperator1 + month + seperator1 + strDate;
        return currentdate;
    }
	
	$("#datepicker").dateRangePicker(
			{
				selectForward: true,
				language:"auto",
				startDate:getNowFormatDate(),
				separator:"到",
				autoClose: true,
				customTopBar: "请选择入住时间和退房时间",
				getValue: function()
	{	
		return $(this).val()
	}
			});
	
/* 	function displayProp(obj){      
        var names="";         
        for(var name in obj){         
           names+=name+": "+obj[name]+", ";    
        }    
        alert(names);    
    }   */
	
	
	$("#datepicker").bind('datepicker-closed',function()
			{//alert($("#datepicker").val());
			var inoutdate = $("#datepicker").val();
			if(inoutdate==""){
				//alert("请选择日期");
				$("#helpblock").text("请选择日期");
				$("#datepicker").attr("date-check", "no");
				$("#divnights").empty();}
			else {
				$("#datepicker").attr("date-check", "yes");
				$.ajax({
					url : "${APP_PATH}/inoutdate",
					//参数是pn
					data : "inoutdate=" + inoutdate,
					type : "POST",
					dataType : "json",
					success : function(result) {
						//alert("datesuccess");
							//alert("datesuccess");
							$("#helpblock").text("");
							$("#divnights").empty();
							$("#originalTotalPrice").empty();
							$("#finalPrice").empty();
							window.nights = result.extend.inOutDateInfo.nights;
							window.startDate = result.extend.inOutDateInfo.checkindate;
							window.endDate = result.extend.inOutDateInfo.checkoutdate;
							//alert(startDate);
							//alert(endDate);
							if (nights==0) {
								$("<h5></h5>").append("入住晚数：1晚(不足一晚按一晚收费)").appendTo("#divnights");
								$("<p></p>").addClass("text-right").append("RMB "+roomprice+"/晚").appendTo("#originalTotalPrice");
								$("<p></p>").addClass("text-right").append("RMB "+((roomprice*discount)*100)/100).appendTo("#finalPrice");
								nights=1;
								window.originalPrice = nights*roomprice;
								window.lastPrice = nights*roomprice*discount;
							}else {
								$("<h5></h5>").append("入住晚数："+nights+"晚").appendTo("#divnights");
								$("<p></p>").addClass("text-right").append("RMB "+nights*roomprice+"("+nights+"晚*"+roomprice+"/晚)").appendTo("#originalTotalPrice");
								$("<p></p>").addClass("text-right").append("RMB "+((nights*roomprice*discount)*100)/100).appendTo("#finalPrice");
								window.originalPrice = nights*roomprice;
								window.lastPrice = nights*roomprice*discount;
							}
					}
				});
			}
			
		
	});
    
    $("#alipay").click(function() {
    	$("#wechatimg").css("display", "none");
    	$("#aliimg").css("display", "block");
    });
	
    $("#wechatpay").click(function() {
    	$("#aliimg").css("display", "none");
    	$("#wechatimg").css("display", "block");
    	
    });
		
	$("#cradintro").click(function() {
		$('#cardModal').modal({
			  backdrop:"static"
			})
	});
		
		
	</script>



</body>
</html>



