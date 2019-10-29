package com.jww;

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
 * @author wanghaoxi
 * @date 2018/11/02 10:34
 */
@Slf4j
@SpringBootApplication
@ComponentScan(basePackages = {"com.jww.api", "com.jww.common.web", "com.jww.common.log.web", "com.jww.common.redis", "com.jww.common.jwt"})
@ServletComponentScan({"com.jww.common.web.filter", "com.jww.common.jwt.filter", "com.jww.ump.server.druid"})
@ImportResource(value = {"classpath:dubbo/consumers.xml"})
@EnableDubbo(scanBasePackages = "com.jww.api")
public class ApiServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(ApiServerApplication.class, args);
        log.info("========== ApiServerApplication启动成功 ==========");
    }
}
