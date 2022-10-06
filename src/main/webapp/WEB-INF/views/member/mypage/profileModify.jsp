<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<div class="gallery__page">
    <div class="gallery__warp">
        <div style="font-size: 50px; font-weight: 800;">프로필 수정</div>
        <hr>
        <sec:authentication property="principal" var="princi"/>
        <form action="/member/mypage/profileImgModify" method="post" id="imgForm" name="imgForm"
              enctype="multipart/form-data">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <c:choose>
                <c:when test="${princi.member.pic == null}">
                    <br/>
                    <div class="select_img">
                        <img src="/resources/member/bootstrap/main/img/user.png" alt="profile_img"
                             style="width: 100px; height: 100px; border-radius: 50%; margin: 10px;"/>
                    </div>
                </c:when>
                <c:otherwise>
                    <br/>
                    <div class="select_img">
                        <img src="/resources/member/img/profile/${princi.member.pic}" alt="profile_img"
                             style="width: 100px; height: 100px; border-radius: 50%; margin: 10px;"/>
                    </div>
                </c:otherwise>
            </c:choose>
            <div style="padding: 15px;">
                <label class="profileBtn" for="uploadFile">업로드</label>
                <input type="file" id="uploadFile" name="uploadFile">
            </div>
        </form>
        <form action="/member/mypage/profileInfoModify" method="post" id="infoForm" name="infoForm">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div style="padding: 15px;">
                <div>
                    <label>아이디</label>
                    <input type="text" id="id" name="id" value="${princi.member.id}" autocomplete="off" readonly/>
                </div>
                <div>
                    <label for="name">닉네임</label>
                    <input type="text" id="name" name="name" value="${princi.member.name}" autocomplete="off"/>
                </div>
                <div>
                    <label for="phone">휴대폰 번호</label>
                    <input type="text" id="phone" name="phone" value="${princi.member.phone}" autocomplete="off"/>
                </div>
                <div>
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" autocomplete="off"/>
                </div>
                <div>
                    <button class="profileBtn" type="button" onclick="window.location.href='/member/mypage/updatePw'">
                        비밀번호 변경
                    </button>
                </div>
            </div>
            <div style="padding: 15px; text-align: right;">
                <button class="profileBtn" type="submit">완료</button>
            </div>
        </form>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("#uploadFile").change(function () {
            if (this.files && this.files[0]) {
                var reader = new FileReader;
                reader.onload = function (data) {
                    $(".select_img img").attr("src", data.target.result).width(100);
                }
                reader.readAsDataURL(this.files[0]);
            }
        });
    });

    var msg = '${msg}';
    if (msg === '비밀번호를 다시 확인해 주세요.') {
        alert("비밀번호를 다시 확인해 주세요.");
    }

</script>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
