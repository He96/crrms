<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#firstTime{
		height: 30px;
		width: 100%;
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
		<div class="col-xs-3 col-sm-3">
			
		</div>
		<!-- 主体内容 -->
		<div class="personal col-sm-6 col-xs-12">
				<!-- <div class="form-group">
					<label for="roomName" class="col-xs-4 col-sm-2 control-label">机房名称：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="roomName" id="roomName" value="任美福楼" />
					</div>
				</div> -->
				<form id="handAddCourse" class="form-horizontal" action="handAddCourse.html" method="post" role="form">
					<div class="form-group">
						 <label for="courseName" class="col-xs-4 col-sm-2 control-label">课程名称：</label>
						<div class="col-sm-6 col-xs-12">
						 	<input class="form-control" name="courseName" required placeholder="请输入课程名" />
						</div>
					</div>
					<div class="form-group">
						 <label for="courseTeacher" class="col-xs-4 col-sm-2 control-label">任课教师：</label>
						 <div class="col-sm-6 col-xs-12">
						 	<input class="form-control" name="courseTeacher" required placeholder="请输入任课教师" />
						</div>
					</div>
					<div class="form-group">
						<div class="weeks">
							<label class="col-xs-4 col-sm-2 control-label" for="weekWeek">起止周次：</label> 
							<div class="col-sm-6 col-xs-12">
								<input name="start" id="weekWeek" value="1" />-
								<input name="end" id="weekWeeks" value="18"/>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-4 col-sm-2 control-label">设置第一周开始时间：</label>
						<div class="col-sm-6 col-xs-12">
							<input name="firstTime" id="firstTime" class="Wdate col-sm-6 col-xs-12" type="text" onClick="WdatePicker()">
						</div>
						<input type="hidden" name="week" value="${week}"/>
						<input type="hidden" name="node" value="${node}"/>
						<input type="hidden" name="roomName" value="${roomName}"/>
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
					<div class="form-group">
						<div class="col-sm-8 col-xs-12 alert alert-info alert-dismissable">
            			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
               				 &times;
           				 </button>
         				提示：开学第一周的星期一为第一周开始时间,可从校历查看。
         				 <span class="glyphicon glyphicon-hand-right"></span>
         				<a style="color: #c23933" target="_blank" href="http://www.uoh.edu.cn/ggfw/xl.htm">校历查询</a>
       				</div>
					</div>
				</form>
			</div>
			<div class="col-md-4 hidden-xs column">
			</div>
		</div>
		<script type="text/javascript" src="<%=request.getContextPath() %>/static/date/WdatePicker.js" ></script>
</body>
</html>