package cn.hs.service.subscribe;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.hs.pojo.Subscribe;

public interface SubscribeService {
	//用户提交预约申请--添加
	public int addSubscribe(Subscribe subscribe);
	//审批人员审批用户申请--修改(状态)
	public int updateSubscribe(Subscribe subscribe);
	//用户删除预约信息--删除
	public int deleteSubscribe(int id);
	//用户预约--查看
	public Subscribe userSubscribeList(int id);
	//用户预约列表
	public List<Subscribe> userSubscribeListAll(String userId);
	//审批人员查看审核通过的预约
	public List<Subscribe> subscribeListYes();
	//审批人员-管理员查看待审核预约信息
	public List<Subscribe> subscribeListNo();
	//显示所有预约信息（不包括拒绝预约信息）
	public List<Subscribe> subscribeList(String roomName);
	//限制用户预约次数
	public int subscribeConfine(String userId);
	
}
