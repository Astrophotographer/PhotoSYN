<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/member/css/style.css" type="text/css">
    <script src="/resources/member/css/jquery-3.6.1.min.js"></script>
</head>
<body>
<section class="login-form">
    <h1><a href="/member/main" style="text-decoration: none; color: white;">Photo SYN</a></h1>
    <form action="/member/signup" method="POST">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div style="text-align: center; color: white;">
            <input type="radio" name="auth" value="member" checked="checked"/> 일반회원
            <input type="radio" name="auth" value="admin"/> 관리자
        </div>
        <div class="int-area">
            <input type="text" name="id" id="id" autocomplete="off" required/>
            <label for="id">아이디</label>
        </div>
        <div>
            <span id="idCheck"></span>
        </div>
        <div class="int-area">
            <input type="password" name="pw" id="pw" autocomplete="off" required/>
            <label for="pw">비밀번호</label>
        </div>
        <div class="int-area">
            <input type="password" name="pwch" id="pwch" autocomplete="off" required/>
            <label for="pwch">비밀번호 확인</label>
        </div>
        <div class="int-area">
            <input type="text" name="name" id="name" autocomplete="off" required/>
            <label for="name">닉네임</label>
        </div>
        <div class="int-area">
            <input type="text" name="phone" id="phone" autocomplete="off" required/>
            <label for="phone">전화번호</label>
        </div>
        <div class="btn-area">
            <button id="btn" type="submit">회원가입</button>
        </div>
    </form>
    <div class="caption">
        <a href="/member/searchPw">비밀번호 찾기</a>
    </div>
</section>

<script>
    let id = $('id');
    let pw = $('pw');
    let name = $('name')
    let btn = $('btn');

    $(btn).on('click', function () {
        if ($(id).val() == "") {
            $(id).next('label').addClass('warning');
            setTimeout(function () {
                $('label').removeClass('warning');
            }, 1500);
        } else if ($(pw).val() == "") {
            $(pw).next('label').addClass('warning');
            setTimeout(function () {
                $('label').removeClass('warning');
            }, 1500);
        } else if ($(name).val() == "") {
            $(name).next('label').addClass('warning');
            setTimeout(function () {
                $('label').removeClass('warning');
            }, 1500);
        }
    });
    // 아이디 중복확인
    $("#id").blur(function () {
        if ($('#id').val() != '') {
            // 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
            $.ajax({
                type    : 'GET',
                url     : '/member/idCheck',
                data    : 'id=' + $('#id').val(),
                dataType: 'json',
                success : function (result) {
                    if (result == '0') {
                        $('#idCheck').text('사용 가능한 아이디입니다.');
                        $('#idCheck').css('color', 'blue');
                    } else {
                        $('#idCheck').text('이미 사용중인 아이디입니다.');
                        $('#idCheck').css('color', 'red');
                    }
                },
                error   : function (a, b, c) {
                    console.log(a, b, c);
                }
            });
        }
    });
</script>

</body>
</html>