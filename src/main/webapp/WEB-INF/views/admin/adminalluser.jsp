<%--
  Created by IntelliJ IDEA.
  User: pmwkd
  Date: 2022-10-14
  Time: 오전 5:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="admin_include/adminheader.jsp" flush="false"/>

<main class="h-full overflow-y-auto">
    <div class="container px-6 mx-auto grid">


        <!-- New Table -->
        <div class="w-full overflow-hidden rounded-lg shadow-xs">
            <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                    <thead>
                    <tr
                            class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                    >
                        <th class="px-4 py-3">User</th>
                        <th class="px-4 py-3">MemberShip</th>
                        <th class="px-4 py-3">Status</th>
                        <th class="px-4 py-3">Memeber Since...</th>
                    </tr>
                    </thead>
                    <tbody
                            class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                    >
                    <%-- 유저 한명 --%>
                    <c:forEach items="${memberDTOList}" var="member">
                        <tr class="text-gray-700 dark:text-gray-400">
                            <td class="px-4 py-3">
                                <div class="flex items-center text-sm">
                                    <div
                                            class="relative hidden w-8 h-8 mr-3 rounded-full md:block"
                                    >
                                        <img
                                                class="object-cover w-full h-full rounded-full"
                                                src="https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
                                                alt=""
                                                loading="lazy"
                                        />
                                        <div
                                                class="absolute inset-0 rounded-full shadow-inner"
                                                aria-hidden="true"
                                        ></div>
                                    </div>
                                    <div>
                                        <p class="font-semibold"><a
                                                href="../admin/userInfo?u_id=${member.id}"> ${member.id}</a></p>
                                        <p class="text-xs text-gray-600 dark:text-gray-400">
                                                ${member.name}
                                        </p>
                                    </div>
                                </div>
                            </td>
                            <td class="px-4 py-3 text-sm">
                                <c:if test="${member.membership==0}">
                                    브론즈
                                </c:if>
                                <c:if test="${member.membership==1}">
                                    실버
                                </c:if>
                                <c:if test="${member.membership==2}">
                                    골드
                                </c:if>
                                <c:if test="${member.membership==3}">
                                    다이아
                                </c:if>

                            </td>
                            <td class="px-4 py-3 text-xs">
                                <c:if test="${member.status==0}">
                        <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                             정상
                        </span>
                                </c:if>
                                <c:if test="${member.status==1}">
                                            <span class="class=px-2 py-1 font-semibold leading-tight text-gray-700
                                                  bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700">
                                            휴면상태
                                            </span>
                                </c:if>
                                <c:if test="${member.status==2}">
                        <span class="px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600">
                             정상삭제
                        </span>
                                </c:if>
                                <c:if test="${member.status==3}">
                        <span class="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700">
                             강제삭제
                        </span>
                                </c:if>
                            </td>
                            <td class="px-4 py-3 text-sm">
                                    ${member.reg}
                            </td>
                        </tr>

                    </c:forEach>
                    <%-- 유저 한명 끝 --%>

                    </tbody>
                </table>
            </div>
            <%-- 유저정보 끝 --%>
            <div
                    class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
            >
                <span class="flex items-center col-span-3">
                  Showing 21-30 of 100
                </span>
                <span class="col-span-2"></span>
                <!-- Pagination -->
                <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
                  <nav aria-label="Table navigation">
                    <ul class="inline-flex items-center">
                        <c:if test="${pager.prev}">
                      <li>
                          <a href="/admin/user?pageNum=${pager.startPage-1}&listQty=10">Before </a>
<%--                        <button class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple" aria-label="Previous">--%>
<%--                          <svg--%>
<%--                                  aria-hidden="true"--%>
<%--                                  class="w-4 h-4 fill-current"--%>
<%--                                  viewBox="0 0 20 20"--%>
<%--                          >--%>
<%--                            <path--%>
<%--                                    d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"--%>
<%--                                    clip-rule="evenodd"--%>
<%--                                    fill-rule="evenodd"--%>
<%--                            ></path>--%>
<%--                          </svg>--%>
<%--                        </button>--%>
                      </li>
                        </c:if>
                        <c:forEach var="num" begin="${pager.startPage}" end="${pager.endPage}" step="1">
                            <a href="/admin/user?pageNum=${num}&listQty=10" class=" ${pager.cri.pageNum==num?"px-3 py-1 text-white transition-colors duration-150 bg-purple-600 border border-r-0 border-purple-600 rounded-md focus:outline-none focus:shadow-outline-purple":"px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"}">${num}</a>
                        </c:forEach>
                        <c:if test="${pager.next}">
                      <li>
<%--                        <button class="px-3 py-1 rounded-md rounded-r-lg focus:outline-none focus:shadow-outline-purple" aria-label="Next">--%>
<%--                          <svg--%>
<%--                                  class="w-4 h-4 fill-current"--%>
<%--                                  aria-hidden="true"--%>
<%--                                  viewBox="0 0 20 20"--%>
<%--                          >--%>
<%--                            <path--%>
<%--                                    d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"--%>
<%--                                    clip-rule="evenodd"--%>
<%--                                    fill-rule="evenodd"--%>
<%--                            ></path>--%>
<%--                          </svg>--%>
<%--                        </button>--%>
<%--    <a href="#">${pager.endPage}</a>--%>
                          <a href="/admin/user?pageNum=${pager.endPage+1}&listQty=10">After </a>
                      </li>
                        </c:if>
                    </ul>
                  </nav>
                </span>
            </div>
        </div>


    </div>
</main>
</div>
</div>
</body>
</html>

