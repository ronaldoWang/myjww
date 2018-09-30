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
    public static void send(final Object object) {
        mqUtils.rabbitMqService.send(object);
    }

    /**
     * 发送队列
     *
     * @param routingKey
     * @param object
     */
    public static void send(final String routingKey, final Object object) {
        mqUtils.rabbitMqService.send(routingKey, object);
    }

    /**
     * 发送队列
     *
     * @param exchange
     * @param routingKey
     * @param object
     */
    public static void send(final String exchange, final String routingKey, final Object object) {
        mqUtils.rabbitMqService.send(exchange, routingKey, object);
    }
}
