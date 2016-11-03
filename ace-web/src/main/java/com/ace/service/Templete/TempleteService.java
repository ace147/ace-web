/**
 * 
 */
package com.ace.service.Templete;


import com.ace.common.model.Pager;
import com.ace.vo.TempleteCondition;
import com.ace.vo.TempleteDetailVo;
import com.ace.vo.TempleteEntity;

/**
 * @author Ace
 *
 * 2016年12月5日
 */
public interface TempleteService {
    
	/**
	 * 保存
	 * @param entity
	 * @return
	 */
	public String save(TempleteEntity entity);
	/**
	 * 编辑
	 * @param entity
	 * @return
	 */
	public String edit(TempleteEntity entity);
	/**
	 * 查看单个详情
	 * @param id
	 * @return
	 */
	public TempleteDetailVo detail(Long id);
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
	public Pager list(TempleteCondition condition,Integer pageNo,Integer pageSize);
	
}
