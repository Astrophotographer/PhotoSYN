<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>


<style>
    .main_title {
        margin: 1rem auto;
        text-align: center;
    }

    .main_list {
        width: 700px;
        margin: 0 auto;
    }

    .list_start {
        text-align: center;
    }

    .list_detail {
        display: inline-block;
        width: 220px;
        height: 260px;
        /*border: 1px solid;*/
        margin-bottom: 5px;
    }

    .paging_start {
        text-align: center;
    }


</style>


<div class="main_list">
    <!-- 상단 제목 -->
    <div class="main_title">

        <div align="right">
            <button type="button" onclick="location.href='/gallery/uploadForm'">글 작성</button>
        </div>
    </div>
    <!-- 리스트 -->
    <div class="list_start">

        <c:forEach var="gallery" items="${list}">

            <div class="list_detail">

                <a href="/gallery/gallerySingle?G_NO=${gallery.g_NO}">
                    <img src="/resources/gallery/images/${gallery.g_HNAME}"
                         width="220px" height="150"/>
                </a>

                <div class="btn btn-dark product-cart-btn" data-gno="${gallery.g_NO}">
                    <a>
                        장바구니에 담기
                    </a>
                </div>

            </div>

        </c:forEach>
    </div>

    <div class="row float-right">
        <div class="col-sm-12 col-md-7">
            <ul class="pagination">
                <c:if test="${pager.prev}">
                    <li class="page-item">
                        <a class="page-link" href="${pager.startPage-1}" tabindex="-1">Prev</a>
                    </li>
                </c:if>
                <c:forEach var="num" begin="${pager.startPage}" end="3">
                    <li class="page-item ${pager.cri.pageNum == num ? "active":""}">
                        <a class="page-link" href="/gallery/main?pageNum=${num}">${num}</a>
                    </li>
                </c:forEach>
                <c:if test="${pager.next}">
                    <li class="page-item">
                        <a class="page-link" href="${pager.endPage + 1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>

<br/><br/><br/>


<script>
    $(document).ready(function(){
        // 카트 추가 이벤트 처리
        $(".product-cart-btn").on("click", function (e) {
            let gnoVal = $(this).data('gno');
            console.log("gnoVal: " + gnoVal);

            var header = $("meta[name='_csrf_header']").attr("content");
            var token = $("meta[name='_csrf']").attr("content");
            $.ajax({
                type: "POST",
                url: "/member/mypage/insertCart",
                data: {G_NO: gnoVal},
                beforeSend: function(xhr){
                    xhr.setRequestHeader(header, token);   // 헤드의 csrf meta태그를 읽어 CSRF 토큰 함께 전송
                },
                success: function (result) {
                    console.log(result);
                    if(result == 'success'){
                       alert("장바구니 담기 성공");
                    }
                },
                error: function (e) {
                    console.log(e);
                    console.log("장바구니 담기 실패");
                }
            })
        })// 카트 추가 끝


    }); // ready 끝

</script>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>