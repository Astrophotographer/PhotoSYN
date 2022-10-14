<%--
  Created by IntelliJ IDEA.
  User: chris
  Date: 2022/10/14
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>main2</title>
</head>
<body>
    <c:forEach items="${list}" var="gallery">
        <h1>${gallery.MT_NAME}</h1>
        <img src="/resources/gallery/images/${gallery.g_HNAME}" />
        <br />

    </c:forEach>



</body>
</html>
