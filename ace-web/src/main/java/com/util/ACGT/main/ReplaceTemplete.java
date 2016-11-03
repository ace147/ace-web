/**
 * 
 */
package com.util.ACGT.main;

import com.util.ACGT.tools.StringUtil;
import com.util.ACGT.vo.ColumnVo;
import com.util.ACGT.vo.EntityVo;

/**
 * @author Ace
 *
 * 2016年12月6日
 */
public class ReplaceTemplete {
      
	/**
	 * @param content
	 * @param entityVo
	 * @return
	 */
	 public static String replaceEntity(String content,EntityVo entityVo){
	    	content=content.replace("$ace:createDate", entityVo.getCreateTime());
	    	content=content.replace("$ace:author", entityVo.getAuthor());
	    	content=content.replace("$ace:description", entityVo.getDescription());
	    	content=content.replace("$ace:tableName", entityVo.getTableName());
	    	content=content.replace("templete", entityVo.getEntityName());
	    	content=content.replace("Templete", StringUtil.uppercaseFirstLetter(entityVo.getEntityName()));
	    	StringBuffer columnArray=new StringBuffer();  
	    	StringBuffer getsetArray=new StringBuffer();
	    	for(ColumnVo vo:entityVo.getListColumn()){
	    		String upperFirstLetter=StringUtil.uppercaseFirstLetter(vo.getColumnName());
	    		//column
	    		columnArray.append("\t@Column(name = \""+upperFirstLetter+"\", length = "+vo.getLength()+")");
	    		columnArray.append("\r\n\r\n");
	    		columnArray.append("\tprivate "+vo.getType()+" "+vo.getColumnName()+"; // "+vo.getRemark());
	    		columnArray.append("\r\n\r\n");
	    		//get set
	    		getsetArray.append("\tpublic "+vo.getType()+" get"+upperFirstLetter+"() {return "+vo.getColumnName()+";}");
	    		getsetArray.append("\r\n\r\n");
	    		getsetArray.append("\tpublic void set"+upperFirstLetter+"("+vo.getType()+" "+vo.getColumnName()+") {this."+vo.getColumnName()+" = "+vo.getColumnName()+";}");
	    		getsetArray.append("\r\n\r\n");
	    	}
	    	content=content.replace("$ace:column", columnArray.toString());
	    	content=content.replace("$ace:getset", getsetArray.toString());
	    	return content;
	    }
	 
	 public static String replaceContrallor(String content,EntityVo entityVo){
		    content=content.replace("$ace:createDate", entityVo.getCreateTime());
	    	content=content.replace("$ace:author", entityVo.getAuthor());
	    	content=content.replace("$ace:description", entityVo.getDescription());
	    	content=content.replace("templete", StringUtil.lowercaseFirstLetter(entityVo.getEntityName()));
	    	content=content.replace("Templete", StringUtil.uppercaseFirstLetter(entityVo.getEntityName()));
		 return content;
	 }
	 
	 
	 public static String replaceService(String content,EntityVo entityVo){
			 content=content.replace("$ace:createDate", entityVo.getCreateTime());
			 content=content.replace("$ace:description", entityVo.getDescription());
		     content=content.replace("$ace:author", entityVo.getAuthor());
		     content=content.replace("templete", StringUtil.lowercaseFirstLetter(entityVo.getEntityName()));
		     content=content.replace("Templete", StringUtil.uppercaseFirstLetter(entityVo.getEntityName()));
		 return content;
	 }
	 
	 public static String replaceServiceImpl(String content,EntityVo entityVo){
		    String upperEntityFirstLetter=StringUtil.uppercaseFirstLetter(entityVo.getEntityName());
		    String lowerEntityFirstLetter=StringUtil.lowercaseFirstLetter(entityVo.getEntityName());
		    content=content.replace("$ace:description", entityVo.getDescription());
		  	content=content.replace("$ace:createDate", entityVo.getCreateTime());
	    	content=content.replace("$ace:author", entityVo.getAuthor());
	    	content=content.replace("templete", lowerEntityFirstLetter);
	    	content=content.replace("Templete", upperEntityFirstLetter);
	    	StringBuffer listVoArray=new StringBuffer();  
	    	StringBuffer detailVoArray=new StringBuffer();
	    	StringBuffer editArray=new StringBuffer();
	    	for(ColumnVo vo:entityVo.getListColumn()){
	    		String upperColumnFirstLetter=StringUtil.uppercaseFirstLetter(vo.getColumnName());
	    		String lowerColumnFirstLetter=StringUtil.uppercaseFirstLetter(vo.getColumnName());
	    		//listVo
	    		if("Y".equals(vo.getIsListVo())){
	    			listVoArray.append("\t\t\t"+lowerEntityFirstLetter+"ListVo.set"+upperColumnFirstLetter+"("+lowerEntityFirstLetter+"Entity.get"+upperColumnFirstLetter+"());");
	    			
	    			listVoArray.append("\n");
	    		}
	    		//detailVo
	    		if("Y".equals(vo.getIsDetailVo())){
	    			detailVoArray.append("\t\t"+lowerEntityFirstLetter+"Detailvo.set"+upperColumnFirstLetter+"("+lowerEntityFirstLetter+"Entity.get"+upperColumnFirstLetter+"());");
	    			detailVoArray.append("\n");
	    		}
	    		//edit
	    		editArray.append("\t\t\tif(BeanUtil.isValid("+lowerEntityFirstLetter+"Entity.get"+upperColumnFirstLetter+"()))");
	    		editArray.append("\n");
	    		editArray.append("\t\t\t\t"+upperEntityFirstLetter+"Entity0.set"+upperColumnFirstLetter+"("+lowerEntityFirstLetter+"Entity.get"+upperColumnFirstLetter+"());");
	    		editArray.append("\n");
	    	}
	    	content=content.replace("$ace:listVo", listVoArray.toString());
	    	content=content.replace("$ace:detailVo", detailVoArray.toString());
	    	content=content.replace("$ace:edit", editArray.toString());
		 return content;
	 }
	 
	 public static String replaceDao(String content,EntityVo entityVo){
		    String upperEntityFirstLetter=StringUtil.uppercaseFirstLetter(entityVo.getEntityName());
		    String lowerEntityFirstLetter=StringUtil.lowercaseFirstLetter(entityVo.getEntityName());
		    content=content.replace("$ace:description", entityVo.getDescription());
		  	content=content.replace("$ace:createDate", entityVo.getCreateTime());
	    	content=content.replace("$ace:author", entityVo.getAuthor());
	    	content=content.replace("templete", lowerEntityFirstLetter);
	    	content=content.replace("Templete", upperEntityFirstLetter);
		 return content;
	 }
	 
	 
	 public static String replaceDaoImpl(String content,EntityVo entityVo){
		    String upperEntityFirstLetter=StringUtil.uppercaseFirstLetter(entityVo.getEntityName());
		    String lowerEntityFirstLetter=StringUtil.lowercaseFirstLetter(entityVo.getEntityName());
		    content=content.replace("$ace:description", entityVo.getDescription());
		  	content=content.replace("$ace:createDate", entityVo.getCreateTime());
	    	content=content.replace("$ace:author", entityVo.getAuthor());
	    	content=content.replace("templete", lowerEntityFirstLetter);
	    	content=content.replace("Templete", upperEntityFirstLetter);
	    	StringBuffer conditionArray=new StringBuffer();
	    	for(ColumnVo vo:entityVo.getListColumn()){
	    		String upperColumnFirstLetter=StringUtil.uppercaseFirstLetter(vo.getColumnName());
	    		String lowerColumnFirstLetter=StringUtil.lowercaseFirstLetter(vo.getColumnName());
	    		//条件
	    		conditionArray.append("\t\t\tif(BeanUtil.isValid("+lowerEntityFirstLetter+"Condition.get"+upperColumnFirstLetter+"()))");
	    		conditionArray.append("\n");
	    		conditionArray.append("\t\t\t\tcriteria.add(Restrictions.like(\""+lowerColumnFirstLetter+"\", "+lowerEntityFirstLetter+"Condition.get"+upperColumnFirstLetter+"().trim(), MatchMode.ANYWHERE));");
	    		conditionArray.append("\n");
	    	}
	    	content=content.replace("$ace:condition	", conditionArray.toString());
		 return content;
	 }
	 
	 public static String replaceCondition(String content,EntityVo entityVo){
		 	content=content.replace("$ace:description", entityVo.getDescription());
		 	content=content.replace("$ace:createDate", entityVo.getCreateTime());
	    	content=content.replace("$ace:author", entityVo.getAuthor());
	    	StringBuffer columnArray=new StringBuffer();  
	    	StringBuffer getsetArray=new StringBuffer();
	    	for(ColumnVo vo:entityVo.getListColumn()){
	    		String upperFirstLetter=StringUtil.uppercaseFirstLetter(vo.getColumnName());
	    		//column
	    		if("Y".equals(vo.getIsSreach())){
		    		columnArray.append("\tprivate "+vo.getType()+" "+vo.getColumnName()+"; // "+vo.getRemark());
		    		columnArray.append("\r\n\r\n");
	    		}
	    		if("Y".equals(vo.getIsSreach())){
		    	//get set
		    		getsetArray.append("\tpublic "+vo.getType()+" get"+upperFirstLetter+"() {return "+vo.getColumnName()+";}");
		    		getsetArray.append("\r\n\r\n");
		    		getsetArray.append("\tpublic void set"+upperFirstLetter+"("+vo.getType()+" "+vo.getColumnName()+") {this."+vo.getColumnName()+" = "+vo.getColumnName()+";}");
		    		getsetArray.append("\r\n\r\n");
	    		}
	    	}
	    	content=content.replace("templete", entityVo.getEntityName());
	    	content=content.replace("Templete", StringUtil.uppercaseFirstLetter(entityVo.getEntityName()));
	    	content=content.replace("$ace:column", columnArray.toString());
	    	content=content.replace("$ace:getset", getsetArray.toString());
	    	return content;
	 }
	 
	 public static String replaceDetailVo(String content,EntityVo entityVo){
		 	content=content.replace("$ace:description", entityVo.getDescription());
		 	content=content.replace("$ace:createDate", entityVo.getCreateTime());
	    	content=content.replace("$ace:author", entityVo.getAuthor());
	    	StringBuffer columnArray=new StringBuffer();  
	    	StringBuffer getsetArray=new StringBuffer();
	    	for(ColumnVo vo:entityVo.getListColumn()){
	    		String upperFirstLetter=StringUtil.uppercaseFirstLetter(vo.getColumnName());
	    		//column
	    		if("Y".equals(vo.getIsDetailVo())){
		    		columnArray.append("\tprivate "+vo.getType()+" "+vo.getColumnName()+"; // "+vo.getRemark());
		    		columnArray.append("\r\n\r\n");
	    		}
	    		if("Y".equals(vo.getIsDetailVo())){
		    	//get set
		    		getsetArray.append("\tpublic "+vo.getType()+" get"+upperFirstLetter+"() {return "+vo.getColumnName()+";}");
		    		getsetArray.append("\r\n\r\n");
		    		getsetArray.append("\tpublic void set"+upperFirstLetter+"("+vo.getType()+" "+vo.getColumnName()+") {this."+vo.getColumnName()+" = "+vo.getColumnName()+";}");
		    		getsetArray.append("\r\n\r\n");
	    		}
	    	}
	    	content=content.replace("templete", entityVo.getEntityName());
	    	content=content.replace("Templete", StringUtil.uppercaseFirstLetter(entityVo.getEntityName()));
	    	content=content.replace("$ace:column", columnArray.toString());
	    	content=content.replace("$ace:getset", getsetArray.toString());
	    	return content;
	 }
	 
	 public static String replaceListVo(String content,EntityVo entityVo){
		 	content=content.replace("$ace:description", entityVo.getDescription());
		 	content=content.replace("$ace:createDate", entityVo.getCreateTime());
	    	content=content.replace("$ace:author", entityVo.getAuthor());
	    	StringBuffer columnArray=new StringBuffer();  
	    	StringBuffer getsetArray=new StringBuffer();
	    	for(ColumnVo vo:entityVo.getListColumn()){
	    		String upperFirstLetter=StringUtil.uppercaseFirstLetter(vo.getColumnName());
	    		//column
	    		if("Y".equals(vo.getIsListVo())){
		    		columnArray.append("\tprivate "+vo.getType()+" "+vo.getColumnName()+"; // "+vo.getRemark());
		    		columnArray.append("\r\n\r\n");
	    		}
	    		if("Y".equals(vo.getIsListVo())){
		    	//get set
		    		getsetArray.append("\tpublic "+vo.getType()+" get"+upperFirstLetter+"() {return "+vo.getColumnName()+";}");
		    		getsetArray.append("\r\n\r\n");
		    		getsetArray.append("\tpublic void set"+upperFirstLetter+"("+vo.getType()+" "+vo.getColumnName()+") {this."+vo.getColumnName()+" = "+vo.getColumnName()+";}");
		    		getsetArray.append("\r\n\r\n");
	    		}
	    	}
	    	content=content.replace("templete", entityVo.getEntityName());
	    	content=content.replace("Templete", StringUtil.uppercaseFirstLetter(entityVo.getEntityName()));
	    	content=content.replace("$ace:column", columnArray.toString());
	    	content=content.replace("$ace:getset", getsetArray.toString());
		 return content;
	 }
	 
}
