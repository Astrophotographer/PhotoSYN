<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Photo SYN</title>
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
            <label for="id">이메일</label>
            <span id="idCheck"></span>
        </div>
        <div class="int-area">
            <input type="password" name="pw" id="password" autocomplete="off" required/>
            <label for="password">비밀번호</label>
        </div>
        <div class="int-area">
            <input type="password" name="passwordCh" id="passwordCh" autocomplete="off" onchange="isSame()" required/>
            <label for="passwordCh">비밀번호 확인</label>
            <span id="same"></span>
        </div>
        <div class="int-area">
            <input type="text" name="name" id="name" autocomplete="off" required/>
            <label for="name">닉네임</label>
            <span id="nameCk"></span>
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
        <a href="/member/searchPw">비밀번호 찾기</a><b style="color: #696969;">&nbsp;｜</b>
        <a href="/member/login" style="text-decoration: none;">로그인</a>
    </div>
</section>

<script>
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

    $('#name').blur(function () {
        if ($('#name').val() != '') {
            $.ajax({
                url     : '/member/nameCheck',
                type    : 'post',
                data    : 'name=' + $('#name').val(),
                dataType: 'json',
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

    function isSame() {
        var pw = $('#password').val();
        var confirmPw = $('#passwordCh').val();
        if (pw != '' && confirmPw != '') {
            if (pw == confirmPw) {
                document.getElementById('same').innerHTML = '비밀번호가 일치합니다';
                document.getElementById('same').style.color = 'blue';
            } else {
                document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다';
                document.getElementById('same').style.color = 'red';
            }
        }
    }
</script>

</body>
</html>