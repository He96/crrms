<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="headTools.jsp" flush="true"/>
<title>我的申请书</title>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	body{
		background: linear-gradient(to right,#f3f4f3,#bdbdbd);
	}
	#ruleInfo{
		margin-top: 5%;
		padding: 30px;
		border: 1px solid #bfbfbf;
		box-shadow: #888888 5px 13px 15px;		
	}
	#ruleInfo ol li{
		line-height: 40px;
		font-size: 16px;
	}
	h3{
		text-align: center;
		padding: 20px;
	}
	#top{
		border: #c23933 solid;
		border-width: 2px 0px 2px 0px;
		margin: 0 auto;
		background: #fafafa;
		}
	
</style>
</head>
<body>
	<!-- 头部 -->
	<div id="top" class="row">
		<%@include file="header.jsp" %>
	</div>
	<div class="col-xs-3 hidden-xs"></div>
		<div class="col-xs-12 col-sm-6" id="ruleInfo">
			<h3>我的预约申请书</h3>
			<h4>申请时间：<fmt:formatDate value="${subBook.subscribeDate}" pattern="yyyy年MM月dd日"/>
			${subBook.subscribeWeek}  ${subBook.subscribeNode} ${subBook.subscribeTime}
			</h4>
			<h4>申请机房：${subBook.subscribeRoom}</h4>
			<p>
				${subBook.subscribeContent}
			</p>
			<a href="javascript:history.go(-1)"><button class="btn btn-info">返回</button></a>
		</div>
</body>
</html>