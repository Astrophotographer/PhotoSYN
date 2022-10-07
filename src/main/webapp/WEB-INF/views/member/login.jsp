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
    <h2 style="color: white"><c:out value="${error}"/></h2>
    <h2 style="color: white"><c:out value="${logout}"/></h2>

    <form action="/login" method="POST">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="int-area">
            <input type="text" name="username" id="id" required/>
            <label for="id">아이디</label>
        </div>
        <div class="int-area">
            <input type="password" name="password" id="pw" autocomplete="off" required/>
            <label for="pw">비밀번호</label>
        </div>
        <br/>
        <div style="color: white;">
            <input type="checkbox" name="remember-me" id="remember-me"/>
            <label for="remember-me">로그인 상태 유지</label>
        </div>
        <div class="btn-area">
            <button id="btn" type="submit">로그인</button>
        </div>
    </form>
    <div class="caption">
        <a href="/member/searchPw" style="text-decoration: none;">비밀번호 찾기</a><b style="color: #696969;">&nbsp;｜</b>
        <a href="/member/signup" style="text-decoration: none;">회원가입</a>
    </div>
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