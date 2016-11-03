/**
 * Copyright (c) 2016 Ace. All rights reserved.
 */
package com.ace.dao;

import java.util.List;

import com.ace.condition.HumanCondition;
import com.ace.entity.human.HumanEntity;

/**
 * @author  ace
 * @description  持久层接口-人类
 * @date  2016-11-03 
 */

public interface HumanDao {
    /**
	 * 列表查询
	 * @param humanCondition
	 * @return
	 */  
	public List<HumanEntity> geHumanList(HumanCondition humanCondition);
		
	
}

