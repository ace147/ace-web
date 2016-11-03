/**
 * Copyright (c) 2016 Ace. All rights reserved.
 */
package com.ace.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ace.common.ResponseJson;
import com.ace.common.model.Pager;
import com.ace.common.util.BeanUtil;
import com.ace.condition.HumanCondition;
import com.ace.entity.human.HumanEntity;
import com.ace.service.HumanService;
import com.ace.vo.HumanDetailVo;

/**
 * @author  ace
 * @description  控制层-人类
 * @date  2016-11-03
 */
@Controller
@RequestMapping(value = "/human")
public class HumanController {
    
	
	@Autowired
	@Qualifier("HumanService")
	private HumanService humanService;
	
	/**
	 * 
	 * 跳转list页面
	 * @return  view
	 */
	 
	@RequestMapping(value="listPage",method=RequestMethod.GET)
	public String listPage(){
		return "listPage";
	}
	
	/**
	 * 
	 * 异步获取list数据
	 * @param request
	 * @return json
	 */
	@RequestMapping(value="listData",method=RequestMethod.POST)
	@ResponseBody
	public ResponseJson listDate(HumanCondition humanCondition,Integer pageNo,Integer pageSize){
		ResponseJson result= new ResponseJson();
		Pager pager =humanService.list(humanCondition, pageNo, pageSize);
		result.setData(pager);
		return result;
	}
	
	/**
	 * 跳转新建页面
	 * @return json
	 */
	@RequestMapping(value="addPage",method=RequestMethod.GET)
	public String addPage(){ 
		return "addPage";
	}
	
	/**
	 * 异步新建保存
	 * @return json
	 */
	@RequestMapping(value="save",method=RequestMethod.POST)
	@ResponseBody
	public ResponseJson save(HumanEntity humanEntity){
		ResponseJson result=new ResponseJson();
		if(BeanUtil.isValid(humanEntity)){
			String message=humanService.save(humanEntity);
			if("success".equals(message)){
				result.setMessage("新建成功");
			}else{
				result.setStatus(false);
				result.setMessage("操作失败");
			}
		}else{
			result.setStatus(false);
			result.setMessage("参数错误");
		}
		return result;
	}
	
	/**
	 * 跳转编辑页面
	 * @param id
	 * @return  view
	 */
	@RequestMapping(value="editPage",method=RequestMethod.GET)
	public String editPage(Long id,Model model){
		HumanDetailVo humanDetailVo=humanService.detail(id);
		model.addAttribute("humanDetail", humanDetailVo);
		return "editPage";
	}
	
	/**
	 *  异步编辑保存
	 * @return json
	 */
	@RequestMapping(value="edit",method=RequestMethod.POST)
	@ResponseBody
	public ResponseJson edit(HumanEntity humanEntity){
		ResponseJson result=new ResponseJson();
		if(BeanUtil.isValid(humanEntity.getId())){
			String message=humanService.edit(humanEntity);
			if("success".equals(message)){
				result.setMessage("编辑成功");
			}else{
				result.setStatus(false);
				result.setMessage("操作失败");
			}
		}else{
			result.setStatus(false);
			result.setMessage("参数错误");
		}
		return result;
	}
	
	/**
	 * 单个详情
	 * @param id
	 * @return  view
	 */
	@RequestMapping(value="detail",method=RequestMethod.GET)
	public String detail(Long id,Model model){
		HumanDetailVo humanDetailVo=humanService.detail(id);
		model.addAttribute("humanDetail", humanDetailVo);
		return "detail";
	}
	
	/**
	 * 删除
	 * @return  json
	 */
	@RequestMapping(value="delete",method=RequestMethod.POST)
	@ResponseBody
	public ResponseJson delete(String ids){
		ResponseJson result=new ResponseJson();
	if(BeanUtil.isValid(ids)){
		String message=humanService.delete(ids);
		if("success".equals(message)){
			result.setMessage("删除成功");
		}else{
			result.setStatus(false);
			result.setMessage("操作失败");
		}
	}else{
		result.setStatus(false);
		result.setMessage("参数错误");
	}
	return result;
	}
	
}

