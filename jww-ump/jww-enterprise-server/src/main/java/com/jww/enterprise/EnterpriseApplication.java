package com.jww.enterprise;

import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ImportResource;

/**
 * 启动类
 *
 * @author haoxi.wang
 * @date 2017/11/17 00:34
 */
@Slf4j
@SpringBootApplication
@ComponentScan(basePackages = {"com.jww.**.server", "com.jww.ump.common", "com.jww.common.oss", "com.jww.common.dsession", "com.jww.common.log.web", "com.jww.common.redis", "com.jww.common.jwt"})
@ServletComponentScan({"com.jww.common.web.filter", "com.jww.common.jwt.filter", "com.jww.ump.server.druid"})
@ImportResource(value = {"classpath:dubbo/consumers.xml"})
@EnableDubbo(scanBasePackages = "com.jww.**.server")
public class EnterpriseApplication {
    public static void main(String[] args) {
        SpringApplication.run(EnterpriseApplication.class, args);
        log.info("========== ServerApplication启动成功 ==========");
    }

}
