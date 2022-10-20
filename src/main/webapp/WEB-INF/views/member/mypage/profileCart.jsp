<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<div class="gallery__page">
    <div class="gallery__warp">
        <div style="font-size: 50px; font-weight: 800;">장바구니</div>
        <hr>
        <div style="display: flex; justify-content: space-between;">
            <button class="btn btn-outline-danger" type="button" onclick="deleteValue();">삭제</button>
        </div>
        <br/>

        <table class="member">
            <tr>
                <th style="width: 20px;"><input id="allCheck" type="checkbox" name="allCheck" style="width: 20px;"/></th>
                <th style="width: 80px;">상품번호</th>
                <th>사진</th>
                <th>일자</th>
                <th>가격</th>
            </tr>
            <c:set var="tot" value="${0}"/>
            <c:forEach items="${list}" var="cartDTO">
                <tr>
                    <td><input name="RowCheck" type="checkbox" style="width: 20px;" value="${cartDTO.g_no}"/></td>
                    <td>${cartDTO.g_no}</td>
                    <td>
                        <input type="hidden" value="${cartDTO.c_hName}"/>
                        <img src="/resources/gallery/images/${cartDTO.c_hName}" width="220px" height="150">
                    </td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${cartDTO.c_reg}"/></td>
                    <td>${cartDTO.c_hPrice}</td>
                </tr>
            </c:forEach>
        </table>
        <br/>
        <div>
            <button class="profileBtn2" style="width: 80px" onclick="orderValue();">구매하기</button>
        </div>
    </div>
</div>

<script>
    $(function () {
        var chkObj = document.getElementsByName("RowCheck");
        var rowCnt = chkObj.length;

        $("input[name='allCheck']").click(function () {
            var chk_listArr = $("input[name='RowCheck']");
            for (var i = 0; i < chk_listArr.length; i++) {
                chk_listArr[i].checked = this.checked;
            }
        });
        $("input[name='RowCheck']").click(function () {
            if ($("input[name='RowCheck']:checked").length == rowCnt) {
                $("input[name='allCheck']")[0].checked = true;
            } else {
                $("input[name='allCheck']")[0].checked = false;
            }
        });
    });

    function deleteValue() {
        var url = "deleteCart";
        var valueArr = new Array();
        var list = $("input[name='RowCheck']");

        for (var i = 0; i < list.length; i++) {
            // 선택되어 있으면 배열에 값을 저장함
            if (list[i].checked) {
                valueArr.push(list[i].value);
            }
        }
        if (valueArr.length == 0) {
            alert("선택된 상품이 없습니다.");
        } else {
            var header = $("meta[name='_csrf_header']").attr("content");
            var token = $("meta[name='_csrf']").attr("content");
            var chk = confirm("삭제하시겠습니까?");

            if (chk == true) {
                $.ajax({
                    url        : url,
                    type       : 'POST',
                    traditional: true,
                    data       : {
                        valueArr: valueArr
                    },
                    beforeSend : function (xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    success    : function (jdata) {
                        if (jdata = 1) {
                            alert("삭제 완료");
                            location.replace("profileCart");
                        } else {
                            alert("삭제 실패");
                        }
                    }
                });
            } else {
                alert("삭제 취소");
            }
        }
    }

    function orderValue() {
        var url = "galleryBuyBtn";
        var valueArr = new Array();
        var list = $("input[name='RowCheck']");

        for (var i = 0; i < list.length; i++) {
            // 선택되어 있으면 배열에 값을 저장함
            if (list[i].checked) {
                valueArr.push(list[i].value);
            }
        }
        if (valueArr.length == 0) {
            alert("선택된 상품이 없습니다.");
        } else {
            var header = $("meta[name='_csrf_header']").attr("content");
            var token = $("meta[name='_csrf']").attr("content");
            var chk = confirm("구매하시겠습니까?");

            if (chk == true) {
                $.ajax({
                    url        : url,
                    type       : 'POST',
                    traditional: true,
                    data       : {
                        valueArr: valueArr
                    },
                    beforeSend : function (xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    success    : function (jdata) {
                        if (jdata = 1) {
                            alert("구매 완료");
                            location.replace("profileCart");
                        } else {
                            alert("구매 실패");
                        }
                    },
                    error      : function (e) {
                        alert("실패");
                    }
                });
            } else {
                alert("구매 취소");
            }
        }
    }

    var msg1 = '${notPoint}';
    if (msg1 === "포인트가 부족합니다.") {
        alert("포인트가 부족합니다.");
    }


</script>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
