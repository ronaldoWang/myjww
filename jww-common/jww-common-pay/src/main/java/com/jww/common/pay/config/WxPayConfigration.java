package com.jww.common.pay.config;

import com.egzosn.pay.common.api.PayService;
import com.egzosn.pay.wx.api.WxPayConfigStorage;
import com.egzosn.pay.wx.api.WxPayService;
import com.jww.common.pay.properties.WxPayProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 支付配置类
 *
 * @author shadj
 * @date 2018/5/2 14:27
 */
@Configuration
@EnableConfigurationProperties(WxPayProperties.class)
public class WxPayConfigration {

    @Autowired
    private WxPayProperties wxPayProperties;

    @Bean("payConfigStorage")
    public WxPayConfigStorage getWxPayConfigStorage(){
        WxPayConfigStorage wxPayConfigStorage = new WxPayConfigStorage();
        wxPayConfigStorage.setMchId(wxPayProperties.getMchId());
        wxPayConfigStorage.setAppid(wxPayProperties.getAppid());
        wxPayConfigStorage.setKeyPublic(wxPayProperties.getKeyPublic());
        wxPayConfigStorage.setSecretKey(wxPayProperties.getSecretKey());
        wxPayConfigStorage.setNotifyUrl(wxPayProperties.getNotifyUrl());
        wxPayConfigStorage.setReturnUrl(wxPayProperties.getNotifyUrl());
        wxPayConfigStorage.setSignType(wxPayProperties.getSignType());
        wxPayConfigStorage.setInputCharset("utf-8");
        return wxPayConfigStorage;
    }

    @Bean("payService")
    public PayService getPayService(WxPayConfigStorage wxPayConfigStorage){
        return new WxPayService(wxPayConfigStorage);
    }
}
