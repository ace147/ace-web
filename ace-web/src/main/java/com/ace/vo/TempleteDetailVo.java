/**
 * 
 */
package com.ace.vo;


/**
 * @author Ace
 *
 * 2016年12月5日
 */
public class TempleteDetailVo {
	
	private Long id;
	
	private String realName; // 真实名称
	
	private String nickname; // 昵称

	private String mobile; // 手机

	private String sex; // 性别 ‘M’=男；‘F’=女

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

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
}
