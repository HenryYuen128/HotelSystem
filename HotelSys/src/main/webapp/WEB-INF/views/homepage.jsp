<%@page import="java.awt.event.ItemEvent"%>
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
	<link href="assets/bootstrap/checkboxcss/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
		<link rel="stylesheet" href="assets/bootstrap/checkboxcss/font-awesome.min.css"/>
    <link rel="stylesheet" href="assets/bootstrap/checkboxcss/build.css"/>
    <link href="assets/bootstrap/checkboxcss/flat/blue.css" rel="stylesheet">
    <link href="assets/bootstrap/checkboxcss/square/blue.css" rel="stylesheet">
    
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js">
	
</script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js">
	
</script>
<script
	src="assets/bootstrap/checkboxcss/icheck.js">
	
</script>
<script
	src="assets/bootstrap/checkboxcss/custom.min.js">
	
</script>
</link>
</meta>
</meta>
</meta>

<!-- 百度地图 -->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=cdHKjleRh4XtXaRREzQWYZdYEHu69wuC"></script>
		
		<style>
		#l-map{height:300px;width:100%;}
		#r-result{width:100%;}
		
		#allmap {height:300px;width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";z-index: 1070}
		
		</style>

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
						<li class="active" role="presentation"><a href="#"> 房间信息
						</a></li>


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
							type="button" >
							<%=session.getAttribute("username")%>
							<span class="caret"> </span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="editUserInfo.jsp"> 修改账号信息 </a></li>
							<li><a href="userOrders.jsp"> 订单记录 </a></li>
							<li><a href="serviceOrders.jsp"> 查看接送预订 </a></li>
							<li class="divider" role="separator"></li>
							<li><a href="ClientLogin.jsp"> 注销 </a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<hr />
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox" style="height: 60%">
						<div class="item active">
							<img src="${APP_PATH }/image/welcome.jpg" alt="...">
							<!-- <div class="carousel-caption">...</div> -->
						</div>
						<div class="item">
							<img src="${APP_PATH }/image/welcome1.jpg" alt="...">
							<!-- <div class="carousel-caption">...</div> -->
						</div>
						<div class="item">
							<img src="${APP_PATH }/image/welcome2.jpg" alt="...">
							<!-- <div class="carousel-caption">...</div> -->
						</div>

					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			</div>
			<hr/>
			<div class="row clearfix" >
			<form id="conditions">
				
					<div class="col-md-3 column">
						<h4>房间类型</h4>
						<label> <input name="single" id="single" type="checkbox"
							value="0"> 单人房 </input>
						</label>
						 <label style="margin-left: 5%"> <input name="couples" id="couples"
							type="checkbox" value="0"> 标准房 </input>
						</label> 
						<label style="margin-left: 5%"> <input name="luxury" id="luxury" type="checkbox"
							value="0"> 豪华房 </input>
						</label>
					</div>
					<div class="col-md-4">
						<h4>设施和服务</h4>
						<label>
						 	
							<input type="checkbox" name="garden"
							id="garden" value="0"> 露台花园 </input>
							
						</label>
						<label style="margin-left: 3%"> <input type="checkbox" name="computer"
							id="computer" value="0"> 电脑 </input>
						</label>
						 <label style="margin-left: 3%"> <input type="checkbox" name="breakfast"
							id="breakfast" value="0"> 免费早餐 </input>
						</label>
						 <label style="margin-left: 3%"> <input type="checkbox" name="clean" id="clean"
							value="0"> 房间清洁 </input>
						</label>
					</div>

					<div class="col-md-3 column">
						<!-- <h4>Price</h4> -->
						<!-- <br> -->

						<div class="col-md-4">
							<h4>价格</h4>
							<input name="fromprice" class="form-control"
								id="fromprice" placeholder="￥0.00" style="width: 80px;"
								type="text"> </input>
						</div>

						<div class="col-md-1 column">
							<br />
							<center>
								<h2>~</h2>
							</center>
						</div>
						<div class="col-md-1 column">
						<br/>
						<br/>
							 <input name="toprice"
								class="form-control" id="toprice" placeholder="￥0.00"
								style="width: 80px;" type="text"
								oninput='this.value=this.value.replace(/^[0]+[0-9]*$/gi,"")'
								maxlength="5"> </input>
						</div>
						<div class="col-md-6 column"></div>

					</div>

					<div class="col-md-2 column">
						<br> <br>
						<button class="btn btn-primary" type="button" id="search_btn">查找</button>
						<input name="pn" type="hidden" value="1"></input></br> </br>
					</div>

				
			</form>
		</div>

		<hr>
		<div class="row clearfix">
		
			<!-- 百度地图API -->
			<div class="col-md-4 column">
				<div class="row">
					<div class="col-md-3 col-md-offset-2">
						<input id="map" name="submit" type="image" value="" src="image/map.png" /></div>
					<div class="col-md-7"></div>
				</div>
				<div class="row">
							<b><h4 style="font-family:YouYuan;font-weight: bold;margin-left: 19%">-点击发现酒店周边好去处-</h4></b>
				</div>
			</div>
			
			<!-- 表格 -->
			<div class="col-md-8 column">
				<div class="row">
					<table class="table table-hover">
						<thead>
							<tr>
								<td><h4>房间预览</h4></td>
								<td><h4>房间信息</h4></td>
								<td></td>
							</tr>
						</thead>
						<tbody id="tbody1">
						</tbody>
					</table>
				</div>
				<hr />
				<div class="row">
					<!--分页文字信息  -->
					<div class="col-md-6" id="page_info_area"></div>
					<!-- 分页条信息 -->
					<div class="col-md-6" id="page_nav_area"></div>
				</div>
			</div>
		</div>
		</hr>
	</div>

<!-- Modal -->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="myModal">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
<div id="allmap" style="height: 400px"></div>
<hr/>
<form class="form-inline">
<div class="form-group">
<input id="keyword" class="form-control" type="text" placeholder="搜索你感兴趣的地点"></input>
     </div>
<button id="searchPOI" type="button" class="btn btn-default">查找</button>
 
      </form>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>





<!-- JS代码------------------------------------------------------------------------------------------------------- -->
	<script type="text/javascript">
	
	$('input').iCheck({
		 checkboxClass: 'icheckbox_square-blue',
		    //radioClass: 'iradio_square-red',
		    increaseArea: '20%' // optional
		});
	
	var totalRecord, currentPage;
	//点击预订按钮跳转
$(document).on("click",".btn.btn-info",function(){
	//alert($(this).attr("roomnumber"));
	var roomnumber = $(this).attr("roomnumber");
	//alert($(this).attr("roomsize"));
	var roomsize = $(this).attr("roomsize");
	var roomprice = $(this).attr("roomprice");
	document.write("<form action=${APP_PATH}/orderInfo method=post name=form1 style='display:none'>");  
						document.write("<input type=hidden name=roomnumber value='"+roomnumber+"'/>");
						document.write("<input type=hidden name=roomsize value='"+roomsize+"'/>");
						document.write("<input type=hidden name=roomprice value='"+roomprice+"'/>");  
						document.write("</form>");  
						document.form1.submit();  
});
	
	

	//====================================================首页查询所有房间、分页条======================================	
var username = "<%=session.getAttribute("username")%>";
		//加载页面后马上发送ajax请求
		$(function index() {
			//alert("123");
			//去查询结果的第一页

			$.ajax({
				url : "${APP_PATH}/updateUserType",
				data : "username=" + username,
				type : "POST",
				success : function(result) {
					alert("已更新用户等级");
				}
			});

			to_page(1);

		});

		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/rooms",
				//参数是pn
				data : "pn=" + pn,
				type : "GET",
				dataType : "json",
				contentType : "application/json",
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
					
					//mapApi();
				}
			});
		}

		function build_rooms_table(result) {
			//因为ajax是不刷新页面加载数据，所以每次进入页面都要先清空
			//清空table表格
			$("#tbody1").empty();
			var rooms = result.extend.pageInfo.list;
			//jquery的遍历函数
			//index是索引,item是当前对象
			$.each(rooms,
					function(index, item) {
						//var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
						//创建一个<td>元素
						var image = $("<img></img>").attr("src",
								"${APP_PATH }/image/" + item.pic);
						var roompic = $("<td></td>").append(image).attr("width","45%");
						//var roomNoTd = $("<td></td>").append(item.roomnumber);
						if (item.size == 1) {
							var roomSize = "单人间";
						} else if (item.size == 2) {
							var roomSize = "双人间";
						} else
							var roomSize = "豪华套房";
						//var roomSize = "建议入住人数：" + item.size + "人";
						var gardenTd = item.garden == 1 ? "露台花园：√" : "露台花园：×";
						var computerTd = item.computer == 1 ? "电脑：√" : "电脑：×";
						var breakfastTd = item.freebreakfast == 1 ? "免费早餐：√"
								: "免费早餐：×";
						var cleanTd = item.dailyclean == 1 ? "房间清洁：√"
								: "房间清洁：×";

						var info = $("<td></td>").append(
								$("<h2</h2>").append(roomSize).css(
										"font-weight", "900")).append(
								$("<p></p>").append(gardenTd)).append(
								$("<p></p>").append(computerTd)).append(
								$("<p></p>").append(breakfastTd)).append(
								$("<p></p>").append(cleanTd));

						var bookBtn = $("<button></button>").addClass(
								"btn btn-info").append("预订").css("margin-left",
								"15px");

						//为编辑按钮添加一个自定义的属性，来表示当前员工id
						/* 			bookBtn.prop("book-roomnumber", item.roomnumber); */

						bookBtn.attr("roomnumber", item.roomnumber);
						bookBtn.attr("roomsize", item.size);
						bookBtn.attr("roomprice", item.price);

						//bookBtn.attr("id","bookBtn");
						var btn = $("<td></td>").append("￥" + item.price)
								.append(bookBtn);

						$("<tr></tr>").append(roompic).append(info).append(btn)
								.appendTo("#tbody1");
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
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
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

			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
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
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {

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

		//条件查询==============================================================================================================
		$("#search_btn").click(function() {
			//改变value的值
			checked("#single");
			checked("#couples");
			checked("#luxury");

			checked("#garden");
			checked("#computer");
			checked("#breakfast");
			checked("#clean");

			// alert($("#conditions").serializeArray());
			// var a = $("#conditions").serializeArray();
			// alert(a);
			//  alert(a);
			/* 	    var single = $("#single").val();
			 var couples = $("#couples").val();
			 var luxury = $("#luxury").val();
			
			 var garden = $("#garden").val();
			 var computer = $("#computer").val();
			 var breakfast = $("#breakfast").val();
			 var clean = $("#clean").val();
			
			 var  fromprice = $("#fromprice").val();
			 var  toprice = $("#toprice").val();
			 */
			/* 		var a = {
			 "single" : single,
			 "couples" : couples,
			 "luxury" : luxury,
			 "garden" : garden,
			 "computer" : computer,
			 "breakfast" : breakfast,
			 "clean" : clean,
			 "fromprice" : fromprice,
			 "toprice" : toprice	
			 }; */
			var pn = 1;

			//alert(fromprice);
			//alert(a);
			//alert(fromprice);
			//alert(toprice); 

			$.ajax({
				url : "${APP_PATH}/findrooms",
				//参数是pn
				xhrFields : {
					withCredentials : true
				},
				crossDomain : true,
				data : $("#conditions").serialize(),
				type : "POST",
				dataType : "json",
				//contentType : "application/json",
				success : function(result) {

					//result是服务器返回给浏览器的数据

					alert("ConSuccess");
					//1、解析并显示房间数据
					build_rooms_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			});
		});

		function checked(ele) {
			if ($(ele).is(':checked')) {
				//alert("被选中");
				$(ele).val(1);
				//alert($(ele).val());
				//alert($('#garden1').val());
			} else {
				$(ele).val(0);
			}
		}
		
		
		
		$("#map").click(function() {
			//mapApi();
			$("#keyword").val("");
		$('#myModal').modal({
				  backdrop:true
				});
		setTimeout(function () {
	        mapApi();
	     } ,1000 * 0.5);
		});
		

		
		
 			function mapApi(){
 				window.map = new BMap.Map("allmap");
 				window.point = new BMap.Point(113.37623,23.108498);
 				
 				var marker = new BMap.Marker(point);  // 创建标注
 				map.addOverlay(marker);               // 将标注添加到地图中
 				marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
 
 				map.centerAndZoom(point,17);
 				map.enableScrollWheelZoom(true);
 				
 				// 用经纬度设置地图中心点
 				function theLocation(){
 					if(document.getElementById("longitude").value != "" && document.getElementById("latitude").value != ""){
 						map.clearOverlays(); 
 						var new_point = new BMap.Point(document.getElementById("longitude").value,document.getElementById("latitude").value);
 						var marker = new BMap.Marker(new_point);  // 创建标注
 						map.addOverlay(marker);              // 将标注添加到地图中
 						map.panTo(new_point);      
 					}
 				}
 				
 				
 				
			}

 			
			//查找POI
			function searchPOI(point,keyword,map){
				//map.clearOverlays();
				//remove_overlay();
/* 				var marker = new BMap.Marker(point);  // 创建标注
				map.addOverlay(marker);               // 将标注添加到地图中
				marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画 */
				map.clearOverlays();
				
				var marker = new BMap.Marker(point);  // 创建标注
 				map.addOverlay(marker);               // 将标注添加到地图中
 				marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
				
				var circle = new BMap.Circle(point,1000,{fillColor:"blue", strokeWeight: 1 ,fillOpacity: 0.3, strokeOpacity: 0.3});
			    map.addOverlay(circle);
			    var local =  new BMap.LocalSearch(map, {renderOptions: {map: map, autoViewport: false}});  
			    local.searchNearby(keyword,point,1000);
			}
 			
			$("#searchPOI").click(function() {
				var keyword = $("#keyword").val();
				searchPOI(point,keyword,map);
			});
 			
	</script>



</body>
</html>



