<%--
  Created by IntelliJ IDEA.
  User: chris
  Date: 2022/10/14
  Time: 0:00
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/includes/header.jsp"/>


<form action="/member/mypage/galleryBuyBtn" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <button class="profileBtn2" type="submit" style="width: 100px">
        구매하기
    </button>
</form>




<div>
    <a href="/gallery/update?b_no=${gallery.g_NO}" class="btn btn-primary">수정하기</a>
    <a href="/gallery/delete?b_no=${gallery.g_NO}" class="btn btn-primary">삭제하기</a>
</div>

</body>
</html>
