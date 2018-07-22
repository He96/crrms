package cn.hs.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.hs.pojo.User;

public interface UserMapper {
	//多用户查询
	public List<User> getUserList(@Param("page")Integer page,@Param("pageSize")Integer pageSize);
	//获取单用户信息
	public User getUser(User user);
	//获取待审核用户
	public List<User> getUserCheckList();
	//登录
	public User loginUser(@Param("userName")String userName);
	//新增、注册用户
	public int insertUser(User user);
	//更改用户信息
	public int updateUser(User user);
	//删除用户信息
	public int deleteUser(User user);
	//获取邮箱授权码
	public User getMail();
	//用户总数
	public int getUserNum();
}
