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
    String exchangeName = "DIRECT_EXCHANGE";
    String queueName = "DIRECT_QUEUE";
    String routingKey = "DIRECT_ROUTING_KEY";
}
