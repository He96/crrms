<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	#userImg {
		width: 500px;
		height: 500px;
		background: #fefefe;
		perspective: 900px;
		margin:50px auto;
	}
	.userImg{position: absolute;top: 50%;
		left: 50%;
		width: 400px;
		height: 540px;
		margin: -220px 0 0 -100px;
		background: url(lanrenzhijia.jpg) 0 0  no-repeat;
		background-size:200px 340px;
		box-shadow: -7px 10px 10px #333;
		transform: rotateX(60deg) rotateY(3deg) rotateZ(-25deg);
		-webkit-transform: rotateX(60deg) rotateY(3deg) rotateZ(-25deg);
		-moz-transform: rotateX(60deg) rotateY(3deg) rotateZ(-25deg);
		transform-origin:50% 50%;
		-webkit-transform-origin:50% 50%;
		-moz-transform-origin:50% 50%;
		transition: all 1s;
		-moz-transition: all 1s;
		-webkit-transition: all 1s;
	}
	#userImg:hover .userImg {
	transform: rotate3d(0, 0, 0, 0deg);
	-webkit-transform: rotate3d(0, 0, 0, 0deg);
	-moz-transform: rotate3d(0, 0, 0, 0deg);
	box-shadow: -100px 100px 20px #fff;
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
			<div class="row">
			<div class="col-sm-2 hidden-xs nav leftNav">
			</div>
			<!-- 主体内容 -->
			<div class="personal col-sm-9 col-xs-12">	
				<div class="list-group">
				<h4><a href="javascript:void(0)" class="list-group-item active">用户资料</a></h4>
				<h4><a href="javascript:void(0)" class="list-group-item">姓名：${onlyUserCheck.userName}</a></h4>
				<h4><a href="javascript:void(0)" class="list-group-item">邮箱：${onlyUserCheck.userId}</a></h4>
				<h4>
					<a href="javascript:void(0)" class="list-group-item">
						职务：
						<c:if test="${onlyUserCheck.userRole==2}">校外人员</c:if>
						<c:if test="${onlyUserCheck.userRole==3}">教师</c:if>
						<c:if test="${onlyUserCheck.userRole==4}">学生</c:if>
					</a>
				</h4>
				<h4><a href="javascript:void(0)" class="list-group-item">电话：${onlyUserCheck.userTel}</a></h4>
				<h4><a href="javascript:void(0)" class="list-group-item">密码：${onlyUserCheck.userPwd}</a></h4>
				<h4><a href="javascript:void(0)" class="list-group-item">用户证件 <b class="caret"></b></a></h4>
				<div class="list-group-item">
					<a onclick="if(confirm('确定通过用户申请?')==false)return false;" href="updateUserCheck.html"><button class="btn btn-success">通过</button></a>
					<a onclick="if(confirm('确定拒绝该用户申请?')==false)return false;" href="deleteUserCheck.html"><button class="btn btn-warning">拒绝</button></a>
				</div>
				<h4><a href="javascript:void(0)" class="list-group-item"><button onClick='javascript :history.go(-1);' class="btn btn-info"> 返回</button></a></h4>
				<div id="userImg">
					<a href="javascript:void(0)" class="list-group-item">
						<img class="userImg" src="<%=request.getContextPath()%>/static/upload/${onlyUserCheck.userImg}"/>
					</a>
				</div>
			</div>
		</div>
		</div>
	</div>

	<%-- 姓名：${onlyUserCheck.userName}&nbsp;&nbsp;
	邮箱：${onlyUserCheck.userId}&nbsp;&nbsp;
	电话：${OnlyUserCheck.userTel}&nbsp;&nbsp;
	职务：
	<c:if test="${onlyUserCheck.userRole==2}">校外人员</c:if>
	<c:if test="${onlyUserCheck.userRole==3}">教师</c:if>
	<c:if test="${onlyUserCheck.userRole==4}">学生</c:if>
	&nbsp;&nbsp;
	个人资料：
	<img src="<%=request.getContextPath() %>/static/upload/${onlyUserCheck.userImg}" />
	<br/> --%>
	<!-- <a href="updateUserCheck.html">通过</a>
	<a href="deleteUserCheck.html">拒绝</a> -->
</body>
</html>