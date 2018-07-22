<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- 左边栏 -->
	<div class="nav-main">
		<div class="nav-box">
			<c:if test="${user.userName==null}">
				<script type="text/javascript">
					alert("您还没登录，即将跳转登录页面！");
					window.location.href='../login.html'
				</script>
			</c:if>
			<div class="nav">
				<ul class="nav-ul">
					<li>
						<a href="javascript:void(0)" class="home"><span>机房预约</span></a>
					</li>
					<li>
						<a href="mySubscribe.html" class="mysubscribe"><span>我的预约</span></a>
					</li>
					<li>
						<a href="javascript:void(0)" class="personal"><span>个人信息</span></a>
					</li>
					<li>
						<a href="bulletin.html" class="bulletinboard"><span>公告栏</span></a>
					</li>
					<li>
						<a href="javascript:void(0)" class="about"><span>关于我们</span></a>
					</li>
					<li>
						<a href="exitUser"><span>安全退出</span></a>
					</li>
				</ul>
			</div>
			<div class="nav-slide">
				<div class="nav-slide-o">
					<a href="#"><span>机房选择</span></a>
					<ul>
						<c:forEach items="${roomList}" var="rl">
							<li>
								<c:if test="${rl.roomStatus==1}">
									<form action="toSubscribeTable.html" method="post">
										<input type="hidden" name="room" value="${rl.roomName}"/>
										<a title="正常使用">
											<span>
												 <span class="glyphicon glyphicon-dashboard"></span>
												 <button type="submit" style="background:none;border:none">${rl.roomName}</button>
											</span>
										</a>
									</form>
									<%-- <a title="正常使用" href="toSubscribeTable.html?room=${rl.roomName}">
									<span>
									 <span class="glyphicon glyphicon-dashboard"></span>
									   ${rl.roomName}
									</span></a> --%>
								</c:if>
								<c:if test="${rl.roomStatus==2}">
									<a title="机房已关闭！" style="background: #C1CDC1;color:#c23933" href="javascript:void(0)"><span><span class="glyphicon glyphicon-wrench"></span> ${rl.roomName}</span></a>
								</c:if>
							
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="nav-slide-o"></div>
				<div class="nav-slide-o">
					<ul>
						<li>
							<a href="userPersonal.html"><span>个人资料</span></a>
						</li>
						<li>
							<a href="toUpdatePersonal.html"><span>资料修改</span></a>
						</li>
						<li>
							<a href="toUpdateUserPwd.html"><span>密码修改</span></a>
						</li>
					</ul>
				</div>
				<div class="nav-slide-o"></div>
				<div class="nav-slide-o">
					<ul>
						<li>
							<a href="homeMap.html"><span>我的位置</span></a>
						</li>
						<li>
							<a href="aboutRules.html"><span>机房使用条例</span></a>
						</li>
						<li>
							<a href="javascript:void(0)"><span>更多功能敬请期待</span></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>