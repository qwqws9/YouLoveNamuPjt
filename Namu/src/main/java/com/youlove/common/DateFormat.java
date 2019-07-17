package com.youlove.common;

import java.text.SimpleDateFormat;

public class DateFormat {
	
	public static String minute() throws Exception {
		
		//날짜 형식 1992-08-02 17:52:34
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String time = format.format(System.currentTimeMillis());
		//System.out.println(time);
		
		return time;
	}

}
