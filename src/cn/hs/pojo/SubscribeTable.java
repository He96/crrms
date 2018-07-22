package cn.hs.pojo;

import java.io.Serializable;
import java.util.Date;

//预约显示表（课程信息+已预约信息+可预约信息）
public class SubscribeTable implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//公共属性
	private Integer id;//
	private Date time;//当前时间
	private String week;//当前星期
	private String weekNum;//当前周
	//课程属性
	private String courseName;//课程名称
	private String courseTeacher;//教师名称
	private String weekWeek;//起始周次
	private Date startTime;//开始时间
	private Date endTime;//结束时间
	//预约属性
	private String subscribeStatus;//预约状态
	private String[] node;//预约节次或课程节次
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getWeekNum() {
		return weekNum;
	}
	public void setWeekNum(String weekNum) {
		this.weekNum = weekNum;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseTeacher() {
		return courseTeacher;
	}
	public void setCourseTeacher(String courseTeacher) {
		this.courseTeacher = courseTeacher;
	}
	public String getWeekWeek() {
		return weekWeek;
	}
	public void setWeekWeek(String weekWeek) {
		this.weekWeek = weekWeek;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getSubscribeStatus() {
		return subscribeStatus;
	}
	public void setSubscribeStatus(String subscribeStatus) {
		this.subscribeStatus = subscribeStatus;
	}
	public String[] getNode() {
		return node;
	}
	public void setNode(String[] node) {
		this.node = node;
	}
	
}