package cn.hs.pojo;

import java.io.Serializable;
import java.util.Date;

//课程表
public class Course implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String courseWeek;//上课星期
	private String courseNode;//上课节次
	private String courseName;//课程名称
	private String courseTeacher;//上课教师
	private String roomName;//上课机房
	private Date startDate;//开始时间
	private Date endDate;//结束时间
	private String weekWeek;//起始周次
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCourseWeek() {
		return courseWeek;
	}
	public void setCourseWeek(String courseWeek) {
		this.courseWeek = courseWeek;
	}
	public String getCourseNode() {
		return courseNode;
	}
	public void setCourseNode(String courseNode) {
		this.courseNode = courseNode;
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
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getWeekWeek() {
		return weekWeek;
	}
	public void setWeekWeek(String weekWeek) {
		this.weekWeek = weekWeek;
	}
	
	
}
