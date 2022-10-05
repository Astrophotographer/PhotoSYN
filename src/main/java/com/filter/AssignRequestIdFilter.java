//package com.filter;
//
////assignRequestIdFilter
//
//
//
//package com.web.filter;
//
//import com.http.HttpRequestConstant;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.boot.web.servlet.filter.OrderedFilter;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.core.Ordered;
//
//import javax.servlet.FilterChain;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import java.io.IOException;
//import java.util.UUID;
//
//@Configuration
//@Slf4j
//public class AssignRequestIdFilter implements OrderedFilter {
//
//    @Override
//    public int getOrder() {
//        return Ordered.HIGHEST_PRECEDENCE;
//    }
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//
//        try {
//            //Request Id가 존재할 경우 새로 부여하지 않게 처리
//            String requestId = UUID.randomUUID().toString();
//            request.setAttribute(HttpRequestConstant.REQUEST_ID.getId(), requestId);
//        } catch (Exception e) {
//            log.debug(e.getMessage());
//        } finally {
//            chain.doFilter(request, response);
//        }
//    }
//}
