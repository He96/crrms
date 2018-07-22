<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="headTools.jsp"%>
	<title>新增机房</title>
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
		<!-- 主体内容 -->
		<div class="personal col-sm-12 col-xs-12">
			<form id="addRoom" role="form" class="form-horizontal" action="addRoom.html" method="post">
				<div class="form-group">
					<label for="roomName" class="col-xs-4 col-sm-2 control-label">机房名称：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="roomName" id="roomName" value="任美福楼" />
					</div>
				</div>
				<div class="form-group">
					<label for="roomSeat" class="col-xs-4 col-sm-2 control-label">机房容量：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="roomSeat" id="roomSeat" value="64" />
					</div>
				</div>
				<div class="form-group">
					<label for="roomStatus" class="col-xs-4 col-sm-2 control-label">机房状态：</label>
					<div class="col-sm-6 col-xs-12">
						<select size="1" class="form-control bg" name="roomStatus">
							<option value="1">机房正常</option>
							<option value="2">机房不可用</option>
					   </select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-4 col-sm-2 control-label"></label>
					<div class="col-sm-6 col-xs-12">
						<button type="submit" id="sub" class="btn btn-primary form-control" >确定添加</button>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-4 col-sm-2 control-label"></label>
					<div class="col-sm-6 col-xs-12">
						<button type="button" onClick='javascript :history.go(-1);' class="btn btn-info form-control" >返回</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- <form action="addRoom.html" method="post">
		机房名称：<input name="roomName"/><br/>
		机房容量：<input name="roomSeat"/><br/>
		机房状态：<select size="1" name="roomStatus">
					<option value="1">机房正常</option>
					<option value="2">机房不可用</option>
			   </select><br/>
		<input type="submit" value="提交"/>
	</form> -->
</body>
</html>