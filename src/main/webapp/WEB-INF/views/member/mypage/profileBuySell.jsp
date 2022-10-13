<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<div class="gallery__page">
    <div class="gallery__warp">
        <div style="font-size: 50px; font-weight: 800;">구매 · 판매내역</div>
        <hr>

        <div style="display: flex; justify-content: space-between;">
            <button type="button" class="profileBtn2" onclick="window.location.href='/member/mypage/deleteCart'">삭제</button>
            <select>
                <option>구매내역</option>
                <option>판매내역</option>
            </select>
        </div>
        <br/>

        <table class="member">
            <tr>
                <th style="width: 20px;"><input type="checkbox" name="chk" onclick="checkAll(this)" style="width: 20px;"/></th>
                <th style="width: 80px;">번호</th>
                <th>사진</th>
                <th>구매자</th>
                <th>판매자</th>
                <th>가격</th>
                <th>구매일자</th>
            </tr>
            <c:set var="tot" value="${0}"/>
            <c:forEach items="${list}" var="buyDTO">
                <tr>
                    <td><input type="checkbox" name="chk" style="width: 20px;"/></td>
                    <td>${buyDTO.o_no}</td>
                    <td>${buyDTO.g_no}</td>
                    <td>${buyDTO.o_buyer}</td>
                    <td>${buyDTO.o_seller}</td>
                    <td>${buyDTO.o_price}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${buyDTO.o_reg}"/></td>
                </tr>
            </c:forEach>
        </table>
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
