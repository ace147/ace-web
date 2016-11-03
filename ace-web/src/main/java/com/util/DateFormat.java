package com.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateFormat {

	public static String getTisMonthStart(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		//获取当前月第一天：
        Calendar c = Calendar.getInstance();    
        c.add(Calendar.MONTH, 0);
        c.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
        String first = format.format(c.getTime());
//        System.out.println("===============first:"+first);
        return first+" 00:00:00";
	}
	
	public static String getTisMonthEnd(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		//获取当前月最后一天
		Calendar ca = Calendar.getInstance();    
		ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));  
		String last = format.format(ca.getTime());
//		System.out.println("===============last:"+last);
		return last+" 23:59:59";
	}
}
