<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="headTools.jsp"%>
	<title>添加课程--选择机房</title>
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
			<div class="list-group">
				<h4><a href="javascript:void(0)" class="list-group-item active">添加课程 -- 机房选择  <span class="glyphicon glyphicon-chevron-down"></a></h4>
			</div>
			<c:forEach items="${roomNames}" var="rn">
				<div class="list-group">
					<c:if test="${rn.roomStatus==1}">
					<a href="toCourseAdd.html?name=${rn.roomName}" style="background:#BCD2EE" class="list-group-item"> <span class="glyphicon glyphicon-ok-circle"></span> ${rn.roomName}</a>
					</c:if>
					<c:if test="${rn.roomStatus==2}">
					<a href="javascript:void(0)" title="机房维护中" style="background:#cccccc" class="list-group-item"> <span class="glyphicon glyphicon-ban-circle"></span> ${rn.roomName}  <span class="glyphicon glyphicon-wrench"></span> -- 机房维护中</a>
					</c:if>
				</div>
			</c:forEach>
			
		</div>
	</div>
	<%-- <c:forEach items="${roomNames}" var="rn">
		机房名称：<a href="toCourseAdd.html?name=${rn.roomName }">${rn.roomName}</a><br/>
	</c:forEach> --%>
</body>
</html>