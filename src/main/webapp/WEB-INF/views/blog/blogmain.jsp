<%--
  Created by IntelliJ IDEA.
  User: pmwkd
  Date: 2022-09-28
  Time: 오전 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Blog Main</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--Favicon-->
    <link rel="shortcut icon" href="../resources/blog/images/favicon.ico" type="image/x-icon">

    <!-- THEME CSS
	================================================== -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="../resources/blog/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Themify -->
    <link rel="stylesheet" href="../resources/blog/plugins/themify/css/themify-icons.css">
    <link rel="stylesheet" href="../resources/blog/plugins/slick-carousel/slick-theme.css">
    <link rel="stylesheet" href="../resources/blog/plugins/slick-carousel/slick.css">
    <!-- Slick Carousel -->
    <link rel="stylesheet" href="../resources/blog/plugins/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="../resources/blog/plugins/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="../resources/blog/plugins/magnific-popup/magnific-popup.css">
    <!-- manin stylesheet -->
    <link rel="stylesheet" href="../resources/blog/css/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/includes/header.jsp"/>
<div>
    <h1>TEST BLOG MAIN</h1>
<%--    <table>--%>
<%--        <c:forEach var="board" items="${list}">--%>
<%--            <tr>--%>
<%--                <td>U_ID : ${board.u_ID}</td>--%>
<%--                <td>REG : ${board.b_REG}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
</div>


<!-- slide -->
<%-- 슬라이드 조건은 뭐로하지.. --%>
<section class="slider mt-4">
    <div class="container-fluid">
        <div class="row no-gutters">
            <div class="col-lg-12 col-sm-12 col-md-12 slider-wrap">

                <div class="slider-item">
                    <div class="slider-item-content">
                        <div class="post-thumb mb-4">
                            <a href="../resources/blog/blog-single.html">
                                <img src="../resources/blog/images/slider/slider1.jpg" alt="" class="img-fluid">
                            </a>
                        </div>

                        <div class="slider-post-content">
                            <span class="cat-name text-color font-sm font-extra text-uppercase letter-spacing">Lifestyle(메인 태그 <-- 카테고리 개념)</span>
                            <h3 class="post-title mt-1"><a href="../resources/blog/blog-single.html">Tips for Taking a
                                Long-term Trip(블로그 제목)</a></h3>
                            <span class=" text-muted  text-capitalize">January 2, 2019(블로그 수정 >> 작성 시간)</span>
                        </div>
                    </div>
                </div>

                <div class="slider-item">
                    <div class="slider-item-content">
                        <div class="post-thumb mb-4">
                            <a href="blog-single.html">
                                <img src="../resources/blog/images/slider/slider2.jpg" alt="" class="img-fluid">
                            </a>
                        </div>
                        <div class="slider-post-content">
                            <span class="cat-name text-color font-sm font-extra text-uppercase letter-spacing">Travel</span>
                            <h3 class="post-title mt-1"><a href="../resources/blog/blog-single.html">Trip to
                                California</a></h3>
                            <span class=" text-muted  text-capitalize">September 15, 2019</span>
                        </div>
                    </div>
                </div>

                <div class="slider-item">
                    <div class="slider-item-content">
                        <div class="post-thumb mb-4">
                            <a href="blog-single.html">
                                <img src="../resources/blog/images/slider/slider3.jpg" alt="" class="img-fluid">
                            </a>
                        </div>
                        <div class="slider-post-content">
                            <span class="cat-name text-color font-sm font-extra text-uppercase letter-spacing">weekends</span>
                            <h3 class="post-title mt-1"><a href="../resources/blog/blog-single.html">Our Favorite
                                Weekend Getaways</a></h3>
                            <span class=" text-muted  text-capitalize">June 12, 2019</span>
                        </div>
                    </div>
                </div>

                <div class="slider-item">
                    <div class="slider-item-content">
                        <div class="post-thumb mb-4">
                            <a href="../resources/blog/blog-single.html">
                                <img src="../resources/blog/images/slider/slider2.jpg" alt="" class="img-fluid">
                            </a>
                        </div>

                        <div class="slider-post-content">
                            <span class="cat-name text-color font-sm font-extra text-uppercase letter-spacing">Travel</span>
                            <h3 class="post-title mt-1"><a href="../resources/blog/blog-single.html">Trip to
                                California</a></h3>
                            <span class=" text-muted  text-capitalize">September 15, 2019</span>
                        </div>
                    </div>
                </div>

                <div class="slider-item">
                    <div class="slider-item-content">
                        <div class="post-thumb mb-4">
                            <a href="../resources/blog/blog-single.html">
                                <img src="../resources/blog/images/slider/slider3.jpg" alt="" class="img-fluid">
                            </a>
                        </div>

                        <div class="slider-post-content">
                            <span class="cat-name text-color font-sm font-extra text-uppercase letter-spacing">Travel</span>
                            <h3 class="post-title mt-1"><a href="../resources/blog/blog-single.html">Trip to
                                California</a></h3>
                            <span class=" text-muted  text-capitalize">September 15, 2019</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 글 작성. 로그인시 보이게 하기-->
<sec:authorize access="isAuthenticated()">
<div>
    <button id="gowrite" onclick="goWrite()">글 작성</button>
</div>
</sec:authorize>

<!-- 글 영역 -->
<div>
    <%--    <select name="option" id="">--%>
    <%--        <option value="reg">최신순</option>--%>
    <%--        <option value="like">좋아요순</option>--%>
    <%--        <option value="readcount">조회순</option>--%>
    <%--    </select>--%>
    <%--    <select name="sort">--%>
    <%--        <option value="desc">내림차순</option>--%>
    <%--        <option value="asc">오름차순</option>--%>
    <%--    </select>--%>
    <div>
        <form id="mainsortForm" action="main" method="post">
            <input type="hidden" name="option" id="optionSort" value="latest">

            <button type="submit" data-service="latest">최신순</button>
            <button type="submit" data-service="oldest">오래된순</button>
            <button type="submit" data-service="like">좋아요순</button>
            <button type="submit" data-service="readcount">조회순</button>


<%--            <a href="#" onclick="optionIs('latest')">최신순</a>--%>
<%--            <a href="#" onclick="optionIs('oldest')">오래된순</a>--%>
<%--            <a href="#" onclick="optionIs('like')">좋아요순</a>--%>
<%--            <a href="#" onclick="optionIs('readcount')">조회순</a>--%>
        </form>
    </div>
</div>
<section class="section-padding">

    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="row">
                    <!-- 글 -->
                    <c:forEach var="board" items="${list}">
                        <div class="col-lg-3 col-md-6">
                            <article class="post-grid mb-5">
                                <a class="post-thumb mb-4 d-block" href="/blog/single?b_no=${board.b_NO}">
                                    <img src="/blog/getmainimg?b_no=${board.b_NO}" alt="" class="img-fluid w-100"
                                         style="width: 300px; height: 200px; object-fit:cover">
                                </a>
                                <span class="cat-name text-color font-extra text-sm text-uppercase letter-spacing-1"><c:out
                                        value="${board.MT_NAME}"/></span>
                                <h3 class="post-title mt-1"><a href="/blog/single?b_no=${board.b_NO}"><c:out
                                        value="${board.b_SUBJECT}"/></a></h3>

                                <span class="text-muted letter-spacing text-uppercase font-sm"><c:out
                                        value="${board.b_REG}"/></span>

                            </article>
                        </div>
                        <!-- 글 한개 -->
                    </c:forEach>
                    <!-- 샘플 글 여러개 배치 -->
                    <c:forEach var="i" begin="1" end="8" step="1">
                        <div class="col-lg-3 col-md-6">
                            <article class="post-grid mb-5">
                                <a class="post-thumb mb-4 d-block" href="../resources/blog/blog-single.html">
                                    <img src="../resources/blog/images/news/f1.jpg" alt="" class="img-fluid w-100">
                                </a>
                                <span class="cat-name text-color font-extra text-sm text-uppercase letter-spacing-1"><c:out
                                        value="${i}"/> (메인태그 <-- 카테고리개념)</span>
                                <h3 class="post-title mt-1"><a href="../resources/blog/blog-single.html">The best place
                                    to explore to enjoy(블로그 제목)</a></h3>

                                <span class="text-muted letter-spacing text-uppercase font-sm">June 15, 2019(블로그 수정 >> 작성 시간)</span>

                            </article>
                        </div>
                        <!-- 글 한개 -->
                    </c:forEach>
                </div>
            </div>


            <!-- 페이징 처리 -->
            <%--            <div class="m-auto">--%>
            <%--                <div class="pagination mt-5 pt-4">--%>
            <%--                    <ul class="list-inline ">--%>
            <%--                        <li class="list-inline-item"><a href="#" class="active">1</a></li>--%>
            <%--                        <li class="list-inline-item"><a href="#">2</a></li>--%>
            <%--                        <li class="list-inline-item"><a href="#">3</a></li>--%>
            <%--                        <li class="list-inline-item"><a href="#" class="prev-posts"><i class="ti-arrow-right"></i></a></li>--%>
            <%--                    </ul>--%>
            <%--                </div>--%>
            <%--            </div>--%>
        </div>
    </div>
</section>


<!-- footer -->
<%--<section class="footer-2 section-padding gray-bg pb-5">--%>
<%--    <div class="container">--%>
<%--        <div class="row justify-content-center">--%>
<%--            <div class="col-lg-6">--%>
<%--                <div class="subscribe-footer text-center">--%>
<%--                    <div class="form-group mb-0">--%>
<%--                        <h2 class="mb-3">Subscribe Newsletter</h2>--%>
<%--                        <p class="mb-4">Subscribe my Newsletter for new blog posts , tips and info.<p>--%>
<%--                        <div class="form-group form-row align-items-center mb-0">--%>
<%--                            <div class="col-sm-9">--%>
<%--                                <input type="email" class="form-control" placeholder="Email Address">--%>
<%--                            </div>--%>
<%--                            <div class="col-sm-3">--%>
<%--                                <a href="#" class="btn btn-dark ">Subscribe</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        --%>
<%--        <div class="footer-btm mt-5 pt-4 border-top">--%>
<%--            <div class="row">--%>
<%--                <div class="col-lg-12">--%>
<%--                    <ul class="list-inline footer-socials-2 text-center">--%>
<%--                        <li class="list-inline-item"><a href="#">Privacy policy</a></li>--%>
<%--                        <li class="list-inline-item"><a href="#">Support</a></li>--%>
<%--                        <li class="list-inline-item"><a href="#">About</a></li>--%>
<%--                        <li class="list-inline-item"><a href="#">Contact</a></li>--%>
<%--                        <li class="list-inline-item"><a href="#">Terms</a></li>--%>
<%--                        <li class="list-inline-item"><a href="#">Category</a></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="row justify-content-center">--%>
<%--                <div class="col-lg-6">--%>
<%--                    <div class="copyright text-center ">--%>
<%--                        @ copyright all reserved to <a href="https://themefisher.com/">themefisher.com</a>-2019--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>


<!-- THEME JAVASCRIPT FILES
================================================== -->
<!-- initialize jQuery Library -->
<script src="../resources/blog/plugins/jquery/jquery.js"></script>
<!-- Bootstrap jQuery -->
<script src="../resources/blog/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../resources/blog/plugins/bootstrap/js/popper.min.js"></script>
<!-- Owl caeousel -->
<script src="../resources/blog/plugins/owl-carousel/owl.carousel.min.js"></script>
<script src="../resources/blog/plugins/slick-carousel/slick.min.js"></script>
<script src="../resources/blog/plugins/magnific-popup/magnific-popup.js"></script>
<!-- Instagram Feed Js -->
<script src="../resources/blog/plugins/instafeed-js/instafeed.min.js"></script>
<!-- Google Map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
<script src="../resources/blog/plugins/google-map/gmap.js"></script>
<!-- main js -->
<script src="../resources/blog/js/custom.js"></script>

<script type="text/javascript">
    function goWrite() {
        // console.log('click');
        window.location.href = "/blog/write";
    }

    $(document).ready(function(){
        console.log('ready...');

        let formObj = $("#mainsortForm");
        let optionElement = document.getElementById("optionSort");
        console.log("optionElement", optionElement);

        $("button").on("click", function(e){
            e.preventDefault();
            let service_data = $(this).data("service");
            console.log(service_data);

            if (service_data == "latest"){
                optionElement.value = "latest";
                formObj.submit();
            } else if (service_data == "oldest"){
                optionElement.value = "oldest";
                formObj.submit();
            } else if (service_data == "like"){
                optionElement.value = "like";
                formObj.submit();
            } else if(service_data == "readcount"){
                optionElement.value = "readcount";
                formObj.submit();
            }
        })
    })


    function optionIs(option) {
        console.log("optionIs Start...");
        console.log("option is : " + option);



        <%--$.ajax({--%>
        <%--    &lt;%&ndash;beforeSend: function (xhr) {&ndash;%&gt;--%>
        <%--    &lt;%&ndash;    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");&ndash;%&gt;--%>
        <%--    &lt;%&ndash;},&ndash;%&gt;--%>
        <%--    // url: "/blog/getList.do",--%>
        <%--    url: "/blog/main",--%>
        <%--    type: "POST",--%>
        <%--    data: {--%>
        <%--        option: option--%>
        <%--    },--%>
        <%--    success: function (data) {--%>
        <%--        console.log("success");--%>
        <%--        console.log(data);--%>
        <%--        // window.location.reload();--%>
        <%--        location.reload();--%>
        <%--    },--%>
        <%--    error: function (data) {--%>
        <%--        console.log("error");--%>
        <%--        console.log(data);--%>
        <%--    }--%>
        <%--});--%>
    }
</script>

<%-- footer 적용--%>
<jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
<%--</body>--%>
<%--</html>--%>