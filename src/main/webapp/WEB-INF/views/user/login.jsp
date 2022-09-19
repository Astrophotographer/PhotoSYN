<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="/resources/css/signForm.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="login-box">
    <h2>로그인</h2>
    <form>
        <div class="user-box">
            <input type="text" name="" required="">
            <label>아이디</label>
        </div>
        <div class="user-box">
            <input type="password" name="" required="">
            <label>비밀번호</label>
        </div>
        <a href="#">
            <span></span> <span></span> <span></span> <span></span> 로그인
        </a>
    </form>
</div>

<%--<div>--%>
<%--    <a class="p-2"--%>
<%--       href="https://kauth.kakao.com/oauth/authorize?client_id=5637a372d543a79ac7d28ed36d58fe2f&redirect_uri=http://localhost:8080/user/kakaoLogin&response_type=code">--%>
<%--        <img src="/resources/icon/kakao_login_medium_wide.png" style="height: 60px; width: 350px;">--%>
<%--    </a>--%>
<%--</div>--%>
</body>
</html>