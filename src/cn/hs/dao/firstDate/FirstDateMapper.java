package cn.hs.dao.firstDate;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.hs.pojo.FirstDate;

public interface FirstDateMapper {
	//获取第一周时间
	public List<FirstDate> getfirstDate();
	//添加第一周时间
	public int addfirstDate(@Param("firstDate") Date firstDate);
	//获取时间总数
	public int firstDateNum();
	//删除第一周时间
	public int deletefirstDate();
}
