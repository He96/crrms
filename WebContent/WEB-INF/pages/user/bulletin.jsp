<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="headTools.jsp" flush="true"/>
<title>公告查看</title>
<style type="text/css">
	body{
	background:linear-gradient(to right,#f3f4f3,#bdbdbd);
}
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
</style>
	
</head>
<body>
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

	<div id="personals" class="row">
		<div class="col-sm-4 hidden-xs"></div>
		<div class="col-sm-5 col-xs-12">
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
			<a href="javascript:void(0)" class="list-group-item">
				<h4 class="list-group-item-heading">${bl.bulletinTitle }<small>——<fmt:formatDate value="${bl.bulletinDate}" pattern="yyyy年MM月dd日"/></small></h4>
				<p class="list-group-item-text">
					${bl.bulletinContent }
				</p>
			</a>
			</c:forEach>
		</div>
		</div>
	
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