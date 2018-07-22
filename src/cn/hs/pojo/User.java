package cn.hs.pojo;

import java.io.Serializable;

//用户
public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;//ID
	private String userId;//邮箱号
	private String userPwd;//密码
	private String userName;//姓名
	private String userTel;//联系电话
	private String userImg;//个人资料
	private String userOther;//授权码or用途
	private String userStatus;//状态
	private Integer userRole;//角色
	
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
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	
	public String getUserOther() {
		return userOther;
	}
	public void setUserOther(String userOther) {
		this.userOther = userOther;
	}
	
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	public Integer getUserRole() {
		return userRole;
	}
	public void setUserRole(Integer userRole) {
		this.userRole = userRole;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userTel=" + userTel + ", userImg=" + userImg + ", userOther=" + userOther + ", userStatus="
				+ userStatus + ", userRole=" + userRole + "]";
	}
	
	
}
