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

    <form action="/member/mypage/updatePwPro" method="POST">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="int-area">
            <input type="password" name="pw1" id="pw1" autocomplete="off" required/>
            <label for="pw1">현재 비밀번호</label>
        </div>
        <div class="int-area">
            <input type="password" name="pw2" id="pw2" autocomplete="off" onchange="isSame()" required/>
            <label for="pw2">새 비밀번호</label>
        </div>
        <div class="int-area">
            <input type="password" name="pw3" id="pw3" autocomplete="off" onchange="isSame()" required/>
            <label for="pw3">새 비밀번호 확인</label>
        </div>
        <span id="same"></span>
        <div class="btn-area">
            <button id="btn" type="submit">비밀번호 변경</button>
        </div>
    </form>
    <div class="caption">
        <a href="/member/searchPw" style="text-decoration: none;">비밀번호 찾기</a>
    </div>
</section>

<script>
    function isSame() {
        var pw = $('#pw2').val();
        var confirmPw = $('#pw3').val();
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

    var msg2 = '${msg2}';
    var msg3 = '${msg3}';

    if (msg2 === "새 비밀번호가 일치하지 않습니다.") {
        alert("새 비밀번호가 일치하지 않습니다.");
    }
    if (msg3 === "현재 비밀번호가 일치하지 않습니다.") {
        alert("현재 비밀번호가 일치하지 않습니다.");
    }
</script>

</body>
</html>
