package com.jww;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ImportResource;

/**
 * 启动类
 *
 * @author wanyong
 * @date 2017/11/17 00:34
 */
@Slf4j
@SpringBootApplication
@ComponentScan(basePackages = {"com.jww.**.server", "com.jww.common.oss", "com.jww.common.web", "com.jww.common.dsession", "com.jww.common.log.web", "com.jww.common.redis"})
@ServletComponentScan({"com.jww.common.web.filter", "com.jww.common.jwt.filter", "com.jww.ump.server.druid"})
@ImportResource(value = {"classpath:dubbo/consumers.xml"})
public class ServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(ServerApplication.class, args);
        log.info("========== ServerApplication启动成功 ==========");
    }

/*    @Bean
    public FilterRegistrationBean webAppForIndexFilterRegistrationBean() {
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        registrationBean.setName("webAppForIndexFilter");
        XssFilter xssFilter = new XssFilter();
        registrationBean.setFilter(xssFilter);
        registrationBean.setOrder(1);
        List<String> urlList = new ArrayList<String>();
        urlList.add("/*");
        registrationBean.setUrlPatterns(urlList);
        return registrationBean;
    }*/
}
