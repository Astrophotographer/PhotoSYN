<%--
  Created by IntelliJ IDEA.
  User: chris
  Date: 2022/10/13
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<sec:authorize access="isAnonymous()">
    <h1>로그인 안됨</h1>
</sec:authorize>
<sec:authorize access="isAuthenticated()">


    <style>
        .main-container {
            margin: 0 auto;
        }

    </style>



    <div class="container">
        <div class="mb-3">
            <br />
        </div>
        <form action="/gallery/uploadPro" method="post" name="inputForm" onsubmit="return checkField();">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="mb-3">
                <div>
                <label for="imgFile" class="form-label ">사진</label>
                <input type="file" class="form-control imgFile" name="imgFile" id="imgFile">
                </div>
            </div>
            <div class="mb-3">
                <label for="imgFile" class="form-label">카메라</label>
                <input type="text" class="form-control" name="M_IMGCAMERA" id="M_IMGCAMERA" placeholder="직접 입력하셔도 됩니다.">
            </div>
            <div class="mb-3">
                <label for="imgFile" class="form-label">렌즈</label>
                <input type="text" class="form-control" name="M_IMGLENS" id="M_IMGLENS" placeholder="직접 입력하셔도 됩니다.">
            </div>
            <div class="mb-3">
                <label for="imgFile" class="form-label">조리개</label>
                <input type="text" class="form-control" step="0.01" name="M_APERTURE" id="M_APERTURE" placeholder="직접 입력하셔도 됩니다.">
            </div>
            <div class="mb-3">
                <label for="imgFile" class="form-label">감도</label>
                <input type="text" class="form-control" name="M_ISO" id="M_ISO" placeholder="직접 입력하셔도 됩니다.">
            </div>
            <div class="mb-3">
                <label for="imgFile" class="form-label">초점거리</label>
                <input type="text" class="form-control" step="0.01" name="M_FLENGTH" id="M_FLENGTH" placeholder="직접 입력하셔도 됩니다.">
            </div>
            <div class="mb-3">
                <label for="imgFile" class="form-label">셔터스피드</label>
                <input type="text" class="form-control" step="0.0001" name="M_SHUTTERSPEED" id="M_SHUTTERSPEED" placeholder="직접 입력하셔도 됩니다.">
            </div>
            <div class="mb-3">
                <label for="imgFile" class="form-label">설명</label>
                <textarea class="form-control" name="M_CONTENT" id="M_CONTENT" rows="3"></textarea>
            </div>
            <div>
            <input type="hidden" name="M_HNAME" id="M_HNAME" >
            <input type="checkbox" name="agreements" onClick="agreeCheck(this.form)"> [필수] 본인이 찍은 사진만 올릴 수 있습니다.
            </div>
            <input type="submit"  name="checkButton" value="등록하기" disabled/>
            <input type="button" value="뒤로가기" onclick="history.go(-1)"/>
        </form>

    </div>
    <br /><br />

</sec:authorize>




<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ready(function () {
        $("#imgFile").on('change', function () {
            console.log("change");
            console.log(this.files[0]);
            var form = $("#imgFile")[0].files[0];
            var formData = new FormData();
            formData.append("files", form);
            console.log(form);
            console.log(formData);
            // ajax로 파일 업로드하고 메타데이터 받아와 화면에 뿌리기
            $.ajax({
                url: "/gallery/getMetadata.json",
                type: "POST",
                enctype: "multipart/form-data",
                data: formData,
                processData: false,
                contentType: false,
                cache: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success: function (result) {
                    console.log("success");
                    console.log(result);
                    //$("#orgName").val(result.orgName);
                    // 폼태그에 가져온 메타데이터 정보 작성해주기
                    $("#M_IMGCAMERA").val(result.m_IMGCAMERA);
                    $("#M_IMGLENS").val(result.m_IMGLENS);
                    $("#M_APERTURE").val(result.m_APERTURE);
                    $("#M_ISO").val(result.m_ISO);
                    $("#M_FLENGTH").val(result.m_FLENGTH);
                    $("#M_SHUTTERSPEED").val(result.m_SHUTTERSPEED);
                    $("#M_HNAME").val(result.m_HNAME);
                    $("#M_CONTENT").val(result.m_CONTENT);

                },
                error: function (e) {
                    console.log("error.........");
                    console.log(e);
                }
            });
        });
    });
    // 필수박스 눌러야 등록가능
    function agreeCheck(frm){
        if(frm.checkButton.disabled==true){ frm.checkButton.disabled=false; }
        else{ frm.checkButton.disabled=true; }

    }

    function checkField(){

        let inputs = document.inputForm;
        if(!inputs.imgFile.value){ alert("사진이 없습니다."); return false; }
        if(!inputs.M_CONTENT.value){ alert("설명이 없습니다."); return false; }

    }
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
        integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
        crossorigin="anonymous" referrerpolicy="no-referrer">




<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
