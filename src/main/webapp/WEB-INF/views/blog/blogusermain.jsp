<%--
  Created by IntelliJ IDEA.
  User: pmwkd
  Date: 2022-09-30
  Time: 오전 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <!-- ** Plugins Needed for the Project ** -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="../resources/blog/blogUserMain/plugins/bootstrap/bootstrap.min.css">

    <!-- slick slider -->
    <link rel="stylesheet" href="../resources/blog/blogUserMain/plugins/slick/slick.css">
    <!-- themefy-icon -->
    <link rel="stylesheet" href="../resources/blog/blogUserMain/plugins/themify-icons/themify-icons.css">

    <!-- Main Stylesheet -->
    <link href="../resources/blog/blogUserMain/css/style.css" rel="stylesheet">

    <!--Favicon-->
    <link rel="shortcut icon" href="../resources/blog/blogUserMain/images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="../resources/blog/blogUserMain/images/favicon.ico" type="image/x-icon">
    <title>Blog User Main</title>

    <link rel="stylesheet" href="../resources/blog/plugins/themify/css/themify-icons.css">
    <link rel="stylesheet" href="../resources/blog/plugins/slick-carousel/slick-theme.css">
    <link rel="stylesheet" href="../resources/blog/plugins/slick-carousel/slick.css">
    <link rel="stylesheet" href="../resources/blog/plugins/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="../resources/blog/plugins/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="../resources/blog/plugins/magnific-popup/magnific-popup.css">
<%--    <link rel="stylesheet" href="../resources/blog/plugins/bootstrap/css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" href="../resources/blog/css/style.css">--%>

</head>
<body>

<jsp:include page="/WEB-INF/views/includes/header.jsp"/>

<!-- preloader -->
<section>
    <div class="container-fluid p-sm-0">
        <!-- 임시로 5개만 노출 -->

        <div class="row featured-post-slider">
            <c:forEach var="i" begin="1" end="5" step="1">>
            <div class="col-lg-3 col-sm-6 mb-2 mb-lg-0 px-1" >
                <article class="card bg-dark text-center text-white border-0 rounded-0">
                    <img class="card-img rounded-0 img-fluid w-100" src="../resources/blog/blogUserMain/images/featured-post/post-${i}.jpg"
                         alt="post-thumb">
                    <div class="card-img-overlay">
                        <div class="card-content">
                            <p class="text-uppercase">LifeStyle</p>
                            <h4 class="card-title mb-4"><a class="text-white" href="blog-single.html">Organize Your Life
                                With 10 Simple rule</a></h4>
                            <a class="btn btn-outline-light" href="blog-single.html">read more</a>
                        </div>
                    </div>
                </article>
            </div>
            </c:forEach>
        </div>
    </div>
</section>

<!-- 자기소개 + sns링크 -->
<!-- 우측 사이드바 개념. 유저 정보 -->
<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
    <%--<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12" style="position: fixed ; top:1em; right: 0">
    CSS 하나두 모루게따...
    --%>
    <div class="sidebar sidebar-right">
        <div class="sidebar-wrap mt-5 mt-lg-0">
            <div class="sidebar-widget about mb-5 text-center p-3">
                <div class="about-author">
                    <img src="../resources/blog/images/author.jpg" alt="" class="img-fluid">
                </div>
                <h4 class="mb-0 mt-4">Liam Mason(블로그 유저 이름)</h4>
                <p>Travel Blogger(맴버쉽등급)</p>
                <p>I'm Liam, last year I decided to quit my job and travel the world. You can follow my journey on this blog!(한줄 자기소개?)</p>
                <img src="../resources/blog/images/liammason.png" alt="" class="img-fluid">
            </div>

            <div class="sidebar-widget follow mb-5 text-center">
                <h4 class="text-center widget-title">Follow Me</h4>
                <div class="follow-socials">
                    <a href="#"><i class="ti-facebook"></i></a>
                    <a href="#" ><i class="ti-twitter"></i></a>
                    <a href="#" ><i class="ti-instagram"></i></a>
                    <a href="#"><i class="ti-youtube"></i></a>
                    <a href="#"><i class="ti-pinterest"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- featured post -->
<!-- 유저 블로그 글중에서 상단 노출 되는 글 (조회순, 최신순 등)-->
<div class="preloader">
    <div class="loader">
        <span class="dot"></span>
        <div class="dots">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
</div>
<!-- /featured post -->

<!-- blog post -->
<section class="section">
    <div class="container">
        <div class="row masonry-container">
            <c:forEach var="i" begin="1" end="13" step="1">
                <div class="col-lg-4 col-sm-6 mb-5">
                    <article class="text-center">
                        <img class="img-fluid mb-4"
                             src="../resources/blog/blogUserMain/images/masonary-post/post-${i}.jpg" alt="post-thumb">
                        <p class="text-uppercase mb-2">TRAVEL(메인 카테고리)</p>
                        <h4 class="title-border"><a class="text-dark" href="blog-single.html">Charming Evening
                            Field(블로그글 제목)</a></h4>
                        <p>Lorem ipsum dolor sit amet,(블로그 글 내용은 어떻게 들어가지.. 사진이 들어가는데...)</p>
                        <a href="blog-single.html" class="btn btn-transparent">read more</a>
                    </article>
                </div>
            </c:forEach>
        </div>

        <!-- 페이징 처리 -->
        <div class="row">
            <div class="col-12">
                <nav>
                    <ul class="pagination justify-content-center align-items-center">
                        <li class="page-item">
                            <span class="page-link">&laquo; Previous</span>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">01</a></li>
                        <li class="page-item active">
                            <span class="page-link">02</span>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">03</a></li>
                        <li class="page-item"><a class="page-link" href="#">04</a></li>
                        <li class="page-item"><a class="page-link" href="#">05</a></li>
                        <li class="page-item"><a class="page-link" href="#">06</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next &raquo;</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</section>
<!-- /blog post -->

<!-- 자기소개 + sns링크 -->
<!-- 우측 사이드바 개념. 유저 정보 -->
<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
<%--<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12" style="position: fixed ; top:1em; right: 0">
CSS 하나두 모루게따...
--%>
    <div class="sidebar sidebar-right">
        <div class="sidebar-wrap mt-5 mt-lg-0">
            <div class="sidebar-widget about mb-5 text-center p-3">
                <div class="about-author">
                    <img src="../resources/blog/images/author.jpg" alt="" class="img-fluid">
                </div>
                <h4 class="mb-0 mt-4">Liam Mason(블로그 유저 이름)</h4>
                <p>Travel Blogger(맴버쉽등급)</p>
                <p>I'm Liam, last year I decided to quit my job and travel the world. You can follow my journey on this blog!(한줄 자기소개?)</p>
                <img src="../resources/blog/images/liammason.png" alt="" class="img-fluid">
            </div>

            <div class="sidebar-widget follow mb-5 text-center">
                <h4 class="text-center widget-title">Follow Me</h4>
                <div class="follow-socials">
                    <a href="#"><i class="ti-facebook"></i></a>
                    <a href="#" ><i class="ti-twitter"></i></a>
                    <a href="#" ><i class="ti-instagram"></i></a>
                    <a href="#"><i class="ti-youtube"></i></a>
                    <a href="#"><i class="ti-pinterest"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- jQuery -->
<script src="../resources/blog/blogUserMain/plugins/jQuery/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script src="../resources/blog/blogUserMain/plugins/bootstrap/bootstrap.min.js"></script>
<!-- slick slider -->
<script src="../resources/blog/blogUserMain/plugins/slick/slick.min.js"></script>
<!-- masonry -->
<script src="../resources/blog/blogUserMain/plugins/masonry/masonry.js"></script>
<!-- instafeed -->
<script src="../resources/blog/blogUserMain/plugins/instafeed/instafeed.min.js"></script>
<!-- smooth scroll -->
<script src="../resources/blog/blogUserMain/plugins/smooth-scroll/smooth-scroll.js"></script>
<!-- headroom -->
<script src="../resources/blog/blogUserMain/plugins/headroom/headroom.js"></script>
<!-- reading time -->
<script src="../resources/blog/blogUserMain/plugins/reading-time/readingTime.min.js"></script>

<!-- Main Script -->
<script src="../resources/blog/blogUserMain/js/script.js"></script>


<%--footer--%>
<jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
<%--</body>--%>
<%--</html>--%>
