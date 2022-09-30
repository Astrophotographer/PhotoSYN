
<%--
  Created by IntelliJ IDEA.
  User: pmwkd
  Date: 2022-09-27
  Time: 오후 7:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Blog Editor</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/testEditor/ckeditor/ckeditor.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<%-- 헤더 수정하기.. 임시로 test 를 줌--%>
<jsp:include page="/WEB-INF/views/includes/test.jsp"/>

<form class="form-horizontal" role="form" id="editorForm" method="post" action="/blog/checkmainimg">
    <div class="form-group">
        <div class="form-group">
            <div class="col-lg-12">
                <label>
                    제목<input type="text" name="B_SUBJECT">
                </label>
                <label for="ckeditor"></label><textarea name="B_CONTENT" id="ckeditor"></textarea>
                <!-- 작성자는 원래 자동으로 들어가야 함. 임시로 넣어주기 -->
                <label>
                    작성자 : <input type="text" name="U_ID">
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
                    추가태그 : <input type="text" name="B_TAG1" placeholder="#으로 구분하여 추가해주세요. 예시 #고양이" width="200">
                </label>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12" align="right">
                <button type="submit" class="btn btn-default">저장</button>
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
                filebrowserUploadUrl: '/blog/write'
            });
    });
</script>


</body>
</html>
