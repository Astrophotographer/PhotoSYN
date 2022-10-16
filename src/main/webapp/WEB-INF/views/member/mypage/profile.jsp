<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<div class="gallery__page">
    <div class="gallery__warp">
        <div style="font-size: 50px; font-weight: 800;">내정보</div>
        <hr>
        <sec:authentication property="principal" var="princi"/>
        <div>
            <c:choose>
                <c:when test="${princi.member.pic == null}">
                    <br/>
                    <img src="/resources/member/bootstrap/main/img/user.png" alt="사진"
                         style="width: 100px; height: 100px; border-radius: 50%; margin: 10px;"/>
                </c:when>
                <c:otherwise>
                    <br/>
                    <img src="/resources/member/img/profile/${princi.member.pic}" alt="profile_img"
                         style="width: 100px; height: 100px; border-radius: 50%; margin: 10px;"/>
                </c:otherwise>
            </c:choose>
            ${princi.member.name}님의 회원등급은
            <c:if test="${princi.member.membership == 0}">
                <b style="color: #a76d27;">브론즈</b>
            </c:if>
            <c:if test="${princi.member.membership == 1}">
                <b style="color: #7b7f7b;">실버</b>
            </c:if>
            <c:if test="${princi.member.membership == 2}">
                <b style="color: #a99a31;">골드</b>
            </c:if>
            <c:if test="${princi.member.membership == 3}">
                <b style="color: #28e3d4;">다이아</b>
            </c:if>
            입니다.

            <div style="text-align: right; padding: 15px;">
                <fmt:formatNumber value="${princi.member.point}" pattern="#,###,###"/>&nbsp;P
            </div>
            <div style="padding: 15px; display: flex; justify-content: space-between;">
                <button class="profileBtn2" type="button" style="width: 100px"
                        onclick="window.location.href='/member/mypage/profileModify'">
                    프로필 수정
                </button>
                <button class="profileBtn2" type="button" style="width: 100px"
                        onclick="window.location.href='/member/mypage/profilePointAdd'">
                    포인트 충전
                </button>

            </div>
        </div>
        <hr>
        <div class="parent">
            <div class="first">베스트 사진</div>
            <div class="second">총 판매금액</div>
            <div class="third">누적 다운로드 수</div>
        </div>
        <div class="parent">
            <div class="first">
                <img src="/resources/member/img/profile/home_button_startframe__c9vtuy36kju6_large.jpg" alt="사진"
                     style="width: 400px; height: 250px;"/>
            </div>
            <div class="second"><fmt:formatNumber pattern="###,###" value="${tot}"/> 원</div>
            <div class="third">0 회</div>
        </div>
    </div>
</div>

<!-- TEST BUTTON -->
<form action="/member/mypage/galleryBuyBtn" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <button class="profileBtn2" type="submit" style="width: 100px">
        구매하기
    </button>
</form>

<script>
    var msg1 = '${msg1}';
    if (msg1 === "비밀번호 변경이 완료되었습니다.") {
        alert("비밀번호 변경이 완료되었습니다.");
    }

    var msg = '${success}';
    if (msg === "구매가 완료되었습니다.") {
        alert("구매가 완료되었습니다.\r잔여 포인트 : [" + ${princi.member.point} + " P]");
    }
</script>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>



