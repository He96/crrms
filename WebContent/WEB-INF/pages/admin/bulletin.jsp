<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
		
			<c:if test="${listNum<1}">
			<div class="list-group">
				<div class="alert alert-info alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
						&times;
					</button>
					暂无公告信息！
				</div>
			</div>
			</c:if>
			<div class="list-group">
				<h4><a href="javascript:void(0)" class="list-group-item active">公告栏</a></h4>
				<c:forEach items="${bulletinList}" var="bl">
				<h4>
				<%-- <a href="javascript:void(0)" class="list-group-item">
					标题：${bl.bulletinTitle }
					<small>——<fmt:formatDate value="${bl.bulletinDate}" pattern="yyyy年MM月dd日"/>
					</small>
					<br/>
					<hr/>
					<br/>&nbsp;&nbsp;${bl.bulletinContent }
				</a> --%>
				<a href="javascript:void(0)" class="list-group-item">
				<h4 class="list-group-item-heading">${bl.bulletinTitle }<small>——<fmt:formatDate value="${bl.bulletinDate}" pattern="yyyy年MM月dd日"/></small></h4>
					<p class="list-group-item-text">
						${bl.bulletinContent }
					</p>
				</a>
				</h4>
				<a onclick="if(confirm('确定删除该公告?')==false)return false;" href="deleteBulletin.html?id=${bl.id}"><button class="btn btn-danger btn-xs">删除</button></a>
				</c:forEach>
			</div>
			<div class="list-group">
				<a class="list-group-item-text" href="toAddBulletin.html"><button class="btn btn-info">添加公告</button></a>
			</div>
		</div>
	</div>
</body>
</html>