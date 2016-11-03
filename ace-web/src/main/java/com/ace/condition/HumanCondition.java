/**
 * Copyright (c) 2016 Ace. All rights reserved.
 */
package com.ace.condition;

import com.ace.common.Condition;

/**
 * @author  ace
 * @description  搜索条件-人类
 * @date  2016-11-03
 */
public class HumanCondition extends Condition {
     
	private String hair; // 头发

	private Integer eyes; // null


	public String getHair() {return hair;}

	public void setHair(String hair) {this.hair = hair;}

	public Integer getEyes() {return eyes;}

	public void setEyes(Integer eyes) {this.eyes = eyes;}


	
}

