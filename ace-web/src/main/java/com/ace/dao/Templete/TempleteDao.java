/**
 * 
 */
package com.ace.dao.Templete;

import java.util.List;

import com.ace.vo.TempleteCondition;
import com.ace.vo.TempleteEntity;

/**
 * @author Ace
 *
 * 2016年12月5日
 */
public interface TempleteDao {
    
	/**
	 * 列表查询
	 * @param templeteCondition
	 * @return
	 */
	public List<TempleteEntity> geTempleteList(TempleteCondition templeteCondition);
		
	
}
