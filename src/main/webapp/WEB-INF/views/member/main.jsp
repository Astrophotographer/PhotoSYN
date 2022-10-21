<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<!-- swiper 슬라이더 메인 컨테이너 -->
<div class="swiper-container">
    <!-- 보여지는 영역 -->
    <div class="swiper-wrapper">
        <c:forEach items="${maintagDTO}" var="tags">
            <div class="swiper-slide">
                    <%--                <a href="#">--%>
                    <%--                    <img class="imgs" src="/resources/mainTagImgSaveFolder/${tags.MT_IMG}">--%>
                    <%--                </a>--%>
                <div class="card">
                    <a href="/gallery/main">
                        <img src="/resources/mainTagImgSaveFolder/${tags.MT_IMG}" style="width: 1000px; height: 200px;">
                    </a>
                    <div class="inner-content">
                        <span class="title">Photo SYN</span>
                        <hr style="color: black;">
                        <span class="overview">${tags.MT_NAME}</span>
                    </div>
                </div>
            </div>
        </c:forEach>
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
        spaceBetween:20,
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

    var msg = '${success}';

    if (msg === "구매가 완료되었습니다.") {
        alert("구매가 완료되었습니다.");
    }
</script>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>