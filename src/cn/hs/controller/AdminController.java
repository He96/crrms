package cn.hs.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.hs.pojo.BulletinBoard;
import cn.hs.pojo.Course;
import cn.hs.pojo.Mail;
import cn.hs.pojo.Room;
import cn.hs.pojo.Subscribe;
import cn.hs.pojo.User;
import cn.hs.service.bulletinboard.BulletinBoardService;
import cn.hs.service.course.CourseService;
import cn.hs.service.firstDate.FirstDateService;
import cn.hs.service.room.RoomService;
import cn.hs.service.subscribe.SubscribeService;
import cn.hs.service.user.UserService;
import cn.hs.tools.ExcelAnalyTools;
import cn.hs.tools.JudgeCourse;
import cn.hs.tools.MailTools;
import cn.hs.tools.NodeTimeTools;
import cn.hs.tools.Rename;
import cn.hs.tools.WeekDateTools;

//管理员控制层
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource
	private UserService userService;
	@Resource
	private RoomService roomService;
	@Resource
	private CourseService courseService;
	@Resource
	private BulletinBoardService bBoardService;
	@Resource
	private SubscribeService subscribeService;
	@Resource
	private FirstDateService firstDateService;
	//管理员界面
	@RequestMapping(value="/index.html")
	public String adminIndex(HttpSession session){
		List<User> userCheckList = null;
		userCheckList = userService.getUserCheckList();
		int checkNum = userCheckList.size();
		session.setAttribute("checkNum", checkNum);
		return "admin/index";
	}
	//管理员个人信息
	@RequestMapping(value="/personal.html")
	public String personal(HttpSession session){
		User user = new User();
		user = (User)session.getAttribute("user");
		user.setId(user.getId());
		session.setAttribute("user", userService.getUser(user));
		return "admin/personal";
	}
	//管理员个人信息修改页面
	@RequestMapping(value="/toUpdatePersonal.html")
	public String toUpdatePersonal(){
		
		return "admin/updatePersonal";
	}
	//处理个人信息修改
	@RequestMapping(value="/updatePersonal.html",method=RequestMethod.POST)
	public String updatePersonal(@RequestParam String userName,@RequestParam String userTel,
			@RequestParam String userId,@RequestParam String userOther,HttpSession session,RedirectAttributes red){
		String info="";
		int result=-1;
		User user = new User();
		user = (User)session.getAttribute("user");
		user.setId(user.getId());
		user.setUserId(userId);
		user.setUserName(userName);
		user.setUserTel(userTel);
		user.setUserOther(userOther);
		result = userService.updateUser(user);
		if(result>0){
		info="修改成功！";
		}else{
			info="个人信息修改失败，请检查后修改";
		}
		red.addFlashAttribute(info);
		return "redirect:index.html";
	}
	//密码修改
	@RequestMapping(value="/toUpdateUserPwd.html")
	public String updatePwd(){
		return "admin/updatePwd";
	}
	@RequestMapping(value="updateUserPwd.html",method=RequestMethod.POST)
	public String updatePwd(@RequestParam Integer id,@RequestParam String userPwd,@RequestParam String newsUserPwd,RedirectAttributes red){
		String info="";
		if(!"".equals(userPwd)&&!"".equals(newsUserPwd)){
			//判断旧密码
			User user = new User();
			user.setId(id);
			user.setUserPwd(userPwd);
			try{
			user = userService.getUser(user);
			//新密码赋值
			if(user!=null){
				int result=-1;
				user.setUserPwd(newsUserPwd);
				result = userService.updateUser(user);
				if(result>0){
					info="Y";
				}
			}
			}catch (Exception e) {
				e.printStackTrace();
				info="Error";
			}
		}else{
			info="null";
		}
		red.addFlashAttribute(info);
		return "redirect:toUpdateUserPwd.html";
		
	}
	
	//用户管理
	@RequestMapping(value="/userList.html")
	public String userList(@RequestParam String page,Model model){
		List<User> list = null;
		if(page==null||"".equals(page)){
			page=1+"";
		}
		//每页显示条数
		int pageSize=5;
		//总条数
		int pageCount = userService.getUserNum();
		//总页数
		int pageNum;
		if(pageCount%pageSize==0){
			pageNum=pageCount/pageSize;
		}else if(pageCount%pageSize>0){
			pageNum=pageCount/pageSize+1;
		}else{
			pageNum=0;
		}
		Integer IntPage = Integer.parseInt(page.trim());
		//每页开始的数据
		int startPage = (IntPage-1)*pageSize;
		model.addAttribute("pageNum", pageNum);
		
		list = userService.getUserList(startPage,pageSize);
		model.addAttribute("userList", list);
		model.addAttribute("IntPage", IntPage);
		model.addAttribute("listNum", list.size());
		return "admin/userList";
	}
	//单用户信息
	@RequestMapping(value="/{id}/onlyUser.html")
	public String onlyUser(@PathVariable Integer id,Model model){
		User user = new User();
		user.setId(id);
		model.addAttribute("onlyUser",userService.getUser(user));
		return "admin/onlyUser";
	}
	//删除用户
	@RequestMapping(value="deleteUser.html")
	public String deleteUsers(@RequestParam Integer id,HttpServletRequest request){
		int result = -1;
		User user = new User();
		user.setId(id);
		user = userService.getUser(user);//通过ID获取用户信息
		//获取用户证件路径
		String uploadFilePath = request.getSession().getServletContext().getRealPath("/static/upload");
		String path="";
		path = uploadFilePath+File.separator+user.getUserImg();
		User userMail = new User();
		Mail mail = new Mail();
		MailTools mTools = new MailTools();
		String host="";
		userMail = userService.getMail();//获取到授权码
		host = mTools.host(userMail.getUserId());//获取服务器
			if("通过".equals(user.getUserStatus())&&user.getUserRole()>1){
				mail.setHost(host);//设置邮件服务器
		        mail.setSender(userMail.getUserId());  //发件人
		        mail.setReceiver(user.getUserId()); // 接收人  
		        mail.setUsername(userMail.getUserId()); // 登录账号
		        mail.setPassword(userMail.getUserOther()); // 发件人授权码 
		        mail.setSubject("致客户的一封信！");
		        mail.setMessage("<h3>尊敬的用户您好！</h3><br/>"
		        		+ "  感谢您对红河学院工学院计算机机房预约管理系统的支持！\n但由于您违法了计算机机房使用条款或其它原因，我们将关闭您所使用的账号，给您带来的不便请见谅！\n如有任何疑问，可以咨询管理员："+userMail.getUserTel()+"！");
		        mTools.send(mail);
			}
		result = userService.deleteUser(user);
		if(result>0){
			//用户删除后删除上传文件
			File file = new File(path);
			if(file.exists()){
				file.delete();
			}
		return "redirect:/admin/userList.html?page=1";
		}else{
			return "admin/onlyUserCheck";
		}
	}
	//用户审核
	@RequestMapping(value="/toUserCheck.html")
	public String toUserCheck(Model model){
		List<User> userCheckList = null;
		userCheckList = userService.getUserCheckList();
		model.addAttribute("userCheckList", userCheckList);
		model.addAttribute("listNum", userCheckList.size());
		return "admin/userCheck";
	}
	//用户审核处理
	@RequestMapping(value="/{id}/userCheck.html")
	public String userCheck(@PathVariable Integer id,Model model){
		User user = new User();
		user.setId(id);
		model.addAttribute("onlyUserCheck", userService.getUser(user));
		return "admin/onlyUserCheck";
	}
	//通过用户审核
	@RequestMapping(value="/{id}/updateUserCheck.html")
	public String passUserCheck(@PathVariable Integer id,HttpSession session){
		int result = -1;
		User user = new User();
		user.setId(id);
		user.setUserStatus("通过");
		result = userService.updateUser(user);
		if(result>0){
			/*
			 * 1.发送用户审核通过消息给用户
			 * 2.用户的邮箱，内容，管理员邮箱，授权码
			 * 步骤：通过id获取用户信息，
			 */
			User userMail = new User();
			user = userService.getUser(user);//通过ID获取用户信息
			Mail mail = new Mail();
			MailTools mTools = new MailTools();
			String host="";
			userMail = userService.getMail();//获取到授权码
			host = mTools.host(userMail.getUserId());//获取服务器
				if("通过".equals(user.getUserStatus())&&user.getUserRole()>1){
					mail.setHost(host);//设置邮件服务器
			        mail.setSender(userMail.getUserId());  //发件人
			        mail.setReceiver(user.getUserId()); // 接收人  
			        mail.setUsername(userMail.getUserId()); // 登录账号
			        mail.setPassword(userMail.getUserOther()); // 发件人授权码 
			        mail.setSubject("审核结果通知");
			        mail.setMessage("<h3>尊敬的用户您好！\n"
			        		+ "  欢迎使用红河学院工学院计算机机房预约管理系统\n您的账号申请审核已通过，初始密码为："
			        		+user.getUserPwd()+"\n温馨提示：为了您的账号安全，请尽快修改密码！请规范使用本系统，不然可是会被管理员关小黑屋的哦！</h3>");
			        mTools.send(mail);
				}
			int checkNum = (Integer)session.getAttribute("checkNum");
			if(checkNum>0){
			session.setAttribute("checkNum", checkNum-1);
			}
			return "redirect:/admin/toUserCheck.html";
		}else{
			return "admin/onlyUserCheck";
		}
		
	}
	//审核未通过
	@RequestMapping(value="/{id}/deleteUserCheck.html")
	public String deleteUser(@PathVariable Integer id,HttpServletRequest request,HttpSession session){
		int result = -1;
		User user = new User();
		user.setId(id);
		User userMail = new User();
		user = userService.getUser(user);//通过ID获取用户信息
		//获取文件路径
		String uploadFilePath = request.getSession().getServletContext().getRealPath("/static/upload");
		String path = "";
		path = uploadFilePath+File.separator+user.getUserImg();
		Mail mail = new Mail();
		MailTools mTools = new MailTools();
		String host="";
		userMail = userService.getMail();//获取到授权码
		host = mTools.host(userMail.getUserId());//获取服务器
			if("未通过".equals(user.getUserStatus())&&user.getUserRole()>1){
				mail.setHost(host);//设置邮件服务器
		        mail.setSender(userMail.getUserId());  //发件人
		        mail.setReceiver(user.getUserId()); // 接收人  
		        mail.setUsername(userMail.getUserId()); // 登录账号
		        mail.setPassword(userMail.getUserOther()); // 发件人授权码 
		        mail.setSubject("审核结果通知");
		        mail.setMessage("<h3>尊敬的用户您好！\n"
		        		+ "  欢迎使用红河学院工学院计算机机房预约管理系统\n您的账号申请审核未能通过\n温馨提示：请正确的填写您的注册信息以及证明材料，审核更容易通过，如有急事，也可以联系管理员："+userMail.getUserTel()+"</h3>");
		        mTools.send(mail);
			}
		result = userService.deleteUser(user);
		if(result>0){
			//删除用户上传文件
			File file = new File(path);
			if(file.exists()){
				file.delete();
			}
		int checkNum = (Integer)session.getAttribute("checkNum");
		if(checkNum>0){
		session.setAttribute("checkNum", checkNum-1);
		}
		return "redirect:/admin/toUserCheck.html";
		}else{
			return "admin/onlyUserCheck";
		}
	}
	//机房管理
	//机房查看
	@RequestMapping(value="seeRoom.html")
	public String SeeRoom(Model model){
		List<Room> list = roomService.getRoomList();
		model.addAttribute("roomList", list);
		return "admin/room";
	}
	//机房激活与禁用
	@RequestMapping("roomStatus.html")
	public String updateRoomStatus(@RequestParam String id,@RequestParam String status,RedirectAttributes red){
		Room room = new Room();
		room.setId(Integer.parseInt(id.trim()));
		room.setRoomStatus(Integer.parseInt(status.trim()));
		int result=-1;
		String info="";
		try{
			result = roomService.updateRoom(room);
			if(result>0){
				info="激活成功！";
			}
		}catch (Exception e) {
			e.printStackTrace();
			info="激活失败";
		}
		red.addAttribute(info);
		return "redirect:/admin/seeRoom.html";
	}
	
	//机房添加
	@RequestMapping(value="toAddRoom.html")
	public String toRoom(){
		return "admin/addRoom";
	}
	@RequestMapping(value="addRoom.html")
	public String toRoom(@RequestParam String roomName,
			@RequestParam String roomSeat,@RequestParam String roomStatus){
		int result =-1;
		Room room = new Room();
		room.setRoomName(roomName);
		room.setRoomSeat(roomSeat);
		room.setRoomStatus(Integer.parseInt(roomStatus));
		result = roomService.addRoom(room);
		if(result>0){
			
		}
		return "redirect:/admin/seeRoom.html";
	}
	//机房更改
	@RequestMapping(value="/toUpdateRoom.html")
	public String toUpdateRoom(String id,Model model){
		Room room = new Room();
		room.setId(Integer.parseInt(id));
		model.addAttribute("room",roomService.getRoom(room));
		return "admin/updateRoom";
	}
	@RequestMapping(value="updateRoom.html")
	public String updateRoom(@RequestParam String id,@RequestParam String roomSeat,@RequestParam String roomStatus){
		int result = -1;
		Room room = new Room();
		room.setId(Integer.parseInt(id));
		room.setRoomSeat(roomSeat);
		room.setRoomStatus(Integer.parseInt(roomStatus));
		result = roomService.updateRoom(room);
		if(result>0){
			return "redirect:/admin/seeRoom.html";
		}
		return "admin/updateRoom";
	}
	//机房删除
	@RequestMapping(value="deleteRoom.html")
	public String deleteRoom(@RequestParam String id){
		Room room = new Room();
		room.setId(Integer.parseInt(id));
		int result = roomService.deleteRoom(room);
		if(result>0){
			return "redirect:/admin/seeRoom.html";
		}
		return "admin/room";
	}
	//课表管理
	//课表查看
	//先查机房再查课表
	@RequestMapping(value="toCourseRoom.html")
	public String toCourseRoom(Model model){
		model.addAttribute("roomNames",roomService.getRoomList());
		return "admin/courseRoom";
	}
	//获取机房名称--得到课程列表
	@RequestMapping(value="toCourse.html")
	public String toCourse(@RequestParam String name,Model model){
		List<Course> courseList=null;
		model.addAttribute("roomName", name);
		courseList = courseService.getCourseList(name);
		String[] courseNode = { "第1,2节","第3,4节","第5节","第6,7节","第8,9节","第10,11节","第12节"};
		for(int i=0;i<courseNode.length;i++){
			List<Course> courseNodeList = JudgeCourse.judge(courseList, courseNode[i]);
			model.addAttribute("courseNodeList"+i, courseNodeList);
		}
		return "admin/course";
	}
	
	//课表添加--自动
	@RequestMapping("toAddCourse")
	public String addCourse(){
		return "admin/addCourse";
	}
	//上传课表
	@RequestMapping(value="addCourse.html",method=RequestMethod.POST)
	public String addCourse(@RequestParam String firstTime,@RequestParam MultipartFile attach,HttpServletRequest request,RedirectAttributes red){
		//上传文件路径
		String path ="hello.xls";
		//判断上传内容
		if(firstTime!=""&&attach!=null){
		try {
			//指定上传位置
			String uploadFilePath = request.getSession().getServletContext().getRealPath("/static/upload");
			String newsFile = "";
			//文件非空判断
			if(!attach.isEmpty()){
				//新上传文件名
				newsFile = Rename.newsName(attach.getOriginalFilename());
				File saveFile = new File(uploadFilePath+File.separator+newsFile);
				//文件不存在则自动创建
				FileUtils.copyInputStreamToFile(attach.getInputStream(), saveFile);
				//文件路径
				path=uploadFilePath+File.separator+newsFile;
				/*
				 * 获取上传文件路径
				 * 对文件进行解析
				 */
				Date firstDate = new SimpleDateFormat("yyyy-MM-dd").parse(firstTime);
				//第一周开始时间存入数据库
				if(firstDateService.firstDateNum()==0){
					firstDateService.addfirstDate(firstDate);
				}else{
					firstDateService.deletefirstDate();
					firstDateService.addfirstDate(firstDate);
				}
				//调用工具类解析Excel表格
				List<Course> list = ExcelAnalyTools.excel(path,firstDate);
				for(Course course:list){
					courseService.addCourse(course);
				}
				red.addFlashAttribute("upExcelInfo", "Y");
				return "redirect:/admin/toAddCourse";
			}else{
				red.addFlashAttribute("upExcelInfo", "N");
				return "redirect:/admin/toAddCourse";
			}
			
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("uploadMsg", "fileError");
		return "";
		
	}finally{
		//卸磨杀驴省内存^_^
		File file = new File(path);
		if(file.exists()){
			file.delete();
		}
	}
		}else{
			return "";
		}
		
	
	}
	
	//手动添加课表
	@RequestMapping("toCourseRoomAdd.html")
	public String toCourseRoomAdd(Model model){
		//遍历机房
		model.addAttribute("roomNames",roomService.getRoomList());
		return "admin/courseRoomAdd";
	}
	//课表填充
	@RequestMapping(value="toCourseAdd.html")
	public String toCourseAdd(@RequestParam String name,Model model){
		List<Course> courseList=null;
		model.addAttribute("roomName", name);
		courseList = courseService.getCourseList(name);
		String[] courseNode = { "第1,2节","第3,4节","第5节","第6,7节","第8,9节","第10,11节","第12节"};
		for(int i=0;i<courseNode.length;i++){
			List<Course> courseNodeList = JudgeCourse.judge(courseList, courseNode[i]);
			model.addAttribute("courseNodeList"+i, courseNodeList);
		}
		return "admin/toCourseAdd";
	}
	//课程添加（手动课程添加）
	@RequestMapping("toHandAddCourse.html")
	public String toHandAddCourse(@RequestParam String roomName,@RequestParam String week,@RequestParam String node,Model model){
		model.addAttribute("roomName", roomName);
		model.addAttribute("week", week);
		model.addAttribute("node", node);
		return "admin/handAddCourse";
	}
	@RequestMapping(value="handAddCourse.html",method=RequestMethod.POST)
	public String handAddCourse(@RequestParam String firstTime, @RequestParam String courseName,@RequestParam String courseTeacher,
			@RequestParam String start,@RequestParam String end,@RequestParam String week,@RequestParam String node,@RequestParam String roomName){
		try {
			Course course = new Course();
			course.setCourseName(courseName);
			course.setCourseNode(node);
			course.setCourseTeacher(courseTeacher);
			course.setCourseWeek(week);
			course.setWeekWeek("{第"+start+"-"+end+"周}");
			course.setRoomName(roomName);
			Date firstDate = new SimpleDateFormat("yyyy-MM-dd").parse(firstTime);
			Date first = WeekDateTools.weekDateTools(Integer.parseInt(start), firstDate);
			Date last = WeekDateTools.weekDateTools(Integer.parseInt(end), firstDate);
			course.setStartDate(first);//开始时间
			course.setEndDate(last);//结束时间
			int result = -1;
			result = courseService.addCourse(course);
			if(result>0){
				return "redirect:/admin/toCourseRoomAdd.html";
			}
			return "";
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
	}
	
	//单个课表删除
	@RequestMapping("toDeleteCourseRoom.html")
	public String deleteCourseRoom(Model model){
		model.addAttribute("roomNames",roomService.getRoomList());
		return "admin/toDeleteCourseRoom";
	}
	@RequestMapping("toDeleteCourse.html")
	public String deleteCourse(@RequestParam String name,Model model){
		List<Course> courseList=null;
		model.addAttribute("roomName", name);
		courseList = courseService.getCourseList(name);
		String[] courseNode = { "第1,2节","第3,4节","第5节","第6,7节","第8,9节","第10,11节","第12节"};
		for(int i=0;i<courseNode.length;i++){
			List<Course> courseNodeList = JudgeCourse.judge(courseList, courseNode[i]);
			model.addAttribute("courseNodeList"+i, courseNodeList);
		}
		return "admin/deleteCourseById";
	}
	@RequestMapping("deleteCourseById.html")
	public String deleteCourse(@RequestParam String id){
		int result = -1;
		Course course = new Course();
		course.setId(Integer.parseInt(id));
		result = courseService.deleteCourse(course);
		if(result>0){
			return "redirect:/admin/toDeleteCourseRoom.html";
		}
		return "";
	}
	//格式化课表
	@RequestMapping("deleteAllCourse")
	public String deleteAllCourse(RedirectAttributes red){
		String deleteInfo="";
		try{
		int i=-1;
		i=courseService.deleteAllCourse();
		if(i>0){
			deleteInfo="Y";
		}
		}catch (Exception e) {
			e.printStackTrace();
			deleteInfo="N";
		}
		red.addFlashAttribute("deleteInfo", deleteInfo);
		return "redirect:/admin/index.html";
	}
	
	//公告管理--查看
	@RequestMapping("toBulletin.html")
	public String toBulletin(Model model){
		model.addAttribute("bulletinList", bBoardService.getBulletinList());
		model.addAttribute("listNum", bBoardService.getBulletinList().size());
		return "admin/bulletin";
	}
	//公告--添加
	@RequestMapping("toAddBulletin.html")
	public String toAddBulletin(){
		return "admin/addBulletin";
	}
	@RequestMapping(value="addBulletin.html",method=RequestMethod.POST)
	public String addBulletin(@RequestParam String bulletinTitle,@RequestParam String bulletinContent){
		BulletinBoard board = new BulletinBoard();
		board.setBulletinTitle(bulletinTitle);
		board.setBulletinContent(bulletinContent);
		board.setBulletinDate(new Date());
		int result = -1;
		result = bBoardService.addBulletin(board);
		if(result>0){
			return "redirect:/admin/toBulletin.html";
		}
		return "";
	}
	//公告--删除
	@RequestMapping("deleteBulletin.html")
	public String deleteBulletin(@RequestParam String id){
		int result = -1;
		result = bBoardService.deleteBulletin(Integer.parseInt(id));
		if(result>0){
			return "redirect:/admin/toBulletin.html";
		}
		return "";
	}
	
	//预约管理
	
	//查看已预约用户
	@RequestMapping("toSubscribe.html")
	public String toSubscribe(Model model){
		List<Subscribe> subscribeList =subscribeService.subscribeListYes();
		model.addAttribute("now",new Date());
		model.addAttribute("subscribeList", subscribeList);
		model.addAttribute("listNum", subscribeList.size());
		return "admin/subscribeList";
	}
	//清除已过期用户
	@RequestMapping("deleteSubscribeYes.html")
	public String deleteSubscribeYes(@RequestParam String id,Model model){
		int result = -1;
		try{
			result = subscribeService.deleteSubscribe(Integer.parseInt(id.trim()));
			if(result>0){
				return "redirect:toSubscribe.html";
			}else{
				model.addAttribute("info", "清除失败！");
				return "admin/subscribeList";
			}
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("info", "清除失败！");
			return "admin/subscribeList";
		}
		
	}
	//查看预约申请书
	@RequestMapping("subScribeContent.html")
	public String subScribeContent(@RequestParam String id,Model model){
		Subscribe subscribe = subscribeService.userSubscribeList(Integer.parseInt(id));
		model.addAttribute("content", subscribe.getSubscribeContent());
		return "admin/subScribeContent";
	}
	
	//预约审核
	@RequestMapping("toSubscribeCheck.html")
	public String toSubscribeCheck(Model model){
		List<Subscribe> subscribeList = subscribeService.subscribeListNo();
		model.addAttribute("subCheckList",subscribeList);
		model.addAttribute("listNum", subscribeList.size());
		return "admin/toSubscribeCheck";
	}
	//机房预约审核通过
	@RequestMapping("updateSubscribe.html")
	public String updateSubscribe(@RequestParam String id){
		Subscribe subscribe = new Subscribe();
		subscribe.setId(Integer.parseInt(id));
		subscribe.setSubscribeStatus("通过");
		//获取用户邮箱
		int result =-1;
		result = subscribeService.updateSubscribe(subscribe);
		subscribe = subscribeService.userSubscribeList(Integer.parseInt(id));
		String email = subscribe.getUserId();
		String date = new SimpleDateFormat("yyyy-MM-dd").format(subscribe.getSubscribeDate());
		String time = NodeTimeTools.nodeTime(subscribe.getSubscribeNode());
		if(result>0){
			Mail mail = new Mail();
			MailTools mTools = new MailTools();
			String host="";
			User userMail = userService.getMail();//获取到授权码
			host = mTools.host(userMail.getUserId());//获取服务器
			mail.setHost(host);//设置邮件服务器
	        mail.setSender(userMail.getUserId());  //发件人
	        mail.setReceiver(email); // 接收人  
	        mail.setUsername(userMail.getUserId()); // 登录账号
	        mail.setPassword(userMail.getUserOther()); // 发件人授权码 
	        mail.setSubject("关于机房预约审核结果的通知");
	        mail.setMessage("<h3>尊敬的用户您好！</h3><br/>"
	        		+ "  欢迎使用红河学院工学院计算机机房预约系统<br/>"
	        		+ "    您申请的机房预约已通过审核人员审核<br/>"
	        		+ "请您于"+date+subscribe.getSubscribeWeek()+" "+time
	        		+"按时带上个人证件到红河学院工学院"+subscribe.getSubscribeRoom()
	        		+"<br/>我们的工作人员会对您的身份进行核实后就可以使用机房啦<br/>"
	        		+ "期间可要请自觉遵守机房使用条款，不然会被关小黑屋的，感谢您的使用！");
	        mTools.send(mail);
			return "redirect:/admin/toSubscribeCheck.html";
			
		}
		return "";
	}
	
	//未通过机房审核
	@RequestMapping("updateSubscribeNo.html")
	public String updateSubscribeNo(@RequestParam String id){
		Subscribe subscribe = new Subscribe();
		subscribe.setId(Integer.parseInt(id));
		subscribe.setSubscribeStatus("未通过");
		int result =-1;
		result = subscribeService.updateSubscribe(subscribe);
		subscribe = subscribeService.userSubscribeList(Integer.parseInt(id));
		String email = subscribe.getUserId();
		if(result>0){
			Mail mail = new Mail();
			MailTools mTools = new MailTools();
			String host="";
			User userMail = userService.getMail();//获取到授权码
			host = mTools.host(userMail.getUserId());//获取服务器
			mail.setHost(host);//设置邮件服务器
	        mail.setSender(userMail.getUserId());  //发件人
	        mail.setReceiver(email); // 接收人  
	        mail.setUsername(userMail.getUserId()); // 登录账号
	        mail.setPassword(userMail.getUserOther()); // 发件人授权码 
	        mail.setSubject("关于机房预约审核结果的通知");
	        mail.setMessage("<h3>尊敬的用户您好！</h3><br/>"
	        		+ "  欢迎使用红河学院工学院计算机机房预约系统<br/>"
	        		+ "您的机房预约申请已被审核人员拒绝，如有疑问、或特殊重要事情，可致电"+userMail.getUserTel()+"!<br/>"
	        			+ "如给您带来麻烦尽情见谅！");
	        mTools.send(mail);
			return "redirect:/admin/toSubscribeCheck.html";
			
		}
		return "";
	}
	
	@RequestMapping("exitUser")
	public String exitUser(HttpSession session){
		session.removeAttribute("user");
		return "redirect:../login.html";
	}
}
