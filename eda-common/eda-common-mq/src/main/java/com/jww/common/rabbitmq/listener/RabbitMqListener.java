package com.jww.common.rabbitmq.listener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * Created by ThinkPad on 2018/9/26.
 */
@Component
public class RabbitMqListener {
    private static final Logger log = LoggerFactory.getLogger(RabbitMqListener.class);

    /**
     * FANOUT广播队列监听一.
     *
     * @param message the message
     * @param channel the channel
     * @throws IOException the io exception  这里异常需要处理
     */
    //@RabbitListener(queues = {"FANOUT_QUEUE_A"})
    //public void on(Message message, Channel channel) throws IOException {
    //    channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
    //    log.debug("FANOUT_QUEUE_A " + new String(message.getBody()));
    //}

    /**
     * FANOUT广播队列监听二.
     *
     * @param message the message
     * @param channel the channel
     * @throws IOException the io exception   这里异常需要处理
     */
    //@RabbitListener(queues = {"FANOUT_QUEUE_B"})
    //public void t(Message message, Channel channel) throws IOException {
    //    channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
    //    log.debug("FANOUT_QUEUE_B " + new String(message.getBody()));
    //}

    /**
     * DIRECT模式.
     *
     * @param message the message
     * @param channel the channel
     * @throws IOException the io exception  这里异常需要处理
     */
    //@RabbitListener(queues = {"DIRECT_QUEUE"})
    //public void message(Message message, Channel channel) throws IOException {
    //    channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
    //    log.debug("DIRECT " + new String(message.getBody()));
   // }

    /**
     * 监听替补队列 来验证死信.
     *
     * @param message the message
     * @param channel the channel
     * @throws IOException the io exception  这里异常需要处理
     */
    //@RabbitListener(queues = {"REDIRECT_QUEUE"})
    //public void redirect(Message message, Channel channel) throws IOException {
    //    channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
    //    log.debug("dead message  10s 后 消费消息 {}", new String(message.getBody()));
    //}
}
