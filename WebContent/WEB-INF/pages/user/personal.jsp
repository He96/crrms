<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="headTools.jsp" flush="true"/>
<title>个人资料</title>
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
		p img{
			width: 100%;
			height: 400px;
		
		}
		#personals{
			margin-top: 10px;
		}
		#userImg {
		width: 500px;
		height: 500px;
		background: #fefefe;
		perspective: 900px;
		margin:50px auto;
	}
	.userImg{position: absolute;top: 50%;
		left: 50%;
		width: 200px;
		height: 340px;
		margin: -220px 0 0 -100px;
		background: url(lanrenzhijia.jpg) 0 0  no-repeat;
		background-size:200px 340px;
		box-shadow: -7px 10px 10px #333;
		transform: rotateX(60deg) rotateY(3deg) rotateZ(-25deg);
		-webkit-transform: rotateX(60deg) rotateY(3deg) rotateZ(-25deg);
		-moz-transform: rotateX(60deg) rotateY(3deg) rotateZ(-25deg);
		transform-origin:50% 50%;
		-webkit-transform-origin:50% 50%;
		-moz-transform-origin:50% 50%;
		transition: all 1s;
		-moz-transition: all 1s;
		-webkit-transition: all 1s;
	}
	#userImg:hover .userImg {
	transform: rotate3d(0, 0, 0, 0deg);
	-webkit-transform: rotate3d(0, 0, 0, 0deg);
	-moz-transform: rotate3d(0, 0, 0, 0deg);
	box-shadow: -100px 100px 20px #fff;
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
	<marquee id="affiche" align="left" behavior="scroll" direction="left" hspace="50" vspace="20" loop="1" scrollamount="8" scrolldelay="100" onMouseOut="this.start()" onMouseOver="this.stop()">
		欢迎您！${user.userName}     温馨提示！您可以点击菜单来对其进行开关。
	</marquee>
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
		<div class="list-group">
			<h4><a href="javascript:void(0)" class="list-group-item active">个人资料</a></h4>
			<h4><a href="javascript:void(0)" class="list-group-item">姓名：${user.userName}</a></h4>
			<h4><a href="javascript:void(0)" class="list-group-item">邮箱：${user.userId}</a></h4>
			<h4><a href="javascript:void(0)" class="list-group-item">密码：${user.userPwd}</a></h4>
			<h4><a href="javascript:void(0)" class="list-group-item">电话：${user.userTel}</a></h4>
			<h4><a href="javascript:void(0)" class="list-group-item">用途：${user.userOther}</a></h4>
			<div class="list-group">
				<h4><a href="javascript:void(0)" class="list-group-item">我的证件 <b class="caret"></b></a></h4>
				<h4><a href="javascript:void(0)" class="list-group-item"><button onClick='javascript :history.go(-1);' class="btn btn-info"> 返回</button></a></h4>
				<div id="userImg">
					<a href="javascript:void(0)" class="list-group-item">
						<img class="userImg" src="<%=request.getContextPath() %>/static/upload/${user.userImg}" />
					</a>
				</div>
			</div>
		</div>
		</div>
	
	</div>
	
<script type="text/javascript">
	$(function(){
		$("marquee").fadeOut(15000);
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