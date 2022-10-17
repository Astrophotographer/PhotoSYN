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
        <div style="text-align: right;">
            <button class="profileBtn2" type="button" onclick="window.location.href='/member/mypage/profileGalleryStatus'"
                    style="width: 70px;">글 숨김
            </button>
        </div>
        <br/>
        <table class="member">
            <tr>
                <th style="width: 20px;"><input type="checkbox" name="chk" onclick="checkAll(this)" style="width: 20px;"/></th>
                <th style="width: 80px;">번호</th>
                <th>사진</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>가격</th>
                <th>상태</th>
            </tr>
            <c:forEach items="${list}" var="galleryDTO">
                <tr>
                    <td><input type="checkbox" name="chk" style="width: 20px;"/></td>
                    <td>${galleryDTO.g_NO}</td>
                    <td><img src="/resources/gallery/images/${galleryDTO.g_HNAME}" width="100"></td>
                    <td>${galleryDTO.u_ID}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${galleryDTO.g_REG}"/></td>
                    <td>${galleryDTO.g_HPRICE}</td>
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