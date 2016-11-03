/**
 * 
 */
package com.ace.vo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * @author Ace
 *
 * 2016年12月5日
 */
    
	@Entity
	@Table(name = "TEMPLETE")
	public class TempleteEntity implements Serializable {
		
	private static final long serialVersionUID = 1L;

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "ID")
		private Long id;

		@Column(name = "REALNAME", length = 100)
		private String realName; // 真实名称
		
		@Column(name = "NICKNAME", length = 40)
		private String nickname; // 昵称

		

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		

		public String getRealName() {
			return realName;
		}

		public void setRealName(String realName) {
			this.realName = realName;
		}

		public String getNickname() {
			return nickname;
		}

		public void setNickname(String nickname) {
			this.nickname = nickname;
		}

	

}
