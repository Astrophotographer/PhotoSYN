package com.member.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class MemberLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                                        Authentication authentication) throws IOException, ServletException {
        List<String> roleNames = new ArrayList<String>();

        // 로그인한 사람의 권한 목록 얻어오기
        authentication.getAuthorities().forEach(authority -> roleNames.add(authority.getAuthority()));
		// 권한에 따른 페이지 이동 처리
        /*
		if (roleNames.contains("ROLE_ADMIN")) { // 어드민 권한이 있으면
			response.sendRedirect("/admin/main"); // 어드민 메인페이지로 이동
		}
		if (roleNames.contains("ROLE_SALES")) { // 어드민 권한이 있으면
			response.sendRedirect("/sales/main"); // 어드민 메인페이지로 이동
		}
		*/
        // 로그인 폼으로 강제 이동되어 로그인 처리 성공 후 보던 곳으로 가기 위한 처리
        HttpSession session = httpServletRequest.getSession();
        if (session != null) {
            String redirectURL = (String) session.getAttribute("prevPage");
            if (redirectURL != null) {
                session.removeAttribute("prevPage");
                httpServletResponse.sendRedirect(redirectURL);
            } else {
                httpServletResponse.sendRedirect("/member/main");
            }
        } else {
            // 로그인 하고 메인으로 이동
            httpServletResponse.sendRedirect("/member/main");
        }
    }
}
