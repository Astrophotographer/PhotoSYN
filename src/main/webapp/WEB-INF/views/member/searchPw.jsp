<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <form name="form" action="/member/searchPwPro" method="POST">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="int-area">
            <input type="text" name="id" id="id" autocomplete="off" required/>
            <label for="id">아이디</label>
        </div>
        <div class="int-area">
            <input type="text" name="name" id="name" autocomplete="off" required/>
            <label for="name">닉네임</label>
        </div>
        <div class="btn-area">
            <button id="btn" type="button" onclick="checkAll()">비밀번호 찾기</button>
        </div>
    </form>
    <div class="caption">
        <a href="/member/signup" style="text-decoration: none; color: white">회원가입</a>
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

    function checkAll() {
        var cId = document.getElementById("id");
        var cName = document.getElementById("name");

        if (cId.value == "") {
            alert("아이디를 입력하세요.");
            cId.focus();
            return false;
        }
        if (cName.value == "") {
            alert("닉네임을 입력하세요.");
            cName.focus();
            return false;
        }

        document.form.submit();
    }
</script>
</body>
</html>