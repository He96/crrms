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
				 //电话
				 userTel:{
					 validators:{
						notEmpty:{
							message:"电话不能为空！"
						},
						regexp:{
							regexp:/^1[3|4|5|7|8]{1}\d{9}$/,
							message:"请输入有效的电话号码！"
						}/*,
						//内容必须为11个字符才发送ajax请求
						threshold:11,
						remote:{
							url:"../checkTel",//地址
							message:"电话号码已存在！",
							delay:2000,//服务器减压,2S请求一次
							type:"POST"
						}*/
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
							 url:"../checkUserId",
							 message:"邮箱已存在！",
							 delay:2000,
							 type:"POST"
						 }
	 
					 }
				 }
			 }
		 });
		 //提交事件
		 $("#registerForm").submit(function(){
				if($(this).data('bootstrapValidator').isValid()){
					$(this).bootstrapValidator('disableSubmitButtons', false); 
					
				}
			 });
		 
		//修改成功与否
		if($("#info").val().length>5){
			alert($(this).val());
		}
	});