/**
 * 
 */
package com.ace.service.Templete;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ace.common.model.Pager;
import com.ace.common.util.BeanUtil;
import com.ace.dao.Templete.TempleteDao;
import com.ace.hibernate.dao.BaseDao;
import com.ace.hibernate.service.BaseServiceImpl;
import com.ace.vo.TempleteCondition;
import com.ace.vo.TempleteDetailVo;
import com.ace.vo.TempleteEntity;
import com.ace.vo.TempleteListVo;

/**
 * @author Ace
 *
 * 2016年12月5日
 */
@Service("TempleteService")
public class TempleteServiceImpl extends BaseServiceImpl implements TempleteService{
	@Autowired
	@Qualifier("baseDao")
	private BaseDao baseDao;
	
	@Autowired
	@Qualifier("TempleteDao")
	private TempleteDao templeteDao;
	
	private String message="error";
	
	@Override
	public String save(TempleteEntity entity) {
		try {
			this.addObject(entity);
			message="success";
		} catch (Exception e) {
			e.printStackTrace();
			message="error";
		}
		return message;
	}
    
	@Override
	public Pager list(TempleteCondition templeteCondition,Integer pageNo,Integer pageSize) {
		List<TempleteEntity> templeteList=templeteDao.geTempleteList(templeteCondition);
		List<TempleteListVo> templeteListVos=new ArrayList<TempleteListVo>();
		for(TempleteEntity templeteEntity:templeteList){
			TempleteListVo templeteListVo=new TempleteListVo();
			templeteListVo.setId(templeteEntity.getId());
			templeteListVo.setNickname(templeteEntity.getNickname());
			templeteListVo.setRealName(templeteEntity.getRealName());
			templeteListVos.add(templeteListVo);
		}
		return getPager(pageNo, pageSize, templeteListVos, null);
	}
	
	@Override
	public String edit(TempleteEntity entity) {
		try {
			Long id=entity.getId();
			if(BeanUtil.isValid(id)){
			  TempleteEntity templeteEntity=(TempleteEntity) baseDao.get(TempleteEntity.class, id);
			  if(BeanUtil.isValid(entity.getNickname()))
			     templeteEntity.setNickname(entity.getNickname());
			  if(BeanUtil.isValid(entity.getRealName()))
				 templeteEntity.setRealName(entity.getRealName());
			  this.modifyObject(templeteEntity);
			  message="success";
			}
		} catch (Exception e) {
			message="error";
		}
		return message;
	}
    
	@Override
	public TempleteDetailVo detail(Long id) {
		TempleteDetailVo vo=new TempleteDetailVo();
		TempleteEntity templeteEntity=(TempleteEntity) baseDao.get(TempleteEntity.class, id);
		vo.setId(templeteEntity.getId());
		vo.setRealName(templeteEntity.getRealName());
		return vo;
	}

	
	@Override
	public String delete(String ids) {
        try {
			if(BeanUtil.isValid(ids)){
				String idArray[]=ids.split(",");
				for(int i=0;i<idArray.length;i++){
					Long id=Long.parseLong(idArray[i]);
					TempleteEntity templeteEntity=(TempleteEntity) baseDao.get(TempleteEntity.class, id);
					if(BeanUtil.isValid(templeteEntity)){
						this.removeObject(templeteEntity);
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
