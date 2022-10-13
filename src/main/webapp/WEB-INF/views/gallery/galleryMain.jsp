
<!doctype html>
<html lang="zxx" class="dark">


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel = "stylesheet" href="${path}/resources/style.css" />
<link rel="stylesheet" href="/resources/gallery/shopy/assets/css/theme.css"/>
<script src="../resources/gallery/shopy/assets/js/jquery-3.5.1.min.js"></script>
<script src="../resources/gallery/shopy/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../resources/gallery/shopy/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="../resources/gallery/shopy/assets/vendor/isotope/isotope.pkgd.min.js"></script>
<script src="../resources/gallery/shopy/assets/vendor/magnific/jquery.magnific-popup.min.js"></script>
<script src="../resources/gallery/shopy/assets/vendor/mail/js/form.min.js"></script>
<script src="../resources/gallery/shopy/assets/vendor/mail/js/script.js"></script>
<script src="../resources/gallery/shopy/assets/js/theme-jquery.js"></script>
<script src="../resources/gallery/shopy/assets/js/theme.js"></script>

<head>
</head>
<jsp:include page="/WEB-INF/views/includes/header.jsp"/>
<body>


<div class="wrapper">
    <!-- Header Height -->
    <div class="header-height-bar"></div>
    <!--  -->
    <!-- Header -->

    <!-- End Header -->
    <!-- Main -->
    <main>
        <!-- 테마 Home Section -->
        <div class="swiper swiper-container" data-swiper-options='{
                  "slidesPerView": 1,
                  "spaceBetween": 0,
                  "pagination": {
                    "el": ".swiper-pagination",
                    "clickable": true
                  },
                  "navigation": {
                    "nextEl": ".swiper-next-01",
                    "prevEl": ".swiper-prev-01"
                  },
                  "autoplay": {
                    "delay": 5000,
                    "disableOnInteraction": false
                  }
                }'>
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="bg-cover bg-no-repeat bg-center"
                         style="background-image: url(../resources/gallery/shopy/assets/img/home-banner-01.jpg);">
                        <div class="container">
                            <div class="row min-vh-65 py-12 align-items-center">
                                <%--                                <div class="col-md-6 col-lg-5 col-xxl-4 text-center text-md-start">--%>
                                <%--                                    <div class="bg-white p-4 p-lg-5">--%>
                                <%--                                        <h1 class="fw-300 display-3 mb-2">Light up<br /> the room</h1>--%>
                                <%--                                        <p class="fs-lg">Discover our lighting ideas.</p>--%>
                                <%--                                        <div class="pt-2">--%>
                                <%--                                            <a class="btn btn-dark" href="#">Shop Now</a>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="bg-cover bg-no-repeat bg-center"
                         style="background-image: url(../resources/gallery/shopy/assets/img/home-banner-02.jpg);">
                        <div class="container">
                            <div class="row min-vh-65 py-12 align-items-center">
                                <div class="col-md-6 col-lg-5 col-xxl-4 text-center text-md-start">
                                    <div class="bg-white p-4 p-lg-5">
                                        <h1 class="fw-300 display-3 mb-2">Light up<br/> the room</h1>
                                        <p class="fs-lg">Discover our lighting ideas.</p>
                                        <div class="pt-2">
                                            <a class="btn btn-dark" href="#">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-arrow-style-01 swiper-next swiper-next-01"><i class="bi bi-chevron-right"></i></div>
            <div class="swiper-arrow-style-01 swiper-prev swiper-prev-01"><i class="bi bi-chevron-left"></i></div>
            <div class="swiper-pagination"></div>
        </div>
        <!-- End Home Section -->

        <!-- 2 번째 섹션  5개 있는곳 section -->
        <div class="py-3">
            <div class="container">
                <div class="row g-3">
                    <div class="col-md-6">
                        <div class="position-relative hover-scale hover-opacity">
                            <div class="hover-scale-in">
                                <img class="w-100" src="../resources/gallery/shopy/assets/img/shop-banner-3.jpg"
                                     title="" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row g-3">
                            <div class="col-6">
                                <div class="position-relative hover-scale hover-opacity">
                                    <div class="hover-scale-in">
                                        <img class="w-100" src="../resources/gallery/shopy/assets/img/shop-banner-2.jpg"
                                             title="" alt="">
                                    </div>
                                    <div class="position-absolute top-0 bottom-0 end-0 start-0 d-flex align-items-center justify-content-center hover-opacity-in">


                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="position-relative hover-scale hover-opacity">
                                    <div class="hover-scale-in">
                                        <img class="w-100" src="../resources/gallery/shopy/assets/img/shop-banner-1.jpg"
                                             title="" alt="">
                                    </div>
                                    <div class="position-absolute top-0 bottom-0 end-0 start-0 d-flex align-items-center justify-content-center hover-opacity-in">


                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="position-relative hover-scale hover-opacity">
                                    <div class="hover-scale-in">
                                        <img class="w-100" src="../resources/gallery/shopy/assets/img/shop-banner-4.jpg"
                                             title="" alt="">
                                    </div>
                                    <div class="position-absolute top-0 bottom-0 end-0 start-0 d-flex align-items-center justify-content-center hover-opacity-in">

                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="position-relative hover-scale hover-opacity">
                                    <div class="hover-scale-in">
                                        <img class="w-100" src="../resources/gallery/shopy/assets/img/shop-banner-5.jpg"
                                             title="" alt="">
                                    </div>
                                    <div class="position-absolute top-0 bottom-0 end-0 start-0 d-flex align-items-center justify-content-center hover-opacity-in">


                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End section -->


        <!-- section -->
        <section class="section">
            <div class="container">
                <div class="row justify-content-center section-heading">
                    <div class="col-lg-6 text-center">
                        <h3 class="fw-500 h2 m-0">Browse our Bestsellers</h3>
                    </div>
                </div>


                <div class="upload-active">
                   <button type="button" onclick="location.href='/gallery/uploadForm'">글작성</button>
                </div>

                <div class="swiper-hover-arrow position-relative">
                    <div class="swiper swiper-container swiper-initialized swiper-horizontal swiper-pointer-events"
                         data-swiper-options="{
                              &quot;slidesPerView&quot;: 2,
                              &quot;spaceBetween&quot;: 24,
                              &quot;loop&quot;: true,
                              &quot;pagination&quot;: {
                                &quot;el&quot;: &quot;.swiper-pagination&quot;,
                                &quot;clickable&quot;: true
                                },
                              &quot;navigation&quot;: {
                                &quot;nextEl&quot;: &quot;.swiper-next-02&quot;,
                                &quot;prevEl&quot;: &quot;.swiper-prev-02&quot;
                              },
                              &quot;autoplay&quot;: {
                                &quot;delay&quot;: 3500,
                                &quot;disableOnInteraction&quot;: false
                              },
                              &quot;breakpoints&quot;: {
                                &quot;600&quot;: {
                                  &quot;slidesPerView&quot;: 3
                                },
                                &quot;991&quot;: {
                                  &quot;slidesPerView&quot;: 3
                                },
                                &quot;1200&quot;: {
                                  &quot;slidesPerView&quot;: 4
                                }
                              }
                        }">


                        <%--사진 뿌려주기 --%>
                        1번
                        <div class="swiper-wrapper" id="swiper-wrapper-68b80b9203f3bf19" aria-live="off"
                             style="transition-duration: 0ms; transform: translate3d(-1446.67px, 0px, 0px);">
                            <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" role="group"
                                 aria-label="3 / 5" style="width: 265.333px; margin-right: 24px;"
                                 data-swiper-slide-index="2">
                                <div class="product-card-01 my-1">
                                    <div class="product-media">
                                        <div class="product-media-hover">
                                            <a href="#">
                                                <img src="/resources/gallery/dev/assets/img/product-4.jpg" title=""
                                                     alt="">
                                                <img class="hover-image"
                                                     src="/resources/gallery/dev/assets/img/product-4-hover.jpg"
                                                     title="" alt="">
                                            </a>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="p-btn">
                                                <i class="fi-heart"></i>
                                            </a>
                                            <a href="#" class="p-btn">
                                                <i class="fi-repeat"></i>
                                            </a>
                                            <a data-bs-toggle="modal" data-bs-target="#px-quick-view"
                                               href="javascript:void(0)" class="p-btn">
                                                <i class="fi-eye"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="product-card-info">


                                        <div class="product-cart-btn">
                                            <a class="btn btn-outline-dark">
                                                Add to Cart
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            2번
                            <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" role="group"
                                 aria-label="4 / 5" style="width: 265.333px; margin-right: 24px;"
                                 data-swiper-slide-index="3">
                                <div class="product-card-01 my-1">
                                    <div class="product-media">
                                        <div class="product-media-hover">
                                            <a href="#">
                                                <img src="/resources/gallery/dev/assets/img/product-4.jpg" title=""
                                                     alt="">
                                                <img class="hover-image"
                                                     src="/resources/gallery/dev/assets/img/product-4-hover.jpg"
                                                     title="" alt="">
                                            </a>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="p-btn">
                                                <i class="fi-heart"></i>
                                            </a>
                                            <a href="#" class="p-btn">
                                                <i class="fi-repeat"></i>
                                            </a>
                                            <a data-bs-toggle="modal" data-bs-target="#px-quick-view"
                                               href="javascript:void(0)" class="p-btn">
                                                <i class="fi-eye"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="product-card-info">
                                        <div class="rating-star text">
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star"></i>
                                        </div>
                                        <h6 class="product-title">
                                            <a href="#">Name Test2</a>
                                        </h6>
                                        <div class="product-price">
                                            <span class="text-primary">$28.<small>50</small></span>
                                            <del class="fs-sm text-muted">$38.<small>50</small></del>
                                        </div>
                                        <div class="product-cart-btn">
                                            <a class="btn btn-outline-dark">
                                                Add to Cart
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            3번
                            <div class="swiper-slide swiper-slide-duplicate" role="group" aria-label="5 / 5"
                                 style="width: 265.333px; margin-right: 24px;" data-swiper-slide-index="4">
                                <div class="product-card-01 my-1">
                                    <div class="product-media">
                                        <div class="product-lable">
                                            <span class="bg-danger text-white">Hot</span>
                                        </div>
                                        <div class="product-media-hover">
                                            <a href="#">
                                                <img src="/resources/gallery/dev/assets/img/product-5.jpg" title=""
                                                     alt="">
                                                <img class="hover-image"
                                                     src="/resources/gallery/dev/assets/img/product-5-hover.jpg"
                                                     title="" alt="">
                                            </a>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="p-btn">
                                                <i class="fi-heart"></i>
                                            </a>
                                            <a href="#" class="p-btn">
                                                <i class="fi-repeat"></i>
                                            </a>
                                            <a data-bs-toggle="modal" data-bs-target="#px-quick-view"
                                               href="javascript:void(0)" class="p-btn">
                                                <i class="fi-eye"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="product-card-info">
                                        <div class="rating-star text">
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star"></i>
                                        </div>
                                        <h6 class="product-title">
                                            <a href="#">Name Test3</a>
                                        </h6>
                                        <div class="product-price">
                                            <span class="text-primary">$28.<small>50</small></span>
                                            <del class="fs-sm text-muted">$38.<small>50</small></del>
                                        </div>
                                        <div class="product-cart-btn">
                                            <a class="btn btn-outline-dark">
                                                Add to Cart
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            4번
                            <div class="swiper-slide" role="group" aria-label="1 / 5"
                                 style="width: 265.333px; margin-right: 24px;" data-swiper-slide-index="0">
                                <div class="product-card-01 my-1">
                                    <div class="product-media">
                                        <div class="product-lable">
                                            <span class="bg-danger text-white">Hot</span>
                                        </div>
                                        <div class="product-media-hover">
                                            <a href="#">
                                                <img src="/resources/gallery/dev/assets/img/product-1.jpg" title=""
                                                     alt="">
                                                <img class="hover-image"
                                                     src="/resources/gallery/dev/assets/img/product-1-hover.jpg"
                                                     title="" alt="">
                                            </a>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="p-btn">
                                                <i class="fi-heart"></i>
                                            </a>
                                            <a href="#" class="p-btn">
                                                <i class="fi-repeat"></i>
                                            </a>
                                            <a data-bs-toggle="modal" data-bs-target="#px-quick-view"
                                               href="javascript:void(0)" class="p-btn">
                                                <i class="fi-eye"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="product-card-info">
                                        <div class="rating-star text">
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star"></i>
                                        </div>
                                        <h6 class="product-title">
                                            <a href="#">Name Test4</a>
                                        </h6>
                                        <div class="product-price">
                                            <span class="text-primary">$28.<small>50</small></span>
                                            <del class="fs-sm text-muted">$38.<small>50</small></del>
                                        </div>
                                        <div class="product-cart-btn">
                                            <a class="btn btn-outline-dark">
                                                Add to Cart
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Product Card -->
                            <div class="swiper-slide swiper-slide-active" role="group" aria-label="3 / 5"
                                 style="width: 265.333px; margin-right: 24px;" data-swiper-slide-index="2">
                                <div class="product-card-01 my-1">
                                    <div class="product-media">
                                        <div class="product-media-hover">
                                            <a href="#">
                                                <img src="../assets/img/product-3.jpg" title="" alt="">
                                                <img class="hover-image" src="../assets/img/product-3-hover.jpg"
                                                     title="" alt="">
                                            </a>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="p-btn">
                                                <i class="fi-heart"></i>
                                            </a>
                                            <a href="#" class="p-btn">
                                                <i class="fi-repeat"></i>
                                            </a>
                                            <a data-bs-toggle="modal" data-bs-target="#px-quick-view"
                                               href="javascript:void(0)" class="p-btn">
                                                <i class="fi-eye"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="product-card-info">
                                        <div class="rating-star text">
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star"></i>
                                        </div>
                                        <h6 class="product-title">
                                            <a href="#">Name Test6</a>
                                        </h6>
                                        <div class="product-price">
                                            <span class="text-primary">$28.<small>50</small></span>
                                            <del class="fs-sm text-muted">$38.<small>50</small></del>
                                        </div>
                                        <div class="product-cart-btn">
                                            <a class="btn btn-outline-dark">
                                                Add to Cart
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Product Card -->
                            <div class="swiper-slide swiper-slide-next" role="group" aria-label="4 / 5"
                                 style="width: 265.333px; margin-right: 24px;" data-swiper-slide-index="3">
                                <div class="product-card-01 my-1">
                                    <div class="product-media">
                                        <div class="product-media-hover">
                                            <a href="#">
                                                <img src="/resources/gallery/dev/assets/img/product-4.jpg" title=""
                                                     alt="">
                                                <img class="hover-image"
                                                     src="/resources/gallery/dev/assets/img/product-4-hover.jpg"
                                                     title="" alt="">
                                            </a>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="p-btn">
                                                <i class="fi-heart"></i>
                                            </a>
                                            <a href="#" class="p-btn">
                                                <i class="fi-repeat"></i>
                                            </a>
                                            <a data-bs-toggle="modal" data-bs-target="#px-quick-view"
                                               href="javascript:void(0)" class="p-btn">
                                                <i class="fi-eye"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="product-card-info">
                                        <div class="rating-star text">
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star"></i>
                                        </div>
                                        <h6 class="product-title">
                                            <a href="#">Name Test7</a>
                                        </h6>
                                        <div class="product-price">
                                            <span class="text-primary">$28.<small>50</small></span>
                                            <del class="fs-sm text-muted">$38.<small>50</small></del>
                                        </div>
                                        <div class="product-cart-btn">
                                            <a class="btn btn-outline-dark">
                                                Add to Cart
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Product Card -->
                            <div class="swiper-slide" role="group" aria-label="5 / 5"
                                 style="width: 265.333px; margin-right: 24px;" data-swiper-slide-index="4">
                                <div class="product-card-01 my-1">
                                    <div class="product-media">
                                        <div class="product-lable">
                                            <span class="bg-danger text-white">Hot</span>
                                        </div>
                                        <div class="product-media-hover">
                                            <a href="#">
                                                <img src="/resources/gallery/dev/assets/img/product-5.jpg" title=""
                                                     alt="">
                                                <img class="hover-image"
                                                     src="/resources/gallery/dev/assets/img/product-5-hover.jpg"
                                                     title="" alt="">
                                            </a>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="p-btn">
                                                <i class="fi-heart"></i>
                                            </a>
                                            <a href="#" class="p-btn">
                                                <i class="fi-repeat"></i>
                                            </a>
                                            <a data-bs-toggle="modal" data-bs-target="#px-quick-view"
                                               href="javascript:void(0)" class="p-btn">
                                                <i class="fi-eye"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="product-card-info">
                                        <div class="rating-star text">
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star"></i>
                                        </div>
                                        <h6 class="product-title">
                                            <a href="#">Name Test8</a>
                                        </h6>
                                        <div class="product-price">
                                            <span class="text-primary">$28.<small>50</small></span>
                                            <del class="fs-sm text-muted">$38.<small>50</small></del>
                                        </div>
                                        <div class="product-cart-btn">
                                            <a class="btn btn-outline-dark">
                                                Add to Cart
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide swiper-slide-duplicate" role="group" aria-label="1 / 5"
                                 style="width: 265.333px; margin-right: 24px;" data-swiper-slide-index="0">
                                <div class="product-card-01 my-1">
                                    <div class="product-media">
                                        <div class="product-lable">
                                            <span class="bg-danger text-white">Hot</span>
                                        </div>
                                        <div class="product-media-hover">
                                            <a href="#">
                                                <img src="/resources/gallery/dev/assets/img/product-1.jpg" title=""
                                                     alt="">
                                                <img class="hover-image"
                                                     src="/resources/gallery/dev/assets/img/product-1-hover.jpg"
                                                     title="" alt="">
                                            </a>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="p-btn">
                                                <i class="fi-heart"></i>
                                            </a>
                                            <a href="#" class="p-btn">
                                                <i class="fi-repeat"></i>
                                            </a>
                                            <a data-bs-toggle="modal" data-bs-target="#px-quick-view"
                                               href="javascript:void(0)" class="p-btn">
                                                <i class="fi-eye"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="product-card-info">
                                        <div class="rating-star text">
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star"></i>
                                        </div>
                                        <h6 class="product-title">
                                            <a href="#">Name Test9</a>
                                        </h6>
                                        <div class="product-price">
                                            <span class="text-primary">$28.<small>50</small></span>
                                            <del class="fs-sm text-muted">$38.<small>50</small></del>
                                        </div>
                                        <div class="product-cart-btn">
                                            <a class="btn btn-outline-dark">
                                                Add to Cart
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev" role="group"
                                 aria-label="2 / 5" style="width: 265.333px; margin-right: 24px;"
                                 data-swiper-slide-index="1">
                                <div class="product-card-01 my-1">
                                    <div class="product-media">
                                        <div class="product-media-hover">
                                            <a href="#">
                                                <img src="/resources/gallery/dev/assets/img/product-2.jpg" title=""
                                                     alt="">
                                                <img class="hover-image"
                                                     src="/resources/gallery/dev/assets/img/product-2-hover.jpg"
                                                     title="" alt="">
                                            </a>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="p-btn">
                                                <i class="fi-heart"></i>
                                            </a>
                                            <a href="#" class="p-btn">
                                                <i class="fi-repeat"></i>
                                            </a>
                                            <a data-bs-toggle="modal" data-bs-target="#px-quick-view"
                                               href="javascript:void(0)" class="p-btn">
                                                <i class="fi-eye"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="product-card-info">
                                        <div class="rating-star text">
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star-fill active"></i>
                                            <i class="bi bi-star"></i>
                                        </div>
                                        <h6 class="product-title">
                                            <a href="#">Test10</a>
                                        </h6>
                                        <div class="product-price">
                                            <span class="text-primary">$28.<small>50</small></span>
                                            <del class="fs-sm text-muted">$38.<small>50</small></del>
                                        </div>
                                        <div class="product-cart-btn">
                                            <a class="btn btn-outline-dark">
                                                Add to Cart
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-pagination mt-4 d-lg-none position-relative swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-horizontal">
                            <span class="swiper-pagination-bullet" tabindex="0" role="button"
                                  aria-label="Go to slide 1"></span><span class="swiper-pagination-bullet" tabindex="0"
                                                                          role="button"
                                                                          aria-label="Go to slide 2"></span><span
                                class="swiper-pagination-bullet swiper-pagination-bullet-active" tabindex="0"
                                role="button" aria-label="Go to slide 3" aria-current="true"></span><span
                                class="swiper-pagination-bullet" tabindex="0" role="button"
                                aria-label="Go to slide 4"></span><span class="swiper-pagination-bullet" tabindex="0"
                                                                        role="button" aria-label="Go to slide 5"></span>
                        </div>
                        <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                    <div class="swiper-arrow-style-02 swiper-next swiper-next-02" tabindex="0" role="button"
                         aria-label="Next slide" aria-controls="swiper-wrapper-68b80b9203f3bf19"><i
                            class="bi bi-chevron-right"></i></div>
                    <div class="swiper-arrow-style-02 swiper-prev swiper-prev-02" tabindex="0" role="button"
                         aria-label="Previous slide" aria-controls="swiper-wrapper-68b80b9203f3bf19"><i
                            class="bi bi-chevron-left"></i></div>
                </div>
            </div>
        </section>
        <!-- End section -->
        <!-- section -->
        <section>
            <div class="container">
                <div class="bg-cover bg-center bg-no-repeat px-4 py-10"
                     style="background-image: url(../resources/gallery/shopy/assets/img/shop-banner-8.jpg);">
                    <div class="row justify-content-center">
                        <div class="col-lg-6 text-center d-flex align-items-center justify-content-center">
                            <div class="bg-white p-4">
                                <h3 class="text-uppercase fw-300 mb-1">Light up<br> the room</h3>
                                <p class="fs-lg">Discover our lighting ideas.</p>
                                <a class="btn btn-sm btn-outline-dark" href="#">Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End section -->


    </main>
    <!-- End Main -->
    <!-- Footer -->
    @@include('./footer/_footer01.html', {
    "path": ".",
    "imgPath": "../assets",
    })
    <!-- End Footer -->
</div>
<!--
========================
   End Wrapper
========================
-->
<!-- script start -->
<!-- End script start -->
</body>
@@include('./_scripts.html', {
"path": "../assets",
})

<script>

    $(".fi-heart").on("click", function (e) {
        let gnoVal = '${gallery.G_NO}';
        console.log("gnoVal: " + gnoVal);
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/gallery/like/" + gnoVal + ".json",
            data: {gno: gnoVal},
            success: function (result) {
                console.log(result);
                console.log("좋아요 성공");
                if (result == 1) {
                    $(".fi-heart").css("color", "red");
                } else {
                    $(".fi-heart").css("color", "black");
                }
            },
            error: function (e) {
                console.log(e);
                console.log("좋아요 실패");
            }
        })
    })

    $(".fi-shopping-cart").on("click", function (e) {
        let gnoVal = '${gallery.G_NO}';
        console.log("gnoVal: " + gnoVal);
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/member/mypage/profileCart" + gnoVal + ".json",
            data: {gno: gnoVal},
            success: function (result) {
                console.log(result);
                console.log("장바구니 담기 성공");
            },
            error: function (e) {
                console.log(e);
                console.log("장바구니 담기 실패");
            }
        })
    })


</script>


<jsp:include page="/WEB-INF/views/includes/footer.jsp"/>

</html>
