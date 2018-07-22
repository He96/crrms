package cn.hs.service.course;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hs.dao.course.CourseMapper;
import cn.hs.pojo.Course;
@Service
public class CourseServiceImpl implements CourseService {
	@Resource
	private CourseMapper courseMapper;
	@Override
	public List<Course> getCourseList(String roomName) {
		return courseMapper.getCourseList(roomName);
	}

	@Override
	public int addCourse(Course course) {
		return courseMapper.addCourse(course);
	}

	@Override
	public int updateCourse(Course course) {
		return courseMapper.updateCourse(course);
	}

	@Override
	public int deleteCourse(Course course) {
		return courseMapper.deleteCourse(course);
	}
	//格式化课表
	public int deleteAllCourse(){
		return courseMapper.deleteAllCourse();
	}
	
	public Course getOnlyCourseList(){
		return courseMapper.getOnlyCourseList();
	}

}
