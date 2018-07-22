$(function() {
	//验证状态
//	var result = false;
	//**重点优化：改进方法为Validator-->remote认证（fastJson）
	//判断邮箱是否存在
//	$("#userId").focus(function(){
//		$("#userIdInfo").html("");
//	});
//	
//	$("#userId").blur(function(){
//		var email = $("#userId").val();
//		var emailRE = new RegExp(/^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/);
//		if(email!="" && emailRE.test(email)){
//			$.ajax({
//				type:"GET",
//				url:"checkEmail",
//				data:{"email":email},
//				dataType:"json",
//				success:function(data){
//					if(data.info=="N"){
//						$("#userIdInfo").css("color","green");
//						$("#userIdInfo").html("恭喜你该邮箱号可用！");
//					}else if(data.info=="Y"){
//						$("#userIdInfo").css("color","red");
//						$("#userIdInfo").html("该邮箱号已存在！");
//					}
//				},
//				error:function(data){
//					$("#info").html("系统无响应！");
//				}
//			
//			});
//		}
//	});
	
	//邮箱验证规则
	var emailRE = new RegExp(/^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/);
	//防止误触发送邮件
	$("#checkBtn").addClass("disabled");
	$("#userId").blur(function(){
		var email = $("#userId").val();
		if(email!="" && emailRE.test(email)){
			$("#checkBtn").removeClass("disabled");
		}else{
			$("#checkBtn").addClass("disabled");
		}
	})
	$("#userId").focus(function(){
		var email = $("#userId").val();
		if(email!="" && emailRE.test(email)){
			$("#checkBtn").addClass("disabled");
		}
	})
	//初始化验证码
	var checkId= "";
	//发送邮箱验证码
	$("#checkBtn").click(function(){
		var email = $("#userId").val();
		if(email!="" && emailRE.test(email)){
			$.ajax({
				type:"GET",
				url:"checkEmailId",
				data:{"email":email},
				dataType:"json",
				success:function(data){
					if(data.info=="Y"){
						$("#checkBtn").addClass("disabled");
						$("#checkTime").css({"display":"block","font-size":"14px"});
						checkId=data.checkId;
						var sum=120;
						var time1 = setInterval(function time(){
							sum-=1;
							$("#checkTime").html(sum+"s");
							if(sum==0){
								clearInterval(time1);
								$("#checkBtn").html("重新获取");
								$("#checkTime").css("display","none");
								$("#checkBtn").removeClass("disabled");
								//清除验证码
								checkId="";
								$("#checkId").html("验证码失效！");
							}
						}, 1000);
					}
				},
				error:function(data){
					$("#checkTime").html("系统无响应！");
				}
			});
		}
	});
	//注册验证
	 $("#registerForm").bootstrapValidator({
		 message:"内容无效",
		 feedbackIcons: {        //提示图标
		        valid: 'glyphicon glyphicon-ok',
		        invalid: 'glyphicon glyphicon-remove',
		        validating: 'glyphicon glyphicon-refresh'
		 },
		 fields:{
			 //姓名验证
			 userName:{
				 validators:{
					 //非空验证
					 notEmpty:{
						 message:"姓名不能为空！"
					 },
					 regexp:{
						 regexp:/^[\u4E00-\u9FA5]{2,4}$/,
						 message:"暂只支持2-4位中文姓名！"
					 }
				 }
			 },
			 //电话
			 userTel:{
				 validators:{
					notEmpty:{
						message:"电话不能为空！"
					},
					regexp:{
						regexp:/^1[3|4|5|7|8]{1}\d{9}$/,
						message:"请输入有效的电话号码！"
					},
					//内容必须为11个字符才发送ajax请求
					threshold:11,
					remote:{
						url:"checkTel",//地址
						message:"电话号码已存在！",
						delay:2000,//服务器减压,2S请求一次
						type:"POST"
					}
				 }
			 },
			 //邮箱
			 userId:{
				 validators:{
					 notEmpty:{
						 message:"邮箱不能为空！"
					 },
					 emailAddress:{
						 message:"邮箱格式有误！"
					 },
					 threshold:11,
					 remote:{
						 url:"checkUserId",
						 message:"邮箱已存在！",
						 delay:2000,
						 type:"POST"
					 }
 
				 }
			 },
			 //验证码
			 checkId:{
				 validators:{
					 notEmpty:{
						 message:"验证码不能为空！"
					 },
					 regexp:{
						 regexp:/^\d{6}$/,
						 message:"验证码格式有误！",
					 },
					 callback: {
	                        message: '验证码有误!',
	                        callback: function(value, validator) {
	                            return value == checkId;
	                        }
	                    }
				 }
			 },
			 //文件验证
			 attach:{
				 validators:{
					 notEmpty:{
						 message:'请上传！'
					 }
				 }
			 },
			 //协议
			 agree:{
				 validators:{
					notEmpty:{
						message:"agree?"
					} 
				 }
			 }
		 }
	 });
	//图片验证
	 var imgCheck=false;
	 $("#sub").click(function(){
		 var path = $("#previewImg").val();
		 console.log("mouserleave Start:"+path);
		 if(path==null||path==""){
			 imgCheck=false;
			 console.log("无上传文件"+imgCheck);
		 }else{
			 console.log("Value");
			 var suffix = path.substring(path.lastIndexOf(".")+1);
			 console.log("suffix:"+suffix);
			 var sufName= suffix.toLowerCase();
			 console.log("小写转换:"+suffix);
			 var imgFormat=["jpeg","jpg","png","bmp"];
			 for(var i=0;i<imgFormat.length;i++){
					if(imgFormat[i]==sufName){
						imgCheck=true;
						 console.log("格式正确"+imgCheck);
						 return;
					}else{
						 imgCheck=false;
						 console.log("格式有误！"+imgCheck);
					}
			}
		 }

	 });
	 //验证成功后返回
	 $("#registerForm").submit(function(){
		if($(this).data('bootstrapValidator').isValid()&&imgCheck){
			$(this).bootstrapValidator('disableSubmitButtons', false); 
		}else if(!imgCheck){
			alert("图片格式有误！");
		}
		 
	 });
	//触发模态框提示
	 function modal(){
		 if($('#info').val()=='ok'){
			 $('#myModalLabel').html('恭喜你，注册成功！');
			 $('#infoCon').html('管理员会在2-7个工作日对您提交的信息进行审核<br/>审核结果会以邮件的形式下发至您邮箱<br/>请注意查收！');
			 $('#myModal').modal();
			$('#myModal').on('hide.bs.modal', function () {
				location.href="login.html";
			});
		 }else if($('#info').val()=='error'){
			 $('#myModalLabel').html('注册失败！');
			 $('#infoCon').html('对不起，由于异常原因，您的注册有误，请重新注册！');
			 $('#myModal').modal();
		 }else if($('#info').val()=='null'){
			 $('#myModalLabel').html('警告！');
			 $('#infoCon').html('请填写完整信息，不要进行非法操作！');
			 $('#myModal').modal();
		 }else if($('#info').val()=='imgError'){
			 $('#myModalLabel').html('注册失败！');
			 $('#infoCon').html('请严格按要求上传图片，注意大小和格式，谢谢合作！');
			 $('#myModal').modal();
		 }
	 };
	 //延时执行(写了玩的，哈哈^_^)
	 setTimeout(modal,1000);//延时1秒 执行模态框
});


