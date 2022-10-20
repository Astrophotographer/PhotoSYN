package com.test.controller;

import com.admin.mapper.AdminMapper;
import com.member.mapper.MemberMapper;
import junit.framework.TestCase;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

@Log4j
public class TestControllerTest extends TestCase {

    @Autowired
    private AdminMapper adminMapper;

    @Test
    public void testaddNum(){
        int a = 3;
        int b = 2;
        log.info(a+b);
    }

    @Test
    public void testGetMember(){
        try {
            log.info(adminMapper.getUserCount());
        }catch (NullPointerException nullPointerException){
            log.info("nullPointerException : "+nullPointerException);
        }catch (Exception e){
            e.printStackTrace();
        }
    }


}