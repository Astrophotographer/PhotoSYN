<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>home</title>
    <meta charset="UTF-8">
    <meta name="description" content="Boto Photo Studio HTML Template">
    <meta name="keywords" content="photo, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 스프링 시큐리티 -->
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <!-- Stylesheets -->
    <link rel="stylesheet" href="/resources/member/bootstrap/main/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/member/bootstrap/main/css/font-awesome.min.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/member/bootstrap/main/css/slicknav.min.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/member/bootstrap/main/css/fresco.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/member/bootstrap/main/css/slick.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/member/bootstrap/main/css/style.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/member/css/menu.css" type="text/css"/>
</head>
<body>
<header class="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-4 col-md-3 order-2 order-sm-1">
                <div class="header__social">
                </div>
            </div>
            <div class="col-sm-4 col-md-6 order-1  order-md-2 text-center">
                <a href="/member/main" class="site-logo">
                    <img src="/resources/member/bootstrap/main/img/logo_sub-removebg-preview.png" alt="logo"
                         style="display : block; margin : auto;">
                </a>
            </div>
            <sec:authorize access="isAnonymous()">
            <div class="col-sm-4 col-md-3 order-3 order-sm-3">
                <div class="header__switches">
                    <a href="#" class="search-switch"><i class="fa fa-search"></i></a>
                    <a href="/member/login">로그인</a>
                    <a href="/member/signup">회원가입</a>
                </div>
            </div>
        </div>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <div class="col-sm-4 col-md-3 order-3 order-sm-3">
                <div class="header__switches">
                    <form action="/logout" method="POST">
                        <a href="#" class="search-switch"><i class="fa fa-search"></i></a>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button type="submit" style="border: 0; outline: 0; background-color:transparent;">로그아웃</button>
                    </form>
                </div>
            </div>
        </sec:authorize>
    </div>
    <sec:authorize access="isAnonymous()">
        <nav class="main__menu">
            <ul class="nav__menu">
                <li><a href="/member/main">Home</a></li> <!-- class="menu--active" -->
                <li><a href="#">Gallery</a></li>
                <li><a href="/blog/main">Blog</a></li>
            </ul>
        </nav>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <nav class="main__menu">
            <ul class="nav__menu">
                <li><a href="/member/main">Home</a></li> <!-- class="menu--active" -->
                <li><a href="#">Gallery</a></li>
                <li><a href="/blog/main">Blog</a></li>
                <li><a href="/member/mypage/profile">Mypage</a>
                    <ul class="sub__menu">
                        <li><a href="/member/mypage/profile">내정보</a></li>
                        <li><a href="#">장바구니</a></li>
                        <li><a href="#">구매 · 판매내역</a></li>
                        <li><a href="#">환급신청</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </sec:authorize>
</header>

<!-- Search Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="검색어를 입력해 주세요.">
        </form>
    </div>
</div>

