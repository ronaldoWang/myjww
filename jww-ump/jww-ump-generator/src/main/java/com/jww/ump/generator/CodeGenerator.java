package com.jww.ump.generator;

import com.jww.common.core.util.MybatisPlusGeneratorUtil;

/**
 * 代码生成器
 *
 * @author haoxi.wang
 * @date 2017/11/25 14:05
 */
public class CodeGenerator {

    public static void main(String[] args) {
        UmpGeneratorUtil mybatisPlusGeneratorUtil = new UmpGeneratorUtil();
        String propertiesFilePath = "generator.properties";
        mybatisPlusGeneratorUtil.generator(propertiesFilePath);
    }

}
