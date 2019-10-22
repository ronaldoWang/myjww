package com.jww;

import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.mybatis.spring.annotation.MapperScan;
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
@ComponentScan(basePackages = {"com.jww.**.rpc.service.impl", "com.jww.quartz", "com.jww.common.db", "com.jww.common.core", "com.jww.common.mdb", "com.jww.common.redis"})
@ImportResource(value = {"classpath:dubbo/providers.xml"})
@MapperScan(basePackages = {"com.jww.**.dao.mapper"})
@EnableDubbo(scanBasePackages = "com.jww.**.impl")
public class JobServiceApplication {

    public static void main(String[] args) {
        SpringApplication springApplication = new SpringApplication(JobServiceApplication.class);
        springApplication.run(args);
        log.info("========== ServiceApplication启动成功 ==========");
    }
}
