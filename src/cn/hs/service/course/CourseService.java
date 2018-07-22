package cn.hs.service.course;

import java.util.List;

import cn.hs.pojo.Course;

public interface CourseService {
	//查询带有{第1开头的第一个课程
	public Course getOnlyCourseList();
	//课表查看
	public List<Course> getCourseList(String roomName);
	//课程添加
	public int addCourse(Course course);
	//课表更改
	public int updateCourse(Course course);
	//课表删除
	public int deleteCourse(Course course);
	//格式化课表
	public int deleteAllCourse();
}
