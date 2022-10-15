<%--
  Created by IntelliJ IDEA.
  User: pmwkd
  Date: 2022-10-15
  Time: 오전 3:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="admin_include/adminheader.jsp" flush="false"/>

<h1>Admin GALLERY</h1>

<!-- 갤러리 리스트 및 어드민관리 페이지 -->

<c:forEach var="gallery" items="${galleryDTOList}">
    <table>
        <tr>
            <td>${gallery.g_NO}</td>
        </tr>
    </table>
</c:forEach>
----
<%--<c:forEach var="pages" items="${pager}">--%>
<%--    ${pages}--%>
<%--</c:forEach>--%>

</body>
</html>
