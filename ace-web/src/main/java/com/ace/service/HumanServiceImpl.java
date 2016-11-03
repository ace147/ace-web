/**
 * Copyright (c) 2016 Ace. All rights reserved.
 */
package com.ace.service;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ace.common.model.Pager;
import com.ace.common.util.BeanUtil;
import com.ace.condition.HumanCondition;
import com.ace.dao.HumanDao;
import com.ace.entity.human.HumanEntity;
import com.ace.hibernate.dao.BaseDao;
import com.ace.hibernate.service.BaseServiceImpl;
import com.ace.vo.HumanDetailVo;
import com.ace.vo.HumanListVo;

/**
 * @author  ace
 * @description  业务层实现类-人类
 * @date  2016-11-03 
 */
@Service("HumanService")
public class HumanServiceImpl extends BaseServiceImpl implements HumanService{
	@Autowired
	@Qualifier("baseDao")
	private BaseDao baseDao;
	
	@Autowired
	@Qualifier("HumanDao")
	private HumanDao humanDao;
	
	private String message="error";
	
	/**
	 * 保存
	 * @param entity
	 * @return
	 */
	@Override
	public String save(HumanEntity humanEntity) {
		try {
			this.addObject(humanEntity);
			message="success";
		} catch (Exception e) {
			message="error";
		}
		return message;
	}
    /**
	 * 列表查询
	 * @param condition  查询条件
	 * @param pageNo     页码
	 * @param pageSize   每页条数
	 * @return
	 */
	@Override
	public Pager list(HumanCondition humanCondition,Integer pageNo,Integer pageSize) {
		List<HumanEntity> humanList=humanDao.geHumanList(humanCondition);
		List<HumanListVo> humanListVos=new ArrayList<HumanListVo>();
		for(HumanEntity humanEntity:humanList){
			HumanListVo humanListVo=new HumanListVo();
			humanListVo.setId(humanEntity.getId());
			humanListVo.setHair(humanEntity.getHair());
			humanListVo.setEyes(humanEntity.getEyes());

			humanListVos.add(humanListVo);
		}
		return getPager(pageNo, pageSize, humanListVos, null);
	}
	/**
	 * 编辑
	 * @param entity
	 * @return
	 */
	@Override
	public String edit(HumanEntity humanEntity) {
		try {
			HumanEntity humanEntity0=(HumanEntity) baseDao.get(HumanEntity.class, humanEntity.getId());
			if(BeanUtil.isValid(humanEntity0)){
				if(BeanUtil.isValid(humanEntity.getHair()))
					humanEntity0.setHair(humanEntity.getHair());
				if(BeanUtil.isValid(humanEntity.getEyes()))
					humanEntity0.setEyes(humanEntity.getEyes());
	
				  this.modifyObject(humanEntity0);
				  message="success";
			}
		} catch (Exception e) {
			message="error";
		}
		return message;
	}
    /**
	 * 查看单个详情
	 * @param id
	 * @return
	 */
	@Override
	public HumanDetailVo detail(Long id) {
		HumanDetailVo humanDetailvo=new HumanDetailVo();
		HumanEntity humanEntity=(HumanEntity) baseDao.get(HumanEntity.class, id);
		humanDetailvo.setId(humanEntity.getId());
		humanDetailvo.setHair(humanEntity.getHair());
		humanDetailvo.setEyes(humanEntity.getEyes());

		return humanDetailvo;
	}

	/**
	 * 删除（真）
	 * @param ids  要删除的id   例："1,2,3..."
	 * @return
	 */
	@Override
	public String delete(String ids) {
        try {
			if(BeanUtil.isValid(ids)){
				String idArray[]=ids.split(",");
				for(int i=0;i<idArray.length;i++){
					Long id=Long.parseLong(idArray[i]);
					HumanEntity humanEntity=(HumanEntity) baseDao.get(HumanEntity.class, id);
					if(BeanUtil.isValid(humanEntity)){
						this.removeObject(humanEntity);
					}
				}
				message="success";
			}
		} catch (Exception e) {
			message="error";
		}
		return message;
	}
    
}

