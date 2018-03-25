<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
    <head>
        <meta charset="utf-8">
            <meta content="IE=edge" http-equiv="X-UA-Compatible">
                <meta content="width=device-width, initial-scale=1" name="viewport">
                    <title>
                        Document
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
                                选择房间
                            </div>
                            <div class="progress-bar progress-bar-info" style="width: 25%">
                                订单信息
                            </div>
                            <div class="progress-bar progress-bar-info" style="width: 25%">
                                支付
                            </div>
                            <div class="progress-bar" style="width: 25%">
                                预约服务
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row clearfix">
                    <div class="jumbotron">
                        <h1>
                            已成功预订！
                        </h1>
                        <p>
                            您还可以预约机场接送服务
                        </p>
                        <p>
                            <a class="btn btn-primary btn-lg" href="${APP_PATH}/bookTransport" role="button">
                                预约机场接送
                            </a>
                        </p>
                    </div>
                </div>
            </br>
        </div>
    </body>
<!--     <script>
    
    </script> -->
    
    
</html>
