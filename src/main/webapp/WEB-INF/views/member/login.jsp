<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    <script src="/resources/css/jquery-3.6.1.min.js"></script>
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
        <a href="/member/searchPw" style="text-decoration: none; color: white">비밀번호 찾기</a>&nbsp;｜
        <a href="/member/signup" style="text-decoration: none; color: white">회원가입</a>
    </div>
    <!--
    <a href="https://kauth.kakao.com/oauth/authorize?client_id=c67a03f0334b4eff20b7eb96995f64dd&redirect_uri=http://localhost:8080/member/kakao_callback&response_type=code">
        <img src="https://i0.wp.com/forhappywomen.com/wp-content/uploads/2018/11/산부인과-포해피우먼-문의-카카오플러스친구-버튼.png?fit=586%2C586&ssl=1"
             alt="" width="50" height="50">
    </a>
    --> <!-- 카카오 로그인 -->
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