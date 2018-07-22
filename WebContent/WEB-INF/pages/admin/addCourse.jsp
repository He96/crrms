<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="headTools.jsp"%>
	<title>课表自动导入</title>
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
		height:30px;
	}
	#attach{
		height: 35px;
	}
	.userImg{
		width:100%;
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
		<div class="row">
		<!-- 左边 -->
		<div class="col-xs-12 col-sm-3 nav leftNav">
			<jsp:include page="leftNav.jsp"/>
		</div>
		<!-- 主体内容 -->
		<div class="personal col-sm-9 col-xs-12">
			<form id="addCourseForm" action="addCourse.html" role="form" class="form-horizontal" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="firstTime" class="col-xs-12 col-sm-5 control-label">第一周开始时间：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="Wdate form-control" onClick="WdatePicker()" name="firstTime" id="firstTime"/>
					</div>
				</div>
				<div class="form-group">
					<label for="attach" class="col-xs-4 col-sm-2 control-label"></label>
					<div class="col-sm-6 col-xs-12">
						<a target="_blank" href="http://www.uoh.edu.cn/ggfw/xl.htm">
							校历查询
						</a>
					</div>
				</div>
				<div class="form-group">
					<label for="attach" class="col-xs-4 col-sm-2 control-label">课表导入：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control" type="file" name="attach" id="attach"/>
					</div>
				</div>
				<div class="form-group">
					<label for="attach" class="col-xs-4 col-sm-2 control-label"></label>
					<div class="col-sm-6 col-xs-12">
						<button type="submit" id="sub" class="btn btn-primary form-control" >课表上传</button>
					</div>
					<input value="${upExcelInfo}" type="hidden" id="upExcelInfo"/>
				</div>
				<div class="form-group">
					<div class="alert alert-info alert-dismissable">
            			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
               				 &times;
           				 </button>
         				提示：<br/>
         				1、开学第一周的星期一为第一周开始时间,可从校历查看。<br/>
         				2、Excel建议使用.xsl格式，以免出错！<br/>
         				3、可以把所有机房数据放入同一张Excel表格导入，但需要注意每列的内容必须按下列格式统一！ 
       				</div>
				</div>
				<div class="list-group">
				<h4><a href="javascript:void(0)" class="list-group-item active">Excel内容格式</a></h4>
					<img class="userImg" src="<%=request.getContextPath() %>/static/images/courseExcel.png" />
				</div>
			</form>
		</div>
	</div>	
	</div>
	<!-- <form action="addCourse.html" method="post" enctype="multipart/form-data">
		设置第一周开始时间：
		<input name="firstTime" class="Wdate" type="text" onClick="WdatePicker()">
		<p>提示：开学第一周的星期一为第一周开始时间,可从校历查看。</p><br/>
		
		<a target="_blank" href="http://www.uoh.edu.cn/ggfw/xl.htm">校历查询</a><br/>
		课表导入：
		<input type="file" name="attach" /><br/>
		<input type="submit" value="上传"/>
	</form> -->
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
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/static/date/WdatePicker.js" ></script>
	<script type="text/javascript">
	$(function(){
		function modal(){
			 if($("#upExcelInfo").val()=='Y'){
				 $('#myModalLabel').html('提示！');
				 $('#infoCon').html('恭喜您课表导入成功！');
				 $('#myModal').modal();
			 }else if($("#upExcelInfo").val()=='N'){
				 $('#myModalLabel').html('警告！');
				 $('#infoCon').html('由于文件格式问题，您的文件上传失败，请查看后重试！');
				 $('#myModal').modal();
			}
		}
		setTimeout(modal,1000);
		
	});
	</script>
	
</body>
</html>