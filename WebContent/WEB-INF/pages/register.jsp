<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type"	>
	<link rel="icon" type="image/x-icon" href="static/images/computer.ico" />
	<link rel="stylesheet" href="static/css/bootstrap.min.css" />
 	<link rel="stylesheet" href="static/dist/css/bootstrapValidator.css"/> 
	<link rel="stylesheet" href="static/css/register.css"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script>
      //图片上传预览    IE是用了滤镜。
        function previewImage(file)
        {
          var MAXWIDTH  = 90; 
          var MAXHEIGHT = 90;
          var div = document.getElementById('preview');
          if (file.files && file.files[0])
          {
              //div.innerHTML ='<img id="imghead" onclick="$(\'#previewImg\').click()">';
              var img = document.getElementById('imghead');
              img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
//                 img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top+'px';
              }
              var reader = new FileReader();
              reader.onload = function(evt){img.src = evt.target.result;}
              reader.readAsDataURL(file.files[0]);
          }
          else //兼容IE
          {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
          }
        }
        function clacImgZoomParam( maxWidth, maxHeight, width, height ){
            var param = {top:0, left:0, width:width, height:height};
            if( width>maxWidth || height>maxHeight ){
                rateWidth = width / maxWidth;
                rateHeight = height / maxHeight;
                
                if( rateWidth > rateHeight ){
                    param.width =  maxWidth;
                    param.height = Math.round(height / rateWidth);
                }else{
                    param.width = Math.round(width / rateHeight);
                    param.height = maxHeight;
                }
            }
            param.left = Math.round((maxWidth - param.width) / 2);
            param.top = Math.round((maxHeight - param.height) / 2);
            return param;
        }
    </script>
	<title>账号注册</title>
</head>
<body>
	<header>
		<h3>工学院计算机机房预约系统账号申请书</h3>
	</header>
	<article>
	<div class="col-md-4 hidden-xs"></div>
		<div class="col-md-5 col-xs-12">
			<form id="registerForm" role="form" class="form-horizontal" action="register" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="userName" class="col-xs-4 col-sm-2 control-label">姓名：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="userName" id="userName" placeholder="真实姓名，一经填写，不可更改！" />
					</div>
				</div>
				<div class="form-group">
					<label for="userTel" class="col-xs-4 col-sm-2 control-label">电话：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="userTel" id="userTel" placeholder="常用联系电话"/>
					</div>
				</div>
				<div class="form-group">
					<label for="userId" class="col-xs-4 col-sm-2 control-label">邮箱：</label>
					<div class="col-sm-6 col-xs-12">
						<input class="form-control bg" name="userId"  id="userId" placeholder="常用邮箱"/>
					</div>
				</div>
				<div class="form-group">
					<label for="checkId" class="col-xs-4 col-sm-2 control-label">验证码：</label>
					<div class="col-xs-12 col-sm-4">
						<input class="form-control bg" name="checkId" id="checkId" placeholder="邮箱验证码"/>
					</div>
					<div class="col-xs-8 col-sm-4">
						<button id="checkBtn" type="button" class="btn btn-info">获取验证码</button>
					</div>
					<label id="checkTime" class="col-xs-4 col-sm-1 control-label"></label>
				</div>
				<div class="form-group">
					<label for="userOther" class="col-xs-4 col-sm-2 control-label">用途：</label>
					<div class="col-xs-12 col-sm-4">
						<select size="1" id="userOther" name="userOther" class="form-control">
							<option value="授课">授课</option>
							<option value="考试" selected>考试</option>
							<option value="培训">培训</option>
							<option value="选课">选课</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="identity" class="col-xs-4 col-sm-2 control-label">角色：</label>
					<div class="col-sm-3 col-xs-12">
						<input type="radio" value="2" name="Role" checked="checked" />校外人员
					</div>
					<div class="col-sm-2 col-xs-12">
						<input type="radio" value="3" name="Role" />教师
					</div>
					<div class="col-sm-2 col-xs-12">
						<input type="radio" value="4" name="Role" />学生
					</div>
				</div>
				<div class="form-group">
					<label for="ID" class="col-xs-4 col-sm-2 control-label">证件上传:</label>
				</div>
				<div class="form-group">
					<div class="col-xs-4" id="preview">
						<img id="imghead" name="imghead" src="static/images/picture.png" onClick="$('#previewImg').click();"/>
 					</div>
 					<input type="file" name="attach" onChange="previewImage(this)" style="display:none;"  id="previewImg"/>
 					<div class="col-xs-8">
 						<label  class="control-label">请上传一张能证明本身身份的照片，确保清晰！</label>
 						<label  class="control-label">学生证、教师证、工作证；</label>
 						<label  class="control-label">大小限制10M以内，格式为jpg、jpeg、png、bmp。</label>
 					</div>
 					<label id="imgInfo" class="col-xs-6 control-label"></label>
 				</div>       
 				<div class="form-group">
 					<label class="col-sm-6 col-xs-12 control-label">
 						<a href="aboutRules" style="line-height:26px">《机房使用条款》</a>
 					</label>
					<div class="col-xs-12 col-sm-2">
						<input type="checkbox" name="agree" id="agree" class="btn btn-primary form-control" value="yes"/>
					</div>
 				</div>  
				<div class="form-group">
					<label class="col-xs-2 control-label"></label>
					<div class="col-sm-6 col-xs-12">
						<button type="submit" id="sub" class="btn btn-primary form-control" >注册</button>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-2"></div>
					<div class="col-xs-10">
						<input id="info" type="hidden" value="${string}" />
					</div>
				</div>
			</form>
		</div>
	</article>
	<!-- 弹窗提示 -->
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div id="infoCon" class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" 
							data-dismiss="modal">关闭
					</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="static/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="static/js/bootstrap.min.js" ></script>
    <script type="text/javascript" src="static/dist/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="static/js/register.js" ></script> 
</body>
</html>