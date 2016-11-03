package com.ace.service.baseUtil;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ace.dao.baseUtil.BaseUtilDao;
import com.ace.hibernate.service.BaseServiceImpl;
import com.ace.common.util.BeanUtil;

@Service("baseUtilService")
public class BaseUtilServiceImpl  extends BaseServiceImpl implements BaseUtilService {
	@Autowired
	@Qualifier("baseUtilDao")
	private BaseUtilDao baseUtilDao;

//	@Override
//	public String createCode(String preCode, int Length, String sqlTable) {
//		String code;
//		int subLength=preCode.length();
//		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd"); 
//		String formatDate=format.format(new Date());
//		String codeQuery=preCode+formatDate.substring(2);
//		String codeMax=baseUtilDao.getCodeMax(codeQuery,sqlTable);
//		if(BeanUtil.isValid(codeMax)){
//			int codeInt=Integer.valueOf(codeMax.substring(subLength)).intValue()+1;
//			code=preCode+codeInt;
//		}else{
//			 StringBuffer zero=new StringBuffer();
//			 for(int i=0;i<Length-1;i++){
//				 zero.append("0");
//			 }
//			code=codeQuery+zero+"1";
//		}
//		return code;
//	}
	
	@Override
	public String createCode(String preCode, int Length, String sqlTable) {
		 String code="";//编号
		 String date="";//yyMMdd日期
		 SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd"); 
		 String formatDate=format.format(new Date());
		 date=formatDate.substring(2);
		 StringBuffer zero=new StringBuffer();
		 for(int i=0;i<Length;i++){
			 zero.append("0");
		 }
	    NumberFormat f=new DecimalFormat(zero.toString());
		int subLength=preCode.length();
//		String codeQuery=date;
		String codeMax=baseUtilDao.getCodeMax(date,sqlTable);
		if(BeanUtil.isValid(codeMax)){
//			String codeString=codeMax.substring(subLength);
//			int codeInt=Integer.valueOf(codeString)+1;
			long codeInt=Long.valueOf(codeMax.substring(subLength))+1l;
			code=preCode+f.format(codeInt);
		}else{
			code=preCode+date+f.format(1);
		}
		return code;
	}
	
}
