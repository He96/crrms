<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="headTools.jsp"%>
	<title>计算机机房管理系统</title>
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
				<h4><a href="javascript:void(0)" class="list-group-item active">个人资料</a></h4>
				<h4><a href="javascript:void(0)" class="list-group-item">姓名：${user.userName}</a></h4>
				<h4><a href="javascript:void(0)" class="list-group-item">邮箱：${user.userId}</a></h4>
				<h4><a href="javascript:void(0)" class="list-group-item">密码：${user.userPwd}</a></h4>
				<h4><a href="javascript:void(0)" class="list-group-item">电话：${user.userTel}</a></h4>
				<h4><a href="javascript:void(0)" class="list-group-item">授权码：${user.userOther}</a></h4>
				<input id="deleteInfo" type="hidden" value="${deleteInfo}"/>
			</div>
			<div class="list-group">
				<a href="toUpdatePersonal.html"><button class="btn btn-info">修改个人信息</button></a>
				<a href="toUpdateUserPwd.html"><button class="btn btn-warning">修改密码</button></a>
			</div>
		</div>
		
	</div>
	<!-- 模态框提示 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div id="infoCon" class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" 
							data-dismiss="modal">关闭
					</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
		function modal(){
			 if($("#deleteInfo").val()=='Y'){
				 $('#myModalLabel').html('提示！');
				 $('#infoCon').html('您已经对所有课程进行了格式化，可以通过手动或自动方式添加新课程！');
				 $('#myModal').modal();
			 }else if($("#deleteInfo").val()=='N'){
				 $('#myModalLabel').html('警告！');
				 $('#infoCon').html('数据异常,格式化失败！');
				 $('#myModal').modal();
			 
			}
		}
		 setTimeout(modal,1000);
		
	});
	</script>
</body>
</html>