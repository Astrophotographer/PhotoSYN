<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<div class="gallery__page">
    <div class="gallery__warp">
        <div style="font-size: 50px; font-weight: 800;">구매 · 판매내역</div>
        <hr>
        <div style="display: flex; justify-content: space-between;">
            <h3>판매내역</h3>
            <select onchange="if(this.value) location.href=(this.value);">
                <option value="/member/mypage/profileSell">판매내역</option>
                <option value="/member/mypage/profileBuy">구매내역</option>
            </select>
        </div>
        <br/>

        <table class="member">
            <tr>
                <th style="width: 80px;">번호</th>
                <th>사진</th>
                <th>판매자</th>
                <th>가격</th>
                <th>판매일자</th>
            </tr>
            <c:forEach items="${list}" var="buyDTO">
                <tr>
                    <td>${buyDTO.o_no}</td>
                    <td>${buyDTO.g_hName}</td>
                    <td>${buyDTO.o_seller}</td>
                    <td>${buyDTO.o_price}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${buyDTO.o_reg}"/></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<div class="row float-right">
    <div class="col-sm-12 col-md-7">
        <ul class="pagination">
            <c:if test="${pager.prev}">
                <li class="page-item">
                    <a class="page-link" href="${pager.startPage-1}" tabindex="-1">Prev</a>
                </li>
            </c:if>
            <c:forEach var="num" begin="${pager.startPage}" end="${pager.endPage}">
                <li class="page-item ${pager.cri.pageNum == num ? "active":""}">
                    <a class="page-link" href="/member/mypage/profileSell?pageNum=${num}">${num}</a>
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

<script>
    function checkAll(checkAll) {
        let checkboxes = document.getElementsByName("chk");
        console.log(checkboxes);
        checkboxes.forEach((checkbox) => {
            console.log(checkbox);
            checkbox.checked = checkAll.checked;
        })
    }
</script>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
