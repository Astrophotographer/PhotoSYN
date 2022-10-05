package com.member.security;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MemberAccessDeniedHandler implements AccessDeniedHandler {


    @Override
    public void handle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                       AccessDeniedException e) throws IOException, ServletException {
        // 접근 제한 에러 페이지로 이동
        httpServletResponse.sendRedirect("/member/accessError");
    }
}
