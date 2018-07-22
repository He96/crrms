<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../user/headTools.jsp"%>
<link rel="stylesheet" href="static/dist/css/bootstrapValidator.css"/> 
<title>修改个人信息</title>
</head>
<style type="text/css">
	*{
	}
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
	.update{
		margin-top: 20px;
	}
</style>
<body>
<div class="container-fluid body">
		<!-- 头部 -->
		<div id="top" class="row nav">
			<div class="col-xs-12">
				<%@include file="../user/header.jsp"%>
			</div>
		</div>
		<!-- 左边 -->
		<div class="col-xs-12 col-sm-3 nav leftNav">
			<jsp:include page="leftNav.jsp"/>
		</div>
		<!-- 主体内容 -->
		<div class="update col-sm-9 col-xs-12">
			<form id="updateForm" role="form" class="form-horizontal" action="updatePersonal.html" method="post">
				<div class="form-group">
					<label for="userName" class="col-xs-4 col-sm-2 control-label">姓名：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="userName" id="userName" value="${user.userName}" />
					</div>
				</div>
				<div class="form-group">
					<label for="userTel" class="col-xs-4 col-sm-2 control-label">电话：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="userTel" id="userTel" value="${user.userTel}" />
					</div>
				</div>
				<div class="form-group">
					<label for="userId" class="col-xs-4 col-sm-2 control-label">邮箱：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="userId" id="userId" value="${user.userId}" />
					</div>
				</div>
				<div class="form-group">
					<label for="userOther" class="col-xs-4 col-sm-2 control-label">授权码：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="userOther" id="userOther" value="${user.userOther}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 control-label"></label>
					<div class="col-sm-6 col-xs-12">
						<button type="submit" id="sub" class="btn btn-primary form-control" >确定修改</button>
						<input name="id" type="hidden"value="${user.id}"/>
						<input id="info" type="hidden"value="${string}"/>
					</div>
				</div>
				<div class="form-group">
					<div class="alert alert-info alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
							&times;
						</button>
						*暂只开放163、126、新浪邮箱的信息发送功能,消息接收方无邮箱限制！
						授权码由管理员根据自己邮箱开启相应POP3/SMTP服务获得。有任何疑问请致电17089490559。
					</div>
				</div>
				</form>
			</div>
		</div>	
	
  <script type="text/javascript" src="static/dist/js/bootstrapValidator.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath() %>/static/js/admin/updatePersonal.js" ></script>
</body>
</html>