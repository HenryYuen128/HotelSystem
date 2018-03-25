package com.crud.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.crud.bean.Room;
import com.crud.bean.RoomExample;
import com.crud.bean.User;
import com.crud.bean.UserExample;
import com.crud.bean.RoomExample.Criteria;
import com.crud.dao.RoomMapper;
import com.crud.service.RoomService;

@Transactional
public class RoomServiceImpl implements RoomService {
	@Autowired
	RoomMapper roomMapper;

	@Override
	public List<Room> getRooms() {
		RoomExample roomExample = new RoomExample();
		Criteria criteria = roomExample.createCriteria();
		criteria.andBookEqualTo(0);
		return roomMapper.selectByExample(roomExample);
	}

	@Override
	public List<Room> getConRooms(int single, int couples, int luxury, int garden, int computer, int breakfast,
			int clean, double fromprice, double toprice) {
		RoomExample roomExample = new RoomExample();
		Criteria criteria = roomExample.createCriteria();
		if (single==1||couples==1||luxury==1) {
			List<Integer> sizes = new ArrayList<Integer>(Arrays.asList(0,0,0));
			if (single == 1)
				sizes.set(0, 1);
			if (couples == 1)
				sizes.set(1, 2);
			if (luxury == 1)
				sizes.set(2, 3);

			criteria.andSizeIn(sizes);
		}
		

		if (garden == 1)
			criteria.andGardenEqualTo(1);
		if (computer == 1)
			criteria.andComputerEqualTo(1);
		if (breakfast == 1)
			criteria.andFreebreakfastEqualTo(1);
		if (clean == 1)
			criteria.andDailycleanEqualTo(1);

		if (fromprice != 0 || toprice != 0) {
			if (toprice < fromprice) {
				double a = toprice;
				toprice = fromprice;
				fromprice = a;
				criteria.andPriceBetween(fromprice, toprice);
			}
			criteria.andPriceBetween(fromprice, toprice);
		}

		criteria.andBookEqualTo(0);
		return roomMapper.selectByExample(roomExample);

	}

	@Override
	public List<Room> getAll() {
		RoomExample roomExample = new RoomExample();
		roomExample.setOrderByClause("'index' ASC,Id ASC");
		return roomMapper.selectByExample(roomExample);
	}

	@Override
	public List<Room> getByName(String searchname) {
		RoomExample roomExample = new RoomExample();
		Criteria criteria = roomExample.createCriteria();
		criteria.andRoomnumberEqualTo(searchname);
		List<Room> rooms = roomMapper.selectByExample(roomExample);
		return rooms;
	}
	//搜索房间、查询入住记录
	@Override
	public Room getRoom(String room) {
		RoomExample roomExample = new RoomExample();
		Criteria criteria = roomExample.createCriteria();
		criteria.andRoomnumberEqualTo(room);
		List<Room> rooms = roomMapper.selectByExample(roomExample);
		return rooms.get(0);
	}
	
	//更新房间信息
	@Override
	public void updateRoom(String roomnumber, String size, String price, String pc, String garden, String meal,
			String clean) {
		Room room = new Room();
		room.setSize(Integer.valueOf(size));
		room.setPrice(Double.valueOf(price));
		room.setComputer(Integer.valueOf(pc));
		room.setGarden(Integer.valueOf(garden));
		room.setFreebreakfast(Integer.valueOf(meal));
		room.setDailyclean(Integer.valueOf(clean));
		
		RoomExample roomExample = new RoomExample();
		Criteria criteria = roomExample.createCriteria();
		criteria.andRoomnumberEqualTo(roomnumber);
		
		roomMapper.updateByExampleSelective(room, roomExample);
		System.out.println("更新成功");
	}





	
	

}
