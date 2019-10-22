package com.jww.common.oss.configuration;


import com.jww.common.oss.OssProperties;
import com.jww.common.oss.service.CloudStorageService;
import com.jww.common.oss.service.impl.AliCloudStorageServiceImpl;
import com.jww.common.oss.service.impl.QiNuiCloudStorageServiceImpl;
import com.jww.common.oss.service.impl.QqCloudStorageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 云存储配置
 *
 * @author haoxi.wang
 * @date 2018-01-31 14:58
 */
@Configuration
@EnableConfigurationProperties(OssProperties.class)
public class CloudStorageConfiguration {

    @Autowired
    private OssProperties ossProperties;

    @Bean("cloudStorageService")
    public CloudStorageService cloudStorageService() {
        if (ossProperties.getType() == null) {
            return null;
        }
        if (ossProperties.getType().equals(1)) {
            return new AliCloudStorageServiceImpl(ossProperties);
        } else if (ossProperties.getType().equals(2)) {
            return new QqCloudStorageServiceImpl(ossProperties);
        } else if (ossProperties.getType().equals(3)) {
            return new QiNuiCloudStorageServiceImpl(ossProperties);
        }
        return null;
    }


}
