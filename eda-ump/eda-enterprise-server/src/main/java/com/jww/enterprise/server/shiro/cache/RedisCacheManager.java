package com.jww.enterprise.server.shiro.cache;

import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.springframework.stereotype.Component;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * Shiro缓存管理器（Redis实现）
 *
 * @author haoxi.wang
 * @date 2017/12/29 18:21
 */
@Slf4j
@Component
public class RedisCacheManager implements CacheManager {

    private final ConcurrentMap<String, Cache> caches = new ConcurrentHashMap();

    @Override
    public <K, V> Cache<K, V> getCache(String name) throws CacheException {
        Cache<K, V> cache = caches.get(name);
        if (cache == null) {
            // create a new cache instance, add it to the cache collection
            caches.put(name, new RedisCache<K, V>());
        }
        return cache;
    }
}
