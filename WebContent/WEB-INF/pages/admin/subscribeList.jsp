<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="headTools.jsp"%>
	<title>已预约用户</title>
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
						<th>用户名</th>
						<th>预约机房</th>
						<th>星期</th>
						<th>节次</th>
						<th>使用时间</th>
						<th>申请原因</th>
						<th>审核状态</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${subscribeList}" var="sl">
					<tr>
						<%-- onmouseover="displayInfo(${sl.userId})" --%>
						<td>${sl.userName}</td>
						<td>${sl.subscribeRoom}</td>
						<td>${sl.subscribeWeek}</td>
						<td>${sl.subscribeNode}</td>
						<td><fmt:formatDate value="${sl.subscribeDate}" pattern="yyyy年MM月dd日"/></td>
						<td><a href="subScribeContent.html?id=${sl.id}">查看</a></td>
						<td>
							<c:if test="${sl.subscribeDate.time<now.time}">
								已失效 | <a href="deleteSubscribeYes.html?id=${sl.id}" onclick="if(confirm('确定清除该条记录？')==false) return false;">清除</a>
							</c:if>
							<c:if test="${sl.subscribeDate.time>now.time}">
								${sl.subscribeStatus} 
							</c:if>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<c:if test="${listNum<1}">
			<div class="list-group">
				<div class="alert alert-info alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
						&times;
					</button>
					暂无预约信息！
				</div>
			</div>
			</c:if>
		</div>
		<c:if test="${info!=null}">
		<div class="hidden-xs col-sm-3 nav leftNav">
		</div>
		<!-- 主体内容 -->
		<div class="personal col-sm-9 col-xs-12">
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
					&times;
				</button>
				${info}
			</div>
		</div>
		</c:if>
	</div>

</body>
</html>