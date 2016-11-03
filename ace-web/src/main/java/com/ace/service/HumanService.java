/**
 * Copyright (c) 2016 Ace. All rights reserved.
 */
package com.ace.service;


import com.ace.common.model.Pager;
import com.ace.condition.HumanCondition;
import com.ace.entity.human.HumanEntity;
import com.ace.vo.HumanDetailVo;

/**
 * @author  ace
 * @description  业务层接口-人类
 * @date  2016-11-03 
 */
public interface HumanService {
    /**
	 * 保存
	 * @param entity
	 * @return
	 */
	public String save(HumanEntity entity);
	/**
	 * 编辑
	 * @param entity
	 * @return
	 */
	public String edit(HumanEntity entity);
	/**
	 * 查看单个详情
	 * @param id
	 * @return
	 */
	public HumanDetailVo detail(Long id);
	/**
	 * 删除（真）
	 * @param ids  要删除的id   例："1,2,3..."
	 * @return
	 */
	public String delete(String ids);
	/**
	 * 列表查询
	 * @param condition  查询条件
	 * @param pageNo     页码
	 * @param pageSize   每页条数
	 * @return
	 */
	public Pager list(HumanCondition condition,Integer pageNo,Integer pageSize);
	
}

