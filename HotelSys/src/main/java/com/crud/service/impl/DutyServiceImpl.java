package com.crud.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.crud.bean.Duty;
import com.crud.bean.DutyExample;
import com.crud.bean.Transport;
import com.crud.bean.DutyExample.Criteria;
import com.crud.dao.DutyMapper;
import com.crud.service.DutyService;

@Transactional
public class DutyServiceImpl implements DutyService {
	@Autowired
	DutyMapper dutyMapper;
	
	//查询所有值班表
	@Override
	public List<Duty> getAll() {
		DutyExample dutyExample = new DutyExample();
		dutyExample.setOrderByClause("'index' ASC,ondutytime ASC");
		return dutyMapper.selectByExample(dutyExample);
	}

	//按名字查询值班表
	@Override
	public List<Duty> getByName(String searchname) {
		DutyExample dutyExample = new DutyExample();
		dutyExample.setOrderByClause("'index' ASC,ondutytime ASC");
		Criteria criteria = dutyExample.createCriteria();
		criteria.andRealnameEqualTo(searchname);
		return dutyMapper.selectByExample(dutyExample);
		
	}

	//添加值班表
	@Override
	public void addDuty(String name, String time,String time2) {
		String ontime = time+":00";
		String offtime = time2+":00";
		System.out.println(ontime);
		System.out.println(offtime);
		
		Timestamp ondutytime = Timestamp.valueOf(ontime);
		Timestamp offdutytime = Timestamp.valueOf(offtime);
		Duty duty = new Duty();
		duty.setOndutytime(ondutytime);
		duty.setOffdutytime(offdutytime);
		duty.setRealname(name);
		dutyMapper.insertSelective(duty);
		
	}

	//删除值班表
	@Override
	public void deleteDuty(String name, String ontime, String offtime) {
		DutyExample dutyExample = new DutyExample();
		Criteria criteria = dutyExample.createCriteria();
		System.out.println(offtime);
		
		System.out.println(Timestamp.valueOf(ontime));
		System.out.println(Timestamp.valueOf(offtime));
		criteria.andOndutytimeEqualTo(Timestamp.valueOf(ontime));
		criteria.andOffdutytimeEqualTo(Timestamp.valueOf(offtime));
		criteria.andRealnameEqualTo(name);
		dutyMapper.deleteByExample(dutyExample);
		System.out.println("已删除");
	}


	
}
