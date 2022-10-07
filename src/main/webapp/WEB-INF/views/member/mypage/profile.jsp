<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<!--
<div class="wrapper">
<div class="sidebar">
<div class="profile">
<img src="/resources/bootstrap/main/img/profile.jpg" alt="profile_picture">
<h3>하이성아</h3>
<p>다이아</p>
</div>
<ul>
<li>
<a href="/member/mypage/profile">
<span class="item">내정보</span>
</a>
</li>
<li>
<a href="#">
<span class="item">장바구니</span>
</a>
</li>
<li>
<a href="#">
<span class="item">구매 · 판매내역</span>
</a>
</li>
<li>
<a href="#">
<span class="item">환급신청</span>
</a>
</li>
</ul>
</div>
</div>
--> <!-- 사이드바 -->
<div class="gallery__page">
    <div class="gallery__warp">
        <div style="font-size: 50px; font-weight: 800;">내정보</div>
        <hr>
        <sec:authentication property="principal" var="princi"/>
        <div>
            <c:choose>
                <c:when test="${princi.member.pic == null}">
                    <br/>
                    <img src="/resources/member/bootstrap/main/img/user.png" alt="profile_img"
                         style="width: 100px; height: 100px; border-radius: 50%; margin: 10px;"/>
                </c:when>
                <c:otherwise>
                    <br/>
                    <img src="/resources/member/img/profile/${princi.member.pic}" alt="profile_img"
                         style="width: 100px; height: 100px; border-radius: 50%; margin: 10px;"/>
                </c:otherwise>
            </c:choose>
            ${princi.member.name}님의 회원등급은 ${princi.member.membership}
            <c:if test="${princi.member.membership} == 0">
                <b style="color: #a76d27;">브론즈</b>
            </c:if>
            <c:if test="princi.member.membership == 1">
                <b style="color: #7b7f7b;">실버</b>
            </c:if>
            <c:if test="princi.member.membership == 2">
                <b style="color: #a99a31;">골드</b>
            </c:if>
            <c:if test="princi.member.membership == 3">
                <b style="color: #28e3d4;">다이아</b>
            </c:if>
            입니다.
            <div style="padding: 15px;">
                <button class="profileBtn" type="button" onclick="window.location.href='/member/mypage/profileModify'">
                    프로필 수정
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    var msg1 = '${msg1}';
    if (msg1 === "비밀번호 변경이 완료되었습니다.") {
        alert("비밀번호 변경이 완료되었습니다.");
    }
</script>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>



