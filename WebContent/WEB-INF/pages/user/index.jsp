<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>计算机机房预约系统</title>
</head>
<body>
	<!-- 头部 -->
	<div id="top" class="row">	
			<jsp:include page="header.jsp"/>
	</div>
	<!-- 左边栏 -->
	<div id="top" class="row">
		<div class="col-xs-1 col-sm-2">
			<jsp:include page="leftNav.jsp"/>
		</div>	
	<!-- 右边栏 -->
		<div class="col-xs-8 col-sm-10">
			<jsp:include page="subscribeTable.jsp"/>
		</div>
	</div>

	<!-- 底部 -->
	<div class="col-md-12 hidden-xs hidden-sm">
		<jsp:include page="../foot.jsp"></jsp:include>
	</div>
	