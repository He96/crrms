<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="机房预约管理系统" content="机房,预约,管理"  charset="utf-8">
		 <meta name="renderer" content="webkit">
		<link rel="icon" type="image/x-icon" href="static/images/computer.ico" />
		<link rel="stylesheet" href="static/css/bootstrap.min.css" />
		<link rel="stylesheet" href="static/css/login.css" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script type="text/javascript" src="static/js/jquery-3.1.1.min.js" ></script>
		<script type="text/javascript" src="static/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="static/js/login.js" ></script>
		<title>机房预约系统</title>
	</head>
<body>
	<header>
		<div id="logo">
			<img src="static/images/logo_school.png" ></img>
		</div>
		<h2>工学院计算机机房预约管理系统</h2>
	</header>
	<!-- <marquee id="affiche" align="left" behavior="scroll" direction="left" hspace="50" vspace="20" loop="1" scrollamount="6" scrolldelay="100" onMouseOut="this.start()" onMouseOver="this.stop()">
		友情提示！360客户端浏览器用户地址栏把'兼容模式'改为'极速模式'会给您带来更好的体验。
	</marquee> -->
	<article>
			<form role="form" action="loginCheck.html" method="post">
				<div id="tips"></div>
				<div class="userInput form-group">
					<img class="infoInput" src="static/images/user.png" />
					<input name="username" id="username" maxlength="25" autocomplete="off" placeholder="邮箱号/手机号"/>
				</div>
				<div class="userInput form-group">
					<img class="infoInput" src="static/images/pass.png" />
					<input name="password" id="password" type="password" autocomplete="off" maxlength="20" placeholder="请输入密码"/>
				</div>
				<div id="reginfo">
					<a  href="forgetPw.php">忘记密码</a>&nbsp;&nbsp;
					<a  href="goRegister.html">账号申请</a>
				</div>
				<div class="userInput form-group">
					<input type="submit" id="submit" value="登录"/>
				</div>
				<input type="hidden" id="loginInfo" value="${string}"/>
			</form>
	</article>
	<!-- 弹窗提示 -->
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">警告！</h4>
				</div>
				<div id="infoCon" class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" 
							data-dismiss="modal">关闭
					</button>
				</div>
			</div>
		</div>
	</div>
	<div id="foot" class="hidden-sm hidden-xs">
		<jsp:include page="foot.jsp"/>
	</div>
</body>
</html>