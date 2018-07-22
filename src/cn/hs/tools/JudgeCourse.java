package cn.hs.tools;

import java.util.ArrayList;
import java.util.List;

import cn.hs.pojo.Course;

//课程判断
public class JudgeCourse {
	
	/**
	 * 整体思路：根据机房名称获取课程列表--根据节次获得节次列表--jsp中用节次列表来遍历填充1-7数据
	 * 1、循环遍历courseList可以得到各个时段各个星期
	 * 2、判断课表里有没有1-2节的课，如果有，再判断星期一到星期天有没有课，
	 * 2、根据节次，判断星期一有没有课，如果有，创建对象，添加课程名称、教师名称，如果没有，添加空值，list.add(对象)
	 * 如此循环判断到星期天，list中就存在7个对象，通过forEach遍历循环7次，依次获取数据
	 * 3、重复上述步骤！！！(:现在只有这个蠢点的想法，后期有更好方法再改进！:)
	 */
	public static List<Course> judge(List<Course> courseList,String courseNode){
		List<Course> list1  = new ArrayList<Course>();
		String[] weeks = {"星期一","星期二","星期三","星期四","星期五","星期六","星期天"};
		//list初始化赋值
		for(int i=0;i<weeks.length;i++){
			Course courseai = new Course();
			courseai.setCourseWeek(weeks[i]);
			list1.add(i,courseai);
		}
		for(Course course:courseList){
			if(course.getCourseNode().equals(courseNode)){
				for(int j=0;j<weeks.length;j++){
					if(course.getCourseWeek().equals(weeks[j])){
						list1.set(j,course);
					}
				}
			}
		}
		return list1;
	}
}
