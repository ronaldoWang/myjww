package com.jww.ump.server.aspect;

import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSON;
import com.jww.common.core.Constants;
import com.jww.common.core.util.RegexUtil;
import com.jww.common.log.annotation.SysLogOpt;
import com.jww.common.web.model.ResultModel;
import com.jww.common.web.util.WebUtil;
import com.jww.ump.model.SysLogModel;
import com.jww.ump.model.SysUserModel;
import com.jww.ump.rpc.api.SysLogService;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.Reference;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;


/**
 * 日志入库切面
 *
 * @author haoxi.wang
 * @date 2017/12/27 13:56
 */
@Slf4j
@Aspect
@Component
public class LogAspect {
    /**
     * 开始时间
     */
    private long startTime = 0L;

    @Reference(check = false)
    private SysLogService logService;

    @Pointcut("execution(* *..controller..*.*(..)) && @annotation(com.jww.common.log.annotation.SysLogOpt)")
    public void logPointCut() {

    }

    @Around("logPointCut()")
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
        startTime = System.currentTimeMillis();
        Object result = null;
        SysLogModel sysLogModel = logPre(pjp);
        try {
            result = pjp.proceed();
        } finally {
            //查询类型不添加日志
            if (Constants.LogOptEnum.QUERY.value() != sysLogModel.getOperationType()) {
                if (logAfter(result, sysLogModel).getUserName() != null) {
                    //不入缓存库
                    sysLogModel.setCreateTime(new Date());
                    sysLogModel.setUpdateTime(new Date());
                    logService.insert(sysLogModel);
                }
            }
        }
        return result;
    }


    private SysLogModel logPre(ProceedingJoinPoint pjp) throws Exception {
        SysLogModel sysLogModel = new SysLogModel();
        for (Method method : Class.forName(pjp.getTarget().getClass().getName()).getMethods()) {
            if (method.getName().equals(pjp.getSignature().getName())) {
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length == pjp.getArgs().length) {
                    //方法名称
                    sysLogModel.setOperation(method.getAnnotation(SysLogOpt.class).value());
                    //操作类型
                    sysLogModel.setOperationType(method.getAnnotation(SysLogOpt.class).operationType().value());
                    break;
                }
            }
        }
        //获取请求对象
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        startTime = System.currentTimeMillis();
        String ip = HttpUtil.getClientIP(request);
        //方法名含包名（com.jww.ump.SysLogController.queryListPage）
        String classMethod = pjp.getSignature().getDeclaringTypeName() + "." + pjp.getSignature().getName();
        //请求参数
        String args = JSON.toJSONString(pjp.getArgs()).replaceAll(RegexUtil.getJSonValueRegex("password"), "****").replaceAll(RegexUtil.getJSonValueRegex("oldPassword"), "****");

        sysLogModel.setIp(ip);
        sysLogModel.setMethod(classMethod);
        //sysLogModel.setParams(args);//参数由于存在base64，无法存放，暂时去掉 2018.11.02
        sysLogModel.setCreateTime(new Date());
        sysLogModel.setCreateBy(0L);
        sysLogModel.setUpdateBy(0L);
        SysUserModel currentUser = (SysUserModel) WebUtil.getCurrentUser();
        if (currentUser != null) {
            sysLogModel.setUserName(currentUser.getUserName());
        }
        return sysLogModel;
    }


    private SysLogModel logAfter(Object result, SysLogModel sysLogModel) {
        ResultModel response = null;
        if (result != null) {
            response = (ResultModel) result;
        }
        if (sysLogModel.getUserName() == null) {
            SysUserModel user = (SysUserModel) WebUtil.getCurrentUser();
            if (user != null) {
                sysLogModel.setUserName(user.getUserName());
            }
        }
        //返回结果
        if (response != null && response.code == Constants.ResultCodeEnum.SUCCESS.value()) {
            sysLogModel.setResult(1);
        } else {
            sysLogModel.setResult(0);
        }
        //执行时长(毫秒)
        Long spendTime = System.currentTimeMillis() - startTime;
        sysLogModel.setTime(spendTime);
        return sysLogModel;
    }
}
