/**
 * 
 */
package com.ace.dao.Templete;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.ace.hibernate.dao.BaseHibernateDaoUtil;
import com.ace.common.util.BeanUtil;
import com.ace.vo.TempleteCondition;
import com.ace.vo.TempleteEntity;

/**
 * @author Ace
 *
 * 2016年12月6日
 */
@Repository("TempleteDao")
public class TempleteDaoImpl extends BaseHibernateDaoUtil implements TempleteDao{

	
	/**
	 * 列表查询
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<TempleteEntity> geTempleteList(TempleteCondition templeteCondition) {
		Session session = getCurrentSession();
		Criteria criteria = session.createCriteria(TempleteEntity.class);
		//查询条件
			if(BeanUtil.isValid(templeteCondition.getNickName()))
				criteria.add(Restrictions.like("nickname", templeteCondition.getNickName().trim(), MatchMode.ANYWHERE));
			if(BeanUtil.isValid(templeteCondition.getRealName()))
				criteria.add(Restrictions.like("realName", templeteCondition.getRealName().trim(), MatchMode.ANYWHERE));
		//排序
			if(BeanUtil.isValid(templeteCondition.getOrderBy())){
				if("asc".equals(templeteCondition.getOrderBy())){
					if(BeanUtil.isValid(templeteCondition.getOrderByName())){
				        criteria.addOrder(Order.asc(templeteCondition.getOrderByName()));
					}else{
						criteria.addOrder(Order.asc("id"));
					}
				}
				if("desc".equals(templeteCondition.getOrderBy())){
					if(BeanUtil.isValid(templeteCondition.getOrderByName())){
				        criteria.addOrder(Order.desc(templeteCondition.getOrderByName()));
					}else{
						criteria.addOrder(Order.desc("id"));
					}
				}
			}
		List<TempleteEntity> result = criteria.list();
		return result;
	}
     
}
