package cn.hs.pojo;

import java.io.Serializable;
import java.util.Date;

//预约信息
public class Subscribe implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private String userId;//用户名称
	private String subscribeRoom;//申请机房
	private String subscribeWeek;//预约星期
	private String subscribeNode;//预约节次
	//@JSONField(format="yyyy年MM月dd日")
	private Date subscribeDate;//申请时间
	private String subscribeContent;//申请原因
	private String subscribeStatus;//状态
	private String subscribeTime;//时间备注
	private String userName;//用户名
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSubscribeRoom() {
		return subscribeRoom;
	}
	public void setSubscribeRoom(String subscribeRoom) {
		this.subscribeRoom = subscribeRoom;
	}
	public String getSubscribeWeek() {
		return subscribeWeek;
	}
	public void setSubscribeWeek(String subscribeWeek) {
		this.subscribeWeek = subscribeWeek;
	}
	public String getSubscribeNode() {
		return subscribeNode;
	}
	public void setSubscribeNode(String subscribeNode) {
		this.subscribeNode = subscribeNode;
	}
	public Date getSubscribeDate() {
		return subscribeDate;
	}
	public void setSubscribeDate(Date subscribeDate) {
		this.subscribeDate = subscribeDate;
	}
	public String getSubscribeContent() {
		return subscribeContent;
	}
	public void setSubscribeContent(String subscribeContent) {
		this.subscribeContent = subscribeContent;
	}
	public String getSubscribeStatus() {
		return subscribeStatus;
	}
	public void setSubscribeStatus(String subscribeStatus) {
		this.subscribeStatus = subscribeStatus;
	}
	public String getSubscribeTime() {
		return subscribeTime;
	}
	public void setSubscribeTime(String subscribeTime) {
		this.subscribeTime = subscribeTime;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
