<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="headTools.jsp" flush="true"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/static/dist/css/bootstrapValidator.css"/> 
<title>密码修改</title>
<style type="text/css">
body{
	background:linear-gradient(to right,#f3f4f3,#bdbdbd);
}
#top{
	border: #c23933 solid;
	border-width: 2px 0px 2px 0px;
	margin: 0 auto;
	background: #fafafa;
}
#left dl dd button {
	width: 100px;
	height:40px;
	background: #9d1e18;
	border:none;
	border-radius: 0;
}
.row{
	width: 100%;	
}
p img{
	width: 100%;
	height: 400px;

}
#personals{
	margin-top: 10px;
}
</style>
</head>
<body>
	<!-- 头部 -->
	<div id="top" class="row nav">
		<div class="col-xs-12">
			<%@include file="header.jsp" %>
		</div>
	</div>
	
	<!-- 左侧 -->
	<div id="main_top" class="row">
		<div id="left" class="col-xs-3 col-sm-3">
			<dl>
				<dd>
					<button class="btn btn-info">
						<span class="glyphicon glyphicon-th-list"></span> 菜单
					</button>
				</dd>
				<dd><jsp:include page="leftNav.jsp"/></dd>
			</dl>
		</div>
	</div>
	<div class="col-md-4 hidden-xs"></div>
	<div class="col-md-6 col-xs-12">
		<form id="registerForm" role="form" class="form-horizontal" action="updateUserPwd.html" method="post">
			<div class="form-group">
				<label for="userPwd" class="col-xs-4 col-sm-2 control-label">旧密码：</label>
				<div class="col-sm-6 col-xs-12">
					<input class="form-control bg" type="password" name="userPwd" id="userPwd"/>
				</div>
				<label id="pwdInfo" class="col-xs-4 col-sm-2 control-label"></label>
			</div>
			<div class="form-group">
				<label for="newsUserPw" class="col-xs-4 col-sm-2 control-label">新密码：</label>
				<div class="col-sm-6 col-xs-12">
					<input class="form-control bg" name="newsUserPw" id="newsUserPw" type="password"/>
				</div>
			</div>
			<div class="form-group">
				<label for="newsUserPwd" class="col-xs-4 col-sm-2 control-label">重复密码：</label>
				<div class="col-sm-6 col-xs-12">
					<input class="form-control bg" name="newsUserPwd" id="newsUserPwd" type="password"/>
					<input type="hidden" name="id" value="${user.id}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-xs-2 control-label"></label>
				<div class="col-sm-6 col-xs-12">
					<button type="submit" id="sub" class="btn btn-primary form-control" >修改密码</button>
				</div>
				<input name="pwd" id="pwd" type="hidden"value="${user.userPwd}"/>
				<input id="info" type="hidden"value="${string}"/>
			</div>
		</form>
			
	</div>
	<script type="text/javascript" src="<%=request.getContextPath() %>/static/js/user/updatePwd.js" ></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/static/dist/js/bootstrapValidator.js"></script>
</body>
</html>