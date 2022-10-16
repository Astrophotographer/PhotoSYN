<%--
  Created by IntelliJ IDEA.
  User: hisung-ah
  Date: 2022-10-16
  Time: PM 8:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</head>
<body>
<form action="/member/mypage/profileImgModify" method="post" enctype="multipart/form-data">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div style="padding: 15px;">
        <input type="file" id="uploadFile" name="uploadFile">
        <button type="submit">업로드</button>
    </div>
</form>
</body>
</html>
