package cn.hs.tools;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

//更改上传文件名称
//格式：当前时间+10000以内随机数.后缀名
public class Rename {
	//随机生成上传文件名
	public static String newsName(String name){
		String suffix = name.substring(name.lastIndexOf("."));
		String newsName="";
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		newsName = date+new Random().nextInt(10000)+suffix;
		return newsName;
	}
	//随机生成六位数密码,格式：小写字母+数字
	public static String newPwd(){
		//随机生成一个字母
		char c=(char)(int)(Math.random()*26+97);
		//随机生成一个5位数
		int random = new Random().nextInt(89999)+10000;
		return c+""+random;
	}
}
