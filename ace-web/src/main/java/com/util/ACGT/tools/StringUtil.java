/**
 * 
 */
package com.util.ACGT.tools;


/**
 * @author Ace
 *
 * 2016年12月6日
 */
public class StringUtil {
    /**
     * 将首个字母转换成大写
     * @param str
     * @return
     */
	public static String uppercaseFirstLetter(String str){
		str=str.substring(0, 1).toUpperCase()+str.substring(1);
		return str;
	}
	
	/**
	 * 将首个字母转换成小写
	 * @param str
	 * @return
	 */
	public static String lowercaseFirstLetter(String str){
		str=str.substring(0, 1).toLowerCase()+str.substring(1);
		return str;
	}
}
