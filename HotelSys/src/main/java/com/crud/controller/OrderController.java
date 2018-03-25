package com.crud.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.HTTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crud.bean.Msg;
import com.crud.bean.Orders;
import com.crud.bean.Room;
import com.crud.service.OrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	//生成订单
	@RequestMapping(value="/generateOrder",method=RequestMethod.POST)
	@ResponseBody
	public Msg generateOrder(
			@RequestParam("username") String username,@RequestParam("realname") String realname,
			@RequestParam("email") String email,@RequestParam("tel") String tel,
			@RequestParam("addRequest") String addRequest,@RequestParam("roomnumber")String roomnumber,
			@RequestParam("startDate")String startDate,@RequestParam("nights") Integer nights,
			@RequestParam("endDate") String endDate,@RequestParam("originalPrice") Double originalPrice,
			@RequestParam("discount") Double discount,@RequestParam("lastPrice") Double lastPrice,
			HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		System.out.println("生成订单");
/*		System.out.println(username);
		System.out.println(realname);
		System.out.println(email);
		System.out.println(tel);
		System.out.println(addRequest);
		System.out.println(roomnumber);
		System.out.println(startDate);
		System.out.println(nights);
		System.out.println(endDate);
		System.out.println(originalPrice);
		System.out.println(discount);
		System.out.println(lastPrice);*/
		
		String orderId = orderService.generateOrder(username,realname,email,tel,addRequest,
				roomnumber,startDate,nights,endDate,originalPrice,discount,lastPrice);
		
		request.getSession().setAttribute("orderId", orderId);
		
		return Msg.success();
		
	}
	
	//查询订单
	@RequestMapping(value="/getOrders",method=RequestMethod.POST)
	@ResponseBody
	public Msg getOrders(@RequestParam(value="pn",defaultValue="1")Integer pn,@RequestParam(value="username")String username,HttpSession session) {
		String name = (String) session.getAttribute("username");
		System.out.println(name);
		
		
		PageHelper.startPage(pn,6);
		List<Orders> orders = orderService.getOrders(username);
		PageInfo<Orders> pageInfo = new PageInfo<Orders>(orders,5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	
	//查询订单详细信息
		@RequestMapping(value="/getOrderDetail",method=RequestMethod.POST)
		@ResponseBody
		public Msg getOrderDetail(@RequestParam(value="orderId")String orderId) {
			
			Orders order = orderService.getOrderDetail(orderId);
			//PageInfo<Orders> pageInfo = new PageInfo<Orders>(orders,5);
			return Msg.success().add("order",order);
		}
		
		//退房
		@RequestMapping(value="/checkout",method=RequestMethod.POST)
		@ResponseBody
		public Msg checkOut(@RequestParam(value="orderId")String orderId) {
			System.out.println(orderId);
			orderService.checkout(orderId);
			//PageInfo<Orders> pageInfo = new PageInfo<Orders>(orders,5);
			return Msg.success();
		}
		
		//查询用户所有订单
		@RequestMapping(value="/getUserOrders",method=RequestMethod.POST)
		@ResponseBody
		public Msg getUserOrders(@RequestParam(value="name")String name) {
			
			List<Orders> orders = orderService.getUserOrders(name);
			
			return Msg.success().add("orders", orders);
		}
		
	
}
