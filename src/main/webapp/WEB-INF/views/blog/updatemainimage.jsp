<%--
  Created by IntelliJ IDEA.
  User: pmwkd
  Date: 2022-10-05
  Time: 오후 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>updatemainimage</title>
</head>
<body>
<h1>updatemainimage</h1>
<jsp:include page="/WEB-INF/views/includes/header.jsp"/>
<c:set var="i" value="${1}"/>

<form action="/blog/updatemainimage" method="get">
    <input type="hidden" name="b_no" value="${b_no}"/>
    b_no : ${b_no}
    <br>

    <c:forEach var="templists" items="${templist}">
        ${templists} <br>
        ${templists.BIT_NAME} <br>
        <img src="/blog/write/ckImgSubmit.do?uid=${templists.BIT_UUID}&amp;fileName=${templists.BIT_ORIGINNAME}"
             style="height:133px; width:100px"/>
        <input type="radio" name="UUID" value="${templists.BIT_UUID}">${i}
        <c:set var="i" value="${i+1}"/>
        <br>
    </c:forEach>

    <c:forEach var="imglists" items="${imglist}">
        ${imglists} <br>
        ${imglists.BI_NAME} <br>
        <img src="/blog/write/ckImgSubmit.do?uid=${imglists.BI_UUID}&amp;fileName=${imglists.BI_ORIGINNAME}"
             style="height:133px; width:100px"/>
        <input type="radio" name="UUID" value="${imglists.BI_UUID}">${i}
        <c:set var="i" value="${i+1}"/>
        <br>
    </c:forEach>
    <br>
    <input type="submit" value="선택">
</form>

<%--footer--%>
<jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
<%--</body>--%>
<%--</html>--%>
