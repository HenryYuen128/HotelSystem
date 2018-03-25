package com.crud.service;

import java.util.List;

import com.crud.bean.Room;

public interface RoomService {

	List<Room> getRooms();

	List<Room> getConRooms(int single, int couples, int luxury, int garden, int computer, int breakfast, int clean, double fromprice, double toprice);

	List<Room> getAll();

	List<Room> getByName(String searchname);

	Room getRoom(String room);

	void updateRoom(String roomnumber, String size, String price, String pc, String garden, String meal, String clean);


}
