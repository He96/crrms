package cn.hs.service.bulletinboard;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hs.dao.bulletinboard.BulletinBoardMapper;
import cn.hs.pojo.BulletinBoard;
@Service
public class BulletinBoardServiceImpl implements BulletinBoardService {
	@Resource
	private BulletinBoardMapper bBoardMapper;
	@Override
	public int addBulletin(BulletinBoard bulletinBoard) {
		return bBoardMapper.addBulletin(bulletinBoard);
	}

	@Override
	public int deleteBulletin(int id) {
		
		return bBoardMapper.deleteBulletin(id);
	}

	@Override
	public List<BulletinBoard> getBulletinList() {
		return bBoardMapper.getBulletinList();
	}

}
