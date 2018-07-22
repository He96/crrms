<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="headTools.jsp"%>
	<title>添加公告</title>
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
	.personal{
		margin-top: 20px;
	}
</style>
<body>
	<div class="container-fluid body">
		<!-- 头部 -->
		<div id="top" class="row nav">
			<div class="col-xs-12">
				<%@include file="../user/header.jsp" %>
			</div>
		</div>
		<div class="row">
		<!-- 左边 -->
		<div class="col-xs-12 col-sm-3 nav leftNav">
			<jsp:include page="leftNav.jsp"/>
		</div>
		<!-- 主体内容 -->
		<div class="personal col-sm-9 col-xs-12">
			<form action="addBulletin.html" role="form" class="form-horizontal" method="post">
				<div class="form-group">
					<label for="bulletinTitle" class="col-xs-4 col-sm-2 control-label">标题：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control" name="bulletinTitle" id="bulletinTitle"/>
					</div>
				</div>
				<div class="form-group">
					<label for="bulletinContent" class="col-xs-4 col-sm-2 control-label">内容：</label>
					<div class="col-sm-6 col-xs-12">
						<textarea rows="4" cols="18" id="bulletinContent" name="bulletinContent"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-4 col-sm-2 control-label"></label>
					<div class="col-sm-6 col-xs-12">
						<button type="submit" id="sub" class="btn btn-primary form-control" >公告添加</button>
					</div>
				</div>
			</form>
		</div>
		</div>
	</div>
	<!-- <form action="addBulletin.html">
		标题：<input name="bulletinTitle"/><br/>
		内容：<textarea rows="4" cols="18" name="bulletinContent">
			</textarea>
		<input type="submit" value="添加"/>
	</form> -->
</body>
</html>