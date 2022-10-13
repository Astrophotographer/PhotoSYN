<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<div class="gallery__page">
    <div class="gallery__warp">
        <div style="font-size: 50px; font-weight: 800;">포인트 충전</div>
        <hr>
        <form action="/member/mypage/profilePointAddPro" method="POST" name="updatePoint">
            <sec:authentication property="principal" var="princi"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="point" id="point"/>
            <div>
                <select id="money" name="money">
                    <option value="5000">5,000P</option>
                    <option value="7000">7,000P</option>
                    <option value="10000">10,000P</option>
                    <option value="30000">30,000P</option>
                    <option value="50000">50,000P</option>
                    <option value="100000">100,000P</option>
                    <option value="500000">500,000P</option>
                    <option value="1000000">1,000,000P</option>
                </select>
            </div>
            <button class="profileBtn2" type="button" id="check_module" style="width: 80px">결제하기</button>
        </form>
    </div>
</div>

<script>
    $("#check_module").click(function () {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp23568852');
        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        // ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안 그러면 결제창이 안뜹니다.
        IMP.request_pay({
            pg          : 'kakao',
            pay_method  : 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            /*
             *  merchant_uid에 경우
             *  https://docs.iamport.kr/implementation/payment
             *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
             */
            name: '포인트 충전',
            // 결제창에서 보여질 이름
            amount    : document.getElementById("money").value,
            buyer_name: '${princi.member.name}',
            // 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
            // 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '결제 금액 : ' + rsp.paid_amount;
                document.getElementById('point').value = rsp.paid_amount;
                updatePoint.submit();
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
    });

    var msg2 = '${notPoint}';
    if (msg2 === "포인트가 부족합니다.") {
        alert("포인트가 부족합니다.");
    }
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>