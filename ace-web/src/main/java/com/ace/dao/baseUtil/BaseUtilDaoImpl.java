package com.ace.dao.baseUtil;


import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import com.ace.hibernate.dao.BaseHibernateDaoUtil;

@Repository("baseUtilDao")
public class BaseUtilDaoImpl extends BaseHibernateDaoUtil implements BaseUtilDao{
	
	
    /**	
     * 返回最大的编码
     */
	@Override
	public String getCodeMax(String codeQuery,String sqltable) {
		String sql="SELECT MAX(CODE) FROM "+sqltable+" WHERE CODE LIKE '%"+codeQuery+"%' ";
		Session session = this.getCurrentSession();
		Query query = session.createSQLQuery(sql);
		String code=(String) query.list().get(0);
		return code;
	}
    
}
