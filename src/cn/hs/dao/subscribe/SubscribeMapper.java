package cn.hs.dao.subscribe;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.hs.pojo.Subscribe;

public interface SubscribeMapper {
	//预约流程
	//用户提交预约申请--添加
	public int addSubscribe(Subscribe subscribe);
	//审批人员审批用户申请--修改(状态)
	public int updateSubscribe(Subscribe subscribe);
	//用户删除预约信息--删除
	public int deleteSubscribe(@Param("id") int id);
	//用户预约情况
	public Subscribe userSubscribeList(@Param("id") int id);
	//用户预约列表--查看
	public List<Subscribe> userSubscribeListAll(@Param("userId") String userId);
	//审批人员查看审核通过的预约
	public List<Subscribe> subscribeListYes();
	//审批人员-管理员查看待审核预约信息
	public List<Subscribe> subscribeListNo();
	//显示所有预约信息（不包括拒绝预约信息）
	public List<Subscribe> subscribeList(@Param("roomName") String roomName);
	//限制用户预约次数
	public int subscribeConfine(@Param("userId") String userId);
	//抢占资源判断
	public int synSubscribe(Subscribe subscribe);
	
}
