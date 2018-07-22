<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="headTools.jsp" flush="true"/>
	<style type="text/css">
		#top{
			border: #c23933 solid;
			border-width: 2px 0px 2px 0px;
			margin: 0 auto;
			background: #fafafa;
		}
		#left dl dd button {
			width: 100px;
			height:40px;
			background: #9d1e18;
			border:none;
			border-radius: 0;
		}
		.row{
			width: 100%;	
		}
		.roomInfo button{
			background: #2e6ac2;
			font-size: 12px;
			font-weight: 400;
			margin-top:20px;
			margin-right: 20px;
			line-height: 12px;
			text-align: center;
			color: #fff;
			box-shadow: 8px 8px 12px #808080;
		}
		.table th,.table td{
			text-align: center;
		}
		.container-fluid{
			margin: 0px;
			padding: 0px;
		}
	</style>
	<title>计算机机房预约系统</title>
</head>
<body>
	<div class="container-fluid">
	<!-- 头部 -->
	<div id="top" class="row">
		<%@include file="header.jsp" %>
	</div>
		<!-- 上部 -->
		<div id="main_top" class="row">
			<div id="left" class="col-xs-6 col-sm-6">
				<dl>
					<dd>
						<button class="btn btn-info">
							<span class="glyphicon glyphicon-th-list"></span> 菜单
						</button>
					</dd>
					<dd><jsp:include page="leftNav.jsp"/></dd>
				</dl>
			</div>
			<div class="roomInfo col-xs-6 col-sm-6">
				<button id="roomInfo" class=" btn btn-info col-xs-12 col-sm-4">机房：${roomName}</button>
				<button id="weekInfo" class="btn btn-info col-xs-12 col-sm-4">本周是第 <strong> ${weekNums}</strong> 周</button>
			</div>
		</div>
		<!-- 下部 -->
		<div id="subTable" class="row">
		<div id="right" class="col-sm-1 hidden-xs"></div>
		<div id="right" class="col-sm-12 col-xs-12 table-responsive">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr style="height:60px;">
							<th>时间</th>
							<th>星期</th>
							<th>第1,2节<br/>(08:00-09:40)</th>
							<th>第3,4节<br/>(10:00-11:40)</th>
							<th>第5节<br/>(13:00-13:45)</th>
							<th>第6,7节<br/>(14:00-15:40)</th>
							<th>第8,9节<br/>(15:50-17:30)</th>
							<th>第10,11节<br/>(19:00-20:40)</th>
							<th>第12节<br/>(20:50-21:35)</th>
						</tr>
					</thead>
					<c:forEach items="${subTableList}" var="stl">
					<tr style="height:80px;">
						<th><fmt:formatDate value="${stl.time}" pattern="yyyy年MM月dd日"/></th>
						<td>${stl.week}</td>
						<c:forEach items="${i}" varStatus="i">
							<td>
								<c:if test="${stl.node[i.index]!=null}">
									<c:if test="${stl.node[i.index].length()>5}">
										${stl.node[i.index]}
									</c:if>
									<c:if test="${stl.node[i.index].length()<5&&stl.time.time+86400*1000>today.time}">
										${stl.node[i.index]}
									</c:if>
									<c:if test="${stl.node[i.index].length()<5&&stl.time.time+86400*1000<today.time}">
										<span>已过期</span>
									</c:if>
								</c:if>
								<c:if test="${stl.node[i.index]==null&&stl.time.time<today.time}">
									<span>已过期</span>
								</c:if>
								<c:if test="${stl.node[i.index]==null&&stl.time.time>today.time}">
									<c:if test="${subNum>=3}">
										<a href="javascript:void(0)" title="预约申请不能超过4次">预约上限</a>
									</c:if>
									<c:if test="${subNum<3}">
										<a href="toSubscribeAsk.html?node=${i.index}&week=${stl.week}&today=${stl.time.time}&room=${roomName}">可预约</a>
									</c:if>
								</c:if>
							</td>
						</c:forEach>
					</tr>
					</c:forEach>
				</table>
		</div>				
	</div>
	</div>
	<!-- 尾部 -->
	<div class="col-md-12 hidden-xs hidden-sm">
		<%@include file="foot.jsp" %>
	</div>
<script type="text/javascript">
	$(function(){
		//点击间隔
		 var count=0;
		  var flag=null;
		  function done(){
		    if(count==0){
		      clearInterval(flag);
		    }
		    else{
		      count=count-1;
		    }
		  }
		  $("#left dl dd button").click(function(){
		    if(count==0){
		      count=1;
		      flag=setInterval(done,1000);
		      $("#left dl dd:eq(1)").slideToggle(500);
		    }
		  });
		
		
		$("#left dl dd:eq(1)").mouseleave(function(){
			$(this).hide(500);
		});
		
	});

</script>
</body>
</html>