<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<div class="gallery__page">
    <div class="gallery__warp">
        <div style="font-size: 50px; font-weight: 800;">프로필 수정</div>
        <hr>
        <form action="/member/mypage/profileModifyPro" method="post" enctype="multipart/form-data">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <c:choose>
                <c:when test="${member.pic == null}">
                    <img src="/resources/member/bootstrap/main/img/user.png" alt="profile_img"
                         style="width: 100px; height: 100px; border-radius: 50%; margin: 10px;">
                </c:when>
                <c:otherwise>
                    <img src="/resources/member/img/profile/${member.pic}" alt="profile_img"
                         style="width: 100px; height: 100px; border-radius: 50%; margin: 10px;">
                </c:otherwise>
            </c:choose>
            <div style="padding: 15px;">
                <input type="file" id="filename" name="filename">
            </div>
            <div style="padding: 15px; text-align: right;">
                <button class="profileBtn" type="submit">완료</button>
            </div>
        </form>
    </div>
</div>

<script>

</script>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
