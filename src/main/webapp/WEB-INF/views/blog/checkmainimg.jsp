<%--
  Created by IntelliJ IDEA.
  User: pmwkd
  Date: 2022-09-29
  Time: 오전 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Main img Chk</title>
</head>
<body>
<div>
    <h1>이미지 체크</h1>
    <c:forEach var="img" items="${imgs}">
        이미지정보 : ${img} <br>
        ${img.BI_NAME} <br>
<%--        <img src="${img}" alt="img" width="100" height="100">--%>

        <p><img alt="" src="/blog/write/ckImgSubmit.do?uid=${img.BI_UUID}&amp;fileName=${img.BI_ORIGINNAME}" style="height:133px; width:100px" /></p>
        <br>
    </c:forEach>
</div>

</body>
</html>
