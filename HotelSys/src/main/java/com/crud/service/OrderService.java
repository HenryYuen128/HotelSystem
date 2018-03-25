package com.crud.service;

import java.util.List;

import org.springframework.core.annotation.Order;

import com.crud.bean.Orders;

public interface OrderService {

	String generateOrder(String username, String realname, String email, String tel, String addRequest, String roomnumber,
			String startDate, Integer nights, String endDate, Double originalPrice, Double discount, Double lastPrice);

	List<Orders> getOrders(String username);

	Orders getOrderDetail(String orderId);

	void checkout(String orderId);

	List<Orders> getUserOrders(String name);

	List<Orders> getRoomRecord(String roomnumber);
}
