/**
 * 
 */
package com.util.ACGT.main;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.util.ACGT.vo.EntityVo;

/**
 * @author Ace
 *
 * 2016年12月2日
 */
@Controller
public class contrallor {
    
	@RequestMapping(value="ACGT",method=RequestMethod.POST)
	public String ACGT(EntityVo entityVo){
		
		return "success";
	}
}
