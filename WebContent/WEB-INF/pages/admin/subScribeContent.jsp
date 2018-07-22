<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="headTools.jsp"%>
	<title>计算机机房管理系统</title>
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
		<!-- 左边 -->
		<div class="hidden-xs col-sm-3"></div>
		<!-- 主体内容 -->
		<div class="personal col-sm-6 col-xs-12">
			<div class="list-group">
				<h4><a href="javascript:void(0)" class="list-group-item active">机房预约申请书</a></h4>
				<a href="javascript:void(0)" class="list-group-item">${content}</a>
			</div>
			<div class="list-group">
				<a href="javascript:void(0)" onClick='javascript :history.go(-1);' class="list-group-item"><button class="btn btn-info">返回</button></a>
			</div>
		</div>
		<div class="hidden-xs col-sm-3"></div>
	</div>
</body>
</html>