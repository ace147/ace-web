package com.ace.common.redis;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;

import com.ace.common.util.SerializeUtil;


/**
 * @author Ace
 * @version 1.0
 */
@SuppressWarnings({ "unchecked", "rawtypes" })
public class RedisDaoImpl implements RedisDao {

	@Autowired
	protected RedisTemplate redisTemplate;

	@Override
	public Object getSession(final String keyValue) {
		return redisTemplate.execute(new RedisCallback<Object>() {

			@Override
			public Object doInRedis(RedisConnection connection) throws DataAccessException {
				byte[] key = redisTemplate.getStringSerializer().serialize(keyValue);
				if (connection.exists(key)) {
					byte[] value = connection.get(key);
					return SerializeUtil.unserialize(value);
				}
				return null;
			}
		});

	}

	@Override
	public void putSession(final String key, final Object value) {
		redisTemplate.execute(new RedisCallback<Object>() {
			public Object doInRedis(RedisConnection connection) throws DataAccessException {
				connection.set(redisTemplate.getStringSerializer().serialize(key), redisTemplate.getValueSerializer().serialize(value));
				return null;
			}
		});
	}
	
	@Override
	public void putSessionT(final String key, final Object value) {
		redisTemplate.opsForValue().set(key, value);
	}
	
	@Override
	public Object getMSession(final Set<String> keys) {
		return redisTemplate.opsForValue().multiGet(keys);
	}
	
	@Override
	public void putSessionExpire(final String key, final Object value,final Integer seconds) {
		redisTemplate.execute(new RedisCallback<Object>() {
			public Object doInRedis(RedisConnection connection) throws DataAccessException {
				connection.set(redisTemplate.getStringSerializer().serialize(key), redisTemplate.getValueSerializer().serialize(value));
				connection.expire(redisTemplate.getStringSerializer().serialize(key), seconds);
				return null;
			}
		});
	}

	@Override
	public void putListSession(final String key, final Object value) {
		redisTemplate.opsForList().leftPush(key, value);
	}

	@Override
	public List getListSession(final String keyValue) {
		final Long listSize = redisTemplate.opsForList().size(keyValue);
		List list = redisTemplate.opsForList().range(keyValue, 0, listSize);
		return list;
	}

	@Override
	public void popListSession(final String keyValue) {
		final Long listSize = redisTemplate.opsForList().size(keyValue);
		for (int i = 0; i < listSize; i++) {
			redisTemplate.opsForList().leftPop(keyValue);
		}
	}
	
	@Override
	public Object rightPopSession(final String keyValue) {
		return redisTemplate.opsForList().rightPop(keyValue);
	}
	
	@Override
	public Object rightPushSession(final String keyValue,final Object value) {
		return redisTemplate.opsForList().rightPush(keyValue, value);
	}
	
	@Override
	public void leftPushSession(final String keyValue,final Object value) {
		redisTemplate.opsForList().leftPush(keyValue,value);
	}

	@Override
	public void setListSession(final String key, final int index, final Object value) {
		redisTemplate.opsForList().set(key, index, value);
	}

	@Override
	public Long listSessionSize(final String key) {
		return redisTemplate.opsForList().size(key);
	}

	@Override
	public void removeListSession(final String key, final long index, final Object value) {
		redisTemplate.opsForList().remove(key, index, value);
	}

	@Override
	public void putHashAllSession(final String key, final Map map) {
		redisTemplate.opsForHash().putAll(key, map);
	}
	
	@Override
	public void putHashSession(final String key, final String keyMap, final Object obj) {
		redisTemplate.opsForHash().put(key, keyMap, SerializeUtil.serialize(obj));
	}

	@Override
	public Map getHashAllSession(final String key) {
		return redisTemplate.opsForHash().entries(key);
	}
	
	@Override
	public byte[] getHashSession(final String key,final String mapKey) {
		return (byte[])redisTemplate.opsForHash().get(key,mapKey);
	}
	
	@Override
	public void incrementHashSession(final String key,final String mapKey,final int cnt) {
		redisTemplate.opsForHash().increment(key, mapKey, cnt);
	}
	
	@Override
	public void deleteHashSession(final String key,final String hashKeys) {
		redisTemplate.opsForHash().delete(key, hashKeys);
	}

	@Override
	public void deleteSession(final String key) {
		this.redisTemplate.delete(key);
	}
	
	@Override
	public void convertAndSendMessage(final String channel,final String message) {
		this.redisTemplate.convertAndSend(channel, message);
	}
    
	/**
	 * 通过正则匹配keys
	 */
	@Override
	public Set getVaguekeys(String pattern){
        return redisTemplate.keys(pattern);
    }
	
	@Override
	public List pipelineHGetAll(final String[] keys){
		List results = redisTemplate.executePipelined(new RedisCallback<Object>() {
            public Object doInRedis(RedisConnection connection) throws DataAccessException {
                for(String key : keys) {
                	byte[] key0 = redisTemplate.getStringSerializer().serialize(key);
                	connection.hGetAll(key0);
                }
                return null;
            }
        });
		return results;
	}
	
	@Override
	public List pipelineHGetAllSet(final Set<String> keys){
		List results = redisTemplate.executePipelined(new RedisCallback<Object>() {
            public Object doInRedis(RedisConnection connection) throws DataAccessException {
                for(String key : keys) {
                	byte[] key0 = redisTemplate.getStringSerializer().serialize(key);
                	connection.hGetAll(key0);
                }
                return null;
            }
        });
		return results;
	}
	
	@Override
	public List pipelineVaguekeys(final String[] keys){
		//模糊查询key，key是用StringSerializer编码的，如果不传StringSerializer指定编码，会默认使用ValueSerializer，会导致编码出错
		List results = redisTemplate.executePipelined(new RedisCallback<Object>() {
            public Object doInRedis(RedisConnection connection) throws DataAccessException {
                for(String key : keys) {
                	byte[] key0 = redisTemplate.getStringSerializer().serialize(key);
                	connection.keys(key0);
                }
                return null;
            }
        },redisTemplate.getStringSerializer());
		return results;
	}
	
	@Override
	public List pipelineGetSession(final Set<String> keys){
		List results = redisTemplate.executePipelined(new RedisCallback<Object>() {
            public Object doInRedis(RedisConnection connection) throws DataAccessException {
                for(String key : keys) {
                	byte[] key0 = redisTemplate.getStringSerializer().serialize(key);
                	connection.get(key0);
                }
                return null;
            }
        });
		return results;
	}

	@Override
    public Object flushDB() {
        return redisTemplate.execute(new RedisCallback() {
            public String doInRedis(RedisConnection connection) throws DataAccessException {
                connection.flushDb();
                return "ok";
            }
        });
    }
	
}
