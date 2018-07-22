package cn.hs.dao.course;
//课表接口

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.hs.pojo.Course;

public interface CourseMapper {
	//查询带有{第1-开头的课程
	public Course getOnlyCourseList();
	//课表查看
	public List<Course> getCourseList(@Param("roomName") String roomName);
	//课程添加
	public int addCourse(Course course);
	//课表更改
	public int updateCourse(Course course);
	//课表删除
	public int deleteCourse(Course course);
	//格式化课表
	public int deleteAllCourse();
}
