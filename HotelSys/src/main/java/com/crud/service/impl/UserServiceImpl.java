package com.crud.service.impl;

import java.util.List;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.crud.bean.Msg;
import com.crud.bean.OrdersExample;
import com.crud.bean.RoomExample;
import com.crud.bean.User;
import com.crud.bean.UserExample;
import com.crud.bean.UserExample.Criteria;
import com.crud.dao.OrdersMapper;
import com.crud.dao.UserMapper;
import com.crud.service.UserService;

@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	
	@Autowired
	OrdersMapper ordersMapper;
	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		UserExample userExample = new UserExample();
		userExample.setOrderByClause("'index' ASC,Id ASC");
		return userMapper.selectByExample(userExample);
	}
	
	@Override
	public User existUser(String username, String password) {
		// TODO Auto-generated method stub
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(password);
		List<User> list = userMapper.selectByExample(userExample);
		if(list.size()<1) {
		return null;
		}
		return list.get(0);
	}

	//�û�������
	@Override
	public boolean checkUser(String username) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		long count = userMapper.countByExample(userExample);
		return count==0;
	}
	//ע�ᣬ����û�
	@Override
	public void register(User user) {
		userMapper.insertSelective(user);
	}

	@Override
	public User getDiscount(String username) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<User> users = userMapper.selectByExample(userExample);
		User user = users.get(0);
		return user;
	}
	//�����û�
	@Override
	public User findUser(String username) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<User> users = userMapper.selectByExample(userExample);
		User user = users.get(0);
		return user;
		
		
		
	}
	
	//��������
	@Override
	public int updatePassword(String username, String curPw, String pw1) {
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(curPw);
		
		long count = userMapper.countByExample(userExample);
		if (count<1) {
			System.out.println("ԭ���벻��ȷ");
			return 0;
		}else {
			User user = findUser(username);
			user.setPassword(pw1);
			userMapper.updateByPrimaryKeySelective(user);
			System.out.println("�Ѹ�������");
			return 1;
		}

		
		
	}

	@Override
	public void updateEmail(String username, String email) {
			User user = findUser(username);
			user.setEmail(email);
			userMapper.updateByPrimaryKeySelective(user);
	}

		//�����û��ȼ�
	@Override
	public void updateUserType(String username) {
		OrdersExample ordersExample = new OrdersExample();
		com.crud.bean.OrdersExample.Criteria criteria = ordersExample.createCriteria();
		criteria.andOrderUsernameEqualTo(username);
		long count = ordersMapper.countByExample(ordersExample);
		
		UserExample userExample = new UserExample();
		Criteria criteria2 = userExample.createCriteria();
		criteria2.andUsernameEqualTo(username);
		
		List<User> list = userMapper.selectByExample(userExample);
		User user = list.get(0);
		
		
		if (count<=3) {
			user.setUsertype(0);
			userMapper.updateByPrimaryKeySelective(user);
			System.out.println("0��");
		}else if (count<=6) {
			user.setUsertype(1);
			userMapper.updateByPrimaryKeySelective(user);
			System.out.println("����Ϊ1");
		}else if(count>=7){
			user.setUsertype(2);
			userMapper.updateByPrimaryKeySelective(user);
			System.out.println("����Ϊ2");
		}
	}

	//ͨ�����ֲ�ѯ�û�
		@Override
		public List<User> getByName(String searhname) {
			UserExample userExample = new UserExample();
			Criteria criteria = userExample.createCriteria();
			criteria.andUsernameEqualTo(searhname);
			List<User> users = userMapper.selectByExample(userExample);
			return users;
		}
	
	
/*	public void updateUserType(int flag) {
		if (flag==0) {
			System.out.println("�û��ȼ�Ϊ0");
			user
		}
	}*/





}
