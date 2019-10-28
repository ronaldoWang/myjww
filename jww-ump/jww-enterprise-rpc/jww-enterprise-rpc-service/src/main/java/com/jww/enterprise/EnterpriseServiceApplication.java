package com.jww.enterprise;

import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ImportResource;

/**
 * @author haoxi.wang
 * @description: 启动类
 * @date 2017/11/17 00:34
 */
@Slf4j
@SpringBootApplication
@ComponentScan(basePackages = {"com.jww.**.rpc", "com.jww.common.db", "com.jww.common.core", "com.jww.common.redis"})
@ImportResource(value = {"classpath:dubbo/providers.xml"})
@EnableDubbo(scanBasePackages = "com.jww.**.impl")
public class EnterpriseServiceApplication {

    public static void main(String[] args) {
        SpringApplication springApplication = new SpringApplication(EnterpriseServiceApplication.class);
        springApplication.run(args);
        log.info("========== ServiceApplication启动成功 ==========");
    }

}
