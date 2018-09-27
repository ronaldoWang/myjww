package com.jww.common.rabbitmq.service;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.rabbit.support.CorrelationData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Service;

import javax.print.attribute.standard.Destination;
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

    /**
     * 发送消息
     *
     * @param queueName
     * @param object
     */
    public void send(String queueName, final Object object) {
        String message = object instanceof String ? object.toString() : JSONObject.toJSONString(object);
        try {
            CorrelationData correlationData = new CorrelationData(UUID.randomUUID().toString());
            rabbitTemplate.convertAndSend("DIRECT_EXCHANGE", "DIRECT_ROUTING_KEY", message, correlationData);
        } catch (MessagingException e) {
            log.error(e.toString());
        }
    }
}
