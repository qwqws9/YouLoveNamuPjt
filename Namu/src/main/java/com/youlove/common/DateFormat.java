package com.youlove.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.youlove.service.domain.User;

public class DateFormat {
	
	
	// 작성시간
	public static String minute() throws Exception {
		
		//날짜 형식 1992-08-02 17:52:34
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String time = format.format(System.currentTimeMillis());
		//System.out.println(time);
		
		return time;
	}
	
	public static User block(User user) throws Exception {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		
		String start = format.format(cal.getTime());
		
		
		if(user.getStartBlock().equals("99")) {
			cal.add(Calendar.YEAR, 99);
			System.out.println("영구정지로 들어옴@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		}else {
			cal.add(Calendar.DAY_OF_MONTH, Integer.parseInt(user.getStartBlock()));
		}
		
		user.setStartBlock(start);
		user.setEndBlock(format.format(cal.getTime()));
		
		return user;
	}
	
public static String[] hotelDate() throws Exception {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		
		String[] hotelDate = new String[2];
		
		cal.add(Calendar.DAY_OF_MONTH, 1);
		hotelDate[0]  = format.format(cal.getTime());
		cal.add(Calendar.DAY_OF_MONTH, 3);
		hotelDate[1] = 	format.format(cal.getTime());
		
		
		return hotelDate;
	}

}
