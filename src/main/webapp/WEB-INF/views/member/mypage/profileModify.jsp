<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<div class="gallery__page">
    <div class="gallery__warp">
        <div style="font-size: 50px; font-weight: 800;">프로필 수정</div>
        <hr>
        <sec:authentication property="principal" var="princi"/>
        <form action="/member/mypage/profileModify?_csrf=${_csrf.token}" method="post" id="imgForm" name="imgForm"
              enctype="multipart/form-data">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <br/>
            <div class="select_img">
                <img src="/resources/member/img/${princi.member.pic}" alt="프로필 사진"
                     style="width: 100px; height: 100px; border-radius: 50%; margin: 10px;"/>
            </div>

            <div style="padding: 15px;">
                <label class="profileBtn2" for="uploadFile">업로드</label>
                <input type="file" id="uploadFile" name="uploadFile">
            </div>
            <div style="padding: 15px;">
                <div>
                    <strong><label for="id">아이디</label></strong>
                    <p><input type="text" id="id" name="id" value="${princi.member.id}" autocomplete="off" readonly/>
                    </p>
                </div>
                <div>
                    <strong><label for="name">닉네임</label></strong>
                    <p><input type="text" id="name" name="name" value="${princi.member.name}" autocomplete="off"/></p>
                    <span id="nameCk" name="nameCk"></span>
                </div>
                <div>
                    <strong><label for="phone">휴대폰 번호</label></strong>
                    <p><input type="text" id="phone" name="phone" value="${princi.member.phone}" autocomplete="off"/>
                    </p>
                </div>
                <div>
                    <strong><label for="pw">비밀번호</label></strong>
                    <p><input type="password" id="pw" name="pw" autocomplete="off"/></p>
                </div>
                <div>
                    <button class="profileBtn2" type="button" style="width: 110px"
                            onclick="window.location.href='/member/mypage/updatePw'">
                        비밀번호 변경
                    </button>
                    <button class="profileBtn2" type="button" style="width: 80px; margin: 0px 0px 0px 115px;"
                            onclick="window.location.href='/member/mypage/profileDelete'">
                        회원탈퇴
                    </button>
                </div>
            </div>
            <div style="padding: 15px; text-align: right;">
                <button class="profileBtn2" type="submit">완료</button>
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
    if (msg === "비밀번호를 다시 확인해 주세요.") {
        alert("비밀번호를 다시 확인해 주세요.");
    }



    $('#name').blur(function () {
        var header = $("meta[name='_csrf_header']").attr("content");
        var token = $("meta[name='_csrf']").attr("content");

        if ($('#name').val() != '') {
            $.ajax({
                url     : '/member/mypage/nameCheck',
                type    : 'post',
                data    : 'name=' + $('#name').val(),
                dataType: 'json',
                beforeSend: function(xhr){
                    xhr.setRequestHeader(header, token);	// 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
                },
                success : function (result) {
                    if (result == '1') {
                        $("#nameCk").text('중복된 닉네임입니다.');
                        $("#nameCk").css('color', 'red');
                    } else {
                        $("#nameCk").text('사용 가능한 닉네임입니다.');
                        $("#nameCk").css('color', 'blue');
                    }
                },
                error   : function (a, b, c) {
                    console.log(a, b, c);
                }
            });
        }
    });
</script>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
