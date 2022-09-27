package com.test.controller;

import junit.framework.TestCase;
import lombok.extern.log4j.Log4j;
import org.junit.Test;

@Log4j
public class TestControllerTest extends TestCase {

    @Test
    public void testaddNum(){
        int a = 3;
        int b = 2;
        log.info(a+b);
    }


}