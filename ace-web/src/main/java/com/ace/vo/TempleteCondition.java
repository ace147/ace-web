/**
 * 
 */
package com.ace.vo;

import com.ace.common.Condition;

/**
 * @author Ace
 *
 * 2016年12月6日
 */
public class TempleteCondition extends Condition {
     
	private String nickName;
	
	private String realName;

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}
	
}
