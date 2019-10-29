package com.jww.common.rabbitmq.service;

import com.alibaba.fastjson.JSONObject;
import com.jww.common.rabbitmq.properties.RabbitMqProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.rabbit.support.CorrelationData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Service;

import java.util.UUID;


/**
 * rabbitmq 服务类
 *
 * @author wang haoxi
 */
@Service("rabbitMqService")
@Slf4j
public class RabbitMqService {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Autowired
    private RabbitMqProperties rabbitMqProperties;

    /**
     * 发送消息
     *
     * @param object
     */
    public void send(final Object object) {
        String exchange = rabbitMqProperties.getExchangeName();
        String routingKey = rabbitMqProperties.getRoutingKey();
        send(exchange, routingKey, object);
    }

    /**
     * 发送消息 ，指定routingKey
     *
     * @param routingKey
     * @param object
     */
    public void send(final String routingKey, final Object object) {
        String exchange = rabbitMqProperties.getExchangeName();
        send(exchange, routingKey, object);
    }

    /**
     * 发送消息 ，指定exchange,routingKey
     *
     * @param exchange
     * @param routingKey
     * @param object
     */
    public void send(final String exchange, final String routingKey, final Object object) {
        String message = object instanceof String ? object.toString() : JSONObject.toJSONString(object);
        try {
            CorrelationData correlationData = new CorrelationData(UUID.randomUUID().toString());
            rabbitTemplate.convertAndSend(exchange, routingKey, message, correlationData);
        } catch (MessagingException e) {
            log.error(e.toString());
        }
    }
}
