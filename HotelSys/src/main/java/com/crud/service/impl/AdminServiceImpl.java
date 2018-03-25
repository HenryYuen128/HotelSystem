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

	// ����Ƿ�����û�
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

	//�����û�
	@Override
	public Administrator findUser(String username) {
		AdministratorExample administratorExample = new AdministratorExample();
		Criteria criteria = administratorExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<Administrator> administrators = adminMapper.selectByExample(administratorExample);
		Administrator administrator = administrators.get(0);
		return administrator;
	}
	
	//�޸�����
	@Override
	public int updatePassword(String username, String curPw, String pw1) {
		AdministratorExample administratorExample = new AdministratorExample();
		Criteria criteria = administratorExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(curPw);
		
		long count = adminMapper.countByExample(administratorExample);
		if (count<1) {
			System.out.println("ԭ���벻��ȷ");
			return 0;
		}else {
			Administrator administrator = findUser(username);
			administrator.setPassword(pw1);
			adminMapper.updateByPrimaryKeySelective(administrator);
			System.out.println("�Ѹ�������");
			return 1;
		}
	}

	//��ȡ���й���Ա��Ϣ
	@Override
	public List<Administrator> getAll() {
		AdministratorExample administratorExample = new AdministratorExample();
		administratorExample.setOrderByClause("'index' ASC,Id ASC");
		return adminMapper.selectByExample(administratorExample);
	}

	//����ʵ���ֲ�ѯ����Ա
	@Override
	public List<Administrator> getByName(String searchname) {
		AdministratorExample administratorExample = new AdministratorExample();
		Criteria criteria = administratorExample.createCriteria();
		criteria.andRealnameEqualTo(searchname);
		List<Administrator> administrators = adminMapper.selectByExample(administratorExample);
		return administrators;
		
	}

	//ɾ������Ա
	@Override
	public void deleteAdmin(String name, String username) {
		AdministratorExample administratorExample = new AdministratorExample();
		Criteria criteria = administratorExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andRealnameEqualTo(name);
		adminMapper.deleteByExample(administratorExample);
	}

	//��ӹ���Ա
	@Override
	public void addAdmin(String name, String username, String password) {
		Administrator administrator = new Administrator();
		administrator.setUsername(username);
		administrator.setRealname(name);
		administrator.setPassword(password);
		adminMapper.insertSelective(administrator);
	}

	//�Ƿ�����û���
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
