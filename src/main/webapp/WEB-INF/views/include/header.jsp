<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>home</title>
    <meta charset="UTF-8">
    <meta name="description" content="Boto Photo Studio HTML Template">
    <meta name="keywords" content="photo, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Stylesheets -->
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/bootstrap/css/font-awesome.min.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/bootstrap/css/slicknav.min.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/bootstrap/css/fresco.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/bootstrap/css/slick.css" type="text/css"/>
    <link rel="stylesheet" href="/resources/bootstrap/css/style.css" type="text/css"/>

    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</head>
<header class="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-4 col-md-3 order-2 order-sm-1">
                <div class="header__social">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-instagram"></i></a>
                </div>
            </div>
            <div class="col-sm-4 col-md-6 order-1  order-md-2 text-center">
                <a href="/member/main" class="site-logo">
                    <img src="/resources/bootstrap/img/logo_sub.png" alt="logo">
                </a>
            </div>
            <div class="col-sm-4 col-md-3 order-3 order-sm-3">
                <div class="header__switches">
                    <a href="#" class="search-switch"><i class="fa fa-search"></i></a>
                    <a href="#" class="nav-switch"><i class="fa fa-bars"></i></a>
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                    <a href="#">마이페이지</a>
                    <a href="/member/login">로그인</a>
                    <a href="#">회원가입</a>
                </div>
            </div>
        </div>
        <nav class="main__menu">
            <ul class="nav__menu">
                <li><a href="#" class="menu--active">Home</a></li>
                <li><a href="#">Gallery</a></li>
                <li><a href="#">Blog</a></li>
            </ul>
        </nav>
    </div>
</header>
<body>
<!-- Search Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="검색어를 입력해 주세요.">
        </form>
    </div>
</div>

<!--====== Javascripts & Jquery ======-->
<script src="/resources/bootstrap/js/vendor/jquery-3.2.1.min.js"></script>
<script src="/resources/bootstrap/js/fresco.min.js"></script>
<script src="/resources/bootstrap/js/jquery.slicknav.min.js"></script>
<script src="/resources/bootstrap/js/main.js"></script>
<script src="/resources/bootstrap/js/slick.min.js"></script>


