$(function(){
	//邮箱正则
	var emailRE = new RegExp(/^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/);
	//手机正则
	var telRE = new RegExp(/^1[3|5|7|8]\d{9}$/);
	
	//登录验证
	
	//获得焦点
	$("#username").focus(function() {
		$("#tips").text("");
		$(".userInput:first").removeClass("error");
	});
	$("#password").focus(function() {
		$(".userInput:eq(1)").removeClass("error");
	});
	//光标移除
	$("#username").blur(function(){
			var $username = $("#username").val();
			if($username==""){
				$("#username").attr("placeholder","账号不能为空");
				$(".userInput:first").addClass("error");
			}else if(!emailRE.test($username)&&!telRE.test($username)){
				$("#tips").text("账号格式有误！");
				$(".userInput:first").addClass("error");
		}else{
			$(".userInput:first").removeClass("error");
		}
	});
	
	//登录判断
	$("form").submit(function(){
		var $username = $("#username").val();
		if($username==""){
			$("#username").attr("placeholder","账号不能为空");
			$(".userInput:first").addClass("error");
			return false;
		}else if(!emailRE.test($username)&&!telRE.test($username)){
			$("#tips").text("账号格式有误！");
			$(".userInput:first").addClass("error");
			return false;
		}else{
			$(".userInput:first").removeClass("error");
		};
		
		if($("#password").val()!="" && $("#username").val()!=""){
			$(".userInput:first").removeClass("error");
			$(".userInput:eq(1)").removeClass("error");
			if($("#tips").text()==""){
				return true;
			}else{
				return false;
			}
		}else if($("#password").val()==""){
			$("#password").attr("placeholder","密码不能为空");
			$(".userInput:eq(1)").addClass("error");
			return false;
		}
	});
	//登录提示信息 		
	if($("#loginInfo").val().length>5){
		 $('#infoCon').html($("#loginInfo").val());
		 $('#myModal').modal();
	}
});