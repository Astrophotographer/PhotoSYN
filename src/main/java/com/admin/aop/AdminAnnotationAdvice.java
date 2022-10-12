package com.admin.aop;

import lombok.extern.log4j.Log4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Component
@Aspect
@Log4j
public class AdminAnnotationAdvice {

    @Around("execution(* com.admin.service.AdminServiceImpl.*(..))")
    public Object logTime(ProceedingJoinPoint pjp) throws Throwable {

        StopWatch stopWatch = new StopWatch();
        stopWatch.start();

        Object result = pjp.proceed();

        stopWatch.stop();

        MethodSignature methodSignature = (MethodSignature) pjp.getSignature();
        log.info("메서드 : " + methodSignature.getMethod().getName());
        log.info("TIME : " + stopWatch.getTotalTimeMillis());

        return result;
    }
}
