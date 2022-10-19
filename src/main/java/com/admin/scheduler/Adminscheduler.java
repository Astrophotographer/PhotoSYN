package com.admin.scheduler;

import com.admin.mapper.AdminMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

@EnableScheduling
@Component
@Log4j
public class Adminscheduler {

    @Autowired
    private AdminMapper adminMapper;

    //매 시간 작동
    @Scheduled(cron = "0 0 0 * * *")
    public void testPrint() throws  Exception{
        log.info("===========================================");
        log.info("testPrint");
        log.info(new Date() + "실행!");
    }

    //매 5분마다 작동 --> 정상 작동
    @Scheduled(cron="0 0/5 * * * *")
    public void test5min() throws Exception{
        log.info("===========================================");
        log.info("test5min");
        log.info(new Date() + "실행!");
    }

    @Scheduled(cron = "0 0 3 * * *")    //매일 3시
    public void deleteBlogTempImg() throws Exception{
        Date date = new Date();

        log.info("===========================================");
        log.info("deleteBlogTempImg");
        log.info(date + "실행!");

        int result = adminMapper.deleteBlogTempImg();

        log.info(date + " 에 진행.\n삭제 결과 : "+result);

    }


    //1초마다 실행 테스트용
//    @Scheduled(fixedDelay = 1000)
//    public void fixedTest() throws Exception{
//        log.info("===========================================");
//        log.info("fixedTest");
//        log.info(new Date() + "실행!");
//    }
//
//    @Scheduled(fixedRate = 1000)
//    public void fixedRate() throws Exception{
//        log.info("===========================================");
//        log.info("fixedRate");
//        log.info(new Date() + "실행!");
//    }
}
