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

    <form action="/blog/checkmainimg" method="get">
        <c:set var="i" value="${1}"/>


        <c:forEach var="img" items="${imgs}">
            <br>
            <br>

            이미지정보 : ${img} <br>
            ${img.BIT_NAME} <br>
            <%--        <img src="${img}" alt="img" width="100" height="100">--%>

            <p><img alt="" src="/blog/write/ckImgSubmit.do?uid=${img.BIT_UUID}&amp;fileName=${img.BIT_ORIGINNAME}"
                    style="height:133px; width:100px"/></p>
            <br>
<%--            <input type="radio" name="mainImg" value="${i}">${i}--%>
            <input type="radio" name="UUID" value="${img.BIT_UUID}">${i}
            <%-- uuid값 여러개가 넘어감.  --%>
<%--            <input type="hidden" name="UUID" value="${img.BI_UUID}">--%>

            <c:set var="i" value="${i+1}"/>
        </c:forEach>
        <input type="submit" value="선택"/>
    </form>
</div>

</body>
</html>