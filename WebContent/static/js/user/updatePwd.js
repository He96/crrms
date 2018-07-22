$(function(){
		//表单验证
		 $("#registerForm").bootstrapValidator({
			 message:"内容无效",
			 feedbackIcons: {        //提示图标
			        valid: 'glyphicon glyphicon-ok',
			        invalid: 'glyphicon glyphicon-remove',
			        validating: 'glyphicon glyphicon-refresh'
			 },
			 fields:{
				 //密码
				 userPwd:{
					 validators:{
						notEmpty:{
							message:"密码不能为空！"
						},
					 stringLength: {
	                        min: 6,
	                        max: 20,
	                        message: '密码有误!'
	                    }
					 }
				 },
				 //新密码
				 newsUserPw:{
					 validators:{
						 notEmpty:{
							 message:"新密码不能为空！"
						 },
						 stringLength: {
		                        min: 6,
		                        max: 20,
		                        message: '密码长度只能为6-20个字符'
		                    },
		                    regexp: {
		                        regexp: /^[a-zA-Z0-9_\.]+$/,
		                        message: '密码格式只能为字母数字下划线以及点'
		                    },
		                    identical: {
		                        field: 'newsUserPwd',
		                        message: '两次密码输入不一致！'
		                    },
		                    different: {
		                        field: 'userPwd',
		                        message: '新密码不能和原始密码相同！'
		                    }
					 }
				 },
				 newsUserPwd:{
					 validators:{
						 notEmpty:{
							 message:"重复密码不能为空！"
						 },
						 identical: {
		                        field: 'newsUserPw',
		                        message: '两次密码输入不一致！'
	                    },
	                    different: {
	                        field: 'userPwd',
	                        message: '新密码不能和原始密码相同！'
	                    }
					 }
				 
				 }
			}
		 });
		 //提交事件
		 $("#userPwd").focus(function(){
			 $("#pwdInfo").html("");
		 });
		 $("#userPwd").blur(function() {
			 console.log("start");
			 if($.trim($("#pwd").val())!=$.trim($("#userPwd").val())){
				 $("#pwdInfo").html("密码输入有误！");
			 }
		})
		 $("#registerForm").submit(function(){
			 	if($.trim($("#pwd").val())==$.trim($("#userPwd").val())){
			 		if($(this).data('bootstrapValidator').isValid()){
						$(this).bootstrapValidator('disableSubmitButtons', false); 
						
					}
			 	}else{
			 		$("#pwdInfo").html("密码有误！");
			 	}
				
			 });
		 
		//修改成功与否
			var info = $("#info").val();
			if(info=="Y"){
				alert("密码修改成功，请重新登录！");
				location.href="../login.html";
			}else if(info=="Error"){
				alert("服务器异常，请稍后重试！");
			}else if(info=="null"){
				alert("请把数据填写完整！");
			}
	});