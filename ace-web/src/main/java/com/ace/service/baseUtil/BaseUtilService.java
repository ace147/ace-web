package com.ace.service.baseUtil;



public interface BaseUtilService  {
	/**
	 * 创建编码   根据前缀编码 + 当前日期（yyMMdd）+后缀编码    例子：GG160323001
	 * @param preCode 前缀编码 例如“GG”
	 * @param Length  后缀长度 例如 3 代表后面又001开始
	 * @param sqlTable 数据库表名
	 * @return
	 */
	public String createCode(String preCode,int Length,String sqlTable);
	
}
