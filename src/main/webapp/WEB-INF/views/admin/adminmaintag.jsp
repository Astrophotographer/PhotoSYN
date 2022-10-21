<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: pmwkd
  Date: 2022-10-18
  Time: 오전 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<jsp:include page="admin_include/adminheader.jsp"/>

<!-- Validation inputs -->
<h4
        class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
>
    메인 태그 관리
</h4>
<div
        class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
>
    <form action="/admin/maintagupdate?_csrf=${_csrf.token}" method="post" enctype="multipart/form-data">
<%--                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
        <!-- Invalid input -->
        <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  수정
                </span>


            <select name="originTag"
                    class="block mt-1 text-sm border-red-600 dark:text-gray-300 dark:bg-gray-700 focus:border-red-400 focus:outline-none focus:shadow-outline-red form-input"
            >
                <option value=""> -</option>
                <c:forEach var="tags" items="${mainTagDTOList}">
                    <option value="${tags.MT_NAME}">${tags.MT_NAME}</option>
                </c:forEach>
            </select>
            <span class="text-xs text-red-600 dark:text-red-400">
                  수정전 메인태그 명입니다.
         </span>

            <input
                    name="updateTag"
                    class="block mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray form-input"
                    placeholder="수정 후 태그 명"
            />

            <span class="text-xs text-red-600 dark:text-red-400">
            수정후 사용될 메인태그 명입니다.
        </span>
        </label>

        <!-- Valid input -->
        <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  새로운 메인태그 생성
                </span>
            <input
                    name="newTag"
                    class="block mt-1 text-sm border-green-600 dark:text-gray-300 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green form-input"
                    placeholder="새로 추가할 메인 태그명"
            />
            <span class="text-xs text-green-600 dark:text-green-400">
                  새로 추가할 메인태그명 입니다.
                </span>
        </label>

        <!-- Helper text -->
        <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  사진 업로드
                </span>
            <input
                    type="file"
                    name="tagImg"
                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray form-input"
            />
            <span class="text-xs text-gray-600 dark:text-gray-400">
                  새로운 메인 태그 사용시 사진을 업로드 해야 합니다.
                </span>
        </label>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="submit"/>
    </form>
</div>

</body>
</html>
