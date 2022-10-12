<%--
  Created by IntelliJ IDEA.
  User: pmwkd
  Date: 2022-10-11
  Time: 오전 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>BlogTestPost</title>
</head>
<body>
<h1>blogTestPost</h1>
<c:forEach var="tag" items="${tagArr}">
    <p>#${tag}</p>
</c:forEach>
</body>
</html>
