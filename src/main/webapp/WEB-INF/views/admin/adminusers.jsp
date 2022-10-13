<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: pmwkd
  Date: 2022-10-13
  Time: 오후 3:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<jsp:include page="admin_include/adminheader.jsp"/>

    <main class="h-full pb-16 overflow-y-auto">
      <div class="container px-6 mx-auto grid">
        <h2
                class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
        >
          User Profile
        </h2>

        <!-- General elements -->
        <h4
                class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
        >
          Elements
        </h4>
        <div
                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
        >
          <label class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">ID</span>
            <input
                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    placeholder="${memberDTO.id}"
            />
          </label>
          <label class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">닉네임</span>
            <input
                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    placeholder="${memberDTO.name}"
            />
          </label>

          <div class="mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  멤버쉽 등급
                </span>
            <div class="mt-2">
              <label
                      class="inline-flex items-center text-gray-600 dark:text-gray-400"
              >
                <input
                        type="radio"
                        class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                        name="accountType"
                        value="0"
                        <c:if test="${memberDTO.membership==0}">checked</c:if>
                />
                <span class="ml-2">브론즈</span>
              </label>
              <label
                      class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
              >
                <input
                        type="radio"
                        class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                        name="accountType"
                        value="1"
                        <c:if test="${memberDTO.membership==1}">checked</c:if>
                />
                <span class="ml-2">실버</span>
              </label>
              <label
                      class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
              >
                <input
                        type="radio"
                        class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                        name="accountType"
                        value="2"
                        <c:if test="${memberDTO.membership==2}">checked</c:if>
                />
                <span class="ml-2">골드</span>
              </label>
              <label
                      class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
              >
                <input
                        type="radio"
                        class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                        name="accountType"
                        value="3"
                        <c:if test="${memberDTO.membership==3}">checked</c:if>
                />
                <span class="ml-2">다이아</span>
              </label>
              <br>
              <button id="changeMembershipBtn">등급 수정</button>
            </div>
          </div>

          <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Requested Limit
                </span>
            <select
                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
            >
              <option>$1,000</option>
              <option>$5,000</option>
              <option>$10,000</option>
              <option>$25,000</option>
            </select>
          </label>

          <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Multiselect
                </span>
            <select
                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-multiselect focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                    multiple
            >
              <option>Option 1</option>
              <option>Option 2</option>
              <option>Option 3</option>
              <option>Option 4</option>
              <option>Option 5</option>
            </select>
          </label>

          <label class="block mt-4 text-sm">
            <span class="text-gray-700 dark:text-gray-400">Message</span>
            <textarea
                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-textarea focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                    rows="3"
                    placeholder="Enter some long form content."
            ></textarea>
          </label>

          <div class="flex mt-6 text-sm">
            <label class="flex items-center dark:text-gray-400">
              <input
                      type="checkbox"
                      class="text-purple-600 form-checkbox focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
              />
              <span class="ml-2">
                    I agree to the
                    <span class="underline">privacy policy</span>
                  </span>
            </label>
          </div>
        </div>

        <!-- Validation inputs -->
        <h4
                class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
        >
          Validation
        </h4>
        <div
                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
        >
          <!-- Invalid input -->
          <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Invalid input
                </span>
            <input
                    class="block w-full mt-1 text-sm border-red-600 dark:text-gray-300 dark:bg-gray-700 focus:border-red-400 focus:outline-none focus:shadow-outline-red form-input"
                    placeholder="Jane Doe"
            />
            <span class="text-xs text-red-600 dark:text-red-400">
                  Your password is too short.
                </span>
          </label>

          <!-- Valid input -->
          <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Valid input
                </span>
            <input
                    class="block w-full mt-1 text-sm border-green-600 dark:text-gray-300 dark:bg-gray-700 focus:border-green-400 focus:outline-none focus:shadow-outline-green form-input"
                    placeholder="Jane Doe"
            />
            <span class="text-xs text-green-600 dark:text-green-400">
                  Your password is strong.
                </span>
          </label>

          <!-- Helper text -->
          <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Helper text
                </span>
            <input
                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray form-input"
                    placeholder="Jane Doe"
            />
            <span class="text-xs text-gray-600 dark:text-gray-400">
                  Your password must be at least 6 characters long.
                </span>
          </label>
        </div>

        <!-- Inputs with icons -->
        <h4
                class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
        >
          Icons
        </h4>
        <div
                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
        >
          <label class="block text-sm">
            <span class="text-gray-700 dark:text-gray-400">Icon left</span>
            <!-- focus-within sets the color for the icon when input is focused -->
            <div
                    class="relative text-gray-500 focus-within:text-purple-600 dark:focus-within:text-purple-400"
            >
              <input
                      class="block w-full pl-10 mt-1 text-sm text-black dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray form-input"
                      placeholder="Jane Doe"
              />
              <div
                      class="absolute inset-y-0 flex items-center ml-3 pointer-events-none"
              >
                <svg
                        class="w-5 h-5"
                        aria-hidden="true"
                        fill="none"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                >
                  <path
                          d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"
                  ></path>
                </svg>
              </div>
            </div>
          </label>

          <label class="block mt-4 text-sm">
            <span class="text-gray-700 dark:text-gray-400">Icon right</span>
            <!-- focus-within sets the color for the icon when input is focused -->
            <div
                    class="relative text-gray-500 focus-within:text-purple-600 dark:focus-within:text-purple-400"
            >
              <input
                      class="block w-full pr-10 mt-1 text-sm text-black dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray form-input"
                      placeholder="Jane Doe"
              />
              <div
                      class="absolute inset-y-0 right-0 flex items-center mr-3 pointer-events-none"
              >
                <svg
                        class="w-5 h-5"
                        aria-hidden="true"
                        fill="none"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                >
                  <path
                          d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"
                  ></path>
                </svg>
              </div>
            </div>
          </label>
        </div>

        <!-- Inputs with buttons -->
        <h4
                class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
        >
          Buttons
        </h4>
        <div
                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
        >
          <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Button left
                </span>
            <div class="relative">
              <input
                      class="block w-full pl-20 mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray form-input"
                      placeholder="Jane Doe"
              />
              <button
                      class="absolute inset-y-0 px-4 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-l-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
              >
                Click
              </button>
            </div>
          </label>

          <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Button right
                </span>
            <div
                    class="relative text-gray-500 focus-within:text-purple-600"
            >
              <input
                      class="block w-full pr-20 mt-1 text-sm text-black dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray form-input"
                      placeholder="Jane Doe"
              />
              <button
                      class="absolute inset-y-0 right-0 px-4 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-r-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
              >
                Click
              </button>
            </div>
          </label>
        </div>
      </div>
    </main>
  </div>
</div>

<script src="../resources/blog/plugins/jquery/jquery.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    let u_id = '${memberDTO.id}';
    console.log(u_id);
    let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");

    let changeMemberShip = $('input:radio[name="accountType"]:checked').val();
    console.log("origin : ",changeMemberShip);

    $('input:radio[name="accountType"]').change(function(){
      changeMemberShip = $(this).val();
      console.log(changeMemberShip);
    });

    $("#changeMembershipBtn").on("click",function(){
      console.log('멤버쉽 등급 변경 버튼 클릭');

      let reqData = {
        id : u_id,
        membership : changeMemberShip
      };

      console.log(reqData);
      console.log("reqData.u_id : ",reqData.id);
      console.log("reqData.changeMemberShip : ",reqData.membership);


      $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/admin/updateMemberShip",
        data: JSON.stringify(reqData),
        contentType: "application/json; charset=utf-8",
        // contentType: "application/json",
        dataType: "text",
        //post 방식 시큐리티 위해 추가
        //요청을 날리기 전에.. 명령어 beforeSend
        beforeSend: function (xhr) {
          xhr.setRequestHeader(header, token);
        },
        success: function (result, status, xhr) {
          console.log("ajax 요청 성공!");
          console.log(result);
          console.log(status);

        },
        error: function (e) {
          console.log("ajax 요청 실패")
          console.log(e);
        }

      });

      // $('input:radio[name="accountType"]').change(function(){
      //   changeMemberShip = $(this).val();
      //   console.log("버튼 안 : ",changeMemberShip);
      //   //updateMemberShip
      // });
    })

  })

</script>

</body>
</html>

