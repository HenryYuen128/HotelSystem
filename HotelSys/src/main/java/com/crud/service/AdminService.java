package com.crud.service;

import java.util.List;

import com.crud.bean.Administrator;

public interface AdminService {

	Administrator existUser(String username, String password);

	int findAdminByName(String name);

	int updatePassword(String username, String curPw, String pw1);

	Administrator findUser(String username);

	List<Administrator> getAll();

	List<Administrator> getByName(String searchname);

	void deleteAdmin(String name, String username);

	void addAdmin(String name, String username, String password);

	int existUsername(String username);

}
