package com.test.controller;

import com.admin.mapper.AdminMapper;
import com.member.mapper.MemberMapper;
import junit.framework.TestCase;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

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

    @Test
    public void testPro() {
        List<String> list = new ArrayList<>();

        list.add("1");
        list.add("2");
        list.add("3");

        for (int i = 0; i < list.size(); i++){
            log.info(list.get(i));
        }
    }


}