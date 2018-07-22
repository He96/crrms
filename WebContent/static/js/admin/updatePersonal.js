$(function(){
		//表单验证
		 $("#updateForm").bootstrapValidator({
			 message:"内容无效",
			 feedbackIcons: {        //提示图标
			        valid: 'glyphicon glyphicon-ok',
			        invalid: 'glyphicon glyphicon-remove',
			        validating: 'glyphicon glyphicon-refresh'
			 },
			 fields:{
				 //姓名
				 userName:{
					 validators:{
						 notEmpty:{
							 message:"姓名不能为空！"
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
						 }
					 }
				 },
				 userOther:{
					 validators:{
						 notEmpty:{
							message:"授权码不能为空！" 
						 }
					 }
				 }
			 }
		 });
		 //提交事件
		 $("#updateForm").submit(function(){
				if($(this).data('bootstrapValidator').isValid()){
					$(this).bootstrapValidator('disableSubmitButtons', false); 
					
				}
			 });
		 
		//修改成功与否
		if($("#info").val().length>5){
			alert($(this).val());
			location.href="../login.html";
		}
	});