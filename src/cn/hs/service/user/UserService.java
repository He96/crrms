package cn.hs.service.user;

import java.util.List;

import cn.hs.pojo.User;

public interface UserService {
		//多用户查询
		public List<User> getUserList(Integer page,Integer pageSize);
		//登录
		public User loginUser(String userName,String passWord);
		//新增用户
		public int insertUser(User user);
		//更改用户信息
		public int updateUser(User user);
		//删除用户信息
		public int deleteUser(User user);
		//获取单用户信息
		public User getUser(User user);
		//获取待审核用户
		public List<User> getUserCheckList();
		//获取邮箱授权码
		public User getMail();
		//获取总页数
		public int getUserNum();
}
