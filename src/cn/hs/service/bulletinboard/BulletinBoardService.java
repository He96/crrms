package cn.hs.service.bulletinboard;

import java.util.List;

import cn.hs.pojo.BulletinBoard;

	public interface BulletinBoardService {
		//添加公告
		public int addBulletin(BulletinBoard bulletinBoard);
		//删除公告
		public int deleteBulletin(int id);
		//查看公告
		public List<BulletinBoard> getBulletinList();
}
