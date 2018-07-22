<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
	<%@include file="headTools.jsp"%>
	<title>用户管理</title>
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
						<th>用户</th>
						<th>邮箱</th>
						<th>职务</th>
						<th>电话</th>
						<th>类型</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${userList}" var="um">
					<tr>
						<td><a href="${um.id}/onlyUser.html">${um.userName}</a></td>
						<td>${um.userId}</td>
						<td>
							<c:if test="${um.userRole==2}">校外人员</c:if>
							<c:if test="${um.userRole==3}">教师</c:if>
							<c:if test="${um.userRole==4}">学生</c:if>
						</td>
						<td>${um.userTel}</td>
						<td>${um.userOther}</td>
						<td>${um.userStatus}</td>
						<td><a href="deleteUser.html?id=${um.id}" onclick="if(confirm('确定删除该用户?')==false)return false;"><button class="btn btn-warning">删除</button></a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<c:if test="${listNum<1}">
					<div class="alert alert-info alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
							&times;
						</button>
						暂无用户信息！
					</div>
				</c:if>
			<ul class="pagination">
				
				<!-- <li class="active"><a href="#">1</a></li>
				<li class="disabled"><a href="#">2</a></li>
				<li><a href="#">3</a></li> -->
				 <c:if test="${IntPage==1}">
            	<li class="disabled"><a href="javascript:void(0)">&laquo;</a></li>      
	       		 </c:if>
 				<c:if test="${IntPage!=1}">
				<li><a href="userList.html?page=${IntPage-1}">&laquo;</a></li>
				</c:if>
				<c:forEach begin="1" end="${pageNum}" varStatus="status">
					<c:if test="${IntPage==status.index}">
						<li class="active"><a href="javascript:void(0)">${status.index}</a></li>
					</c:if>
					<c:if test="${IntPage!=status.index}">
						<li class=""><a href="userList.html?page=${status.index}">${status.index}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${IntPage<pageNum}">
				<li><a href="userList.html?page=${IntPage+1}">&raquo;</a></li>
				</c:if>
				
				<c:if test="${IntPage==pageNum}">
				<li class="disabled"><a href="javascript:void(0)">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
		
	</div>
	<%-- <c:forEach items="${userList}" var="um">
		用户：<a href="${um.id}/onlyUser.html">${um.userName}</a>&nbsp;&nbsp;
		邮箱：${um.userId}&nbsp;&nbsp;
		职务：
		<c:if test="${um.userRole==2}">校外人员</c:if>
		<c:if test="${um.userRole==3}">教师</c:if>
		<c:if test="${um.userRole==4}">学生</c:if>
		&nbsp;&nbsp;
		电话：${um.userTel}&nbsp;&nbsp;
		类型：${um.userOther}&nbsp;&nbsp;
		状态：${um.userStatus}&nbsp;&nbsp;
		<br/>
		<hr/>
		<div id="onlyUser">
			
		</div>
		
	</c:forEach> --%>
</body>
</html>