package com.jww.enterprise.server.swagger;

import com.google.common.base.Predicate;
import io.github.jianzhichun.springboot.starters.swagger2.IgnoreMethod;
import io.github.jianzhichun.springboot.starters.swagger2.condition.AutoSwagger2Condition;
import io.github.jianzhichun.springboot.starters.swagger2.config.AutoSwagger2Properties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Conditional;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.CollectionUtils;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.ParameterBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.service.Parameter;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

import static com.google.common.base.Predicates.*;
import static com.google.common.collect.Sets.newHashSet;
import static springfox.documentation.builders.PathSelectors.regex;
import static springfox.documentation.builders.RequestHandlerSelectors.withMethodAnnotation;

@Configuration
@Conditional(AutoSwagger2Condition.class)
@EnableSwagger2
@EnableConfigurationProperties(AutoSwagger2Properties.class)
public class AutoSwagger2Configuration {

    @Autowired
    private AutoSwagger2Properties autoSwagger2Properties;

    @Bean
    public Docket docket() {
        ParameterBuilder ticketPar = new ParameterBuilder();
        List<Parameter> pars = new ArrayList<>();
        ticketPar.name("Authorization").description("user token")//
                .modelRef(new ModelRef("string")).parameterType("header")
                .required(false).build(); //header中的ticket参数非必填，传空也可以
        pars.add(ticketPar.build());    //根据每个方法名也知道当前方法在设置什么参数

        ApiInfo apiInfo = new ApiInfoBuilder().title(autoSwagger2Properties.getApiInfo().getTitle())
                .description(autoSwagger2Properties.getApiInfo().getDescription())
                .termsOfServiceUrl(autoSwagger2Properties.getApiInfo().getTermsOfServiceUrl())
                .contact(new Contact(autoSwagger2Properties.getApiInfo().getContact().getName(),
                        autoSwagger2Properties.getApiInfo().getContact().getUrl(),
                        autoSwagger2Properties.getApiInfo().getContact().getEmail()))
                .version(autoSwagger2Properties.getApiInfo().getVersion())
                .license(autoSwagger2Properties.getApiInfo().getLicense())
                .licenseUrl(autoSwagger2Properties.getApiInfo().getLicenseUrl()).build();
        return new Docket(DocumentationType.SWAGGER_2).host(autoSwagger2Properties.getHost())
                .protocols(newHashSet(autoSwagger2Properties.getProtocols())).enable(autoSwagger2Properties.isEnable())
                .apiInfo(apiInfo).select().apis(not(withMethodAnnotation(IgnoreMethod.class)))
                .apis(RequestHandlerSelectors.basePackage(autoSwagger2Properties.getBasePackage()))
                .paths(CollectionUtils.isEmpty(autoSwagger2Properties.getPaths().getOr()) ? PathSelectors.any()
                        : or(map2list(autoSwagger2Properties.getPaths().getOr(),
                        new Function<String, Predicate<String>>() {
                            @Override
                            public Predicate<String> apply(String path) {
                                return regex(path);
                            }
                        })))
                .paths(CollectionUtils.isEmpty(autoSwagger2Properties.getPaths().getNot()) ? PathSelectors.any()
                        : and(map2list(autoSwagger2Properties.getPaths().getNot(),
                        new Function<String, Predicate<String>>() {
                            @Override
                            public Predicate<String> apply(String path) {
                                return not(regex(path));
                            }
                        })))
                .build().globalOperationParameters(pars);

    }

    static <T, R> List<R> map2list(Collection<T> collection, Function<? super T, ? extends R> mapper) {
        return collection.stream().map(mapper).collect(Collectors.toList());

    }

}
