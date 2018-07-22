package cn.hs.service.user;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import cn.hs.dao.user.UserMapper;
import cn.hs.pojo.User;
@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userMapper;
	//查找用户列表
	@Override
	public List<User> getUserList(Integer page,Integer pageSize) {
		
		return userMapper.getUserList(page,pageSize);
	}
	//用户登录判断
	@Override
	public User loginUser(String userName,String passWord) {
		User user=null;
		try{
			user = userMapper.loginUser(userName);
			if(user!=null){
				if(!user.getUserPwd().equals(passWord)){
					user=null;
				}
			}
		}catch (Exception e) {
			return user;
		}
		
		return user;
	}
	//添加用户
	@Override
	public int insertUser(User user) {
		if(user.getUserStatus()!=null){
			user.setUserStatus("未通过");
		}
		return userMapper.insertUser(user);
	}
	//更新用户信息
	@Override
	public int updateUser(User user) {
		
		return userMapper.updateUser(user);
	}
	//删除用户信息
	@Override
	public int deleteUser(User user) {
		
		return userMapper.deleteUser(user);
	}
	//获取单用户信息
	public User getUser(User user){
		return userMapper.getUser(user);
	}
	//获取待审核用户
	public List<User> getUserCheckList(){
		return userMapper.getUserCheckList();
	}
	//获取邮箱授权码
	public User getMail(){
		return userMapper.getMail();
	}
	//获取总记录
	public int getUserNum(){
		return userMapper.getUserNum();
	}

}
