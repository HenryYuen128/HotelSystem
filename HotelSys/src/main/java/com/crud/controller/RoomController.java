package com.crud.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crud.bean.Msg;
import com.crud.bean.Orders;
import com.crud.bean.Room;
import com.crud.bean.RoomSearch;
import com.crud.bean.User;
import com.crud.service.OrderService;
import com.crud.service.RoomService;
import com.crud.utils.ConvertString;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONObject;

@Controller
public class RoomController {

	@Autowired
	RoomService roomService;
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value="/rooms",method=RequestMethod.GET)
	@ResponseBody
	public Msg getRoomList(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		System.out.println("roomlistController");
		PageHelper.startPage(pn,6);
		List<Room> rooms = roomService.getRooms();
		PageInfo<Room> pageInfo = new PageInfo<Room>(rooms,5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping(value="/findrooms",method=RequestMethod.POST)
	@ResponseBody
	public Msg getRoomConList(RoomSearch roomSearch){
		System.out.println("conditions");
		System.out.println(roomSearch);
		
		int single = ConvertString.isToInt(roomSearch.getSingle());
		int couples = ConvertString.isToInt(roomSearch.getCouples());
		int luxury = ConvertString.isToInt(roomSearch.getLuxury());
		int garden = ConvertString.isToInt(roomSearch.getGarden());
		int computer = ConvertString.isToInt(roomSearch.getComputer());
		int breakfast = ConvertString.isToInt(roomSearch.getBreakfast());
		int clean = ConvertString.isToInt(roomSearch.getClean());
		
		int pn = ConvertString.isToInt(roomSearch.getPn());

		double fromprice = ConvertString.isToDouble(roomSearch.getFromprice());
		double toprice = ConvertString.isToDouble(roomSearch.getToprice());
		
		PageHelper.startPage(pn,6);
		
		List<Room> rooms = roomService.getConRooms(single, couples, luxury, garden, computer, breakfast, clean, fromprice, toprice);

		PageInfo<Room> pageInfo = new PageInfo<Room>(rooms,5);
		
		return Msg.success().add("pageInfo", pageInfo);
		
	}
	
	//管理员获取所有房间信息
	@RequestMapping(value = "/getRooms", method = RequestMethod.POST)
	@ResponseBody
	public Msg getUsers(@RequestParam(value="pn",defaultValue="1")Integer pn,@RequestParam(value="searchname")String searchname,HttpSession session) {
		System.out.println("查询房号:"+searchname);
		if (searchname=="") {
			PageHelper.startPage(pn,6);
			List<Room> rooms = roomService.getAll();
			PageInfo<Room> pageInfo = new PageInfo<Room>(rooms,5);
			return Msg.success().add("pageInfo", pageInfo);
		}else if(searchname!=""){
			PageHelper.startPage(pn,6);
			List<Room> users = roomService.getByName(searchname);
			PageInfo<Room> pageInfo = new PageInfo<Room>(users,5);
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.fail();
	}
	
	//获取一间房间信息
	@RequestMapping(value = "/getRoom/{room}", method = RequestMethod.GET)
	@ResponseBody
	public Msg getRoom(@PathVariable("room")String room) {
			Room room1 = roomService.getRoom(room);
			return Msg.success().add("room", room1);
			
	}
	
	//更新房间信息
	@RequestMapping(value = "/updateRoom", method = RequestMethod.POST)
	@ResponseBody
	public Msg	updateRoom(HttpServletRequest request) {
			String roomnumber = request.getParameter("roomnumber");
			String size = request.getParameter("size");
			String price = request.getParameter("price");
			String pc = request.getParameter("pc");
			String garden = request.getParameter("garden");
			String meal = request.getParameter("meal");
			String clean = request.getParameter("clean");
			
			roomService.updateRoom(roomnumber,size,price,pc,garden,meal,clean);
			return Msg.success();
	}
	
	//获取房间入住记录
	@RequestMapping(value = "/getRoomRecord", method = RequestMethod.POST)
	@ResponseBody
	public Msg getRoomRecord(@RequestParam(value="roomnumber")String roomnumber) {
		List<Orders> orders = orderService.getRoomRecord(roomnumber);
		return Msg.success().add("orders", orders);
	}

}
