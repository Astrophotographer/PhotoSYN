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
                        placeholder="${adminMemberDTO.u_id}"
                />
            </label>
            <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">닉네임</span>
                <input
                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                        placeholder="${adminMemberDTO.u_nick}"
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
                                <c:if test="${adminMemberDTO.ms_membership==0}">checked</c:if>
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
                                <c:if test="${adminMemberDTO.ms_membership==1}">checked</c:if>
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
                                <c:if test="${adminMemberDTO.ms_membership==2}">checked</c:if>
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
                                <c:if test="${adminMemberDTO.ms_membership==3}">checked</c:if>
                        />
                        <span class="ml-2">플레티넘</span>
                    </label>
                    <label
                            class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
                    >
                        <input
                                type="radio"
                                class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                name="accountType"
                                value="3"
                                <c:if test="${adminMemberDTO.ms_membership==4}">checked</c:if>
                        />
                        <span class="ml-2">다이아</span>
                    </label>
                    <br>
                    <button id="changeMembershipBtn">등급 수정</button>
                </div>
            </div>

            <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  포인트 충전 현재 잔액(포인트) : ${adminMemberDTO.u_point}
                </span>
                <select id="chargePoint"
                        class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
                    <option value="1000">1,000 (원)</option>
                    <option value="5000">5,000 (원)</option>
                    <option value="10000">10,000 (원)</option>
                    <option value="25000">25,000 (원)</option>
                </select>
                <button id="chargePointBtn">충전하기</button>
            </label>

            <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  회원 상태 수정(0:사용중, 1:휴면계정, 2:정상탈퇴, 3:강제탈퇴). 현재상태 :
                  <c:if test="${adminMemberDTO.u_status==0}">사용중</c:if>
                  <c:if test="${adminMemberDTO.u_status==1}">휴면계정</c:if>
                  <c:if test="${adminMemberDTO.u_status==2}">정상탈퇴</c:if>
                  <c:if test="${adminMemberDTO.u_status==3}">강제탈퇴</c:if>
                </span>
                <select id="updateUserStatus" class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-multiselect focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
                    <option value="0">사용중</option>
                    <option value="1">휴면계정</option>
                    <option value="2">정상탈퇴</option>
                    <option value="3">강제탈퇴</option>
                </select>
              <button id="updateUserStatusBtn">상태변경</button>
            </label>

            <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">회원 자기 소개</span>
                <textarea
                        class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-textarea focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                        rows="3"
                        placeholder="회원자기소개란입니다."
                        readonly
                >${adminMemberDTO.u_intro}</textarea>
            </label>

        </div>


    </div>
</main>
</div>
</div>

<script src="../resources/blog/plugins/jquery/jquery.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        let u_id = '${adminMemberDTO.u_id}';
        console.log(u_id);
        let token = $("meta[name='_csrf']").attr("content");
        let header = $("meta[name='_csrf_header']").attr("content");

        let changeMemberShip = $('input:radio[name="accountType"]:checked').val();
        console.log("origin : ", changeMemberShip);

        $('input:radio[name="accountType"]').change(function () {
            changeMemberShip = $(this).val();
            console.log(changeMemberShip);
        });


        $("#changeMembershipBtn").on("click", function () {
            console.log('멤버쉽 등급 변경 버튼 클릭');

            let reqData = {
                id: u_id,
                membership: changeMemberShip
            };

            console.log(reqData);
            console.log("reqData.u_id : ", reqData.id);
            console.log("reqData.changeMemberShip : ", reqData.membership);


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

        // let charge = $('select[name="accountType"]').val();

        $("#chargePointBtn").on("click", function () {
            console.log("포인트 충전 버튼 클릭");
            let chargePoint = $("#chargePoint").val();
            console.log("충전할 포인트 : ", chargePoint);

            let reqData = {
                id: u_id,
                point: chargePoint
            };

            console.log(reqData);
            console.log("reqData.u_id : ", reqData.id);
            console.log("reqData.point : ", reqData.point);

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/admin/chargePoint",
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

                    location.reload();

                },
                error: function (e) {
                    console.log("ajax 요청 실패")
                    console.log(e);
                }

            });
        })

      $("#updateUserStatusBtn").on("click",function (){
        console.log("유저 상태 변경 버튼 클릭");
        let updateUserStatus = $("#updateUserStatus").val();
        console.log("수정할 상태 : ",chargePoint);

        let reqData = {
          id: u_id,
          status: updateUserStatus
        };

        console.log(reqData);
        console.log("reqData.u_id : ",reqData.id);
        console.log("reqData.status : ",reqData.status);

        $.ajax({
          type: "POST",
          url: "${pageContext.request.contextPath}/admin/updateUserStatus",
          data: JSON.stringify(reqData),
          contentType: "application/json; charset=utf-8",
          // contentType: "application/json",
          dataType: "text",
          //post 방식 시큐리티 위해 추가
          //요청을 날리기 전에.. 명령어 beforeSend
          beforeSend: function(xhr){
            xhr.setRequestHeader(header, token);
          },
          success: function(result, status, xhr){
            console.log("ajax 요청 성공!");
            console.log(result);
            console.log(status);

            //responseBody 사용하고싶따...
            location.reload();

          },
          error: function(e){
            console.log("ajax 요청 실패")
            console.log(e);
          }

        });

      })

    })

</script>

</body>
</html>

