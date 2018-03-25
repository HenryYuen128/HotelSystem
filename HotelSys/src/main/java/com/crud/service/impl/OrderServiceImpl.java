package com.crud.service.impl;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.transaction.annotation.Transactional;

import com.crud.bean.Orders;
import com.crud.bean.OrdersExample;
import com.crud.bean.Room;
import com.crud.bean.RoomExample;
import com.crud.bean.RoomExample.Criteria;
import com.crud.dao.OrdersMapper;
import com.crud.dao.RoomMapper;
import com.crud.service.OrderService;
@Transactional
public class OrderServiceImpl implements OrderService{
@Autowired
OrdersMapper orderMapper;
@Autowired
RoomMapper roomMapper;
	@Override
	public String generateOrder(String username, String realname, String email, String tel, String addRequest,
			String roomnumber, String startDate, Integer nights, String endDate, Double originalPrice, Double discount,
			Double lastPrice) {
		String orderId = username + "."+UUID.randomUUID().toString().substring(0, 8);
		System.out.println(orderId);
		
		//Date date = new Date();
/*		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date checkintime = null;
		Date checkouttime = null;
		try {
			checkintime = sdf.parse(startDate);
			checkouttime = sdf.parse(endDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		Date checkintime = Date.valueOf(startDate);
		Date checkouttime = Date.valueOf(endDate);
		//��ȡ��������ʱ��
		//Date date = new Date();
		 //Timestamp creattime = new Timestamp(date.getTime());
		java.util.Date date = new java.util.Date();  
		Timestamp creattime = new Timestamp(date.getTime());
		
		
		/*BigDecimal b = new BigDecimal(lastPrice);   
		double lastprice1 = b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();*/
		
		Orders order = new Orders();
		order.setOrderid(orderId);
		order.setOrderUsername(username);
		order.setRealname(realname);
		order.setEmail(email);
		order.setTel(tel);
		order.setAddRequest(addRequest);
		order.setOrderRoom(roomnumber);
		order.setCheckintime(checkintime);
		order.setNights(nights);
		order.setCheckouttime(checkouttime);
		order.setOriginalprice(originalPrice);
		order.setDiscount(discount);
		order.setPrice(lastPrice);
		order.setOrderCreatetime(creattime);
		System.out.println("===========");
		System.out.println(checkintime);
		System.out.println(checkouttime);
		System.out.println(creattime);
		System.out.println(lastPrice);
		orderMapper.insertSelective(order);
		
		RoomExample roomExample = new RoomExample();
		Criteria criteria = roomExample.createCriteria();
		criteria.andRoomnumberEqualTo(roomnumber);
		List<Room> rooms = roomMapper.selectByExample(roomExample);
		Room room = rooms.get(0);
		System.out.println(room.getPrice());
		room.setBook(1);
		roomMapper.updateByPrimaryKey(room);
		
/*		RoomExample roomExample = new RoomExample();
		Criteria criteria = roomExample.createCriteria();
		criteria.andRoomnumberEqualTo(roomnumber);
		List<Room> rooms = roomMapper.selectByExample(roomExample);
		Room room = rooms.get(0);
		System.out.println(room);*/
/*		room.setBook(1);
		roomMapper.updateByPrimaryKey(room);*/
		
		return orderId;
	}
	
	//��ѯ���ж���
	@Override
	public List<Orders> getOrders(String username) {
			OrdersExample orders = new OrdersExample();
			com.crud.bean.OrdersExample.Criteria criteria = orders.createCriteria();
			criteria.andOrderUsernameEqualTo(username);
			List<Orders> orderList = orderMapper.selectByExample(orders);
			
			
			
			return orderList;
	}
	
	//��ѯ������ϸ
	@Override
	public Orders getOrderDetail(String orderId) {
		OrdersExample ordersExample = new OrdersExample();
		com.crud.bean.OrdersExample.Criteria criteria = ordersExample.createCriteria();
		criteria.andOrderidEqualTo(orderId);
		List<Orders> list = orderMapper.selectByExample(ordersExample);
		Orders order = list.get(0);
		return order;
	}

	//�˷�
	@Override
	public void checkout(String orderId) {
		OrdersExample ordersExample = new OrdersExample();
		com.crud.bean.OrdersExample.Criteria criteria = ordersExample.createCriteria();
		criteria.andOrderidEqualTo(orderId);
		List<Orders> list = orderMapper.selectByExample(ordersExample);
		Orders order = list.get(0);
		order.setEnd(1);
		orderMapper.updateByPrimaryKey(order);
		System.out.println("���˷�");
		
		
		
		//��������Ϊ��Ԥ��
		String roomnumber = order.getOrderRoom();
		RoomExample roomExample = new RoomExample();
		com.crud.bean.RoomExample.Criteria criteria2 = roomExample.createCriteria();
		criteria2.andRoomnumberEqualTo(roomnumber);
		List<Room> rooms = roomMapper.selectByExample(roomExample);
		Room room = rooms.get(0);
		
		room.setBook(0);
		roomMapper.updateByPrimaryKey(room);
		
		System.out.println("����������Ϊ��Ԥ��");
		
	}

	//��ѯ�û��Ķ���
	@Override
	public List<Orders> getUserOrders(String name) {
		OrdersExample ordersExample = new OrdersExample();
		com.crud.bean.OrdersExample.Criteria criteria = ordersExample.createCriteria();
		criteria.andOrderUsernameEqualTo(name);
		List<Orders> orders = orderMapper.selectByExample(ordersExample);
		return orders;
	}

	//��ѯ������ס��¼
	@Override
	public List<Orders> getRoomRecord(String roomnumber) {
		OrdersExample ordersExample = new OrdersExample();
		com.crud.bean.OrdersExample.Criteria criteria = ordersExample.createCriteria();
		criteria.andOrderRoomEqualTo(roomnumber);
		return orderMapper.selectByExample(ordersExample);
	}
	
	

}
