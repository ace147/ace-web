/**
 * 
 */
package com.util.ACGT.tools;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Ace
 *
 * 2016年12月6日
 */
public class DateUtil {
     
	public static String getCurrentTime(String format){
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String dateString = sdf.format(date);
		return dateString;
	}
	
	public static void main(String args[]){
		System.out.println(DateUtil.getCurrentTime("YYMMdd HH:mm:ss"));
	}
}
