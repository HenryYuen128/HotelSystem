package com.crud.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.crud.bean.RoomExample;
import com.crud.bean.Transport;
import com.crud.bean.TransportExample;
import com.crud.bean.TransportExample.Criteria;
import com.crud.dao.TransportMapper;
import com.crud.service.TransportService;
@Transactional
public class TransportServiceImpl implements TransportService {
	@Autowired
	TransportMapper transportMapper;
	
	//生成订单
	@Override
	public void generateOrder(String orderId, String airport, String arrivalTime, String people,String username) {
		// TODO Auto-generated method stub
		String time1 = arrivalTime+":00";
		System.out.println(time1);
		int number = Integer.parseInt(people);
		Timestamp time = Timestamp.valueOf(time1);
		Transport record = new Transport();
		record.setOrderId(orderId);
		record.setAirport(airport);
		record.setArrivaltime(time);
		record.setPeople(number);
		record.setOrderName(username);
		//record.setOk(null);
		transportMapper.insertSelective(record);
	}
	@Override
	public List<Transport> getOrders(String username) {
		TransportExample transportExample = new TransportExample();
		Criteria criteria = transportExample.createCriteria();
		criteria.andOrderNameEqualTo(username);
		
		List<Transport> list = transportMapper.selectByExample(transportExample);
		
		return list;
	}
	//查询所有预约
	@Override
	public List<Transport> getAll() {
		TransportExample transportExample = new TransportExample();
		transportExample.setOrderByClause("'index' ASC,arrivaltime ASC");
		return transportMapper.selectByExample(transportExample);
		
	}
	
	//按订单号或用户名查询预约
	@Override
	public List<Transport> getByName(String searchname) {

		return transportMapper.fuzzyQuery(searchname);
	}
	//获取已完成预约
	@Override
	public List<Transport> getDoneTrans() {
		TransportExample transportExample = new TransportExample();
		transportExample.setOrderByClause("'index' ASC,arrivaltime ASC");
		Criteria criteria = transportExample.createCriteria();
		criteria.andOkEqualTo(1);
		return transportMapper.selectByExample(transportExample);
	}
	
	//获取未完成预约
	@Override
	public List<Transport> getNotTrans() {
		TransportExample transportExample = new TransportExample();
		transportExample.setOrderByClause("'index' ASC,arrivaltime ASC");
		Criteria criteria = transportExample.createCriteria();
		criteria.andOkEqualTo(0);
		return transportMapper.selectByExample(transportExample);
	}

}
