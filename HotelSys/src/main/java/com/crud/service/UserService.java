package com.crud.service;

import java.util.List;

import com.crud.bean.Msg;
import com.crud.bean.User;

public interface UserService {
	//获得所有用户
	public List<User> getAll();
	
	//是否存在用户
	public User existUser(String username, String password);

	//查询用户名是否可用
	public boolean checkUser(String username);

	//注册
	public void register(User user);

	//获取账号类型
	public User getDiscount(String username);

	//查找单个用户
	public User findUser(String username);

	//修改密码
	public int updatePassword(String username, String curPw, String pw1);
	
	//修改邮箱
	public void updateEmail(String username, String email);
	
    //查询用户订单数量
	public void updateUserType(String username);

	//通过名字查询用户
	public List<User> getByName(String searchname);

	
	
	
	
	
}
