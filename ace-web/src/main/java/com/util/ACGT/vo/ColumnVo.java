/**
 * 
 */
package com.util.ACGT.vo;

/**
 * @author Ace
 *
 * 2016年12月2日
 */
public class ColumnVo {
    //字段名
	private String columnName;
	//类型
	private String type;
	//长度
	private String length;
	//中文名
	private String cName;
	//注释
	private String remark;
	//是否作为搜索条件
	private String isSreach;
	//是否作为listVo字段
	private String isListVo;
	//是否作为DetailVo字段 ;
	private String isDetailVo;
	

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public String getcName() {
		return cName;
	}
	
	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getIsSreach() {
		return isSreach;
	}

	public void setIsSreach(String isSreach) {
		this.isSreach = isSreach;
	}

	public String getIsListVo() {
		return isListVo;
	}

	public void setIsListVo(String isListVo) {
		this.isListVo = isListVo;
	}

	public String getIsDetailVo() {
		return isDetailVo;
	}

	public void setIsDetailVo(String isDetailVo) {
		this.isDetailVo = isDetailVo;
	}
	
}
