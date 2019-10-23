package com.jww.ump.common.properties;

import com.jww.ump.common.utils.IdWorker;
import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * idworker配置文件
 *
 * @author kevin wang
 * @date 18/11/13 15:11:47
 */
@Component
@ConfigurationProperties(prefix = "idworker")
public class IdWorkerProperties {

    @Getter
    @Setter
    private long workerId = 9;//默认取10，范围0<x<15

    @Bean
    public IdWorker getIdworker() {
        IdWorker idWorker = new IdWorker(workerId);
        return idWorker;
    }
}
