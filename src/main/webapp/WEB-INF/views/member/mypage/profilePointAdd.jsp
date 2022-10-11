<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<div class="gallery__page">
    <div class="gallery__warp">
        <div style="font-size: 50px; font-weight: 800;">포인트 충전</div>
        <hr>
        <form action="/member/pointCharge" method="post" name="updatePoint" th:object="${member}">
            <input type="hidden" name="memberId" id="memberId" th:value="${member.memberId}">
            <input type="hidden" name="pointType" id="pointType" value="포인트 충전">

            <div class="form-check">
                <input class="form-check-input" type="radio" id="50000" name="pointPoint" th:value="50000" checked>
                <label class="form-check-label" for="50000">
                    50000p
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="pointPoint" id="100000" th:value="100000">
                <label class="form-check-label" for="100000">
                    100000p
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" id="200000" name="pointPoint" th:value="200000" checked>
                <label class="form-check-label" for="200000">
                    200000p
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="pointPoint" id="500000" th:value="500000">
                <label class="form-check-label" for="500000">
                    500000p
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="pointPoint" id="1000000" th:value="1000000">
                <label class="form-check-label" for="1000000">
                    1000000p
                </label>
            </div>

            <input class="btn btn-outline-danger" type="button" onclick="requestPay()" value="결제하기">
        </form>
    </div>
</div>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>