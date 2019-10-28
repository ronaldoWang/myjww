package com.jww.ump.generator;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.setting.dialect.Props;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
import com.baomidou.mybatisplus.generator.config.rules.DbType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * MybatisPlus代码生成工具
 *
 * @author wanyong
 * @date 2017-12-11
 **/
public class UmpGeneratorUtil {

    /**
     * 根据配置文件执行生成
     *
     * @param propertiesFilePath properties配置文件绝对路径
     * @author wanyong
     * @date 2017-12-11 20:04
     */
    public void generator(String propertiesFilePath) {
        Props props = new Props(FileUtil.touch(propertiesFilePath), CharsetUtil.UTF_8);
        AutoGenerator mpg = new AutoGenerator();
        // 全局配置
        GlobalConfig gc = new GlobalConfig();
        gc.setOutputDir("");
        gc.setFileOverride(true);
        // 不需要ActiveRecord特性的请改为false
        gc.setActiveRecord(false);
        // XML 二级缓存
        gc.setEnableCache(false);
        // XML ResultMap
        gc.setBaseResultMap(true);
        // XML columList
        gc.setBaseColumnList(true);
        // .setKotlin(true) 是否生成 kotlin 代码
        gc.setAuthor(props.getStr("global.author"));

        gc.setServiceName("%sService");
        //不打开输出目录
        gc.setOpen(false);

        mpg.setGlobalConfig(gc);

        // 数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setDbType(DbType.MYSQL);
        dsc.setTypeConvert(new MySqlTypeConvert() {
            // 自定义数据库表字段类型转换【可选】
            @Override
            public DbColumnType processTypeConvert(String fieldType) {
                System.out.println("转换类型：" + fieldType);
                // 注意！！processTypeConvert 存在默认类型转换，如果不是你要的效果请自定义返回、非如下直接返回。
                return super.processTypeConvert(fieldType);
            }
        });
        dsc.setDriverName(props.getStr("datasource.drivername"));
        dsc.setUsername(props.getStr("datasource.username"));
        dsc.setPassword(props.getStr("datasource.password"));
        dsc.setUrl(props.getStr("datasource.url"));
        mpg.setDataSource(dsc);

        // 策略配置
        StrategyConfig strategy = new StrategyConfig();
        // 此处可以修改为您的表前缀
        strategy.setTablePrefix(props.getStr("strategy.tableprefix"));
        // 表名生成策略
        strategy.setNaming(NamingStrategy.underline_to_camel);
        // 需要生成的表
        strategy.setInclude(StrUtil.split(props.getStr("strategy.include"), ","));
        // 排除生成的表
        strategy.setExclude(StrUtil.split(props.getStr("strategy.exclude"), ","));
        // 自定义实体父类
        strategy.setSuperEntityClass(props.getStr("strategy.superentityclass"));
        // 自定义实体，公共字段
        strategy.setSuperEntityColumns(StrUtil.split(props.getStr("strategy.superentitycolumns"), ","));
        // 自定义 mapper 父类
        strategy.setSuperMapperClass(props.getStr("strategy.supermapperclass"));
        // 自定义 service 父类
        strategy.setSuperServiceClass(props.getStr("strategy.superserviceclass"));
        // 自定义 service 实现类父类
        strategy.setSuperServiceImplClass(props.getStr("strategy.superserviceimplclass"));
        // 自定义 controller 父类
        strategy.setSuperControllerClass(props.getStr("strategy.superCcontrollerclass"));
        // 设置使用 restController
        strategy.setRestControllerStyle(true);
        // 使用lombok插件
        strategy.setEntityLombokModel(true);
        mpg.setStrategy(strategy);


        String projectService = props.getStr("project.service");//服务名
        String parentModuleName = props.getStr("package.parentmodulename");//父模块名
        String packageModuleName = props.getStr("package.modulename");//子模块名
        StringBuffer parentPackage = new StringBuffer(props.getStr("package.parent"));
        if (StringUtils.isNotBlank(projectService)) {
            parentPackage.append(".").append(projectService);
        }
        if (StringUtils.isNotBlank(parentModuleName)) {
            parentPackage.append(".").append(parentModuleName);
        }
        if (StringUtils.isNotBlank(packageModuleName)) {
            parentPackage.append(".").append(packageModuleName);
        }


        StringBuffer parentDir = new StringBuffer();
        if (StringUtils.isNotBlank(projectService)) {
            parentDir.append(projectService).append("\\");
        }
        if (StringUtils.isNotBlank(parentModuleName)) {
            parentDir.append(parentModuleName).append("\\");
        }
        if (StringUtils.isNotBlank(packageModuleName)) {
            parentDir.append(packageModuleName).append("\\");
        }

        String rpcRoot = props.getStr("fileout.rpcRoot");//服务工程根目录
        String webDirectory = props.getStr("fileout.webDirectory");//web 工程目录
        String rpcDirectory = props.getStr("fileout.rpcDirectory");//服务 根目录
        String rpcServiceApiDirectory = props.getStr("fileout.rpcServiceApiDirectory");//model、service指定目录
        String rpcServiceImplDirectory = props.getStr("fileout.rpcServiceImplDirectory");//dubbo providers、serviceImpl、Mapper所在目录
        String javaDirectory = props.getStr("fileout.javaDirectory");//model、service、Mapper、serviceImpl 等Java类生成路径
        String mapperXmlDirectory = props.getStr("fileout.mapperXmlDirectory");//mapper xml生成目录
        String pageDirectory = props.getStr("fileout.pageDirectory");//html js生成目录
        //String dubboDirectory = props.getStr("fileout.dubboDirectory");//dubbo 指定路径
        //String dubboConsumersDirectory = webDirectory + dubboDirectory;//dubbo consumers 生成目录


        // 包配置
        PackageConfig pc = new PackageConfig();
        pc.setParent(parentPackage.toString());
        pc.setModuleName("");
        pc.setController("controller");
        pc.setMapper("dao.mapper");
        pc.setEntity("model");
        pc.setService("rpc.api");
        pc.setServiceImpl("rpc.service.impl");
        mpg.setPackageInfo(pc);

        // 注入自定义配置，可以在 VM 中使用 cfg.abc 【可无】
        InjectionConfig cfg = new InjectionConfig() {
            @Override
            public void initMap() {
                Map<String, Object> map = new HashMap<>(1);
                map.put("abc", this.getConfig().getGlobalConfig().getAuthor() + "-mp");
                map.put("projectService", projectService);
                map.put("packageModuleName", packageModuleName);
                map.put("parentModuleName", parentModuleName);
                this.setMap(map);
            }
        };

        // 自定义 文件 生成
        List<FileOutConfig> focList = new ArrayList<>();

        // 调整 htmlListConfig 生成目录
        FileOutConfig htmlListConfig = new FileOutConfig("/templates/list.html.vm") {
            @Override
            public String outputFile(com.baomidou.mybatisplus.generator.config.po.TableInfo tableInfo) {
                StringBuffer path = new StringBuffer(pageDirectory);
                if (StringUtils.isNotBlank(parentModuleName)) {
                    path.append(parentModuleName).append("\\");
                }
                if (StringUtils.isNotBlank(packageModuleName)) {
                    path.append(packageModuleName).append("\\");
                }
                path.append(tableInfo.getEntityPath()).append("List.html");
                return path.toString();
            }
        };
        // 调整 jsListConfig 生成目录
        FileOutConfig jsListConfig = new FileOutConfig("/templates/list.js.vm") {
            @Override
            public String outputFile(com.baomidou.mybatisplus.generator.config.po.TableInfo tableInfo) {
                StringBuffer path = new StringBuffer(pageDirectory);
                if (StringUtils.isNotBlank(parentModuleName)) {
                    path.append(parentModuleName).append("\\");
                }
                if (StringUtils.isNotBlank(packageModuleName)) {
                    path.append(packageModuleName).append("\\");
                }
                path.append(tableInfo.getEntityPath()).append("List.js");
                return path.toString();
            }
        };

        // 调整 htmlform 生成目录
        FileOutConfig htmlFormConfig = new FileOutConfig("/templates/form.html.vm") {
            @Override
            public String outputFile(com.baomidou.mybatisplus.generator.config.po.TableInfo tableInfo) {
                StringBuffer path = new StringBuffer(pageDirectory);
                if (StringUtils.isNotBlank(parentModuleName)) {
                    path.append(parentModuleName).append("\\");
                }
                if (StringUtils.isNotBlank(packageModuleName)) {
                    path.append(packageModuleName).append("\\");
                }
                path.append(tableInfo.getEntityPath()).append(".html");
                return path.toString();
            }
        };
        // 调整 jsFormConfig 生成目录
        FileOutConfig jsFormConfig = new FileOutConfig("/templates/form2.js.vm") {
            @Override
            public String outputFile(com.baomidou.mybatisplus.generator.config.po.TableInfo tableInfo) {
                StringBuffer path = new StringBuffer(pageDirectory);
                if (StringUtils.isNotBlank(parentModuleName)) {
                    path.append(parentModuleName).append("\\");
                }
                if (StringUtils.isNotBlank(packageModuleName)) {
                    path.append(packageModuleName).append("\\");
                }
                path.append(tableInfo.getEntityPath()).append(".js");
                return path.toString();
            }
        };

        // 调整entityConfig
        FileOutConfig entityConfig = new FileOutConfig("/templates/entity.java.vm") {
            @Override
            public String outputFile(com.baomidou.mybatisplus.generator.config.po.TableInfo tableInfo) {
                StringBuffer path = new StringBuffer(rpcRoot);
                path.append(rpcDirectory)
                        .append(rpcServiceApiDirectory)
                        .append(javaDirectory)
                        .append(parentDir)
                        .append("model\\")
                        .append(tableInfo.getEntityName())
                        .append("Model.java");
                return path.toString();
            }
        };

        // 调整service
        FileOutConfig serviceConfig = new FileOutConfig("/templates/service.java.vm") {
            @Override
            public String outputFile(com.baomidou.mybatisplus.generator.config.po.TableInfo tableInfo) {
                StringBuffer path = new StringBuffer(rpcRoot);
                path.append(rpcDirectory)
                        .append(rpcServiceApiDirectory)
                        .append(javaDirectory)
                        .append(parentDir)
                        .append("rpc\\api\\")
                        .append(tableInfo.getEntityName())
                        .append("Service.java");
                return path.toString();
            }
        };

        // 调整mapper java
        FileOutConfig mapperConfig = new FileOutConfig("/templates/mapper.java.vm") {
            @Override
            public String outputFile(com.baomidou.mybatisplus.generator.config.po.TableInfo tableInfo) {
                StringBuffer path = new StringBuffer(rpcRoot);
                path.append(rpcDirectory)
                        .append(rpcServiceImplDirectory)
                        .append(javaDirectory)
                        .append(parentDir)
                        .append("dao\\mapper\\")
                        .append(tableInfo.getEntityName())
                        .append("Mapper.java");
                return path.toString();
            }
        };

        // 调整serviceImpl
        FileOutConfig serviceImplConfig = new FileOutConfig("/templates/serviceImpl.java.vm") {
            @Override
            public String outputFile(com.baomidou.mybatisplus.generator.config.po.TableInfo tableInfo) {
                StringBuffer path = new StringBuffer(rpcRoot);
                path.append(rpcDirectory)
                        .append(rpcServiceImplDirectory)
                        .append(javaDirectory)
                        .append(parentDir)
                        .append("rpc\\service\\impl\\")
                        .append(tableInfo.getEntityName())
                        .append("ServiceImpl.java");
                return path.toString();
            }
        };

        // 调整 controller 生成目录
        FileOutConfig controllerConfig = new FileOutConfig("/templates/controller.java.vm") {
            @Override
            public String outputFile(com.baomidou.mybatisplus.generator.config.po.TableInfo tableInfo) {
                StringBuffer path = new StringBuffer(rpcRoot);
                path.append(webDirectory)
                        .append(javaDirectory)
                        .append(parentDir)
                        .append("controller\\")
                        .append(tableInfo.getEntityName())
                        .append("Controller.java");
                return path.toString();
            }
        };

        // 调整mapper xml 生成目录
        FileOutConfig mapperXmlConfig = new FileOutConfig("/templates/mapper.xml.vm") {
            @Override
            public String outputFile(com.baomidou.mybatisplus.generator.config.po.TableInfo tableInfo) {
                StringBuffer path = new StringBuffer(rpcRoot);
                path.append(rpcDirectory)
                        .append(rpcServiceImplDirectory)
                        .append(mapperXmlDirectory);
                if (StringUtils.isNotBlank(parentModuleName)) {
                    path.append(parentModuleName).append("\\");
                }
                if (StringUtils.isNotBlank(packageModuleName)) {
                    path.append(packageModuleName).append("\\");
                }
                path.append(tableInfo.getEntityName()).append("Mapper.xml");
                return path.toString();
            }
        };

        //// 调整 dubbo providers 生成目录
        //FileOutConfig dubboProvidersXmlConfig = new FileOutConfig("/templates/providers.xml.vm") {
        //    @Override
        //    public String outputFile(com.baomidou.mybatisplus.generator.config.po.TableInfo tableInfo) {
        //        StringBuffer path = new StringBuffer(rpcRoot);
        //        path.append(rpcDirectory)
        //                .append(rpcServiceImplDirectory)
        //                .append(dubboDirectory);
        //        if (StringUtils.isNotBlank(parentModuleName)) {
        //            path.append(parentModuleName).append("\\");
        //        }
        //        if (StringUtils.isNotBlank(packageModuleName)) {
        //            path.append(packageModuleName).append("\\");
        //        }
        //        path.append(tableInfo.getEntityPath()).append("-providers.xml");
        //        return path.toString();
        //    }
        //};
        //
        //// 调整 dubbo consumers 生成目录
        //FileOutConfig dubboConsumerXmlConfig = new FileOutConfig("/templates/consumers.xml.vm") {
        //    @Override
        //    public String outputFile(com.baomidou.mybatisplus.generator.config.po.TableInfo tableInfo) {
        //        StringBuffer path = new StringBuffer(rpcRoot);
        //        path.append(dubboConsumersDirectory);
        //        if (StringUtils.isNotBlank(parentModuleName)) {
        //            path.append(parentModuleName).append("\\");
        //        }
        //        if (StringUtils.isNotBlank(packageModuleName)) {
        //            path.append(packageModuleName).append("\\");
        //        }
        //        path.append(tableInfo.getEntityPath()).append("-consumers.xml");
        //        return path.toString();
        //    }
        //};

        focList.add(serviceImplConfig);
        focList.add(serviceConfig);
        focList.add(mapperXmlConfig);
        focList.add(entityConfig);
        focList.add(mapperConfig);
        focList.add(jsFormConfig);
        focList.add(htmlFormConfig);
        focList.add(htmlListConfig);
        focList.add(jsListConfig);
        //focList.add(dubboConsumerXmlConfig);
        //focList.add(dubboProvidersXmlConfig);
        focList.add(controllerConfig);
        cfg.setFileOutConfigList(focList);
        mpg.setCfg(cfg);

        // 关闭默认 xml 生成，调整生成 至 根目录
        TemplateConfig tc = new TemplateConfig();
        tc.setXml(null);
        tc.setEntity(null);
        tc.setMapper(null);
        tc.setController(null);
        tc.setService(null);
        tc.setServiceImpl(null);
        mpg.setTemplate(tc);

        // 执行生成
        mpg.execute();
    }
}
