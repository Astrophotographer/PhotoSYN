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

    <form action="/member/mypage/deletePro" method="POST" name="deleteForm">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="int-area">
            <input type="password" name="pw" id="password" autocomplete="off" required/>
            <label for="password">비밀번호</label>
        </div>
        <div class="int-area">
            <input type="password" name="passwordCh" id="passwordCh" autocomplete="off" onchange="isSame()" required/>
            <label for="passwordCh">비밀번호 확인</label>
            <span id="same"></span>
        </div>
        <div class="btn-area">
            <button type="button" id="btn">탈퇴하기</button>
        </div>
    </form>
</section>

<script>
    $("#btn").click(function () {
        var pw = $('#password').val();
        var confirmPw = $('#passwordCh').val();
        if (pw != '' && confirmPw != '') {
            if (pw == confirmPw) {
                deleteForm.submit();
                alert('탈퇴 처리되었습니다.')
            } else {
                alert('비밀번호가 일치하지 않습니다.')
            }
        }
    });
</script>

</body>
</html>
