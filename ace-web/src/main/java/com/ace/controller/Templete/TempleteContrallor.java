/**
 * 
 */
package com.ace.controller.Templete;


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
import com.ace.service.Templete.TempleteService;
import com.ace.vo.TempleteCondition;
import com.ace.vo.TempleteDetailVo;
import com.ace.vo.TempleteEntity;

/**
 * @author Ace
 * 
 * 2016年12月5日
 */
@Controller
@RequestMapping(value = "/templete")
public class TempleteContrallor {
    
	
	@Autowired
	@Qualifier("TempleteService")
	private TempleteService templeteService;
	
	/**
	 * 
	 * 跳转list页面
	 * @return
	 */
	@RequestMapping(value="listPage",method=RequestMethod.GET)
	public String listPage(){
		return "listPage";
	}
	
	/**
	 * 
	 * 异步获取list数据
	 * @param request
	 * @return
	 */
	@RequestMapping(value="listData",method=RequestMethod.POST)
	@ResponseBody
	public ResponseJson listDate(TempleteCondition templeteCondition,Integer pageNo,Integer pageSize){
		ResponseJson result= new ResponseJson();
		Pager pager =templeteService.list(templeteCondition, pageNo, pageSize);
		result.setData(pager);
		return result;
	}
	
	/**
	 * 跳转新建页面
	 * @return
	 */
	@RequestMapping(value="addPage",method=RequestMethod.GET)
	public String addPage(){ 
		return "addPage";
	}
	
	/**
	 * 异步新建保存
	 * @return  json
	 */
	@RequestMapping(value="save",method=RequestMethod.POST)
	@ResponseBody
	public ResponseJson save(TempleteEntity templeteEntity){
		ResponseJson result=new ResponseJson();
		if(BeanUtil.isValid(templeteEntity)){
			String message=templeteService.save(templeteEntity);
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
	 * @return
	 */
	@RequestMapping(value="editPage",method=RequestMethod.GET)
	public String editPage(Long id,Model model){
		TempleteDetailVo templeteDetailVo=templeteService.detail(id);
		model.addAttribute("templeteDetail", templeteDetailVo);
		return "editPage";
	}
	
	/**
	 * 异步编辑保存
	 * @return json
	 */
	@RequestMapping(value="edit",method=RequestMethod.POST)
	@ResponseBody
	public ResponseJson edit(TempleteEntity templeteEntity){
		ResponseJson result=new ResponseJson();
		if(BeanUtil.isValid(templeteEntity)){
			String message=templeteService.edit(templeteEntity);
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
	 * @return
	 */
	@RequestMapping(value="detail",method=RequestMethod.GET)
	public String detail(Long id,Model model){
		TempleteDetailVo templeteDetailVo=templeteService.detail(id);
		model.addAttribute("templeteDetail", templeteDetailVo);
		return "detail";
	}
	
	/**
	 * 删除
     * @param ids
	 * @return
	 */
	@RequestMapping(value="delete",method=RequestMethod.POST)
	@ResponseBody
	public ResponseJson delete(String ids){
		ResponseJson result=new ResponseJson();
	if(BeanUtil.isValid(ids)){
		String message=templeteService.delete(ids);
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
