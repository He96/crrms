package cn.hs.tools;

public class NodeTimeTools {
	//节次转换时间
	public static String nodeTime(String node){
		//解决中文逗号问题
		if(node.indexOf("，")>0){
			node = node.replaceAll("，", ",");
		}
		//获取节次 --第10,11节
		int start=0,end=0,num=0;
		String time = "";
		//课程时间1-12节
		String[] times = {"08:00","09:40","10:00","11:40","13:00",
				"14:00","15:40","15:50","17:30","19:00","20:40","21:35"};
		String numNode = node.substring(node.indexOf("第")+1, node.indexOf("节"));
		//时间转换	
		if(node.indexOf(",")>0){
			start =Integer.parseInt(numNode.substring(0, numNode.indexOf(",")));
			end =Integer.parseInt(numNode.substring(numNode.lastIndexOf(",")+1));
			time = times[start-1]+"-"+times[end-1];
			return time;
		}else{
			num = Integer.parseInt(numNode);
			time = times[num-1];
			return time;
		}
	}
}
