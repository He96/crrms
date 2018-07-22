package cn.hs.tools;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import cn.hs.pojo.Course;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

/**
 * @author Mathew
 */
public class ExcelAnalyTools {
	//解析Excel方法
	public static List<Course> excel(String path,Date firstDate){
		List<Course> listCourse = null;
		try {
			//创建workbook并指定路径
			//创建课程对象
			listCourse = new ArrayList<Course>();
			
			Workbook workbook = Workbook.getWorkbook(new File(path));
			//获取第一个工作表sheet
			Sheet sheet = workbook.getSheet(0);
			String[] weeks = {"星期一","星期二","星期三","星期四","星期五","星期六","星期天"};
			//获取数据，循环行
			for(int i=0;i<sheet.getRows();i++){
				for(int j=0;j<7;j++){
					//取出Excel表格每一行第一列数据和"星期"做对比
					if(sheet.getCell(0,i).getContents().equals(weeks[j])){
						Course course = new Course();
						//获取列值
						//获取星期
						Cell cell0 = sheet.getCell(0, i);
						course.setCourseWeek(cell0.getContents());
						//获取节次
						Cell cell1 = sheet.getCell(1, i);
						course.setCourseNode(cell1.getContents());
						//获取课程
						Cell cell3 = sheet.getCell(3, i);
						course.setCourseName(cell3.getContents());
						//获取教师
						Cell cell4 = sheet.getCell(4, i);
						course.setCourseTeacher(cell4.getContents());
						//获取教室
						Cell cell6 = sheet.getCell(6, i);
						course.setRoomName(cell6.getContents());
						//获取起始时间
						Cell cell10 = sheet.getCell(10, i);
						String DateWeek = cell10.getContents();
						//获取周次
						String weekWeek = DateWeek.substring(DateWeek.indexOf("{"),DateWeek.indexOf("}")+1);
						course.setWeekWeek(weekWeek);
						String start= DateWeek.substring(DateWeek.indexOf("{")+2, DateWeek.indexOf("-"));
						String end = DateWeek.substring(DateWeek.indexOf("-")+1, DateWeek.indexOf("}")-1);
						Date starts = WeekDateTools.weekDateTools(Integer.parseInt(start), firstDate);
						Date ends = WeekDateTools.weekDateTools(Integer.parseInt(end), firstDate);
						course.setStartDate(starts);
						course.setEndDate(ends);
						listCourse.add(course); 
					}
				}
			}
			//关闭流
			workbook.close();
		} catch (BiffException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listCourse;
	}
	
	public static void main(String[] args) {
//		Pattern p = Pattern.compile("[星期一,星期二,星期三,星期四,星期五,星期六，星期天]");
//		Matcher m = p.matcher("星");
//		System.out.println(m.find());
//		ExcelAnalyTools.excel("F:/毕设/任418.xls");
		Date firstDate = new Date();
		List<Course> list  = ExcelAnalyTools.excel("F:/毕设/任418.xls", firstDate);
		for(Course course:list){
			System.out.println("课程："+course.getCourseName()+" 星期："+course.getCourseWeek()+" 日期："+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(course.getEndDate()));
		}
	}

}
