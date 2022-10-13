<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<div class="gallery__page">
    <div class="gallery__warp">
        <div style="font-size: 50px; font-weight: 800;">장바구니</div>
        <hr>
        <div style="display: flex; justify-content: space-between;">
            <button type="button" class="profileBtn2" onclick="window.location.href='/member/mypage/deleteCart'">삭제</button>
        </div>
        <br/>

        <table class="member">
            <tr>
                <th style="width: 20px;"><input type="checkbox" name="chk" onclick="checkAll(this)" style="width: 20px;"/></th>
                <th style="width: 80px;">상품번호</th>
                <th>사진</th>
                <th>일자</th>
                <th>가격</th>
            </tr>
            <c:set var="tot" value="${0}"/>
            <c:forEach items="${list}" var="cartDTO">
                <tr>
                    <td><input type="checkbox" name="chk" style="width: 20px;"/></td>
                    <td>${cartDTO.c_id}</td>
                    <td>${cartDTO.c_hName}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${cartDTO.c_reg}"/></td>
                    <td>${cartDTO.c_hPrice}</td>
                </tr>
            </c:forEach>
        </table>
        <br/>
        <div style="text-align: right;">
            <button class="profileBtn2" type="button" style="width: 70px;">주문하기</button>
        </div>
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
