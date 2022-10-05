<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<form action="/member/mypage/modifyPro" method="post">
    <div class="gallery__page">
        <div class="gallery__warp">
            <div style="font-size: 50px; font-weight: 800;">내정보</div>
            <div>
                <img src="/resources/member/bootstrap/main/img/profile.jpg" alt="profile_picture"
                     style="width: 100px; height: 100px; border-radius: 50%; margin: 10px;">
                <div style="padding: 15px;">
                    <button class="profileBtn" type="button">프로필 수정</button>
                </div>
            </div>
        </div>
    </div>


</form>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
