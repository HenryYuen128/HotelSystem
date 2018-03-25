package com.crud.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crud.bean.InOutDateInfo;
import com.crud.bean.Msg;

@Controller
public class DateConvertController {
	//Ìø×ª¶©µ¥Ò³Ãæ
	@RequestMapping(value="/inoutdate",method=RequestMethod.POST)
	@ResponseBody
	public Msg orderInfoPage(@RequestParam("inoutdate") String inoutdate) throws Exception {
		System.out.println("DateController");
		System.out.println(inoutdate);
        String startDate = inoutdate.substring(0, 10);
        String endDate = inoutdate.substring(11);
        System.out.println(startDate);
        System.out.println(endDate);
        int nights = days(startDate, endDate);
        System.out.println(nights+"nights");
        
        InOutDateInfo inOutDateInfo = new InOutDateInfo();
        inOutDateInfo.setCheckindate(startDate);
        inOutDateInfo.setCheckoutdate(endDate);
        inOutDateInfo.setNights(nights);
        
		return Msg.success().add("inOutDateInfo", inOutDateInfo);
	}
	
	public int days(String smdate,String bdate) throws ParseException {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        Calendar cal = Calendar.getInstance();    
        cal.setTime(sdf.parse(smdate));    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(sdf.parse(bdate));    
        long time2 = cal.getTimeInMillis();         
        long between_days=(time2-time1)/(1000*3600*24);  
            
       return Integer.parseInt(String.valueOf(between_days));
	}
	
}
