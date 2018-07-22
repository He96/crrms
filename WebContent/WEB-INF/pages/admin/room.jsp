<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="headTools.jsp"%>
	<title>机房管理</title>
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
		<div class="col-xs-12 col-sm-3 nav leftNav">
			<jsp:include page="leftNav.jsp"/>
		</div>
		<!-- 主体内容 -->
		<div class="personal col-sm-9 col-xs-12">
			<table class="table table-hover table-striped">
				<thead>
					<tr>
						<th>机房</th>
						<th>座位数</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${roomList}" var="rm">
					<tr>
						<td>${rm.roomName}</td>
						<td>${rm.roomSeat}</td>
						<td> 
							<c:if test="${rm.roomStatus==1}">机房正常</c:if>
		 					 <c:if test="${rm.roomStatus==2}">机房不可用</c:if>
		 				</td>
						<td>
							<a href="deleteRoom.html?id=${rm.id}" title="慎选！" onclick="if(confirm('确定删除机房?')==false)return false;" ><button class="btn btn-warning btn-sm">删除</button></a>
							 <span class="glyphicon glyphicon-transfer"></span>
							 <c:if test="${rm.roomStatus==1}">
							 	<a href="roomStatus.html?id=${rm.id}&status=2" onclick="if(confirm('确定禁用机房?')==false)return false;"><button class="btn btn-info btn-sm">禁用</button></a>
							 </c:if>
		 					 <c:if test="${rm.roomStatus==2}">
								<a href="roomStatus.html?id=${rm.id}&status=1" onclick="if(confirm('确定开启机房?')==false)return false;"><button class="btn btn-success btn-sm">开启</button></a>
							</c:if>
						</td>
					</tr>
					</c:forEach>
				</tbody>	
		</table>
	</div>
	<div class="col-xs-12 col-sm-3 nav"></div>
	<div class="personal col-sm-9 col-xs-12">
		<a href="toAddRoom.html" class="list-group-item"><button class="btn btn-success">新增机房</button></a>
		<hr/>
	</div>
</div>
	<%-- <c:forEach items="${roomList}" var="rm">
		机房：<a href="toUpdateRoom.html?id=${rm.id}">${rm.roomName}</a>
		座位数：${rm.roomSeat}
		 状态：
		 <c:if test="${rm.roomStatus==1}">机房正常</c:if>
		 <c:if test="${rm.roomStatus==2}">机房不可用</c:if>
		 操作：<a href="deleteRoom.html?id=${rm.id}">删除机房</a>
		<br/>
	</c:forEach>
	<a href="toAddRoom.html">机房添加</a> --%>
</body>
</html>