<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headTools.jsp"%>
<title>${subscribe.subscribeRoom}机房预约申请</title>
<style type="text/css">
	#top{
		border: #c23933 solid;
		border-width: 2px 0px 2px 0px;
		margin: 0 auto;
		background: #fafafa;
	}
	body{
		background:linear-gradient(to right,#f3f4f3,#bdbdbd);
	}
	#main{
		padding-top: 20px;
	}
	.row{
		width: 100%;
	}
	input{
		box-shadow: 5px 5px 5px #808080;
	}
	button{
		margin: 10px;
	}
</style>
</head>
<body>
	<!-- 头部 -->
	<div id="top" class="row nav">
		<div class="col-xs-12">
			<%@include file="header.jsp" %>
		</div>
	</div>
	<!-- 中部 -->
	<div id="main" class="row">
		<div class="col-md-4 col-xs-1"></div>
		<div class="col-md-6 col-xs-11">
		<!-- action="subscribeAsk.html method="post"" -->
			<form id="askForm" role="form" class="form-horizontal">
				<div class="form-group">
					<label class="col-xs-4 col-sm-2 control-label">本人姓名：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" readonly value="${subscribe.subscribeTime}"  />
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-4 col-sm-2 control-label">常用邮箱：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="userId" readonly value="${subscribe.userId}"  />
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-4 col-sm-2 control-label">预约机房：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="subscribeRoom" readonly value="${subscribe.subscribeRoom}"  />
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-4 col-sm-2 control-label">预订时间：</label>
					<div class="col-sm-6 col-xs-12">
						<input type="hidden" class="form-control bg" name="subscribeDate" readonly value="${subscribe.subscribeDate.time}"/>
						<input class="form-control bg" readonly value='<fmt:formatDate pattern="yyyy年MM月dd日" value="${subscribe.subscribeDate}"/>'  />
						
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-4 col-sm-2 control-label">预订星期：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="subscribeWeek" readonly value="${subscribe.subscribeWeek}"  />
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-4 col-sm-2 control-label">预订时段：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="subscribeNode" readonly value="${subscribe.subscribeNode}"  />
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-4 col-sm-2 control-label">申请原因：(<200字符)</label>
					<div class="col-sm-6 col-xs-12">
						<textarea class="form-control" name="subscribeContent" rows="10" cols="30"></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2 hidden-xs"></div>
					<div class="col-sm-4 col-xs-12">
						<button type="button" id="sub" class="btn btn-danger form-control" >提交申请</button>
					</div>
					<input id="askInfo" type="hidden"/>
					<!-- <div class="col-sm-2 col-xs-12">
						<a id="backon" href="javascript:void(0)" ><button class="btn btn-warning form-control" >返回</button></a>
					</div>
					<input id="askInfo" type="hidden"/> -->
				</div>
			</form>
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
	<!-- 尾部 -->
	<div class="col-md-12 hidden-xs hidden-sm">
		<%@include file="foot.jsp" %>
	</div>
	<script type="text/javascript">
	$(function(){
		//提交预约申请
		$("#sub").click(function(){
			var askInfo="";
			$.ajax({
				type:"POST",
				url:"subscribeAsk",
				data:$("#askForm").serialize(),
				dataType:"json",
				success:function(data){
					askInfo=data.askInfo;
					console.log("askInfo返回值："+askInfo);
					$("#askInfo").val(askInfo);
					console.log(askInfo=="Y");
					console.log(askInfo=="S");
				},
				error:function(data){
					alert("系统无响应！");
				}
			});
		
			//模态框提示
			function modal(){
				 if($("#askInfo").val()=='Y'){
					 $('#myModalLabel').html('恭喜你，预订成功！');
					 $('#infoCon').html('管理员会对您的预约信息进行审核<br/>审核通过后会尽快以手机或邮件的形式回复您<br/>期间请保持通信正常！');
					 $('#myModal').modal();
				 }else if($("#askInfo").val()=='S'){
					 $('#myModalLabel').html('预约失败！');
					 $('#infoCon').html('对不起！<br/>该机房已被预订，您可以尝试更换其他机房！');
					 $('#myModal').modal();
					 localhost.href="index.html";
				 }else if($("#askInfo").val()=='N'){
					 $('#myModalLabel').html('警告！');
					 $('#infoCon').html('数据异常,预约失败！');
					 $('#myModal').modal();
				 }else{
					 $('#myModalLabel').html('恭喜你，预订成功！');
					 $('#infoCon').html('管理员会对您的预约信息进行审核<br/>审核通过后会尽快以手机或邮寄的方式回复您<br/>期间请保持通信正常！');
					 $('#myModal').modal();
				 }
			}
			 setTimeout(modal,1000);
			});
		  $('#myModal').on('hide.bs.modal', function () {
	     	location.href="mySubscribe.html";
	  });
		 /*  $("#backon").on('click',function(){
			  location.href="index.html";
		  }) */
	  
	  });
	
	</script>
	
</body>
</html>