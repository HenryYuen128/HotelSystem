package com.crud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.crud.bean.Administrator;
import com.crud.bean.AdministratorExample;
import com.crud.bean.Room;
import com.crud.bean.RoomExample;
import com.crud.bean.User;
import com.crud.bean.UserExample;
import com.crud.bean.AdministratorExample.Criteria;
import com.crud.dao.AdministratorMapper;
import com.crud.service.AdminService;

@Transactional
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdministratorMapper adminMapper;

	// 检查是否存在用户
	@Override
	public Administrator existUser(String username, String password) {
		AdministratorExample administratorExample = new AdministratorExample();
		Criteria criteria = administratorExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(password);
		List<Administrator> list = adminMapper.selectByExample(administratorExample);
		if (list.size() < 1) {
			return null;
		}
		return list.get(0);
	}

	@Override
	public int findAdminByName(String name) {
		AdministratorExample administratorExample = new AdministratorExample();
		Criteria criteria = administratorExample.createCriteria();
		criteria.andRealnameEqualTo(name);
		long count = adminMapper.countByExample(administratorExample);
		if (count < 1) {
			return 0;
		} else {
			return 1;
		}
	}

	//查找用户
	@Override
	public Administrator findUser(String username) {
		AdministratorExample administratorExample = new AdministratorExample();
		Criteria criteria = administratorExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<Administrator> administrators = adminMapper.selectByExample(administratorExample);
		Administrator administrator = administrators.get(0);
		return administrator;
	}
	
	//修改密码
	@Override
	public int updatePassword(String username, String curPw, String pw1) {
		AdministratorExample administratorExample = new AdministratorExample();
		Criteria criteria = administratorExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(curPw);
		
		long count = adminMapper.countByExample(administratorExample);
		if (count<1) {
			System.out.println("原密码不正确");
			return 0;
		}else {
			Administrator administrator = findUser(username);
			administrator.setPassword(pw1);
			adminMapper.updateByPrimaryKeySelective(administrator);
			System.out.println("已更新密码");
			return 1;
		}
	}

	//获取所有管理员信息
	@Override
	public List<Administrator> getAll() {
		AdministratorExample administratorExample = new AdministratorExample();
		administratorExample.setOrderByClause("'index' ASC,Id ASC");
		return adminMapper.selectByExample(administratorExample);
	}

	//按真实名字查询管理员
	@Override
	public List<Administrator> getByName(String searchname) {
		AdministratorExample administratorExample = new AdministratorExample();
		Criteria criteria = administratorExample.createCriteria();
		criteria.andRealnameEqualTo(searchname);
		List<Administrator> administrators = adminMapper.selectByExample(administratorExample);
		return administrators;
		
	}

	//删除管理员
	@Override
	public void deleteAdmin(String name, String username) {
		AdministratorExample administratorExample = new AdministratorExample();
		Criteria criteria = administratorExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andRealnameEqualTo(name);
		adminMapper.deleteByExample(administratorExample);
	}

	//添加管理员
	@Override
	public void addAdmin(String name, String username, String password) {
		Administrator administrator = new Administrator();
		administrator.setUsername(username);
		administrator.setRealname(name);
		administrator.setPassword(password);
		adminMapper.insertSelective(administrator);
	}

	//是否存在用户名
	@Override
	public int existUsername(String username) {
		AdministratorExample administratorExample = new AdministratorExample();
		Criteria criteria = administratorExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		long count = adminMapper.countByExample(administratorExample);
		if (count>0) {
			return 0;
		}else
		return 1;
	}

	
}
