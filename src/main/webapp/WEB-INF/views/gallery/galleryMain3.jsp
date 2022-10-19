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


    <!-- Pagination -->
<%--    <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">--%>
<%--                  <nav aria-label="Table navigation">--%>
<%--                    <ul class="inline-flex items-center">--%>
<%--                        <c:if test="${pager.prev}">--%>
<%--                      <li>--%>
<%--                          <a href="/admin/gallery?pageNum=${pager.startPage-1}&listQty=10">Before </a>--%>

<%--                      </li>--%>
<%--                        </c:if>--%>
<%--                        <c:forEach var="num" begin="${pager.startPage}" end="${pager.endPage}" step="1">--%>
<%--                            <a href="/admin/gallery?pageNum=${num}&listQty=10"--%>
<%--                               class=" ${pager.cri.pageNum==num?"px-3 py-1 text-white transition-colors duration-150 bg-purple-600 border border-r-0 border-purple-600 rounded-md focus:outline-none focus:shadow-outline-purple":"px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"}">${num}</a>--%>
<%--                        </c:forEach>--%>
<%--                        <c:if test="${pager.next}">--%>
<%--                      <li>--%>

<%--                          <a href="/admin/gallery?pageNum=${pager.endPage+1}&listQty=10">After </a>--%>
<%--                      </li>--%>
<%--                        </c:if>--%>
<%--                    </ul>--%>
<%--                  </nav>--%>
<%--                </span>--%>


<%--    <form id="pagingForm" action="/gallery/main">--%>
<%--        <input type="hidden" name="pageNum" value="${pager.cri.pageNum}"/>--%>
<%--        <input type="hidden" name="listQty" value="${pager.cri.listQty}"/>--%>
<%--        <input type="hidden" name="sel" value="${pager.cri.sel}"/>--%>
<%--        <input type="hidden" name="keyword" value="${pager.cri.keyword}"/>--%>
<%--    </form>--%>
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