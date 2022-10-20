<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<div class="gallery__page">
    <div class="gallery__warp">
        <div style="font-size: 50px; font-weight: 800;">글 관리</div>
        <hr>
        <div style="display: flex; justify-content: space-between;">
            <h3>갤러리</h3>
            <sec:authentication property="principal" var="princi"/>
            <select onchange="if(this.value) location.href=(this.value);">
                <option value="/member/mypage/profileGallery">갤러리</option>
                <option value="/member/mypage/profileBlog">블로그</option>
            </select>
        </div>
        <br/>
        <div>
            <button class="btn btn-outline-danger" type="button" onclick="hideValue();" style="width: 70px;">숨김</button>
            <button class="btn btn-outline-danger" type="button" onclick="hideClearValue();" style="width: 70px;">해제</button>
        </div>
        <br/>
        <table class="member">
            <tr>
                <th style="width: 20px;"><input id="allCheck" type="checkbox" name="allCheck" style="width: 20px;"/></th>
                <th style="width: 80px;">번호</th>
                <th>사진</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>가격</th>
                <th>다운로드 수</th>
                <th>상태</th>
            </tr>
            <c:forEach items="${list}" var="galleryDTO">
                <tr>
                    <td><input name="RowCheck" type="checkbox" style="width: 20px;" value="${galleryDTO.g_NO}"/></td>
                    <td>${galleryDTO.g_NO}</td>
                    <td><img src="/resources/gallery/images/${galleryDTO.g_HNAME}" width="100"></td>
                    <td>${galleryDTO.u_ID}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${galleryDTO.g_REG}"/></td>
                    <td>${galleryDTO.g_HPRICE}</td>
                    <td>1</td>
                    <c:if test="${galleryDTO.g_STATUS == 0}">
                        <td>판매중</td>
                    </c:if>
                    <c:if test="${galleryDTO.g_STATUS == 2}">
                        <td>숨김처리</td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
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

    function hideValue() {
        var url = "profileGalleryStatus1";    // Controller로 보내고자 하는 URL
        var valueArr = new Array();
        var list = $("input[name='RowCheck']");

        for (var i = 0; i < list.length; i++) {
            if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
                valueArr.push(list[i].value);
            }
        }
        if (valueArr.length == 0) {
            alert("선택된 갤러리가 없습니다.");
        } else {
            var header = $("meta[name='_csrf_header']").attr("content");
            var token = $("meta[name='_csrf']").attr("content");
            var chk = confirm("숨김 처리하시겠습니까?");

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
                            alert("숨김 처리하였습니다.");
                            location.replace("profileGallery");
                        } else {
                            alert("숨김 실패");
                        }
                    }
                });
            } else {
                alert("숨김 취소");
            }
        }
    }

    function hideClearValue() {
        var url = "profileGalleryStatus2";
        var valueArr = new Array();
        var list = $("input[name='RowCheck']");

        for (var i = 0; i < list.length; i++) {
            // 선택되어 있으면 배열에 값을 저장함
            if (list[i].checked) {
                valueArr.push(list[i].value);
            }
        }
        if (valueArr.length == 0) {
            alert("선택된 갤러리가 없습니다.");
        } else {
            var header = $("meta[name='_csrf_header']").attr("content");
            var token = $("meta[name='_csrf']").attr("content");
            var chk = confirm("숨김 해제하시겠습니까?");

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
                            alert("판매중으로 전환하였습니다.");
                            location.replace("profileGallery");
                        } else {
                            alert("실패");
                        }
                    }
                });
            } else {
                alert("해제 취소");
            }
        }
    }
</script>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>