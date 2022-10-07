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
            <input type="password" name="pw" id="pw1" autocomplete="off" required/>
            <label for="pw1">비밀번호</label>
        </div>
        <div class="int-area">
            <input type="password" name="pwch" id="pw2" autocomplete="off" required/>
            <label for="pw2">비밀번호 확인</label>
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
    /*
    function pw() {
        var p1 = document.getElementById('pw1').value;
        var p2 = document.getElementById('pw2').value;
        if (p1 != p2) {
            alert("비밀번호가 일치 하지 않습니다");
            return false;
        } else {
            alert("비밀번호가 일치합니다");
            return true;
        }
    }
    */
</script>

</body>
</html>