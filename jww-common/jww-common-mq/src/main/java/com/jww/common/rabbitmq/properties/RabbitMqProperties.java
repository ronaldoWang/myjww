package com.jww.common.rabbitmq.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Created by aihuihsou on 2018/9/27.
 */
@Data
@Component
@ConfigurationProperties(prefix = "spring.rabbitmq")
public class RabbitMqProperties {
    private String exchangeName = "DIRECT_EXCHANGE";
    private String queueName = "DIRECT_QUEUE";
    private String routingKey = "DIRECT_ROUTING_KEY";
}
