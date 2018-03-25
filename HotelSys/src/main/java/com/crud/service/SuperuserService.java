package com.crud.service;

import com.crud.bean.Superuser;

public interface SuperuserService {

	Superuser existUser(String username, String password);

	int updatePassword(String username, String curPw, String pw1);

	int existUsername(String username);

}
