package com.jww.common.properties;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Created by ThinkPad on 2018/10/28.
 */
@Data
@Component
@ConfigurationProperties(prefix = "spring.elasticsearch")
public class ElasticsearchProperties {
    /**
     * elk集群地址
     */
    private String hostName;
    /**
     * 端口
     */
    private String port;
    /**
     * 集群名称
     */
    private String clusterName;

    /**
     * 连接池
     */
    private String poolSize;
}
