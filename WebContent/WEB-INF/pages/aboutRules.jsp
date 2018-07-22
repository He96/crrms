<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="icon" type="image/x-icon" href="<%=request.getContextPath() %>/static/images/computer.ico" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/static/css/bootstrap.min.css" />
	<script type="text/javascript" src="<%=request.getContextPath() %>/static/js/bootstrap.min.js" ></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>使用条例</title>
</head>
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
	
</style>
<body>
	<div class="col-xs-3 hidden-xs"></div>
		<div class="col-xs-12 col-sm-6" id="ruleInfo">
			<h3>机房预约系统使用条例</h3>
			<ol>
				<li>用户需至少提前1天进行预约，如要更改预约，登陆后在"我的预约"中取消原预约，再次预约即可。</li>
		 		<li>每个用户最多只能提交4次预约申请，请不要重复提交预约申请，违规操作。</li>
		 		<li>个人或组织必须严格遵守机房上机条例，文明上机，爱惜保护公共财产。</li>
		 		<li>管理人员有权对使用本系统存在违规操作的用户给予封号惩罚。</li>
		 		<li>不允许修改计算机上的信息，如有需要可向管理员申报。</li>
		 		<li>如果计算机机房不可预约，则该机房已关闭或正在维修，给您带来的不便，敬请谅解！</li>
		 		<li>机房主控制台只能由负责人或教师操作，禁止其它人员随意控制。</li>
		 		<li>对于不遵守机房使用条例对机房设备造成人为损害的，由负责人全权赔偿。</li>
		 		<li>机房如果存在已损坏设备情况，请及时报告机房管理人员。</li>
		 		<li>上机结束后，负责人应按规程关闭设备电源并填写《设备使用情况登记表》，发现故障应及时反映。</li>
			</ol>
			<div class="bshare-custom">
		<a title="分享到QQ空间" class="bshare-qzone"></a>
		<a title="分享到QQ好友" class="bshare-qqim"></a>
		<a title="分享到新浪微博" class="bshare-sinaminiblog"></a>
		<a title="分享到微信" class="bshare-weixin"></a>
		<a title="分享到腾讯微博" class="bshare-qqmb"></a>
		<a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a>
	</div>
		<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/button.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
		<a class="bshareDiv" onclick="javascript:return false;"></a>
		<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
		<div style="height: 10px;"></div>
		<a href="javascript:history.go(-1)"><button class="btn btn-info">返回</button></a>
		</div>
</body>
</html>