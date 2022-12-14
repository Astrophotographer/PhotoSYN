<%--
  Created by IntelliJ IDEA.
  User: pmwkd
  Date: 2022-10-04
  Time: 오전 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Blog Modify</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/testEditor/ckeditor/ckeditor.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<%-- 헤더 수정하기.. 임시로 test 를 줌--%>
<%--<jsp:include page="/WEB-INF/views/includes/test.jsp"/>--%>
<jsp:include page="/WEB-INF/views/includes/header.jsp"/>

<%--<form class="form-horizontal" role="form" id="editorForm" method="post" action="/blog/update.do">--%>
<form class="form-horizontal" role="form" id="editorForm" action="#">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <div class="form-group">
        <div class="form-group">
            <div class="col-lg-12">
                <label>
                    제목<input type="text" name="B_SUBJECT" value="${blog.b_SUBJECT}">
                </label>
                <label for="ckeditor"></label><textarea name="B_CONTENT" id="ckeditor">${blog.b_CONTENT}</textarea>

                <!-- 현재 글에서 사용되고있는 사진들 한꺼번에 보여주기 -->
                <div id="imgList">
                    <c:set var="delNum" value="1"/>
                    <c:forEach items="${blog_imgs}" var="img">
                        <img src="${pageContext.request.contextPath}/resources/saveImgckImage/${img.BI_NAME}"
                             width="100px" height="100px">
                        <button onclick="confirmUpdateDeleteImage('${img.BI_NAME}', '${img.BI_UUID}', '${img.BI_ORIGINNAME}')">${delNum}번
                            사진삭제
                        </button>
                        <c:set var="delNum" value="${delNum+1}"/>
                    </c:forEach>
                </div>
                <%--                <jsp:include page="updatebottom.jsp"/>--%>

                <!-- 작성자는 원래 자동으로 들어가야 함. 임시로 넣어주기 -->
                <label>
                    작성자 : <input type="text" name="U_ID" value="${blog.u_ID}">
                </label>
                <label>
                    메인태그 :
                    <%--<input type="text" name="MT_NAME">--%>
                    <select name="MT_NAME">
                        <c:forEach items="${mainTag}" var="mainTagList">
                            <option value="${mainTagList.MT_NAME}">${mainTagList.MT_NAME}</option>
                        </c:forEach>
                    </select>
                </label>
                <label>
                    추가태그 : <input type="text" name="B_TAG1" placeholder="#으로 구분하여 추가해주세요. 예시 #고양이" width="200"
                                  value="${blog.b_TAG1}">
                </label>
                <div>
                    작성일 : ${blog.b_REG}
                    좋아요 : ${blog.b_LIKE}
                    조회수 : ${blog.b_READCOUNT}
                    신고수 : ${blog.b_REPORTCOUNT}
                </div>
                <!-- 값 넘겨주기 -->
                <div>
                    <c:if test="${blog.b_STATUS == 0}">
                        <h6>정상 상태</h6>
                        ${blog.b_STATUS} 상태입니다. 0이면 리스트에 노출중...
                    </c:if>
                    <input type="hidden" name="B_REG" value="${blog.b_REG}"/>
                    <c:if test="${blog.b_EDIT != null}">
                        <input type="hidden" name="B_EDIT" value="${blog.b_EDIT}"/>
                    </c:if>
                    <input type="hidden" name="B_LIKE" value="${blog.b_LIKE}"/>
                    <input type="hidden" name="B_READCOUNT" value="${blog.b_READCOUNT}"/>
                    <input type="hidden" name="B_REPORTCOUNT" value="${blog.b_REPORTCOUNT}"/>
                    <input type="hidden" name="B_NO" value="${blog.b_NO}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12" align="right">
                <button type="submit" data-service="update" class="btn btn-default">수정</button>
                <button type="submit" data-service="delete" class="btn btn-default">삭제하기</button>
                <button type="submit" data-service="goMain" class="btn btn-default">메인으로가기</button>
            </div>
            <div>
                <input type="hidden" name="b_no" value="${blog.b_NO}">
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">


    $(function () {
        CKEDITOR.replace('B_CONTENT',
            // name=ckeditor 인 textarea 에 에디터 입혀주기
            // CKEDITOR.replace('ckeditor',
            {
                width: '80%',
                height: '60%',
                //사진이 올라올 경우 데이터가 해당 링크로 들어가게 된다.
                filebrowserUploadUrl: '/blog/write/${_csrf.parameterName}=${_csrf.token}'
            });
    });

    //수정, 삭제, 뒤로가기 버튼 클릭시
    $(document).ready(function () {
        let formObject = $("#editorForm");

        $("button").on("click", function (e) {
            e.preventDefault();
            let type = $(this).data("service");
            let url = "/blog/update.do?_csrf=${_csrf.token}&b_no=${blog.b_NO}";
            let method = "post";

            if (type === "update") {
                url = "/blog/update.do?_csrf=${_csrf.token}&b_no=${blog.b_NO}";
                method = "post";
                console.log("수정");
                formObject.attr("action", url).attr("method", method).submit();
            } else if (type === "delete") {
                url = "/blog/delete";
                // method = "delete";
                method = "get";
                formObject.attr("action", url).attr("method", method).submit();
            } else if (type === "goMain") {
                url = "/blog/main";
                method = "get";
                formObject.attr("action", url).attr("method", method).submit();
            }

            // console.log(url);
            // console.log(method);
            // formObject.attr("action", url).attr("method", method).submit();
        });


    });

    function confirmUpdateDeleteImage(delName, uid, originName) {

        let token = $("meta[name='_csrf']").attr("content");
        let header = $("meta[name='_csrf_header']").attr("content");

        console.log("confirmUpdateDeleteImage.delName :" + delName + " uid : " + uid + " originName : " + originName);
        if (confirm("이미지를 삭제하시겠습니까?(DB및 서버에서 삭제 진행). 이미지태그 삭제는..")) {
            (() => {
                console.log("updateDeleteImage");
                console.log(delName);

                $.ajax({
                    // url: "/blog/updateDeleteImage",
                    url: "/blog/update.imagedelete",
                    type: "post",
                    data: {
                        "bi_name": delName,
                        "uid": uid,
                        "originName": originName
                    },
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    success: function (data) {
                        console.log(data);
                        //document.location.reload(true);
                        (() => {
                            $("#imgList").load(window.location.href + " #imgList");
                        })();
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });

            })();
        } else {
            alert("취소되었습니다.");
        }

    }
</script>


<%--footer--%>
<jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
<%--</body>--%>
<%--</html>--%>

