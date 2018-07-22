<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="headTools.jsp" flush="true"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/static/js/user/updatePersonal.js" ></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/static/dist/css/bootstrapValidator.css"/> 
<title>个人资料修改</title>
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

<!-- 中部-->
	<div class="col-md-4 hidden-xs"></div>
		<div class="col-md-5 col-xs-12">
			<form id="registerForm" role="form" class="form-horizontal" action="updatePersonal.html" method="post">
				<div class="form-group">
					<label for="userName" class="col-xs-4 col-sm-2 control-label">姓名：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" readonly value="${user.userName}"/>
					</div>
				</div>
				<div class="form-group">
					<label for="userTel" class="col-xs-4 col-sm-2 control-label">电话：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="userTel" id="userTel" value="${user.userTel}"/>
					</div>
				</div>
				<div class="form-group">
					<label for="userId" class="col-xs-4 col-sm-2 control-label">邮箱：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="userId" id="userId" value="${user.userId}"/>
					</div>
				</div>
				<div class="form-group">
					<label for="userOther" class="col-xs-4 col-sm-2 control-label">用途：</label>
					<div class="col-xs-12 col-sm-4">
						<select size="1" id="userOther" name="userOther" class="form-control">
							<option value="授课">授课</option>
							<option value="考试" selected>考试</option>
							<option value="培训">培训</option>
							<option value="选课">选课</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 control-label"></label>
					<div class="col-sm-6 col-xs-12">
						<button type="submit" id="sub" class="btn btn-primary form-control" >修改信息</button>
					</div>
					<input name="id" type="hidden"value="${user.id}"/>
					<input id="info" type="hidden"value="${string}"/>
				</div>
				<div class="form-group">
					<div class="alert alert-info alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
							&times;
						</button>
						*友情提示！邮箱号修改后，以前邮箱号的预约信息将不再同步到新邮箱预约列表。
					</div>
				</div>
			</form>
		</div>
	<%-- <form action="updatePersonal.html" method="post">
		姓名：<input name="userName" readonly value="${user.userName}"/><br/>
		电话：<input name="userTel" value="${user.userTel}"/><br/>
		邮箱：<input name="userId" value="${user.userId}"/><br/>
		用途：<select size="1" id="users" name="userOther">
				<option value="授课">授课</option>
				<option value="考试">考试</option>
				<option value="培训">培训</option>
				<option value="选课">选课</option>
			</select><br />
		<input name="id" type="hidden"value="${user.id}"/>
		<input type="submit" value="提交"/>
	</form> --%>
 <script type="text/javascript" src="<%=request.getContextPath() %>/static/dist/js/bootstrapValidator.js"></script>
</body>
</html>