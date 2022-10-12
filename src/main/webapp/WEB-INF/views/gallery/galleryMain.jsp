<!doctype html>
<html lang="zxx" class="dark">
<c:set var = "path" value = "${pageContext.request.contextPath}" />

<%--<link rel = "stylesheet" href="${path}/resources/style.css" />--%>
<link rel = "stylesheet" href="/resources/gallery/shopy/assets/css/theme.css" />

<!doctype html>
<html lang="zxx" class="dark">

<head>
    @@include('./_head.html', {
    "path": "../assets",
    "title": "Shopy – eCommerce Bootstrap 5 Template"
    })
</head>

<body>
<!-- Skippy & Prload -->
@@include('./_skippy.html',{
"path": "",
})
<!-- Edn Skippy & Prload -->

<!-- All Modal -->
@@include('./_common-modal.html',{
"path": "",
})
<!-- Edn All Modal -->

<!--
========================
    Wrapper
========================
-->
<div class="wrapper">
    <!-- Header Height -->
    <div class="header-height-bar"></div>
    <!--  -->
    <!-- Header -->
    @@include('./header/_header01.html', {
    "path": ".",
    "imgPath": "../assets",
    "HeaderClass": "navbar-light fixed-top header-height bg-white shadow-sm",
    })
    <!-- End Header -->
    <!-- Main -->
    <main>
        <!-- Home Section -->
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
                    <div class="bg-cover bg-no-repeat bg-center" style="background-image: url(../resources/gallery/shopy/assets/img/home-banner-01.jpg);">
                        <div class="container">
                            <div class="row min-vh-65 py-12 align-items-center">
                                <div class="col-md-6 col-lg-5 col-xxl-4 text-center text-md-start">
                                    <div class="bg-white p-4 p-lg-5">
                                        <h1 class="fw-300 display-3 mb-2">Light up<br /> the room</h1>
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
                <div class="swiper-slide">
                    <div class="bg-cover bg-no-repeat bg-center" style="background-image: url(../resources/gallery/shopy/assets/img/home-banner-02.jpg);">
                        <div class="container">
                            <div class="row min-vh-65 py-12 align-items-center">
                                <div class="col-md-6 col-lg-5 col-xxl-4 text-center text-md-start">
                                    <div class="bg-white p-4 p-lg-5">
                                        <h1 class="fw-300 display-3 mb-2">Light up<br /> the room</h1>
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
            <div class="swiper-arrow-style-01 swiper-next swiper-next-01"><i class="bi bi-chevron-right"></i> </div>
            <div class="swiper-arrow-style-01 swiper-prev swiper-prev-01"><i class="bi bi-chevron-left"></i></div>
            <div class="swiper-pagination"></div>
        </div>
        <!-- End Home Section -->
        <!-- section -->
        <div class="py-3">
            <div class="container">
                <div class="row g-3">
                    <div class="col-md-6">
                        <div class="position-relative hover-scale hover-opacity">
                            <div class="hover-scale-in">
                                <img class="w-100" src="../resources/gallery/shopy/assets/img/shop-banner-3.jpg" title="" alt="">
                            </div>
                            <div class="position-absolute top-0 bottom-0 end-0 start-0 d-flex align-items-center justify-content-center hover-opacity-in">
                                <a class="btn btn-light btn-lg" href="#">
                                    Furniture <i class="ms-2 bi bi-chevron-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row g-3">
                            <div class="col-6">
                                <div class="position-relative hover-scale hover-opacity">
                                    <div class="hover-scale-in">
                                        <img class="w-100" src="../resources/gallery/shopy/assets/img/shop-banner-2.jpg" title="" alt="">
                                    </div>
                                    <div class="position-absolute top-0 bottom-0 end-0 start-0 d-flex align-items-center justify-content-center hover-opacity-in">
                                        <a class="btn btn-light btn-lg" href="#">
                                            Furniture <i class="ms-2 bi bi-chevron-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="position-relative hover-scale hover-opacity">
                                    <div class="hover-scale-in">
                                        <img class="w-100" src="../resources/gallery/shopy/assets/img/shop-banner-1.jpg" title="" alt="">
                                    </div>
                                    <div class="position-absolute top-0 bottom-0 end-0 start-0 d-flex align-items-center justify-content-center hover-opacity-in">
                                        <a class="btn btn-light btn-lg" href="#">
                                            Furniture <i class="ms-2 bi bi-chevron-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="position-relative hover-scale hover-opacity">
                                    <div class="hover-scale-in">
                                        <img class="w-100" src="../resources/gallery/shopy/assets/img/shop-banner-4.jpg" title="" alt="">
                                    </div>
                                    <div class="position-absolute top-0 bottom-0 end-0 start-0 d-flex align-items-center justify-content-center hover-opacity-in">
                                        <a class="btn btn-light btn-lg" href="#">
                                            Furniture <i class="ms-2 bi bi-chevron-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="position-relative hover-scale hover-opacity">
                                    <div class="hover-scale-in">
                                        <img class="w-100" src="../resources/gallery/shopy/assets/img/shop-banner-5.jpg" title="" alt="">
                                    </div>
                                    <div class="position-absolute top-0 bottom-0 end-0 start-0 d-flex align-items-center justify-content-center hover-opacity-in">
                                        <a class="btn btn-light btn-lg" href="#">
                                            Furniture <i class="ms-2 bi bi-chevron-right"></i>
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
                <div class="swiper-hover-arrow position-relative">
                    <div class="swiper swiper-container" data-swiper-options='{
                              "slidesPerView": 2,
                              "spaceBetween": 24,
                              "loop": true,
                              "pagination": {
                                "el": ".swiper-pagination",
                                "clickable": true
                                },
                              "navigation": {
                                "nextEl": ".swiper-next-02",
                                "prevEl": ".swiper-prev-02"
                              },
                              "autoplay": {
                                "delay": 3500,
                                "disableOnInteraction": false
                              },
                              "breakpoints": {
                                "600": {
                                  "slidesPerView": 3
                                },
                                "991": {
                                  "slidesPerView": 3
                                },
                                "1200": {
                                  "slidesPerView": 4
                                }
                              }
                        }'>
                        <div class="swiper-wrapper">
                            <!-- Product Card -->
                            <div class="swiper-slide">
                                <div class="product-card-01 my-1">
                                    <div class="product-media">
                                        <div class="product-lable">
                                            <span class="bg-danger text-white">Hot</span>
                                        </div>
                                        <div class="product-media-hover">
                                            <a href="#">
                                                <img src="../resources/gallery/shopy/assets/img/product-1.jpg" title="" alt="">
                                                <img class="hover-image" src="../resources/gallery/shopy/assets/img/product-1-hover.jpg" title="" alt="">
                                            </a>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="p-btn">
                                                <i class="fi-heart"></i>
                                            </a>
                                            <a href="#" class="p-btn">
                                                <i class="fi-repeat"></i>
                                            </a>
                                            <a data-bs-toggle="modal" data-bs-target="#px-quick-view" href="javascript:void(0)" class="p-btn">
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
                                            <a href="#">Fine-knit sweater</a>
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
                            <div class="swiper-slide">
                                <div class="product-card-01 my-1">
                                    <div class="product-media">
                                        <div class="product-media-hover">
                                            <a href="#">
                                                <img src="../resources/gallery/shopy/assets/img/product-2.jpg" title="" alt="">
                                                <img class="hover-image" src="../resources/gallery/shopy/assets/img/product-2-hover.jpg" title="" alt="">
                                            </a>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="p-btn">
                                                <i class="fi-heart"></i>
                                            </a>
                                            <a href="#" class="p-btn">
                                                <i class="fi-repeat"></i>
                                            </a>
                                            <a data-bs-toggle="modal" data-bs-target="#px-quick-view" href="javascript:void(0)" class="p-btn">
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
                                            <a href="#">Fine-knit sweater</a>
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
                            <div class="swiper-slide">
                                <div class="product-card-01 my-1">
                                    <div class="product-media">
                                        <div class="product-media-hover">
                                            <a href="#">
                                                <img src="../resources/gallery/shopy/assets/img/product-3.jpg" title="" alt="">
                                                <img class="hover-image" src="../resources/gallery/shopy/assets/img/product-3-hover.jpg" title="" alt="">
                                            </a>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="p-btn">
                                                <i class="fi-heart"></i>
                                            </a>
                                            <a href="#" class="p-btn">
                                                <i class="fi-repeat"></i>
                                            </a>
                                            <a data-bs-toggle="modal" data-bs-target="#px-quick-view" href="javascript:void(0)" class="p-btn">
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
                                            <a href="#">Fine-knit sweater</a>
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
                            <div class="swiper-slide">
                                <div class="product-card-01 my-1">
                                    <div class="product-media">
                                        <div class="product-media-hover">
                                            <a href="#">
                                                <img src="../resources/gallery/shopy/assets/img/product-4.jpg" title="" alt="">
                                                <img class="hover-image" src="../resources/gallery/shopy/assets/img/product-4-hover.jpg" title="" alt="">
                                            </a>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="p-btn">
                                                <i class="fi-heart"></i>
                                            </a>
                                            <a href="#" class="p-btn">
                                                <i class="fi-repeat"></i>
                                            </a>
                                            <a data-bs-toggle="modal" data-bs-target="#px-quick-view" href="javascript:void(0)" class="p-btn">
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
                                            <a href="#">Fine-knit sweater</a>
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
                            <div class="swiper-slide">
                                <div class="product-card-01 my-1">
                                    <div class="product-media">
                                        <div class="product-lable">
                                            <span class="bg-danger text-white">Hot</span>
                                        </div>
                                        <div class="product-media-hover">
                                            <a href="#">
                                                <img src="../resources/gallery/shopy/assets/img/product-5.jpg" title="" alt="">
                                                <img class="hover-image" src="../resources/gallery/shopy/assets/img/product-5-hover.jpg" title="" alt="">
                                            </a>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="p-btn">
                                                <i class="fi-heart"></i>
                                            </a>
                                            <a href="#" class="p-btn">
                                                <i class="fi-repeat"></i>
                                            </a>
                                            <a data-bs-toggle="modal" data-bs-target="#px-quick-view" href="javascript:void(0)" class="p-btn">
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
                                            <a href="#">Fine-knit sweater</a>
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
                        <div class="swiper-pagination mt-4 d-lg-none position-relative"></div>
                    </div>
                    <div class="swiper-arrow-style-02 swiper-next swiper-next-02"><i class="bi bi-chevron-right"></i> </div>
                    <div class="swiper-arrow-style-02 swiper-prev swiper-prev-02"><i class="bi bi-chevron-left"></i></div>
                </div>
            </div>
        </section>
        <!-- End section -->
        <!-- section -->
        <section>
            <div class="container">
                <div class="row g-3">
                    <div class="col-lg-6">
                        <div class="hover-scale">
                            <div class="hover-scale-in position-relative">
                                <img src="../resources/gallery/shopy/assets/img/shop-banner-6.jpg" title="" alt="">
                                <div class="position-absolute bottom-0 start-0 p-4 bg-white m-2">
                                    <h3 class="text-uppercase fw-300 mb-1">Light up<br> the room</h3>
                                    <a class="btn btn-sm btn-outline-dark" href="#">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="hover-scale">
                            <div class="hover-scale-in position-relative">
                                <img src="../resources/gallery/shopy/assets/img/shop-banner-7.jpg" title="" alt="">
                                <div class="position-absolute bottom-0 start-0 p-4 bg-white m-2">
                                    <h3 class="text-uppercase fw-300 mb-1">Light up<br> the room</h3>
                                    <a class="btn btn-sm btn-outline-dark" href="#">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End section -->
        <!-- section -->
        <section class="section">
            <div class="container">
                <div class="row justify-content-center section-heading">
                    <div class="col-lg-6 text-center">
                        <h3 class="fw-500 h2 m-0">Shop by Department</h3>
                    </div>
                </div>
                <div class="swiper-hover-arrow position-relative">
                    <div class="swiper swiper-container" data-swiper-options='{
                              "slidesPerView": 2,
                              "spaceBetween": 30,
                              "loop": true,
                              "pagination": {
                                "el": ".swiper-pagination",
                                "clickable": true
                                },
                              "navigation": {
                                "nextEl": ".swiper-next-03",
                                "prevEl": ".swiper-prev-03"
                              },
                              "autoplay": {
                                "delay": 3500,
                                "disableOnInteraction": false
                              },
                              "breakpoints": {
                                "500": {
                                  "slidesPerView": 3
                                },
                                "700": {
                                  "slidesPerView": 4
                                },
                                "991": {
                                  "slidesPerView": 5
                                },
                                "1200": {
                                  "slidesPerView": 6
                                }
                              }
                        }'>
                        <div class="swiper-wrapper">
                            <!-- catargory Card -->
                            <div class="swiper-slide">
                                <div class="catargory-card-01">
                                    <div class="catargory-media">
                                        <a href="#">
                                            <img src="../resources/gallery/shopy/assets/img/catagory-1.jpg" title="" alt="">
                                        </a>
                                    </div>
                                    <div class="catargory-info">
                                        <h6><a href="#">Bed & Bath</a></h6>
                                        <span class="fs-sm">85 Products</span>
                                    </div>
                                </div>
                            </div>
                            <!-- catargory Card -->
                            <div class="swiper-slide">
                                <div class="catargory-card-01">
                                    <div class="catargory-media">
                                        <a href="#">
                                            <img src="../resources/gallery/shopy/assets/img/catagory-2.jpg" title="" alt="">
                                        </a>
                                    </div>
                                    <div class="catargory-info">
                                        <h6><a href="#">Bed & Bath</a></h6>
                                        <span class="fs-sm">85 Products</span>
                                    </div>
                                </div>
                            </div>
                            <!-- catargory Card -->
                            <div class="swiper-slide">
                                <div class="catargory-card-01">
                                    <div class="catargory-media">
                                        <a href="#">
                                            <img src="../resources/gallery/shopy/assets/img/catagory-3.jpg" title="" alt="">
                                        </a>
                                    </div>
                                    <div class="catargory-info">
                                        <h6><a href="#">Bed & Bath</a></h6>
                                        <span class="fs-sm">85 Products</span>
                                    </div>
                                </div>
                            </div>
                            <!-- catargory Card -->
                            <div class="swiper-slide">
                                <div class="catargory-card-01">
                                    <div class="catargory-media">
                                        <a href="#">
                                            <img src="../resources/gallery/shopy/assets/img/catagory-4.jpg" title="" alt="">
                                        </a>
                                    </div>
                                    <div class="catargory-info">
                                        <h6><a href="#">Bed & Bath</a></h6>
                                        <span class="fs-sm">85 Products</span>
                                    </div>
                                </div>
                            </div>
                            <!-- catargory Card -->
                            <div class="swiper-slide">
                                <div class="catargory-card-01">
                                    <div class="catargory-media">
                                        <a href="#">
                                            <img src="../resources/gallery/shopy/assets/img/catagory-5.jpg" title="" alt="">
                                        </a>
                                    </div>
                                    <div class="catargory-info">
                                        <h6><a href="#">Bed & Bath</a></h6>
                                        <span class="fs-sm">85 Products</span>
                                    </div>
                                </div>
                            </div>
                            <!-- catargory Card -->
                            <div class="swiper-slide">
                                <div class="catargory-card-01">
                                    <div class="catargory-media">
                                        <a href="#">
                                            <img src="../resources/gallery/shopy/assets/img/catagory-6.jpg" title="" alt="">
                                        </a>
                                    </div>
                                    <div class="catargory-info">
                                        <h6><a href="#">Bed & Bath</a></h6>
                                        <span class="fs-sm">85 Products</span>
                                    </div>
                                </div>
                            </div>
                            <!-- catargory Card -->
                            <div class="swiper-slide">
                                <div class="catargory-card-01">
                                    <div class="catargory-media">
                                        <a href="#">
                                            <img src="../resources/gallery/shopy/assets/img/catagory-1.jpg" title="" alt="">
                                        </a>
                                    </div>
                                    <div class="catargory-info">
                                        <h6><a href="#">Bed & Bath</a></h6>
                                        <span class="fs-sm">85 Products</span>
                                    </div>
                                </div>
                            </div>
                            <!-- catargory Card -->
                            <div class="swiper-slide">
                                <div class="catargory-card-01">
                                    <div class="catargory-media">
                                        <a href="#">
                                            <img src="../resources/gallery/shopy/assets/img/catagory-2.jpg" title="" alt="">
                                        </a>
                                    </div>
                                    <div class="catargory-info">
                                        <h6><a href="#">Bed & Bath</a></h6>
                                        <span class="fs-sm">85 Products</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-pagination mt-4 d-lg-none position-relative"></div>
                    </div>
                    <div class="swiper-arrow-style-02 swiper-next swiper-next-03"><i class="bi bi-chevron-right"></i> </div>
                    <div class="swiper-arrow-style-02 swiper-prev swiper-prev-03"><i class="bi bi-chevron-left"></i></div>
                </div>
            </div>
        </section>
        <!-- End section -->
        <!-- section -->
        <section>
            <div class="container">
                <div class="bg-cover bg-center bg-no-repeat px-4 py-10" style="background-image: url(../resources/gallery/shopy/assets/img/shop-banner-8.jpg);">
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
        <!-- section -->
        <section class="section">
            <div class="container">
                <div class="row justify-content-center section-heading">
                    <div class="col-lg-6 text-center">
                        <h3 class="fw-500 h2 m-0">From Our Blog</h3>
                    </div>
                </div>
                <div class="swiper-hover-arrow position-relative">
                    <div class="swiper swiper-container" data-swiper-options='{
                            "slidesPerView": 1,
                            "spaceBetween": 24,
                            "pagination": {
                                "el": ".swiper-pagination",
                                "clickable": true
                            },
                            "navigation": {
                                "nextEl": ".swiper-next-04",
                                "prevEl": ".swiper-prev-04"
                            },
                            "autoplay": {
                                "delay": 3500,
                                "disableOnInteraction": false
                            },
                            "breakpoints": {
                                "600": {
                                  "slidesPerView": 2
                                },
                                "991": {
                                  "slidesPerView": 2
                                },
                                "1200": {
                                  "slidesPerView": 3
                                }
                            }
                        }'>
                        <div class="swiper-wrapper">

                            <!-- Blog Card 6-->
                            <div class="swiper-slide">
                                <div class="hover-scale">
                                    <div class="hover-scale-in position-relative">
                                        <div class="position-absolute top-0 end-0 p-3 z-index-1">
                                            <span class="bg-dark text-white d-inline-flex px-3 fs-sm py-2">18 FEB</span>
                                        </div>
                                        <a href="#">
                                            <c:forEach var="i" begin="1" end="6" step="1">
                                                <img src="../resources/gallery/shopy/assets/img/blog-${i}.jpg" title="" alt="">
                                            </c:forEach>

                                        </a>
                                    </div>
                                    <div class="p-3 text-center mx-4 mt-n4 bg-white position-relative border border-gray-300">
                                        <span class="fs-sm">Furniture</span>
                                        <h5 class="pt-2"><a href="#" class="link-effect text-reset">Easy Fixes for Home Decor</a></h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do.</p>
                                        <a class="link-effect text-primary text-uppercase fw-600 fs-sm" href="#">Read More</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-pagination mt-4 d-lg-none position-relative"></div>
                    </div>
                    <div class="swiper-arrow-style-02 swiper-next swiper-next-04"><i class="bi bi-chevron-right"></i> </div>
                    <div class="swiper-arrow-style-02 swiper-prev swiper-prev-04"><i class="bi bi-chevron-left"></i></div>
                </div>
            </div>
        </section>
        <!-- End section -->
        <!-- section -->중
        <section class="py-5 bg-gray-100 border-top">
            <div class="container">
                <div class="row gy-2">
                    <div class="col-sm-6 col-lg-3">
                        <div class="border border-gray-300 p-4 bg-white d-flex">
                            <div class="icon-lg bg-primary-soft rounded-circle text-primary">
                                <i class="bi bi-truck"></i>
                            </div>
                            <div class="col ps-3 lh-sm">
                                <h6 class="mb-1">Free Shipping</h6>
                                <span>You will love at great low prices</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <div class="border border-gray-300 p-4 bg-white d-flex">
                            <div class="icon-lg bg-primary-soft rounded-circle text-primary">
                                <i class="bi bi-headphones"></i>
                            </div>
                            <div class="col ps-3 lh-sm">
                                <h6 class="mb-1">Contact us 24/7</h6>
                                <span>You will love at great low prices</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <div class="border border-gray-300 p-4 bg-white d-flex">
                            <div class="icon-lg bg-primary-soft rounded-circle text-primary">
                                <i class="bi bi-box-arrow-in-left"></i>
                            </div>
                            <div class="col ps-3 lh-sm">
                                <h6 class="mb-1">30 Days Return</h6>
                                <span>You will love at great low prices</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <div class="border border-gray-300 p-4 bg-white d-flex">
                            <div class="icon-lg bg-primary-soft rounded-circle text-primary">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                            <div class="col ps-3 lh-sm">
                                <h6 class="mb-1">100% Secure Payment</h6>
                                <span>You will love at great low prices</span>
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
@@include('./_scripts.html', {
"path": "../assets",
})
<!-- End script start -->
</body>

</html>