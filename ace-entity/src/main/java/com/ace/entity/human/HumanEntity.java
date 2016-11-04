/**
 * 持久层接口-人类
 */
package com.ace.entity.human;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * @author  ace
 * @description  实体类-人类
 * @date  2016-11-03 
 */
    
	@Entity
	@Table(name = "HUMAN")
	public class HumanEntity implements Serializable {
		
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

	@Column(name = "Hair", length = 20)

	private String hair; // 头发

	@Column(name = "Eyes", length = 2)

	private Integer eyes; // null



	public Long getId() {return id;}

	public void setId(Long id) {this.id = id;}
	
	public String getHair() {return hair;}

	public void setHair(String hair) {this.hair = hair;}

	public Integer getEyes() {return eyes;}

	public void setEyes(Integer eyes) {this.eyes = eyes;}


		
}

