package com.crud.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crud.bean.Msg;
import com.crud.service.SuperuserService;

import net.sf.json.JSONObject;

@Controller
public class SuperuserController {

	@Autowired
	SuperuserService superuserService;
	@RequestMapping(value = "/updateSuperuserPassword", method = RequestMethod.POST)
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
		String username = (String) session.getAttribute("superusername");
		System.out.println(username);

		int result = superuserService.updatePassword(username, curPw, pw1);
		if (result == 0) {
			return Msg.fail();
		}

		return Msg.success();
	}
}
