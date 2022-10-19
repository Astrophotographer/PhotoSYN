package com.admin.scheduler;

import com.admin.domain.Admin_MemberShip;
import com.admin.domain.Admin_MemberShipInfo;
import com.admin.mapper.AdminMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@EnableScheduling
@Component
@Log4j
public class Adminscheduler {

    @Autowired
    private AdminMapper adminMapper;

    //매일 정각?
//    @Scheduled(cron = "0 0 0 * * *")
//    @Scheduled(cron="0 0/1 * * * *")
//    public void testPrint() throws  Exception{
//        log.info("===========================================");
//        log.info("testPrint");
//        log.info(new Date() + "실행!");
//
//        //모든 유저 아이디 들고와서
////        List<Admin_MemberShip> member_With_uid = adminMapper.getUserList();
//        List<String> u_id = adminMapper.getUserList();
//        List<Admin_MemberShip> admin_memberShipList = null;
//
//        for(int i=0;i<u_id.size();i++){
//            log.info("u_id : "+u_id.get(i));
//            admin_memberShipList = adminMapper.getUserMemberList(u_id.get(i));
//
//        }
//
//        //유저 멤버쉽 비교를 위해 데이터들 가져옴.
//        for(int i=0; i<admin_memberShipList.size();i++){
//            log.info("admin_memberShipList : "+admin_memberShipList.get(i));
//        }
//    }

    //3시 정각 맴버쉽 시작
    @Scheduled(cron = "0 0 3 * * *")
    public void testPrint() throws Exception {
        log.info("===========================================");
        log.info("testPrint");
        Admin_MemberShip admin_memberShip = null;
        Admin_MemberShipInfo admin_memberShipInfo = null;

        //모든 유저들 원하는 정보 list로 담겨있음
        List<Admin_MemberShip> list = adminMapper.getUserMemberList();
        log.info("list : " + list);

        //유저 멤버쉽 비교를 위해 데이터들 가져옴.
        List<Admin_MemberShipInfo> membership = adminMapper.getMemberShipInfo();

        for (int i = 0; i < list.size(); i++) {
            admin_memberShip = list.get(i);

            for (int j = 0; j < membership.size(); j++) {
                admin_memberShipInfo = membership.get(j);

                if (admin_memberShip.getSinceDate() > admin_memberShipInfo.getMs_att() &&
                        admin_memberShip.getSellerCount() > admin_memberShipInfo.getMs_sell() &&
                        admin_memberShip.getGalleryCount() > admin_memberShipInfo.getMs_regist()) {
                    admin_memberShip.setU_status(admin_memberShipInfo.getMs_membership());
                }

            }
            log.info("===========================================");
            log.info("===========================================");
            log.info("admin_memberShip : " + admin_memberShip);
            log.info("===========================================");
            log.info("===========================================");

        }

//        log.info(list.size());
        int result = adminMapper.updateUserMemberShip(list);

        log.info("===========================================");
        log.info("result : "+result);


    }

    //매 5분마다 작동 --> 정상 작동
    @Scheduled(cron = "0 0/5 * * * *")
    public void test5min() throws Exception {
        log.info("===========================================");
        log.info("test5min");
        log.info(new Date() + "실행!");
    }

    @Scheduled(cron = "0 0 3 * * *")    //매일 3시
    public void deleteBlogTempImg() throws Exception {
        Date date = new Date();

        log.info("===========================================");
        log.info("deleteBlogTempImg");
        log.info(date + "실행!");

        int result = adminMapper.deleteBlogTempImg();

        log.info(date + " 에 진행.\n삭제 결과 : " + result);

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
