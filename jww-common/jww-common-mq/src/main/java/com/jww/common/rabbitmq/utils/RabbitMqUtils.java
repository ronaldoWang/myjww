package com.jww.common.rabbitmq.utils;

import com.jww.common.rabbitmq.service.RabbitMqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * Created by ThinkPad on 2018/9/26.
 */
@Component
public class RabbitMqUtils {
    @Autowired
    private RabbitMqService rabbitMqService;
    private static RabbitMqUtils mqUtils;

    @PostConstruct
    public void init() {
        mqUtils = new RabbitMqUtils();
        mqUtils.rabbitMqService = this.rabbitMqService;
    }

    /**
     * @param
     * @return
     * @description: 发送队列
     * @author wang haoxi
     * @date 2017/11/21 15:45
     */
    public static void send(String queueName, final Object object) {
        mqUtils.rabbitMqService.send(queueName, object);
    }
}
