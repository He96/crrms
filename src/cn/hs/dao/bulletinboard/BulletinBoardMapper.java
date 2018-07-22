package cn.hs.dao.bulletinboard;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.hs.pojo.BulletinBoard;

public interface BulletinBoardMapper {
	//添加公告
	public int addBulletin(BulletinBoard bulletinBoard);
	//删除公告
	public int deleteBulletin(@Param("id") int id);
	//查看公告
	public List<BulletinBoard> getBulletinList();
}
