package com.jww.common.configuration;

import com.jww.common.properties.ElasticsearchProperties;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.TransportAddress;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.net.InetAddress;

/**
 * Created by ThinkPad on 2018/10/28.
 */
@Slf4j
@Configuration
public class ElasticsearchConfig {

    @Autowired
    ElasticsearchProperties elasticsearchProperties;

    @Bean
    public TransportClient init() {
        log.info("初始化开始。。。。。");
        TransportClient transportClient = null;
        try {
            // 配置信息
            Settings esSetting = Settings.builder()
                    .put("client.transport.sniff", true)//增加嗅探机制，找到ES集群
                    .put("thread_pool.search.size", Integer.parseInt(elasticsearchProperties.getPoolSize()))//增加线程池个数，暂时设为5
                    .build();
            //配置信息Settings自定义,下面设置为EMPTY
            transportClient = new PreBuiltTransportClient(Settings.EMPTY);
            TransportAddress transportAddress = new TransportAddress(InetAddress.getByName(elasticsearchProperties.getHostName()), Integer.valueOf(elasticsearchProperties.getPort()));
            transportClient.addTransportAddresses(transportAddress);
        } catch (Exception e) {
            log.error("elasticsearch TransportClient create error!!!", e);
        }
        return transportClient;
    }
}
