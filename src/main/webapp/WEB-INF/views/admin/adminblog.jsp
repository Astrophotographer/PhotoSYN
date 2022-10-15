<%--
  Created by IntelliJ IDEA.
  User: pmwkd
  Date: 2022-10-15
  Time: 오전 3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="admin_include/adminheader.jsp" flush="false"/>

<h1>Admin Blog</h1>

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
                        <th class="px-4 py-3">글 제목</th>
                        <th class="px-4 py-3">메인태그/서브태그</th>
                        <th class="px-4 py-3">글 상태</th>
                        <th class="px-4 py-3">작성일/수정일</th>
                        <th class="px-4 py-3">숨김 처리</th>
                    </tr>
                    </thead>
                    <tbody
                            class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                    >
                    <%-- 유저 한명 --%>
                    <c:forEach items="${blogDTOList}" var="blog">
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
                                                href="../blog/single?b_no=${blog.b_NO}"> ${blog.b_SUBJECT}</a></p>
                                        <p class="text-xs text-gray-600 dark:text-gray-400">
                                                ${blog.u_ID}
                                        </p>
                                    </div>
                                </div>
                            </td>
                            <td class="px-4 py-3 text-sm">
                                #${blog.MT_NAME}/${blog.b_TAG1}
                            </td>
                            <td class="px-4 py-3 text-xs">
                                <c:if test="${blog.b_STATUS==0}">
                        <span class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
                             정상 노출
                        </span>
                                </c:if>
                                <c:if test="${blog.b_STATUS==1}">
                                            <span class="class=px-2 py-1 font-semibold leading-tight text-gray-700
                                                  bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700">
                                            신고로 인한 자동 숨김
                                            </span>
                                </c:if>
                                <c:if test="${blog.b_STATUS==2}">
                        <span class="px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600">
                             유저 요청 숨김(유저 삭제)
                        </span>
                                </c:if>
                                <c:if test="${blog.b_STATUS==3}">
                        <span class="px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700">
                             관리자 요청 숨김(관리자 삭제)
                        </span>
                                </c:if>
                            </td>
                            <td class="px-4 py-3 text-sm">
                                    ${blog.b_REG}/${blog.b_EDIT eq null ? '-' : blog.b_EDIT}
                            </td>
                            <td class="px-4 py-3 text-sm">
                                <div class="mt-4 text-sm">
                                    <div class="mt-2">
                                        <label
                                                class="inline-flex items-center text-gray-600 dark:text-gray-400"
                                        >
                                            <select id="changeStatus"
                                                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
                                                <option value="0">정상 노출</option>
                                                <option value="1">신고로 인한 자동 숨김</option>
                                                <option value="2">유저 요청 숨김(유저 삭제)</option>
                                                <option value="3">관리자 요청 숨김(관리자 삭제)</option>
                                            </select>
                                        </label>

                                        <br>
                                        <button id="changeStatusBtn">글 수정</button>
                                    </div>
                                </div>
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
                          <a href="/admin/blog?pageNum=${pager.startPage-1}&listQty=10">Before </a>

                      </li>
                        </c:if>
                        <c:forEach var="num" begin="${pager.startPage}" end="${pager.endPage}" step="1">
                            <a href="/admin/blog?pageNum=${num}&listQty=10"
                               class=" ${pager.cri.pageNum==num?"px-3 py-1 text-white transition-colors duration-150 bg-purple-600 border border-r-0 border-purple-600 rounded-md focus:outline-none focus:shadow-outline-purple":"px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"}">${num}</a>
                        </c:forEach>
                        <c:if test="${pager.next}">
                      <li>

                          <a href="/admin/blog?pageNum=${pager.endPage+1}&listQty=10">After </a>
                      </li>
                        </c:if>
                    </ul>
                  </nav>
                </span>
            </div>
            <form action="/admin/blog?pageNum=1&listQty=10" method="get">
                <select name="searchOpt">
                    <option value="I">ID로검색</option>
                    <option value="S">제목으로검색</option>
                    <option value="T">(메인+서브)태그로검색</option>
                    <option value="IT">ID+태그</option>
                    <option value="IS">ID+제목</option>
                    <option value="ST">제목+태그</option>
                    <option value="IST">ID+제목+태그</option>

                </select>
                <input
                        class="w-full pl-8 pr-2 text-sm text-gray-700 placeholder-gray-600 bg-gray-100 border-0 rounded-md dark:placeholder-gray-500 dark:focus:shadow-outline-gray dark:focus:placeholder-gray-600 dark:bg-gray-700 dark:text-gray-200 focus:placeholder-gray-500 focus:bg-white focus:border-purple-300 focus:outline-none focus:shadow-outline-purple form-input"
                        type="text"
                        placeholder="Search for projects"
                        name="searchStr"
                        aria-label="Search"
                />
                <input type="submit" value="검색">
            </form>
        </div>


    </div>
</main>
</div>
</div>

<script src="../resources/blog/plugins/jquery/jquery.js"></script>
<script type="text/javascript">
    $(document).ready(function (){

    })
</script>
</body>
</html>

