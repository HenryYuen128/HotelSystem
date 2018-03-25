package com.crud.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crud.bean.Administrator;
import com.crud.bean.Msg;
import com.crud.bean.Room;
import com.crud.bean.Superuser;
import com.crud.bean.User;
import com.crud.service.AdminService;
import com.crud.service.SuperuserService;
import com.crud.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONObject;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	@Autowired
	SuperuserService superuserService;
	// 登录
	@RequestMapping(value = "/adminlogin", method = RequestMethod.POST)
	@ResponseBody
	public Msg Login(@RequestBody String name_password, HttpSession session) throws ServletException, IOException {
		System.out.println(name_password);
		JSONObject jsonObject = JSONObject.fromObject(name_password);
		String username = jsonObject.getString("username");
		System.out.println(username);
		String password = jsonObject.getString("password");
		System.out.println(password);
		Administrator admin = adminService.existUser(username, password);
		if (admin == null) {
			Superuser superuser = superuserService.existUser(username, password);
			if (superuser==null) {
				return Msg.fail();
			}else {
				System.out.println("超级管理员");
				session.setAttribute("superusername", username);
				session.setAttribute("adminname","");
				return Msg.success().add("admin",superuser);
			}
		}
		System.out.println("普通管理员");
		session.setAttribute("adminname",username);
		session.setAttribute("superusername","");
		return Msg.success().add("admin",admin);
	}
	
	// 更改密码
		@RequestMapping(value = "/updateAdminPassword", method = RequestMethod.POST)
		@ResponseBody
		public Msg updatePassword(@RequestBody String pwString, HttpSession session) {
			System.out.println(pwString);
			JSONObject jsonObject = JSONObject.fromObject(pwString);
			String curPw = jsonObject.getString("curPw");
			System.out.println(curPw);
			String pw1 = jsonObject.getString("pw1");
			System.out.println(pw1);
			String pw2 = jsonObject.getString("pw2");
			System.out.println(pw2);
			String username = (String) session.getAttribute("adminname");
			System.out.println(username);

			int result = adminService.updatePassword(username, curPw, pw1);
			if (result == 0) {
				return Msg.fail();
			}

			return Msg.success();
		}
	
		//超级管理员获取管理员列表
		@RequestMapping(value = "/getAdminList", method = RequestMethod.POST)
		@ResponseBody
		public Msg getUsers(@RequestParam(value="pn",defaultValue="1")Integer pn,@RequestParam(value="searchname")String searchname,HttpSession session) {
			//System.out.println("查询房号:"+searchname);
			if (searchname=="") {
				PageHelper.startPage(pn,6);
				List<Administrator> administrators = adminService.getAll();
				PageInfo<Administrator> pageInfo = new PageInfo<Administrator>(administrators,5);
				return Msg.success().add("pageInfo", pageInfo);
			}else if(searchname!=""){
				PageHelper.startPage(pn,6);
				List<Administrator> administrators = adminService.getByName(searchname);
				PageInfo<Administrator> pageInfo = new PageInfo<Administrator>(administrators,5);
				return Msg.success().add("pageInfo", pageInfo);
			}
			return Msg.fail();
		}
		
		//删除管理员
		@RequestMapping(value = "/deleteAdmin", method = RequestMethod.POST)
		@ResponseBody
		public Msg deleteDuty(@RequestParam(value="name")String name,@RequestParam(value="username")String username) {
				//System.out.println(ontime);
				adminService.deleteAdmin(name,username);
				return Msg.success();
		}
		
		//添加管理员
		@RequestMapping(value = "/addAdmin", method = RequestMethod.POST)
		@ResponseBody
		public Msg addAdmin(@RequestParam(value="name")String name,@RequestParam(value="username")String username,
				@RequestParam(value="password")String password,HttpSession session) {
			System.out.println(name);
			System.out.println(username);
			System.out.println(password);
			
			//先检查用户名是否重复
			int count = adminService.existUsername(username);
			int count1 = superuserService.existUsername(username);
			if (count==0||count1==0) {
				return Msg.fail();
			}else {
				adminService.addAdmin(name,username,password);
			}
			return Msg.success();
		}
		
		//用户性查重
		@RequestMapping(value = "/existUsername", method = RequestMethod.POST)
		@ResponseBody
		public Msg existUsername(@RequestParam(value="name")String username) {
			int count = adminService.existUsername(username);
			int count1 = superuserService.existUsername(username);
			if (count==0||count1==0) {
				return Msg.fail();
			}else
			return Msg.success();
		}
}
