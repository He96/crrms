<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		#footId{
			margin-top: 280px;
		}
	</style>
<title>我的预约</title>
</head>
<body>
	<div class="container-fluid">
	<!-- 头部 -->
	<div id="top" class="row nav">
		<div class="col-xs-12">
			<%@include file="header.jsp" %>
		</div>
	</div>
	
	<!-- 左侧 -->
	<div id="main_top" class="row">
		<div id="left" class="col-xs-3 col-sm-3">
			<dl>
				<dd>
					<button class="btn btn-info">
						<span class="glyphicon glyphicon-th-list"></span> 菜单
					</button>
				</dd>
				<dd><jsp:include page="leftNav.jsp"/></dd>
			</dl>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-1 hidden-xs"></div>
		<div class="col-sm-11 col-xs-12 table-responsive">
			<table class="table table-hover table-striped">
				<thead>
					<tr>
						<th>姓名</th>
						<th>申请机房</th>
						<th>预约时间</th>
						<th>预约星期</th>
						<th>预约节次</th>
						<th>申请内容</th>
						<th>申请状态</th>
						<th>操作管理</th>
					</tr>
				</thead>
				<tbody >
				<c:if test="${sublistNum>0}">
					<c:forEach items="${userSubListAll}" var="usa">
						<tr>
							<td>${usa.userName}</td>
							<td>${usa.subscribeRoom}</td>
							<td><fmt:formatDate value="${usa.subscribeDate}" pattern="yyyy年MM月dd日"/></td>
							<td>${usa.subscribeWeek}</td>
							<td>${usa.subscribeNode}</td>
							<td><a href="lookAskBook.html?id=${usa.id}">查看申请内容</a></td>
							<td>${usa.subscribeStatus}</td>
							<c:if test="${usa.subscribeStatus=='待审核'}">
								<td><%-- <a href="deleteSubAsk.html?id=${usa.id}">撤销申请</a> --%>
									<a href="deleteSubAsk.html?id=${usa.id}" onclick="if(confirm('确定撤销申请?')==false)return false;">
										<button class="btn btn-warning">撤销申请</button>
									</a>
								</td>
							</c:if>
							<c:if test="${usa.subscribeStatus!='待审核'}">
								<td><%-- <a href="deleteSubAsk.html?id=${usa.id}">删除申请</a> --%>
									<a href="deleteSubAsk.html?id=${usa.id}" onclick="if(confirm('确定撤销申请?')==false)return false;">
										<button class="btn btn-danger">删除申请</button>
									</a>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${sublistNum<1}">
				<tr>
					<div class="alert alert-info alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
							&times;
						</button>
						暂无预约信息！
					</div>
					
				</tr>
				</c:if>
				</tbody>
			
			</table>
		</div>
	</div>
	
	</div>
	<!--尾部-->
	
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