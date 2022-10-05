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
        <div>
            <img src="/resources/member/bootstrap/main/img/profile.jpg" alt="profile_picture"
                 style="width: 100px; height: 100px; border-radius: 50%; margin: 10px;">
            <sec:authentication property="principal.member.name"/>님의 회원등급은 <b style="color: #44b525;">${membership}</b>입니다.
            <div style="padding: 15px;">
                <button class="profileBtn" type="button">프로필 수정</button>
            </div>
        </div>
    </div>
</div>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>



