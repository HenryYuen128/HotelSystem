package com.crud.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.StreamingHttpOutputMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.crud.bean.Msg;
import com.crud.bean.Orders;
import com.crud.bean.User;
import com.crud.service.UserService;
import com.crud.service.impl.UserServiceImpl;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONObject;

@Controller
public class UserController {
	@Autowired
	UserService userService;

	// ��¼
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Msg Login(@RequestBody String name_password, HttpSession session) throws ServletException, IOException {
		System.out.println(name_password);
		JSONObject jsonObject = JSONObject.fromObject(name_password);
		String username = jsonObject.getString("username");
		System.out.println(username);
		String password = jsonObject.getString("password");
		System.out.println(password);
		User user = userService.existUser(username, password);
		if (user == null) {
			return Msg.fail();
		}
		session.setAttribute("username", username);
		return Msg.success().add("user", user);
	}

	// ע��ʱ�쳵�û����Ƿ�Ϸ�
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkUser(@RequestParam("username") String username) {
		System.out.println(username);
		String regx = "^[a-zA-Z0-9_-]{6,16}$";
		if (!username.matches(regx)) {
			System.out.println("������ʽ");
			return Msg.fail().add("va_msg", "�û���������6-16λӢ�Ļ����ֵ����");
		}
		boolean b = userService.checkUser(username);
		if (b) {
			return Msg.success();
		} else {
			return Msg.fail().add("va_msg", "�û���������");
		}

	}

	// ע��
	@ResponseBody
	@RequestMapping("/register")
	public Msg register(@Valid User user, BindingResult result) {
		if (result.hasErrors()) {
			// У��ʧ�ܣ�Ӧ�÷���ʧ�ܣ���ģ̬������ʾУ��ʧ�ܵĴ�����Ϣ
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("������ֶ�����" + fieldError.getField());
				System.out.println("������Ϣ��" + fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		} else {
			userService.register(user);
			return Msg.success();
		}
	}

	// ��ѯ�˻�����
	@ResponseBody
	@RequestMapping("/getUserType")
	public Msg getUserType(@RequestParam("username") String username) {
		User user = userService.getDiscount(username);
		Integer usertype = user.getUsertype();
		return Msg.success().add("userType", usertype);
	}

	// ��������
	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
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
		String username = (String) session.getAttribute("username");
		System.out.println(username);

		int result = userService.updatePassword(username, curPw, pw1);
		if (result == 0) {
			return Msg.fail();
		}

		return Msg.success();
	}

	// �޸�����
	@RequestMapping(value = "/updateEmail", method = RequestMethod.POST)
	@ResponseBody
	public Msg updateEmail(@RequestParam("email") String email, HttpSession session) {

		String username = (String) session.getAttribute("username");
		System.out.println(username);

		userService.updateEmail(username, email);

		return Msg.success();
	}
	
	//�޸��˻�����
	@RequestMapping(value = "/updateUserType", method = RequestMethod.POST)
	@ResponseBody
	public Msg updateUserType(@RequestParam("username") String username) {

		userService.updateUserType(username);
		//userService.updateUserType(flag);
		
		return Msg.success();
	}
	
	//��ȡ�����û�
	@RequestMapping(value = "/getUsers", method = RequestMethod.POST)
	@ResponseBody
	public Msg getUsers(@RequestParam(value="pn",defaultValue="1")Integer pn,@RequestParam(value="searchname")String searchname,HttpSession session) {
		System.out.println("��ѯ����:"+searchname);
		if (searchname=="") {
			PageHelper.startPage(pn,6);
			List<User> users = userService.getAll();
			PageInfo<User> pageInfo = new PageInfo<User>(users,5);
			return Msg.success().add("pageInfo", pageInfo);
		}else if(searchname!=""){
			PageHelper.startPage(pn,6);
			List<User> users = userService.getByName(searchname);
			PageInfo<User> pageInfo = new PageInfo<User>(users,5);
			return Msg.success().add("pageInfo", pageInfo);
		}
		return Msg.fail();
	}
	

}
