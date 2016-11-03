/**
 * 
 */
package com.util.ACGT.vo;

import java.util.List;

import com.util.ACGT.tools.DateUtil;

/**
 * @author Ace
 *
 * 2016年12月6日
 */
public class EntityVo {
	private String author;
	
    private String tableName;
    
    private String entityName;
    
    private String description;
    
    private List<ColumnVo> listColumn;
    

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getEntityName() {
		return entityName;
	}

	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}

	public List<ColumnVo> getListColumn() {
		return listColumn;
	}

	public void setListColumn(List<ColumnVo> listColumn) {
		this.listColumn = listColumn;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
    //创建时间
	public String getCreateTime() {
		return DateUtil.getCurrentTime("YYYY-MM-dd");
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
