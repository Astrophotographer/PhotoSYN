package com.blog.aop;

import lombok.extern.log4j.Log4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import java.util.Arrays;

@Component
@Aspect
@Log4j
public class AnnotationAdvice {

    //BLOG 서비스단 실행시 실행되는 곳. 메서드명과 실행시간 출력.
    @Around("execution(* com.blog.service.BlogServiceImpl.*(..))")
    public Object logTime(ProceedingJoinPoint pjp) throws Throwable {

        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        //실행 메서드
        Object result = pjp.proceed();

        stopWatch.stop();

        MethodSignature methodSignature = (MethodSignature) pjp.getSignature();
        log.info("메서드 : " + methodSignature.getMethod().getName());
        log.info("TIME : " + stopWatch.getTotalTimeMillis());

        return result;
    }

    @AfterThrowing(pointcut = "execution(* com.blog.service.BlogServiceImpl.*(..))", throwing = "exception")
    public void afterThrowingLog(Exception exception) {
        log.info("Exception...............");
        log.info("exception: " + exception);
        log.info("exception.getMessage(): " + exception.getMessage());
    }
}
