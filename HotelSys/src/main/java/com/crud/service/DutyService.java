package com.crud.service;

import java.util.List;

import com.crud.bean.Duty;

public interface DutyService {

	List<Duty> getAll();

	List<Duty> getByName(String searchname);

	void addDuty(String name, String time, String time2);

	void deleteDuty(String name, String offtime, String ontime);

}
