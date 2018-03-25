package com.crud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.crud.bean.Administrator;
import com.crud.bean.AdministratorExample;
import com.crud.bean.Superuser;
import com.crud.bean.SuperuserExample;
import com.crud.bean.SuperuserExample.Criteria;
import com.crud.dao.SuperuserMapper;
import com.crud.service.SuperuserService;

@Transactional
public class SuperuserServiceImpl implements SuperuserService {

	@Autowired
	SuperuserMapper superuserMapper;
	
	@Override
	public Superuser existUser(String username, String password) {
		SuperuserExample superuserExample = new SuperuserExample();
		Criteria criteria = superuserExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(password);
		List<Superuser> list = superuserMapper.selectByExample(superuserExample);
		if(list.size()<1) {
		return null;
		}
		return list.get(0);
	}

	//�޸�����
	@Override
	public int updatePassword(String username, String curPw, String pw1) {
		SuperuserExample superuserExample = new SuperuserExample();
		Criteria criteria = superuserExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(curPw);
		
		long count = superuserMapper.countByExample(superuserExample);
		if (count<1) {
			System.out.println("ԭ���벻��ȷ");
			return 0;
		}else {
			Superuser superuser = findUser(username);
			superuser.setPassword(pw1);
			superuserMapper.updateByPrimaryKeySelective(superuser);
			System.out.println("�Ѹ�������");
			return 1;
		}
	}

	//�����û�
	private Superuser findUser(String username) {
		SuperuserExample superuserExample = new SuperuserExample();
		Criteria criteria = superuserExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<Superuser> superusers = superuserMapper.selectByExample(superuserExample);
		Superuser superuser = superusers.get(0);
		return superuser;
	}

	//�û����Ƿ��ظ�
	@Override
	public int existUsername(String username) {
		SuperuserExample superuserExample = new SuperuserExample();
		Criteria criteria = superuserExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		long count = superuserMapper.countByExample(superuserExample);
		if (count>0) {
			return 0;
		}else
		return 1;
	}

}
