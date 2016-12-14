/*
 * Copyright (c) 2015 Messcat. All rights reserved.
 * 
 */
package com.ace.common.redis;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author Microcat
 * @version 1.0
 */
@SuppressWarnings("rawtypes")
public interface RedisDao {

	public void putSession(String key, Object value);

	public Object getSession(String key);

	public Object getMSession(final Set<String> keys);
	
	public void putListSession(String key, Object value);
	
	public void putSessionExpire(final String key, final Object value,final Integer seconds);

	public List getListSession(String key);

	public void popListSession(String key);

	public void setListSession(final String key, final int index, final Object value);

	public Long listSessionSize(final String key);

	public void removeListSession(final String key, final long index, final Object value);

	public void putHashSession(final String key, final String keyMap, final Object obj);

	public void putHashAllSession(final String key, final Map map);
	
	public Map getHashAllSession(final String key);
	
	public byte[] getHashSession(final String key,final String mapKey);
	
	public void deleteHashSession(final String key,final String hashKeys);

	public void deleteSession(final String key);
	
	public void convertAndSendMessage(final String channel,final String message);
	
	public Object rightPopSession(final String keyValue);
	
	public void leftPushSession(final String keyValue,final Object value);
	
	public Object rightPushSession(final String keyValue,final Object value);
	
    public Set getVaguekeys(String pattern);
    
    public List pipelineHGetAll(final String[] keys);
    
    public List pipelineVaguekeys(final String[] keys);
    
    public List pipelineGetSession(final Set<String> keys);
    
    public void putSessionT(final String key, final Object value);
    
    public List pipelineHGetAllSet(final Set<String> keys);
    
    public void incrementHashSession(final String key,final String mapKey,final int cnt);

    public Object flushDB();
    
}
