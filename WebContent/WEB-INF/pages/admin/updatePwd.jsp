<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="headTools.jsp" flush="true"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/static/dist/css/bootstrapValidator.css"/> 
<title>密码修改</title>
<style type="text/css">
	.body{
		margin: 0px;
		padding: 0px;
	}
	#top{
		border: #000 solid;
		border-width: 2px 0px 2px 0px;
		margin: 0 auto;
		background: #fafafa;
	}
	.row{
		width:100%;
	}
	.personal{
		margin-top: 20px;
	}
</style>
</head>
<body>
	<div class="container-fluid body">
		<!-- 头部 -->
		<div id="top" class="row nav">
			<div class="col-xs-12">
				<%@include file="../user/header.jsp" %>
			</div>
		</div>
		<!-- 左边 -->
		<div class="col-xs-12 col-sm-3 nav leftNav">
			<jsp:include page="leftNav.jsp"/>
		</div>
		<!-- 主体内容 -->
		<div class="personal col-sm-9 col-xs-12">
		<form id="updatePwd" role="form" class="form-horizontal" action="updateUserPwd.html" method="post">
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
					<input type="hidden" name="id" value="${user.id}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-xs-2 control-label"></label>
				<div class="col-sm-6 col-xs-12">
					<button type="submit" id="sub" class="btn btn-primary form-control" >修改密码</button>
				</div>
				<input name="pwd" id="pwd" type="hidden"value="${user.userPwd}"/>
				<input id="info" type="hidden" value="${string}"/>
			</div>
		</form>
		</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath() %>/static/js/admin/updatePwd.js" ></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/static/dist/js/bootstrapValidator.js"></script>
</body>
</html>