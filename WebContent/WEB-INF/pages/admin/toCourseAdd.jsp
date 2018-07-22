<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="headTools.jsp"%>
	<title>手动添加课程</title>
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
	.title{
		margin-top:20px;
		font-size: 16px;
		font-weight: bold;
		text-align: center;
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
		<!-- 摘要 -->
		<div class="title">${roomName}机房课程表--手动添加</div>
		<!-- 主体内容 -->
		<div class="personal col-sm-12 col-xs-12">
			<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>时间</th>
							<th>星期一</th>
							<th>星期二</th>
							<th>星期三</th>
							<th>星期四</th>
							<th>星期五</th>
							<th>星期六</th>
							<th>星期天</th>
						</tr>
					</thead>
					<tr>
						<th>第1,2节</th>
						<c:forEach items="${courseNodeList0}" var="node1">
							<c:if test="${node1.courseName!=null}">
								<td>
									<dl>
										<dd>${node1.courseName}</dd>
										<dd>${node1.weekWeek}</dd>
									 	<dd>${node1.courseTeacher}</dd>
								  	</dl>
							 	</td>
							</c:if>
							<c:if test="${node1.courseName==null}">
								<td>
									<a href="toHandAddCourse.html?roomName=${roomName}&week=${node1.courseWeek}&node=第1,2节">课程添加</a>
								</td>
							</c:if>
						</c:forEach>
					</tr>
					<tr>
						<th>第3,4节</th>
						<c:forEach items="${courseNodeList1}" var="node2">
							<c:if test="${node2.courseName!=null}">
								<td>
									<dl>
										<dd>${node2.courseName}</dd>
										<dd>${node2.weekWeek}</dd>
									 	<dd>${node2.courseTeacher}</dd>
								  	</dl>
							 	</td>
							</c:if>
							<c:if test="${node2.courseName==null}">
								<td>
									<a href="toHandAddCourse.html?roomName='${roomName}'&week='${node2.courseWeek}'&node='第3,4节'">课程添加</a>
								</td>
							</c:if>
						</c:forEach>
					</tr>
					<tr>
						<th>第5节</th>
						<c:forEach items="${courseNodeList2}" var="node3">
							<c:if test="${node3.courseName!=null}">
								<td>
									<dl>
										<dd>${node3.courseName}</dd>
										<dd>${node3.weekWeek}</dd>
									 	<dd>${node3.courseTeacher}</dd>
								  	</dl>
							 	</td>
							</c:if>
							<c:if test="${node3.courseName==null}">
								<td>
									<a href="toHandAddCourse.html?roomName=${roomName}&week=${node3.courseWeek}&node=第5节">课程添加</a>
								</td>
							</c:if>
						</c:forEach>
					</tr>
					<tr>
						<th>第6,7节</th>
						<c:forEach items="${courseNodeList3}" var="node4">
							<c:if test="${node4.courseName!=null}">
								<td>
									<dl>
										<dd>${node4.courseName}</dd>
										<dd>${node4.weekWeek}</dd>
									 	<dd>${node4.courseTeacher}</dd>
								  	</dl>
							 	</td>
							</c:if>
							<c:if test="${node4.courseName==null}">
								<td>
									<a href="toHandAddCourse.html?roomName=${roomName}&week=${node4.courseWeek}&node=第6,7节">课程添加</a>
								</td>
							</c:if>
						</c:forEach>
					</tr>
					<tr>
						<th>第8,9节</th>
						<c:forEach items="${courseNodeList4}" var="node5">
							<c:if test="${node5.courseName!=null}">
								<td>
									<dl>
										<dd>${node5.courseName}</dd>
										<dd>${node5.weekWeek}</dd>
									 	<dd>${node5.courseTeacher}</dd>
								  	</dl>
							 	</td>
							</c:if>
							<c:if test="${node5.courseName==null}">
								<td>
									<a href="toHandAddCourse.html?roomName=${roomName}&week=${node5.courseWeek}&node=第8,9节">课程添加</a>
								</td>
							</c:if>
						</c:forEach>
					</tr>
					<tr>
						<th>第10,11节</th>
						<c:forEach items="${courseNodeList5}" var="node6">
							<c:if test="${node6.courseName!=null}">
								<td>
									<dl>
										<dd>${node6.courseName}</dd>
										<dd>${node6.weekWeek}</dd>
									 	<dd>${node6.courseTeacher}</dd>
								  	</dl>
							 	</td>
							</c:if>
							<c:if test="${node6.courseName==null}">
								<td>
									<a href="toHandAddCourse.html?roomName=${roomName}&week=${node6.courseWeek}&node=第10,11节">课程添加</a>
								</td>
							</c:if>
						</c:forEach>
					</tr>
					<tr>
						<th>第12节</th>
						<c:forEach items="${courseNodeList6}" var="node7">
							<c:if test="${node7.courseName!=null}">
								<td>
									<dl>
										<dd>${node7.courseName}</dd>
										<dd>${node7.weekWeek}</dd>
									 	<dd>${node7.courseTeacher}</dd>
								  	</dl>
							 	</td>
							</c:if>
							<c:if test="${node7.courseName==null}">
								<td>
									<a href="toHandAddCourse.html?roomName=${roomName}&week=${node7.courseWeek}&node=第12节">课程添加</a>
								</td>
							</c:if>
						</c:forEach>
					</tr>
				</table>
		</div>
		<button onclick="javascript:history.go(-1)" class="btn btn-info col-xs-12 col-sm-1">返回</button>
	</div>
	<%-- <h3>${roomName}机房课程表--手动添加</h3>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				
			</div>
		</div>				
	</div> --%>
</body>
</html>