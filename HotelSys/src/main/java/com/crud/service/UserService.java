package com.crud.service;

import java.util.List;

import com.crud.bean.Msg;
import com.crud.bean.User;

public interface UserService {
	//��������û�
	public List<User> getAll();
	
	//�Ƿ�����û�
	public User existUser(String username, String password);

	//��ѯ�û����Ƿ����
	public boolean checkUser(String username);

	//ע��
	public void register(User user);

	//��ȡ�˺�����
	public User getDiscount(String username);

	//���ҵ����û�
	public User findUser(String username);

	//�޸�����
	public int updatePassword(String username, String curPw, String pw1);
	
	//�޸�����
	public void updateEmail(String username, String email);
	
    //��ѯ�û���������
	public void updateUserType(String username);

	//ͨ�����ֲ�ѯ�û�
	public List<User> getByName(String searchname);

	
	
	
	
	
}
