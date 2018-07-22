package cn.hs.tools;
import java.text.ParseException;
//周--日期转换
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class WeekDateTools {
	//用周次和开始时间得到xx周后星期一的时间
	public static Date weekDateTools(int weekNums,Date startDate){
		//第一周时间
		if(weekNums==1){
			return startDate;
		}
		Date wantDate = null;
		//n周的时间
		long wantS = (weekNums-1)*7*86400; 
		wantDate = new Date(wantS*1000+startDate.getTime());	
		return wantDate;
	}
	//用当前时间得到当前是第几周
	public static int dateWeek(Date startDate){
		//当前时间
		Date now = new Date();
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String date = sdf.format(now);
		//String date = "2017-7-3 12:59:59";
		try {
			//now = sdf.parse(date);
			long first = startDate.getTime();
			//周次计算公式：(开始周毫秒数 - 当前时间毫秒数 )/一周的时间+1
			long nows = now.getTime();
			long c = nows-first;
			long s =c/7/86400/1000;
			int want = (int)s+1;
			
			return want;
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	//测试方法
	public static void main(String[] args) {
//		Date helloDate = weekDateTools(18, new Date());
//		System.out.println(new Date().getTime());
//		System.out.println("18周后的今天："+
//				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(helloDate));
//		
		//获得当前周次(不能按本年几周算，存在跨年问题)
		String date = "2017-2-27";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date startDate = sdf.parse(date);
			int want = WeekDateTools.dateWeek(startDate);
			System.out.println(want);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}
}
