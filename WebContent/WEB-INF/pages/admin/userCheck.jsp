<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<%@include file="headTools.jsp"%>
	<title>用户账号审核</title>
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
						<th>姓名</th>
						<th>邮箱</th>
						<th>职务</th>
						<th>电话</th>
						<th>用途</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${userCheckList}" var="um">
					<tr>
						<td>${um.userName}</td>
						<td>${um.userId}</td>
						<td>
							<c:if test="${um.userRole==2}">校外人员</c:if>
							<c:if test="${um.userRole==3}">教师</c:if>
							<c:if test="${um.userRole==4}">学生</c:if>
						</td>
						<td>${um.userTel}</td>
						<td>${um.userOther}</td>
						<td>${um.userStatus}</td>
						<td><a href="${um.id}/userCheck.html">待审核</a></td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
		<div id="onlyUserCheck"></div>
		<c:if test="${listNum<1}">
			<div class="alert alert-info alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
					&times;
				</button>
				暂无审核信息！
			</div>
		</c:if>
	</div>
	</div>
			
	<%-- <c:forEach items="${userCheckList}" var="um">
		姓名：${um.userName}&nbsp;&nbsp;
		邮箱：${um.userId}&nbsp;&nbsp;
		职务：
		<c:if test="${um.userRole==2}">校外人员</c:if>
		<c:if test="${um.userRole==3}">教师</c:if>
		<c:if test="${um.userRole==4}">学生</c:if>
		&nbsp;&nbsp;
		电话：${um.userTel}&nbsp;&nbsp;
		类型：${um.userOther}&nbsp;&nbsp;
		状态：${um.userStatus}&nbsp;&nbsp;
		<a href="${um.id}/userCheck.html">待审核</a>
		<br/>
		<hr/>
		<div id="onlyUserCheck"></div>
		
	</c:forEach> --%>
</body>
</html>