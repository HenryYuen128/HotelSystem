package com.crud.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crud.bean.Msg;
import com.crud.bean.Orders;
import com.crud.bean.Room;
import com.crud.bean.Transport;
import com.crud.dao.TransportMapper;
import com.crud.service.TransportService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class TransportController {
@Autowired
TransportService transportService;

@RequestMapping(value="/transportOrder")
@ResponseBody
public Msg generateTransportOrder(@RequestParam("orderId")String orderId,@RequestParam("airport") String airport,
		@RequestParam("arrivalTime") String arrivalTime,@RequestParam("people") String people,HttpSession session) {
	String username = (String) session.getAttribute("username");
	transportService.generateOrder(orderId,airport,arrivalTime,people,username);
	return Msg.success();
}

//修改账户类型
@RequestMapping(value = "/getTransportOrders", method = RequestMethod.POST)
@ResponseBody
public Msg getTransportOrders(@RequestParam(value="pn",defaultValue="1")Integer pn,@RequestParam("username") String username) {
	//String name = (String) session.getAttribute("username");
	System.out.println(username);
	
	
	PageHelper.startPage(pn,6);
	List<Transport> transports = transportService.getOrders(username);
	PageInfo<Transport> pageInfo = new PageInfo<Transport>(transports,5);
	return Msg.success().add("pageInfo", pageInfo);
}

//管理员获取所有预约信息
@RequestMapping(value = "/getAllTransport", method = RequestMethod.POST)
@ResponseBody
public Msg getAllTransport(@RequestParam(value="pn",defaultValue="1")Integer pn,@RequestParam(value="searchname")String searchname,HttpSession session) {
	System.out.println("查询单号:"+searchname);
	if (searchname=="") {
		PageHelper.startPage(pn,6);
		List<Transport> trans = transportService.getAll();
		PageInfo<Transport> pageInfo = new PageInfo<Transport>(trans,5);
		return Msg.success().add("pageInfo", pageInfo);
	}else if(searchname!=""){
		PageHelper.startPage(pn,6);
		List<Transport> trans = transportService.getByName(searchname);
		PageInfo<Transport> pageInfo = new PageInfo<Transport>(trans,5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	return Msg.fail();
}

//查询完成或未完成订单
@RequestMapping(value = "/getDoneOrNotTransport", method = RequestMethod.POST)
@ResponseBody
public Msg getDoneOrNotTransport(@RequestParam(value="pn",defaultValue="1")Integer pn,@RequestParam(value="done")String done,HttpSession session) {
	
	if (done.equals("done")) {
		PageHelper.startPage(pn,6);
		List<Transport> trans = transportService.getDoneTrans();
		PageInfo<Transport> pageInfo = new PageInfo<Transport>(trans,5);
		return Msg.success().add("pageInfo", pageInfo);
	}else if(done.equals("not")){
		PageHelper.startPage(pn,6);
		List<Transport> trans = transportService.getNotTrans();
		PageInfo<Transport> pageInfo = new PageInfo<Transport>(trans,5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	return Msg.fail();
}


}
