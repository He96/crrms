<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="机房预约管理系统" content="机房,预约,管理"  charset="utf-8">
	<link rel="icon" type="image/x-icon" href="static/images/computer.ico" />
	<link rel="stylesheet" href="static/css/bootstrap.min.css" />
	<link rel="stylesheet" href="static/dist/css/bootstrapValidator.css"/>
	<link rel="stylesheet" href="static/css/forgetPw.css" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>机房预约系统--忘记密码</title>
</head>
<body>
	<div id="row1">
		<h4>忘记密码</h4>
	</div>
	<div>
	<div class="hidden-xs col-sm-4"></div>
		<form role="form" id="forgetForm">
			<div class="col-md-4 col-xs-12">
				<div class="form-group ">
					<label for="username">姓名：</label>
					<input type="text" class="form-control" name="userName" id="username" 
						   placeholder="请输入您的姓名">
				</div>
				<div class="form-group">
					<label for="userId">邮箱：</label>
					<input type="email" class="form-control" name="userId" id="userId" 
						   placeholder="请输入邮箱号">
					<span id="info"></span>
				</div>
				<div class="form-group">
                       <label id="checkInfo"></label>
                       <input type="text" class="form-control" name="captcha"  placeholder="相加结果"  />
                 </div>
                 <div class="form-group">
					<button id="submit" type="submit" class="btn form-control btn-info">提交</button>
					  <label id="resultInfo"></label>
				</div>
			</div>
		</form>
	</div>
	<div id="foot" class="hidden-sm hidden-xs">
		<jsp:include page="foot.jsp"/>
	</div>
	<script type="text/javascript" src="static/js/jquery-3.1.1.min.js" ></script>
	<script type="text/javascript" src="static/js/bootstrap.min.js" ></script>
    <script type="text/javascript" src="static/dist/js/bootstrapValidator.js"></script>
	<script type="text/javascript" src="static/js/forgetPw.js" ></script>
</body>
</html>