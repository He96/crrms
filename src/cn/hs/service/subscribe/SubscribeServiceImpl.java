package cn.hs.service.subscribe;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import cn.hs.dao.subscribe.SubscribeMapper;
import cn.hs.pojo.Subscribe;
@Service
public class SubscribeServiceImpl implements SubscribeService {
	@Resource
	private SubscribeMapper subscribeMapper;

	@Override
	public synchronized int addSubscribe(Subscribe subscribe) {
		//防止抢占
		/**获取所要预约的机房
		 * 获取预约时间和节次
		 * 判断是否已被预约
		 * **/
		int nowSub=-2;
		try{
		nowSub = subscribeMapper.synSubscribe(subscribe);
		//不存在则可预约
		if(nowSub==0){
			return subscribeMapper.addSubscribe(subscribe);
		}else{
			return -2;
		}
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public int updateSubscribe(Subscribe subscribe) {
		return subscribeMapper.updateSubscribe(subscribe);
	}

	@Override
	public int deleteSubscribe(int id) {
		return subscribeMapper.deleteSubscribe(id);
	}
	@Override
	public Subscribe userSubscribeList(int id){
		return subscribeMapper.userSubscribeList(id);
	}
	@Override
	//用户预约列表--查看
	public List<Subscribe> userSubscribeListAll(String userId){
		return subscribeMapper.userSubscribeListAll(userId);
	}

	@Override
	public List<Subscribe> subscribeListYes() {
		return subscribeMapper.subscribeListYes();
	}

	@Override
	public List<Subscribe> subscribeListNo() {
		return subscribeMapper.subscribeListNo();
	}
	//显示所有预约信息（不包括拒绝预约信息）
	public List<Subscribe> subscribeList(String roomName){
		return subscribeMapper.subscribeList(roomName);
	}
	//限制用户预约次数
	public int subscribeConfine(String userId){
		return subscribeMapper.subscribeConfine(userId);
	}
	
}
