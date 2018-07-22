package cn.hs.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import cn.hs.pojo.Mail;
import cn.hs.pojo.User;
import cn.hs.service.user.UserService;
import cn.hs.tools.MailTools;
import cn.hs.tools.Rename;
@Controller
public class LoginController {
	@Resource
	private UserService userService;
	private Logger logger = Logger.getLogger(LoginController.class); 
	
	//跳转登录界面
	@RequestMapping(value={"/login.html","/"},method=RequestMethod.GET)
	public String toLogin(){	
		return "login";
	}
	//登录判断
	@RequestMapping(value="/loginCheck.html",method=RequestMethod.POST)
	public String login(@RequestParam String username,
			@RequestParam String password,HttpSession session,RedirectAttributes red){
		String loginError="";
		try {
			//service层核对账号密码后返回结果
			User userCheck = userService.loginUser(username,password);
			if(userCheck!=null){
				if(userCheck.getUserStatus().equals("通过")){
					session.setAttribute("user", userCheck);
					return  (userCheck.getUserRole()>1)?"redirect:/user/index.html":"redirect:/admin/index.html";
				}else{
					loginError= "该账号正在审核中！审核通过后会以邮件的形式下发至您邮箱,请您注意查收！";
					red.addFlashAttribute(loginError);
					return "redirect:login.html";
				}
			}else{
				loginError="用户名或密码错误！请检查后重新登录！";
				red.addFlashAttribute(loginError);
				return "redirect:login.html";
			}
		} catch (Exception e) {
			loginError= "系统异常,请稍后重试！";
			red.addFlashAttribute(loginError);
			return "redirect:login.html";
		}
		
	}
	
	//跳转用户注册
	@RequestMapping(value="/goRegister.html",method=RequestMethod.GET)
	public String addUser(@ModelAttribute("user") User user){
		
		return "register";
	}
	//用户注册判断
	@RequestMapping(value="register",method=RequestMethod.POST)
	public String addUser(User user,@RequestParam String Role,@RequestParam MultipartFile attach,RedirectAttributes red,HttpServletRequest request){
		//判断上传内容
		String info="";
		try {
			//上传文件类型。大小限制10M以内，格式为jpg、jpeg、png、bmp
			//指定上传位置
			String uploadFilePath = request.getSession().getServletContext().getRealPath("/static/upload");
			String newsFile = "";
			//文件非空判断
			if(!attach.isEmpty()){
				newsFile = Rename.newsName(attach.getOriginalFilename());
				File saveFile = new File(uploadFilePath+File.separator+newsFile);
				//文件不存在则自动创建
				FileUtils.copyInputStreamToFile(attach.getInputStream(), saveFile);
			}
			//把表单中的String类型转换为Integer对象类型
			//因为Role的值在（-128--127之间，故可按基本数据类型比较）
			user.setUserRole(Integer.parseInt(Role.trim()));
			int registerMsg = -1;
			user.setUserImg(newsFile);
			user.setUserPwd(Rename.newPwd());
			if(!"".equals(user.getUserId())&&!"".equals(user.getUserName())){
				registerMsg = userService.insertUser(user);
				if(registerMsg>0){
					info="ok";
				}else{
					info="error";
				}
			}else{
				info="null";
			}
	} catch (IOException e) {
		e.printStackTrace();
		info="imgError";
	}
		red.addFlashAttribute(info);
		return "redirect:goRegister.html";
	}
	
	//忘记密码？
	@RequestMapping(value="/forgetPw.php",method=RequestMethod.GET)
	public String forgetPw(){
		return "forgetPw";
	}
	//密码找回
	@RequestMapping(value="forgetPw.html",method=RequestMethod.GET)
	@ResponseBody
	public Object forgetPw(@RequestParam String userId,@RequestParam String userName){
		HashMap<String, String> result = new HashMap<String,String>();
		String info=null;
		if(!userId.equals("")&&!"".equals(userName)){
			User user = new User();
			User userMail=new User();
			Mail mail = new Mail();
			MailTools mTools = new MailTools();
			String host="";
			userMail = userService.getMail();//获取到授权码
			host = mTools.host(userMail.getUserId());//获取服务器
			user.setUserId(userId);
			user.setUserName(userName);
			try{
				user = userService.getUser(user);//用户信息
				if("通过".equals(user.getUserStatus())&&user.getUserRole()>1){
					mail.setHost(host);//设置邮件服务器
			        mail.setSender(userMail.getUserId());  //发件人
			        mail.setReceiver(user.getUserId()); // 接收人  
			        mail.setUsername(userMail.getUserId()); // 登录账号
			        mail.setPassword(userMail.getUserOther()); // 发件人授权码 
			        mail.setSubject("密码找回！");
			        mail.setMessage("<h3>尊敬的用户您好！</h3><br/>"
			        		+ "  欢迎使用红河学院工学院计算机机房预约管理系统<br/>您的密码为："
			        		+user.getUserPwd()+",请牢记您的密码！");
			        mTools.send(mail);
			        info="yes";
				}else{
					info="userNoPass";
				}
			}catch (Exception e) {
				info="userError";
			}
		}else{
			info="userNull";
		}
		result.put("res", info);
		return JSONArray.toJSONString(result);
	}
	
	//验证邮箱号
	@RequestMapping(value="checkEmail",method=RequestMethod.GET)
	@ResponseBody
	public Object checkEmail(@RequestParam String email){
		HashMap<String, String> result = new HashMap<String,String>();
		String info="N";
		User user = new User();
		user.setUserId(email);
		try{
		user = userService.getUser(user);
		if(user!=null){
			info="Y";
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		result.put("info", info);
		return JSONArray.toJSONString(result);
	}
	//remote测试邮箱验证
	//验证邮箱号
	@RequestMapping(value="checkUserId",method=RequestMethod.POST)
	@ResponseBody
	//检查用户名的合法性,如果用户已经存在，返回false，否则返回true(返回json数据，格式为{"valid",true})
	public String checkUserId(@RequestParam String userId){
		HashMap<String, Boolean> result = new HashMap<String,Boolean>();
		boolean flag = false;
		User user = new User();
		user.setUserId(userId);
		try{
		user = userService.getUser(user);
		if(user==null){
			flag=true;
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		result.put("valid", flag);
		//ObjectMapper mapper = new ObjectMapper();
	    String resultString = JSON.toJSONString(result);
		return resultString;
	}
	
	//邮箱验证码
	@RequestMapping(value="checkEmailId",method=RequestMethod.GET)
	@ResponseBody
	public Object checkEmailId(@RequestParam String email){
		HashMap<String, String> result = new HashMap<String,String>();
		String info="N";
		if(email!=null||email!=""){
			Mail mail = new Mail();
			User userMail=new User();
			MailTools mTools = new MailTools();
			String host="";
			userMail = userService.getMail();//获取到授权码
			host = mTools.host(userMail.getUserId());//获取服务器
			String checkId = new Random().nextInt(899999)+100000+"";;
			//获取验证码
			try{
				mail.setHost(host);//设置邮件服务器
		        mail.setSender(userMail.getUserId());  //发件人
		        mail.setReceiver(email.trim()); // 接收人  
		        mail.setUsername(userMail.getUserId()); // 登录账号
		        mail.setPassword(userMail.getUserOther()); // 发件人授权码 
		        mail.setSubject("注册验证码！");
		        mail.setMessage("<strong>[红河学院工学院机房预约系统]</strong>校验码:<h3>"+checkId+"</h3><br/>"
		        				+ "您正在申请注册红河学院工学院机房预约系统账号，需要进行校验。<br/>"
		        				+ "请勿泄露您的校验码。");
		        mTools.send(mail);
		       result.put("checkId", checkId);
		       info="Y";
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		}
		result.put("info", info);
		return JSONArray.toJSONString(result);
	}
	//手机号验证
	@RequestMapping(value="checkTel",method=RequestMethod.POST)
	@ResponseBody
	public String checkTel(@RequestParam String userTel){
		boolean flag = false;
		Map<String, Boolean> map = new HashMap<String,Boolean>();
		User user = new User();
		user.setUserTel(userTel);
		try{
		user = userService.getUser(user);
		if(user==null){
			flag=true;
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		map.put("valid", flag);
		//ObjectMapper mapper = new ObjectMapper();
	    String resultString = JSON.toJSONString(map);
		return resultString;
	}
	
	//机房使用条款
	@RequestMapping("aboutRules")
	public String aboutRules(){
		return "aboutRules";
	}
}
