package com.admin.scheduler;

import lombok.extern.log4j.Log4j;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

@EnableScheduling
@Component
@Log4j
public class Adminscheduler {

    @Scheduled(cron = "0 0 0 * * *")
    public void testPrint() throws  Exception{
        log.info("===========================================");
        log.info("testPrint");
        log.info(new Date() + "실행!");
    }

    //1초마다 실행 테스트용
    @Scheduled(fixedDelay = 1000)
    public void fixedTest() throws Exception{
        log.info("===========================================");
        log.info("fixedTest");
        log.info(new Date() + "실행!");
    }

    @Scheduled(fixedRate = 1000)
    public void fixedRate() throws Exception{
        log.info("===========================================");
        log.info("fixedRate");
        log.info(new Date() + "실행!");
    }
}
