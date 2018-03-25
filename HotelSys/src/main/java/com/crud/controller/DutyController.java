package com.crud.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crud.bean.Duty;
import com.crud.bean.Msg;
import com.crud.service.AdminService;
import com.crud.service.DutyService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class DutyController {

@Autowired
DutyService dutyService;
	
@Autowired
AdminService adminService;
	@RequestMapping(value = "/getDutyList", method = RequestMethod.POST)
	@ResponseBody
	public Msg getDutyList(@RequestParam(value="pn",defaultValue="1")Integer pn,@RequestParam(value="searchname")String searchname,HttpSession session) {
		System.out.println("查询单号:"+searchname);
		if (searchname=="") {
			PageHelper.startPage(pn,6);
			List<Duty> list = dutyService.getAll();
			PageInfo<Duty> pageInfo = new PageInfo<Duty>(list,5);
			return Msg.success().add("pageInfo", pageInfo);
		}else if(searchname!=""){
			PageHelper.startPage(pn,6);
			List<Duty> list = dutyService.getByName(searchname);
			PageInfo<Duty> pageInfo = new PageInfo<Duty>(list,5);
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.fail();
	}
	
	//添加值班表
	@RequestMapping(value = "/addDuty", method = RequestMethod.POST)
	@ResponseBody
	public Msg addDuty(@RequestParam(value="name")String name,@RequestParam(value="time")String time,@RequestParam(value="time2")String time2,HttpSession session) {
		System.out.println("员工姓名:"+name);
		int count = adminService.findAdminByName(name);
		if (count==0) {
			return Msg.fail();
		}else if (count==1) {
			dutyService.addDuty(name,time,time2);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	//删除值班表
	@RequestMapping(value = "/deleteDuty", method = RequestMethod.POST)
	@ResponseBody
	public Msg deleteDuty(@RequestParam(value="name")String name,@RequestParam(value="ontime")String ontime,@RequestParam(value="offtime")String offtime) {
			System.out.println(ontime);
			dutyService.deleteDuty(name,ontime,offtime);
			return Msg.success();
	}
}
