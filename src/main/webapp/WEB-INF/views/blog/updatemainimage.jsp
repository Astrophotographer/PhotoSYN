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
<jsp:include page="/WEB-INF/views/includes/header.jsp"/>

<section class="pt-5 padding-bottom">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                수정후 메인으로 사용할 이미지를 골라주세요.

                <div class="row justify-content-center mt-5">
                    <div class="col-lg-12">
                        <div class="row">
                            <form action="/blog/updatemainimage" method="get">
                                <input type="hidden" name="b_no" value="${b_no}"/>
                                수정하는 글 번호 : ${b_no}

                                <%--추가한 사진이 있다면.. --%>
                                <input type="hidden" name="b_no" value="${b_no}"/>
                                b_no : ${b_no}
                                <br>
                                <c:set var="i" value="${1}"/>
                                <c:forEach var="templists" items="${templist}">

                                <br>
                                <br>

                                <div class="row">
                                    <div class="col-lg-3 col-md-6">
                                        <div class="about-widget mb-4 mb-lg-0">
                                            <img alt=""
                                                 src="/blog/write/ckImgSubmit.do?uid=${templists.BIT_UUID}&amp;fileName=${templists.BIT_ORIGINNAME}"
                                                 class="img-fluid"
                                                 style="height:133px; width:100px"/>
                                            <h4 class="mt-3">사진명 : ${templists.BIT_NAME}</h4>
                                        </div>
                                    </div>

                                    <input type="radio" name="UUID" value="${templists.BIT_UUID}"
                                           style="width:30px;height:30px;border:1px;">${i}
                                    <c:set var="i" value="${i+1}"/>
                                    <br>
                                </c:forEach>

                                    <%--원래있던 사진들 --%>
                                <c:forEach var="imglists" items="${imglist}">

                                    <div class="row">
                                        <div class="col-lg-3 col-md-6">
                                            <div class="about-widget mb-4 mb-lg-0">
                                                <img alt=""
                                                     src="/blog/write/ckImgSubmit.do?uid=${imglists.BI_UUID}&amp;fileName=${imglists.BI_ORIGINNAME}"
                                                     class="img-fluid"
                                                     style="height:133px; width:100px"/>
                                                <h4 class="mt-3">사진명 : ${imglists.BI_NAME}</h4>
                                            </div>
                                        </div>

                                        <input type="radio" name="UUID" value="${imglists.BI_UUID}"
                                               style="width:30px;height:30px;border:1px;">${i}
                                            <c:set var="i" value="${i+1}"/>

                                    <br>
                                </c:forEach>
                                <br>
                                <input type="submit" value="선택">
                            </form>

                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
</section>




<%--<form action="/blog/updatemainimage" method="get">--%>
<%--    <input type="hidden" name="b_no" value="${b_no}"/>--%>
<%--    b_no : ${b_no}--%>
<%--    <br>--%>

<%--    <c:forEach var="templists" items="${templist}">--%>
<%--        ${templists} <br>--%>
<%--        ${templists.BIT_NAME} <br>--%>
<%--        <img src="/blog/write/ckImgSubmit.do?uid=${templists.BIT_UUID}&amp;fileName=${templists.BIT_ORIGINNAME}"--%>
<%--             style="height:133px; width:100px"/>--%>
<%--        <input type="radio" name="UUID" value="${templists.BIT_UUID}">${i}--%>
<%--        <c:set var="i" value="${i+1}"/>--%>
<%--        <br>--%>
<%--    </c:forEach>--%>

<%--    <c:forEach var="imglists" items="${imglist}">--%>
<%--        ${imglists} <br>--%>
<%--        ${imglists.BI_NAME} <br>--%>
<%--        <img src="/blog/write/ckImgSubmit.do?uid=${imglists.BI_UUID}&amp;fileName=${imglists.BI_ORIGINNAME}"--%>
<%--             style="height:133px; width:100px"/>--%>
<%--        <input type="radio" name="UUID" value="${imglists.BI_UUID}">${i}--%>
<%--        <c:set var="i" value="${i+1}"/>--%>
<%--        <br>--%>
<%--    </c:forEach>--%>
<%--    <br>--%>
<%--    <input type="submit" value="선택">--%>
<%--</form>--%>

<%--footer--%>
<jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
<%--</body>--%>
<%--</html>--%>
