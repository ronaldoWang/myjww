package com.jww.common.redis.helper;

import com.jww.common.redis.manager.CacheManager;
import com.jww.common.redis.util.CacheUtil;
import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.core.RedisOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.SessionCallback;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * Redis缓存辅助类
 *
 * @author shadj
 * @date 2017/11/21 1:30
 */
@Slf4j
@Component
public final class RedisHelper implements CacheManager {

    @Autowired
    private RedisTemplate<String, Serializable> redisTemplate;


    @Value("${spring.redis.lock.waitTimeOut}")
    private long waitTimeOut;

    @Value("${spring.redis.lock.lockTimeOut}")
    private int lockTimeOut;

    public RedisHelper() {
        log.debug("==============setCacheManager(RedisHelper)================");
        CacheUtil.setCacheManager(this);
    }


    /**
     * 放入缓存
     *
     * @param key
     * @param value
     * @return void
     * @author shadj
     * @date 2017/11/21 22:23
     */
    @Override
    public void set(String key, Serializable value) {
        redisTemplate.opsForValue().set(key, value);
    }


    /**
     * 取出缓存，key为String类型
     *
     * @param key
     * @return java.lang.Object
     * @author shadj
     * @date 2017/12/29 20:18
     */
    @Override
    public Object get(final String key) {
        return redisTemplate.opsForValue().get(key);
    }


    /**
     * 根据key模式获取所有的缓存
     *
     * @param pattern
     * @return java.util.Set<java.lang.Object>
     * @author shadj
     * @date 2017/12/29 20:20
     */
    @Override
    public Set<Object> getAll(String pattern) {
        Set<Object> values = new HashSet<Object>();
        Set<String> keys = redisTemplate.keys(pattern);
        for (String key : keys) {
            values.add(redisTemplate.opsForValue().get(key));
        }
        return values;
    }


    @Override
    public void set(String key, Serializable value, int seconds) {
        redisTemplate.boundValueOps(key).set(value);
        expire(key, seconds);
    }

    @Override
    public Boolean exists(String key) {
        return redisTemplate.hasKey(key);
    }

    @Override
    public void del(String key) {
        redisTemplate.delete(key);
    }

    @Override
    public void delAll(String pattern) {
        redisTemplate.delete(redisTemplate.keys(pattern));
    }

    @Override
    public String type(String key) {
        return redisTemplate.type(key).getClass().getName();
    }

    /**
     * 在某段时间后失效
     *
     * @param key
     * @param seconds
     * @return Boolean
     * @author shadj
     * @date 2017/11/21 23:47
     */
    @Override
    public Boolean expire(String key, int seconds) {
        return redisTemplate.expire(key, seconds, TimeUnit.SECONDS);
    }

    /**
     * 在某个时间点失效
     *
     * @param key
     * @param unixTime
     * @return Boolean
     * @author shadj
     * @date 2017/11/21 23:47
     */
    @Override
    public Boolean expireAt(String key, long unixTime) {
        return redisTemplate.expireAt(key, new Date(unixTime));
    }

    @Override
    public Long ttl(String key) {
        return redisTemplate.getExpire(key, TimeUnit.SECONDS);
    }

    @Override
    public Object getSet(String key, Serializable value) {
        return redisTemplate.opsForValue().getAndSet(key, value);
    }

    @Override
    public String lock(String lockName) {
        return this.lock(lockName, waitTimeOut, lockTimeOut);
    }

    @Override
    public String lock(String key, long userWaitTimeOut, int userLockTimeOut) {
        // 随机生成一个value
        String lockValue = UUID.randomUUID().toString();
        // 计算获取锁的最后时间
        long end = System.currentTimeMillis() + userWaitTimeOut * 1000;
        int i = 0;
        while (System.currentTimeMillis() < end) {
            boolean flag = redisTemplate.opsForValue().setIfAbsent(key, lockValue);
            // 获取锁成功后，还要设置锁的有效期
            if (flag) {
                this.expire(key, userLockTimeOut);
                log.info("set lock , key: {}, lockValue: {} ,retry: {} ", key, lockValue, i);
                return lockValue;
            }
            // 返回-1代表key没有设置超时时间，为key设置一个超时时间
            if (this.ttl(key) == -1) {
                this.expire(key, userLockTimeOut);
            }
            //等待10毫秒再继续获取锁
            try {
                Thread.sleep(10);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
            i++;
        }
        log.error("get lock false, key: {} ,retry: {} ", key, i);
        return null;
    }

    @Override
    public boolean unlock(String key, String lockValue) {
        if (StrUtil.isEmpty(lockValue)) {
            log.error("lockValue must be not empty");
            throw new IllegalArgumentException("lockValue must be not empty");
        }
        Object ret = redisTemplate.execute(new SessionCallback() {
            @Override
            public Object execute(RedisOperations operations) throws DataAccessException {
                operations.watch(key);
                String value = (String) operations.opsForValue().get(key);
                if(lockValue.equals(value)){
                    operations.multi();
                    operations.delete(key);
                    Object rs = operations.exec();
                    return rs;
                }
                operations.unwatch();
                return null;
            }
        });
        return ret == null ? false : true;
    }

    @Override
    public void hset(String key, Serializable field, Serializable value) {
        redisTemplate.boundHashOps(key).put(field, value);
    }

    @Override
    public Object hget(String key, Serializable field) {
        return redisTemplate.boundHashOps(key).get(field);
    }

    @Override
    public void hdel(String key, Serializable field) {
        redisTemplate.boundHashOps(key).delete(field);
    }

    @Override
    public boolean setnx(String key, Serializable value) {
        return redisTemplate.opsForValue().setIfAbsent(key, value);
    }

    @Override
    public Long incr(String key) {
        return redisTemplate.opsForValue().increment(key, 1L);
    }

    @Override
    public void setrange(String key, long offset, String value) {
        redisTemplate.boundValueOps(key).set(value, offset);
    }

    @Override
    public String getrange(String key, long startOffset, long endOffset) {
        return redisTemplate.boundValueOps(key).get(startOffset, endOffset);
    }

    @Override
    public void sadd(String key, Serializable value) {
        redisTemplate.boundSetOps(key).add(value);
    }

    @Override
    public Set<?> sall(String key) {
        return redisTemplate.boundSetOps(key).members();
    }

    @Override
    public boolean sdel(String key, Serializable value) {
        return redisTemplate.boundSetOps(key).remove(value) == 1;
    }
}
