$(function () {
	//ajax异步调用邮箱发送功能
	$("#userId").focus(function(){
		$("#info").html("");
	})
	
	$("#userId").blur(function(){
		var email = $("#userId").val();
		$.ajax({
			type:"GET",
			url:"checkEmail",
			data:{"email":email},
			dataType:"json",
			success:function(data){
				if(data.info=="Y"){
					$("#info").css("color","green");
					$("#info").html("恭喜你该邮箱号可用！");
				}else if(data.info=="N"){
					$("#info").css("color","red");
					$("#info").html("该邮箱号不存在！");
				}
			},
			error:function(data){
				$("#info").html("系统无响应！");
			}
		
		});
	});
	//生成验证信息
	function randomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    };
    $("#checkInfo").html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));
	//验证表单
	 $("#forgetForm").bootstrapValidator({
	　　　　message: '内容无效',
	            　feedbackIcons: {
	                　　　　　　　　valid: 'glyphicon glyphicon-ok',
	                　　　　　　　　invalid: 'glyphicon glyphicon-remove',
	                　　　　　　　　validating: 'glyphicon glyphicon-refresh'
	            　　　　　　　　   },

		    fields: {
		        userName: {
		            validators: {
		                notEmpty: {
		                    message: '用户名不能为空'
		                }
		            }
		        },
		        userId: {
		            validators: {
		                notEmpty: {
		                    message: '邮箱地址不能为空'
		                },
		                emailAddress: {
	                        message: '请输入有效的邮箱地址！'
	                    }
		            }
		        },
		        threshold:11,
				 remote:{
					 url:"checkUserId",
					 message:"邮箱已存在！",
					 delay:2000,
					 type:"POST"
				 },
		        captcha: {
	                validators: {
	                    callback: {
	                        message: '回答错误!',
	                        callback: function(value, validator) {
	                            var items = $('#checkInfo').html().split(' '), 
	                            sum = parseInt(items[0]) + parseInt(items[2]);
	                            return value == sum;
	                        }
	                    }
	                }
	            }
		   }
	});
	 
	 //test
//	 $("#submit").on("click", function(){  
//		    alert($("#forgetForm").data('bootstrapValidator').isValid());  
//		}); 
	 
	//执行提交后返回结果
	 $("#submit").click(function(){
		 var $userId = $("#userId").val();
		 var $userName = $("#username").val();
		 if($userName!="" && $userId!=""){
			var result = "";
			$.getJSON(
				"forgetPw.html",
				{"userId":$userId,"userName":$userName},
				function(data) {
					var info =JSON.parse(data).res;
					if(info=="yes"){
						$("#resultInfo").css("color","green");
						result="密码已下发至您的邮箱，请注意查收！";
					}else if(info=="userNoPass"){
						$("#resultInfo").css("color","#c23933");
						result="该账号正在审核中，请您耐心等待！";
					}else if(info=="userError"){
						$("#resultInfo").css("color","red");
						result="姓名或邮箱号填写有误，请核对后重输！";
					}else if(info=="userNull"){
						$("#resultInfo").css("color","red");
						result="请填写完整信息！";
					}
					$("#resultInfo").html(result);
					
				}
			
			);
		}
		 
	 });
	 
	 
});