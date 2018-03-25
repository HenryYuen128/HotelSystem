package com.crud.service;

import java.util.List;

import com.crud.bean.Transport;

public interface TransportService {

	void generateOrder(String orderId, String airport, String arrivalTime, String people, String username);

	List<Transport> getOrders(String username);

	List<Transport> getAll();

	List<Transport> getByName(String searchname);

	List<Transport> getDoneTrans();

	List<Transport> getNotTrans();

}
