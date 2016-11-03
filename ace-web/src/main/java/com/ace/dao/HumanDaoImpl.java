/**
 * Copyright (c) 2016 Ace. All rights reserved.
 */
package com.ace.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.ace.common.util.BeanUtil;
import com.ace.condition.HumanCondition;
import com.ace.entity.human.HumanEntity;
import com.ace.hibernate.dao.BaseHibernateDaoUtil;

/**
 * @author  ace
 * @description  持久层实现类-人类
 * @date  2016-11-03 
 */
@Repository("HumanDao")
public class HumanDaoImpl extends BaseHibernateDaoUtil implements HumanDao{
    
	/**
	 * 列表查询
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<HumanEntity> geHumanList(HumanCondition humanCondition) {
		Session session = getCurrentSession();
		Criteria criteria = session.createCriteria(HumanEntity.class);
		//查询条件
			if(BeanUtil.isValid(humanCondition.getHair()))
				criteria.add(Restrictions.like("hair", humanCondition.getHair().trim(), MatchMode.ANYWHERE));
			if(BeanUtil.isValid(humanCondition.getEyes()))
				criteria.add(Restrictions.eq("eyes", humanCondition.getEyes()));
		
		//排序
			if(BeanUtil.isValid(humanCondition.getOrderBy())){
				if("asc".equals(humanCondition.getOrderBy())){
					if(BeanUtil.isValid(humanCondition.getOrderByName())){
				        criteria.addOrder(Order.asc(humanCondition.getOrderByName()));
					}else{
						criteria.addOrder(Order.asc("id"));
					}
				}
				if("desc".equals(humanCondition.getOrderBy())){
					if(BeanUtil.isValid(humanCondition.getOrderByName())){
				        criteria.addOrder(Order.desc(humanCondition.getOrderByName()));
					}else{
						criteria.addOrder(Order.desc("id"));
					}
				}
			}
		List<HumanEntity> result = criteria.list();
		return result;
	}
     
}

