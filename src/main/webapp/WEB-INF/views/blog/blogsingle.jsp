<%--
  Created by IntelliJ IDEA.
  User: pmwkd
  Date: 2022-09-28
  Time: 오후 4:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Blog Single Magazine</title>
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


<!--search overlay start-->
<div class="search-wrap">
    <div class="overlay">
        <form action="#" class="search-form">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-9">
                        <input type="text" class="form-control" placeholder="Search..."/>
                    </div>
                    <div class="col-md-2 col-3 text-right">
                        <div class="search_toggle toggle-wrap d-inline-block">
                            <i class="ti-close"></i>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<!--search overlay end-->

<section class="single-block-wrapper section-padding">
    <div class="container">
        <div class="row">
            <!-- 글 포스트 + 댓글 -->
            <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                <div class="single-post">
                    <div class="post-header mb-5 text-center">
                        <div class="meta-cat">
                            <a class="post-category font-extra text-color text-uppercase font-sm letter-spacing-1"
                               href="#">Health ,</a>
                            <a class="post-category font-extra text-color text-uppercase font-sm letter-spacing-1"
                               href="#">lifestyle</a>
                        </div>
                        <!-- 글 제목 -->
                        <h2 class="post-title mt-2">
                            ${blog.b_SUBJECT}
                        </h2>

                        <div class="post-meta">
                            <span class="text-uppercase font-sm letter-spacing-1 mr-3">by ${blog.u_ID}</span>
                            <span class="text-uppercase font-sm letter-spacing-1">${blog.b_REG}</span>
                        </div>
                        <!-- 메인 사진 -->
                        <div class="post-featured-image mt-5">
                            <img src="/blog/getmainimg?b_no=${blog.b_NO}" class="img-fluid w-100" alt="featured-image">
                        </div>
                    </div>
                    <div class="post-body">
                        <div class="entry-content">
                            ${blog.b_CONTENT}
                        </div>

                        <!-- 태그들 -->
                        <%-- 태그 누르면 태그명으로 검색한 효과? 갤러리로? 아니면 블로그로? --%>
                        <c:forEach items="${tagArr}" var="tag">
                            <div class="post-tags py-4">
                                <a href="#">#${tag}</a>
                            </div>
                        </c:forEach>
                        <!-- 수정, 삭제하기 버튼 -->
                        <%-- 조건 달아주기. 작성자와 로그인 유저가 같을 경우 --%>
                        <div>
                            <a href="/blog/update?b_no=${blog.b_NO}" class="btn btn-primary">수정하기</a>
                            <a href="/blog/delete?b_no=${blog.b_NO}" class="btn btn-primary">삭제하기</a>
                        </div>


                        <div class="tags-share-box center-box d-flex text-center justify-content-between border-top border-bottom py-3">

                            <!-- 댓글 수 -->
                            <span class="single-comment-o"><i class="fa fa-comment-o"></i>0 comment</span>

                            <div class="post-share">
                                <!-- 좋아요 수, 좋아요 하트모양 사진 -->
                                <span class="count-number-like">2</span>
                                <a class="penci-post-like single-like-button"><i class="ti-heart"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 자기소개 + sns링크 -->
                <div class="post-author d-flex my-5">
                    <div class="author-img">
                        <!-- 유저 이미지 사진 -->
                        <img alt="" src="../resources/blog/images/author.jpg" class="avatar avatar-100 photo"
                             width="100" height="100">
                        이미지 주소 : ${user_info.u_PIC}
                    </div>

                    <div class="author-content pl-4">
                        <!-- 유저 자기소개 -->
                        <h4 class="mb-3"><a href="/blog/usermain?u_id=${blog.u_ID}" title="" rel="author"
                                            class="text-capitalize">${blog.u_ID}</a></h4>
                        <p>자기소개 : ${user_intro.u_INTRO}</p>

                        <a target="_blank" class="author-social" href="#"><i
                                class="ti-facebook"></i>${user_sns.s_FACEBOOK}</a>
                        <a target="_blank" class="author-social" href="#"><i
                                class="ti-twitter"></i>${user_sns.s_TWITTER}</a>
                        <a target="_blank" class="author-social" href="#"><i class="ti-google-plus"></i></a>
                        <a target="_blank" class="author-social" href="#"><i
                                class="ti-instagram"></i>${user_sns.s_INSTAGRAM}</a>
                        <a target="_blank" class="author-social" href="#"><i class="ti-pinterest"></i></a>
                        <a target="_blank" class="author-social" href="#"><i class="ti-tumblr"></i></a>
                        <a target="_blank" class="author-social" href="#"><i
                                class="ti-youtube"></i>${user_sns.s_YOUTUBE}</a>
                    </div>
                </div>

                <!-- 다음글 이전글 -->
                <%--                <nav class="post-pagination clearfix border-top border-bottom py-4">--%>
                <%--                    <div class="prev-post">--%>
                <%--                        <a href="../resources/blog/blog-single.html">--%>
                <%--                            <span class="text-uppercase font-sm letter-spacing">Next</span>--%>
                <%--                            <h4 class="mt-3"> Intel’s new smart glasses actually look good</h4>--%>
                <%--                        </a>--%>
                <%--                    </div>--%>
                <%--                    <div class="next-post">--%>
                <%--                        <a href="../resources/blog/blog-single.html">--%>
                <%--                            <span class="text-uppercase font-sm letter-spacing">Previous</span>--%>
                <%--                            <h4 class="mt-3">Free Two-Hour Delivery From Whole Foods</h4>--%>
                <%--                        </a>--%>
                <%--                    </div>--%>
                <%--                </nav>--%>

                <!-- 추천글. 관련 좋아할만한 글 -->
                <%--                <div class="related-posts-block mt-5">--%>
                <%--                    <h3 class="news-title mb-4 text-center">--%>
                <%--                        You May Also Like--%>
                <%--                    </h3>--%>
                <%--                    <div class="row">--%>
                <%--                        <div class="col-lg-4 col-md-4 col-sm-6">--%>
                <%--                            <div class="post-block-wrapper mb-4 mb-lg-0">--%>
                <%--                                <a href="blog-single.html">--%>
                <%--                                    <img class="img-fluid" src="../resources/blog/images/fashion/img-1.jpg"--%>
                <%--                                         alt="post-thumbnail"/>--%>
                <%--                                </a>--%>
                <%--                                <div class="post-content mt-3">--%>
                <%--                                    <h5>--%>
                <%--                                        <a href="../resources/blog/blog-single.html">Intel’s new smart glasses actually--%>
                <%--                                            look good</a>--%>
                <%--                                    </h5>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="col-lg-4 col-md-4 col-sm-6">--%>
                <%--                            <div class="post-block-wrapper mb-4 mb-lg-0">--%>
                <%--                                <a href="../resources/blog/blog-single.html">--%>
                <%--                                    <img class="img-fluid" src="../resources/blog/images/fashion/img-2.jpg"--%>
                <%--                                         alt="post-thumbnail"/>--%>
                <%--                                </a>--%>
                <%--                                <div class="post-content mt-3">--%>
                <%--                                    <h5>--%>
                <%--                                        <a href="../resources/blog/blog-single.html">Free Two-Hour Delivery From Whole--%>
                <%--                                            Foods</a>--%>
                <%--                                    </h5>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                        <div class="col-lg-4 col-md-4 col-sm-6">--%>
                <%--                            <div class="post-block-wrapper">--%>
                <%--                                <a href="../resources/blog/blog-single.html">--%>
                <%--                                    <img class="img-fluid" src="../resources/blog/images/fashion/img-3.jpg"--%>
                <%--                                         alt="post-thumbnail"/>--%>
                <%--                                </a>--%>
                <%--                                <div class="post-content mt-3">--%>
                <%--                                    <h5>--%>
                <%--                                        <a href="../resources/blog/blog-single.html">Snow and Freezing Rain in Paris--%>
                <%--                                            Forces the</a>--%>
                <%--                                    </h5>--%>
                <%--                                </div>--%>
                <%--                            </div>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>

                <!-- 댓글 -->
                <div class="comment-area my-5">
                    <!-- 댓글 갯수 -->
                    <h3 class="mb-4 text-center">2 Comments</h3>

                    <!-- 댓글 한개 -->
                    <div class="comment-area-box media">
                        <img alt="" src="../resources/blog/images/blog-user-2.jpg"
                             class="img-fluid float-left mr-3 mt-2">
                        <div class="media-body ml-4">
                            <h4 class="mb-0">Micle harison </h4>
                            <span class="date-comm font-sm text-capitalize text-color"><i class="ti-time mr-2"></i>June 7, 2019 </span>

                            <div class="comment-content mt-3">
                                <p>Lorem ipsum dolor sit amet, usu ut perfecto postulant deterruisset, libris causae
                                    volutpat at est, ius id modus laoreet urbanitas. Mel ei delenit dolores.</p>
                            </div>
                            <div class="comment-meta mt-4 mt-lg-0 mt-md-0">
                                <a href="#" class="text-underline ">Reply</a>
                            </div>
                        </div>
                    </div>
                    <!-- 댓글 한개 끝 -->

                    <div class="comment-area-box media mt-5">
                        <img alt="" src="../resources/blog/images/blog-user-3.jpg"
                             class="mt-2 img-fluid float-left mr-3">

                        <div class="media-body ml-4">
                            <h4 class="mb-0 ">John Doe </h4>
                            <span class="date-comm font-sm text-capitalize text-color"><i class="ti-time mr-2"></i>June 7, 2019 </span>

                            <div class="comment-content mt-3">
                                <p>Some consultants are employed indirectly by the client via a consultancy staffing
                                    company. </p>
                            </div>
                            <div class="comment-meta mt-4 mt-lg-0 mt-md-0">
                                <a href="#" class="text-underline">Reply</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 댓글 보여주기 끝 -->

                <!-- 댓글 작성 -->
                <!-- 로그인 한 상태일때만 폼 보이게 만들어주기.. sec:authorize 사용 -->
                <sec:authorize access="isAuthenticated()">
                    <%--                <form class="comment-form mb-5 gray-bg p-5" id="comment-form" action="/reply/add" method="post">--%>
                    <div class="comment-form mb-5 gray-bg p-5" id="comment-form">
                        <h3 class="mb-4 text-center">Leave a comment</h3>
                        <div class="row">
                            <div class="col-lg-12">
                            <textarea class="form-control mb-3" name="R_REPLY" id="comment" cols="30" rows="5"
                                      placeholder="Comment"></textarea>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                        <%--                                <input class="form-control" type="hidden" name="U_ID" id="name" value='<sec:authentication property="principal.username"/>'/>--%>
                                    <input class="form-control" type="hidden" name="U_ID" id="name"
                                           value="<sec:authentication property="principal.member.name"/>"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                        <%-- <input class="form-control" type="text" name="mail" id="mail" placeholder="Email:">--%>
                                </div>
                            </div>
                        </div>

                        <input class="btn btn-primary" type="submit" name="submit-contact" id="submit_contact"
                               value="Submit Message">
                    </div>
                    <%--                </form>--%>
                </sec:authorize>
                <!-- 댓글 작성 끝 -->

            </div>
            <!-- 본문+댓글 div 끝 -->


            <!-- 우측 사이드바 개념. 유저 정보 -->
            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
                <div class="sidebar sidebar-right">
                    <div class="sidebar-wrap mt-5 mt-lg-0">
                        <div class="sidebar-widget about mb-5 text-center p-3">
                            <div class="about-author">
                                <img src="../resources/blog/images/author.jpg" alt="" class="img-fluid">
                            </div>
                            <h4 class="mb-0 mt-4">Liam Mason</h4>
                            <p>Travel Blogger</p>
                            <p>I'm Liam, last year I decided to quit my job and travel the world. You can follow my
                                journey on this blog!</p>
                            <img src="../resources/blog/images/liammason.png" alt="" class="img-fluid">
                        </div>

                        <div class="sidebar-widget follow mb-5 text-center">
                            <h4 class="text-center widget-title">Follow Me</h4>
                            <div class="follow-socials">
                                <a href="#"><i class="ti-facebook"></i></a>
                                <a href="#"><i class="ti-twitter"></i></a>
                                <a href="#"><i class="ti-instagram"></i></a>
                                <a href="#"><i class="ti-youtube"></i></a>
                                <a href="#"><i class="ti-pinterest"></i></a>
                            </div>
                        </div>

                        <!-- 인기글 노출 -->
                        <div class="sidebar-widget mb-5 ">
                            <h4 class="text-center widget-title">Trending Posts</h4>

                            <div class="sidebar-post-item-big">
                                <a href="blog-single.html"><img src="../resources/blog/images/news/img-1.jpg" alt=""
                                                                class="img-fluid"></a>
                                <div class="mt-3 media-body">
                                    <span class="text-muted letter-spacing text-uppercase font-sm">September 10, 2019</span>
                                    <h4><a href="../resources/blog/blog-single.html">Meeting With Clarissa, Founder Of
                                        Purple Conversation App</a></h4>
                                </div>
                            </div>

                            <div class="media border-bottom py-3 sidebar-post-item">
                                <a href="#"><img class="mr-4" src="../resources/blog/images/news/thumb-1.jpg"
                                                 alt=""></a>
                                <div class="media-body">
                                    <span class="text-muted letter-spacing text-uppercase font-sm">September 10, 2019</span>
                                    <h4><a href="../resources/blog/blog-single.html">Thoughtful living in los
                                        Angeles</a></h4>
                                </div>
                            </div>

                            <div class="media py-3 sidebar-post-item">
                                <a href="#"><img class="mr-4" src="../resources/blog/images/news/thumb-2.jpg"
                                                 alt=""></a>
                                <div class="media-body">
                                    <span class="text-muted letter-spacing text-uppercase font-sm">September 10, 2019</span>
                                    <h4><a href="../resources/blog/blog-single.html">Vivamus molestie gravida
                                        turpis.</a></h4>
                                </div>
                            </div>
                        </div>
                        <!-- 인기글 노출 끝 -->

                        <!-- 카테고리 노출 (삭제 예정) -->
                        <div class="sidebar-widget category mb-5">
                            <h4 class="text-center widget-title">Catgeories</h4>
                            <ul class="list-unstyled">
                                <li class="align-items-center d-flex justify-content-between">
                                    <a href="#">Innovation</a>
                                    <span>14</span>
                                </li>
                                <li class="align-items-center d-flex justify-content-between">
                                    <a href="#">Software</a>
                                    <span>2</span>
                                </li>
                                <li class="align-items-center d-flex justify-content-between">
                                    <a href="#">Social</a>
                                    <span>10</span>
                                </li>
                                <li class="align-items-center d-flex justify-content-between">
                                    <a href="#">Trends</a>
                                    <span>5</span>
                                </li>
                            </ul>
                        </div>

                        <!-- newletter 항목. 구독개념. 삭제예정 -->
                        <div class="sidebar-widget subscribe mb-5">
                            <h4 class="text-center widget-title">Newsletter</h4>
                            <input type="text" class="form-control" placeholder="Email Address">
                            <a href="#" class="btn btn-primary d-block mt-3">Sign Up</a>
                        </div>

                        <!-- 광고 사진 -->
                        <div class="sidebar-widget sidebar-adv mb-5">
                            <a href="#"><img src="../resources/blog/images/sidebar-banner3.png" alt=""
                                             class="img-fluid w-100"></a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!--footer start-->
<%--<footer class="footer-section bg-grey">--%>
<%--    <div class="instagram-photo-section">--%>
<%--        <div class="container">--%>
<%--            <div class="row">--%>
<%--                <div class="col-lg-12">--%>
<%--                    <h4 class="text-center">Follow in Instagram</h4>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="row no-gutters" id="instafeed">--%>

<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    </div>--%>

<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-lg-12 text-center">--%>
<%--                <div class="mb-4">--%>
<%--                    <h2 class="footer-logo">Revolve.</h2>--%>
<%--                </div>--%>
<%--                <ul class="list-inline footer-socials">--%>
<%--                    <li class="list-inline-item"><a href="#"><i class="ti-facebook mr-2"></i>Facebook</a></li>--%>
<%--                    <li class="list-inline-item"><a href="#"><i class="ti-twitter mr-2"></i>Twitter</a></li>--%>
<%--                    <li class="list-inline-item"><a href="#"><i class="ti-linkedin mr-2"></i>Linkedin</a></li>--%>
<%--                    <li class="list-inline-item"><a href="#"><i class="ti-pinterest mr-2"></i>Pinterest</a></li>--%>
<%--                    <li class="list-inline-item"><a href="#"><i class="ti-github mr-2"></i>Github</a></li>--%>
<%--                    <li class="list-inline-item"><a href="#"><i class="ti-instagram mr-2"></i>Instrgram</a></li>--%>
<%--                    <li class="list-inline-item"><a href="#"><i class="ti-rss mr-2"></i>rss</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>

<%--            <div class="col-md-12 text-center">--%>
<%--                <p class="copyright">© Copyright 2019 - Revolve. All Rights Reserved.</p>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</footer>--%>
<!--footer end-->

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
    $(document).ready(function () {
        let bnoVal = '${blog.b_NO}';
        console.log("bnoVal: " + bnoVal);

        showReplyList();

        function showReplyList() {
            console.log("함수 시작...");
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/reply/list/" + bnoVal + ".json",
                // url: "/reply/list/" + bnoVal + ".json",
                data: {bno: bnoVal},
                success: function (result) {
                    console.log(result);
                    console.log("댓글 목록 가져오기 성공");

                    makeList(result);
                },
                error: function (e) {
                    console.log(e);
                    console.log("댓글 목록 가져오기 실패");
                }
            })
        }


        // let replyContainer = $(".reply-container");
        let replyContainer = $(".comment-area");

        function makeList(result) {
            console.log('makeList()...');
            console.log(result);
            console.log('result.length : ' + result.length);

            if (result == null || result.length == 0) {
                console.log('댓글이 없습니다.');
                replyContainer.html('<p class="text-center">댓글이 없습니다.</p>');
                return;
            }

            let str = "";
            for (let i = 0; i < result.length; i++) {
                str += '<div class="media mb-4">';
                str += '<img class="d-flex mr-3 rounded-circle" src="../resources/blog/images/user.png" alt="">';
                str += '<div class="media-body">';
                // <a href="/blog/usermain?u_id=${blog.u_ID}" title="" rel="author" class="text-capitalize">${blog.u_ID}</a>
                str += '<h5 class="mt-0">작성자 : <a href="/blog/usermain?u_id=' + result[i].U_ID + '" title="" rel="author" class="text-capitalize">' + result[i].U_ID + '</a></h5>';
                str += '댓글내용 : ' + result[i].R_REPLY;
                str += '</div>';
                str += '</div>';

            }
            replyContainer.html(str);
        }

        $("#submit_contact").on("click", function () {
            console.log("댓글 등록 버튼 클릭");

            //text area id= comment
            let replyVal = $("#comment").val();
            let replyer = $("#name").val();
            console.log("replyVal : " + replyVal);
            console.log("replyer : " + replyer);

            let reqData = {
                B_NO: bnoVal,
                U_ID: replyer,
                R_REPLY: replyVal
            };

            console.log("reqData : " + reqData);
            console.log(reqData);
            console.log("reqData.b_no : " + reqData.B_NO);
            console.log("reqData.u_id : " + reqData.U_ID);
            console.log("reqData.r_reply : " + reqData.R_REPLY);

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/reply/add",
                data: JSON.stringify(reqData),
                contentType: "application/json; charset=utf-8",
                // contentType: "application/json",
                dataType: "text",
                //post 방식 시큐리티 위해 추가
                //요청을 날리기 전에.. 명령어 beforeSend
                // beforeSend: function (xhr) {
                //     xhr.setRequestHeader(header, token);
                // },
                success: function (result, status, xhr) {
                    console.log("ajax 요청 성공!");
                    console.log(result);
                    console.log(status);
                    //xhr...?

                    //작성 성공시 다시 보여주기 위해서
                    showReplyList();

                    //댓글 등록 후 input 공백으로 만들어주기
                    $("#reply").val("");
                    // $("#replyer").val("");
                },
                error: function (e) {
                    console.log("ajax 요청 실패")
                    console.log(e);
                }

            });

        })

    })
</script>
<div>
    <h1>?????</h1>
</div>
<%--footer--%>
<jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
<%--</body>--%>
<%--</html>--%>
