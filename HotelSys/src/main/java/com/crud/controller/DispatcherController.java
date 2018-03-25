package com.crud.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class DispatcherController {
	
	@RequestMapping(value="/index",method=RequestMethod.POST)
	public String homepage(@RequestParam("username") String username,HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("DispathcerController");
		System.out.println(username);

		HttpSession session = request.getSession();
		session.setAttribute("username", username);

		return "homepage";
	}
	
	//跳转订单页面
	@RequestMapping(value="/orderInfo",method=RequestMethod.POST)
	public String orderInfoPage(@RequestParam("roomnumber") String roomnumber,@RequestParam("roomsize") String roomsize,@RequestParam("roomprice") String roomprice,HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("DispathcerController");
		System.out.println(roomnumber);
		System.out.println(roomsize);
		System.out.println(roomprice);
		request.setAttribute("roomnumber", roomnumber);
		request.setAttribute("roomsize", roomsize);
		request.setAttribute("roomprice", roomprice);
		return "orderInfo";
	}
	
	//订单完成跳回首页
	@RequestMapping(value="/homepage")
	public String backToHomepage() {
		System.out.println("回首页controller");
		return "homepage";
	}
	
	@RequestMapping(value="/bookTransport")
	public String bookTransport() {
		System.out.println("订飞机接送");
		return "bookTransport";
	}
	
	//管理员页面跳转
	@RequestMapping(value="/adminindex",method=RequestMethod.POST)
	public String adminHomepage(@RequestParam("username") String username,HttpServletRequest request,HttpServletResponse response) throws Exception {
		System.out.println("DispathcerController");
		System.out.println(username);

		//HttpSession session = request.getSession();
		//session.setAttribute("username", username);
		
		return "adminhomepage";
	}
	
	
}
