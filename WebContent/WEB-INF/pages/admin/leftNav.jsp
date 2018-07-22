<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
	*{
	}
	.leftNav a{
			color: #fff;
		}
		.leftNav a:hover{
			color: #000;
		}
	#subTab,#couTab{
		display: none;
		padding-left: 16px;
	}
	.leftNav_main{
		padding-bottom: 100%;
	}
	.nav > li > a:focus{
		color: #000;
	}
	.topUser h5 a:hover{
		color:#7c1c15;
	}
</style>
<!-- 左边栏 -->
<div class="nav navbar navbar-inverse leftNav_main">
	<ul class="nav nav-pills  nav-stacked">
		<c:if test="${user.userName==null||user.userRole!=1}">
			<script type="text/javascript">
				alert("您还没登录，即将跳转登录页面！");
				window.location.href='../login.html'
			</script>
		</c:if>
		<li class="navbar-brand topUser"><h5>您好！${user.userName} |<a href="exitUser">安全退出</a></h5></li>
		<li class="">
			<a href="index.html">
				<span class="glyphicon glyphicon-unchecked"></span>
				 个人信息
			</a>
		</li>
		<li>
			<a href="userList.html?page=1">
				<span class="glyphicon glyphicon-user"></span>
				用户管理
			</a>
		</li>
		<li>
			<a href="seeRoom.html">
				<span class="glyphicon glyphicon-home"></span>
				机房管理
			</a>
		</li>
		<li>
			<a href="javascript:void(0)">
				<span class="glyphicon glyphicon-edit"></span>
				预约管理  <span class="caret"></span>
			</a>
			<ul id="subTab" class="nav nav-pills  nav-stacked">
				<li>
					<a href="toSubscribe.html"><span></span>已预约列表</a>
				</li>
				<li><a href="toSubscribeCheck.html"><span></span>预约审核</a></li>
			</ul>
		</li>
		<li>
			<a href="javascript:void(0)">
				<span class="glyphicon glyphicon-calendar"></span>
				课表管理  <b class="caret"></b>
			</a>
			<ul id="couTab" class="nav nav-pills  nav-stacked">
				<li><a href="toAddCourse.html"><span></span>自动添加</a></li>
				<li><a href="toCourseRoomAdd.html"><span></span>手动添加</a></li>
				<li><a href="toCourseRoom.html"><span></span>课表查看</a></li>
				<li><a href="toDeleteCourseRoom.html"><span></span>课程删除</a></li>
				<li><a href="deleteAllCourse" onclick="if(confirm('确定格式化所有课程?')==false)return false;"><span></span>格式化课程</a></li>
			</ul>
		<li>
			<a href="toUserCheck.html">
				<span class="glyphicon glyphicon-comment"></span>
				用户审核
				<span class="badge">${checkNum}</span>
			</a>
		</li>
		<li>
			<a href="toBulletin.html">
			<span class="glyphicon glyphicon-bullhorn"></span>
			公告管理
			</a>
		</li>
	</ul>
</div>

<script type="text/javascript">
	$(function(){
		//鼠标样式
		$(".leftNav_main ul li").hover(
		function(){
			$(this).addClass("active");	
		},function(){
			$(this).removeClass("active");
		});
		$("#subTab span,#couTab span").addClass("glyphicon glyphicon-circle-arrow-right");
		//点击事件
		$("#subTab").parent().click(function(){
			$("#subTab").slideToggle();
		});
		$("#couTab").parent().click(function(){
			$("#couTab").slideToggle();
		});
		
		
	});
</script>


