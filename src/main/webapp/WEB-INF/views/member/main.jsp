<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<%@ include file="../includes/header.jsp" %>
<body>
<br/><br/>
<div>

    <sec:authorize access="isAuthenticated()">
        <h1>로그인됨</h1>
        <p>principal : <sec:authentication property="principal"/></p>
        <p>MemberDTO : <sec:authentication property="principal.member"/></p>
        <p>사용자 이름 : <sec:authentication property="principal.member.name"/></p>
        <p>사용자 아이디 : <sec:authentication property="principal.username"/></p>
        <p>사용자 권한 리스트 : <sec:authentication property="principal.member.authDTOList"/></p>
    </sec:authorize>

    <sec:authorize access="isAnonymous()">
        <h1>로그인 안됨</h1>
    </sec:authorize>

</div>
<br/><br/>
</body>
</html>