<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="headTools.jsp" flush="true"/>
	<script type="text/javascript" src="https://3gimg.qq.com/lightmap/components/geolocation/geolocation.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/static/js/map.js"></script>
	<script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp&key=RGCBZ-CG634-2CPUV-XUICH-7PMHE-ZPBKM"></script>
	<style type="text/css">
	#container {
		width: 100%;
		height:400px;
	}
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
#personals{
	margin-top: 10px;
}
</style>
<title>我的位置</title>
</head>
<body>
	<!-- 头部 -->
	<div id="top" class="row nav">
		<div class="col-xs-12">
			<%@include file="header.jsp" %>
		</div>
	</div>
	
	<!-- -->
	<div class="col-xs-3"></div>
		<div class="col-xs-12">
			<div id="container"></div>
			 <button class="btn btn-info" onClick="geolocation.getLocation(showPosition, null, options)">我的位置</button>
			<div id="pos-area">
	        	<p id="address">点击按钮，获取我的位置：<br /></p>
	   		</div>
	   		<button class="btn btn-info" onClick='javascript :history.go(-1);'>返回</button>
   		</div>
</body>
</html>