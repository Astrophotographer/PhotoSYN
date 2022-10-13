<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<!-- swiper슬라이더 메인컨테이너 -->
<div class="swiper-container">
    <!-- 보여지는 영역 -->
    <div class="swiper-wrapper">
        <!-- div class="swiper-slide" 를 추가하면된다 -->
        <div class="swiper-slide"><img src="/resources/member/img/profile/profile.png"></div>
        <div class="swiper-slide"><img src="/resources/member/img/profile/user.png">asd</div>
        <div class="swiper-slide"><img src="/resources/member/img/profile/profile.png"></div>
        <div class="swiper-slide"><img src="/resources/member/img/profile/user.png"></div>
        <div class="swiper-slide"><img src="/resources/member/img/profile/profile.png"></div>
        <div class="swiper-slide"><img src="/resources/member/img/profile/user.png"></div>
        <div class="swiper-slide"><img src="/resources/member/img/profile/profile.png"></div>
    </div>
    <!-- 페이징 버튼 처리 -->
    <%--    <div class="swiper-pagination"></div>--%>
    <!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
</div>


<script>
    const swiper = new Swiper('.swiper-container', {
        //기본 셋팅
        //방향 셋팅 vertical 수직, horizontal 수평 설정이 없으면 수평
        direction: 'horizontal',
        //한번에 보여지는 페이지 숫자
        slidesPerView: 5,
        //페이지와 페이지 사이의 간격
        spaceBetween: 30,
        //드레그 기능 true 사용가능 false 사용불가
        debugger: true,
        //마우스 휠기능 true 사용가능 false 사용불가
        mousewheel: true,
        //반복 기능 true 사용가능 false 사용불가
        loop: true,
        //선택된 슬라이드를 중심으로 true 사용가능 false 사용불가 djqt
        centeredSlides: true,
        // 페이지 전환효과 slidesPerView효과와 같이 사용 불가
        // effect: 'fade',

        //자동 스크를링
        autoplay: {
            //시간 1000 이 1초
            delay               : 2500,
            disableOnInteraction: false,
        },

        //페이징
        pagination: {
            //페이지 기능
            el: '.swiper-pagination',
            //클릭 가능여부
            clickable: true,
        },

        //방향표
        navigation: {
            //다음페이지 설정
            nextEl: '.swiper-button-next',
            //이전페이지 설정
            prevEl: '.swiper-button-prev',
        },

    });
</script>

<!--
<br/><br/>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<div>
<sec:authorize access="isAuthenticated()">
    <h1>로그인됨</h1>
    <p>principal : <sec:authentication property="principal"/></p>
    <p>MemberDTO : <sec:authentication property="principal.member"/></p>
    <p>사용자 이름 : <sec:authentication property="principal.member.name"/></p>
    <p>사용자 아이디 : <sec:authentication property="principal.username"/></p>
    <p>사용자 권한 리스트 : <sec:authentication property="principal.member.authDTOList"/></p>
</sec:authorize>
<sec:authorize access="isAnonymous()">
    <h1>로그인 안됨</h1>
</sec:authorize>
</div>
<br/><br/>
-->

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>