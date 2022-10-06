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
            <input type="password" name="pw2" id="pw2" autocomplete="off" required/>
            <label for="pw2">변경 비밀번호</label>
        </div>
        <div class="int-area">
            <input type="password" name="pw3" id="pw3" autocomplete="off" required/>
            <label for="pw3">변경 비밀번호 확인</label>
        </div>
        <div class="btn-area">
            <button id="btn" type="submit">변경하기</button>
        </div>
    </form>
</section>

<script>
    let id = $('id');
    let pw = $('pw');
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
        }
    });
</script>

</body>
</html>
