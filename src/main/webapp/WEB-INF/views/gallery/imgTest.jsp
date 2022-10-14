<%--
  Created by IntelliJ IDEA.
  User: chris
  Date: 2022/10/13
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
    <title>test</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<h1>imgTest</h1>

<sec:authorize access="isAnonymous()">
    <h1>로그인 하세요</h1>
</sec:authorize>


<sec:authorize access="isAuthenticated()">


    <h1>로그인됨</h1>
    <p>principal : <sec:authentication property="principal"/></p>
    <p>MemberDTO : <sec:authentication property="principal.member"/></p>
    <p>사용자 이름 : <sec:authentication property="principal.member.name"/></p>
    <p>사용자 아이디 : <sec:authentication property="principal.username"/></p>
    <p>사용자 권한 리스트 : <sec:authentication property="principal.member.authDTOList"/></p>



<!-- 메타데이터 뿌려주고 저장할 폼 영역 -->
<form action="/gallery/uploadPro" method="post">
    <div class="form-group">
        <div class="form-group">

            <!-- 파일 올리는 버튼, 파일명 띄울거  -->
            파일명 <input type="file" name="imgFile" id="imgFile">
            <input type="text" name="orgName" id="orgName" readonly>
            <input type="hidden" name="${_csrf.parameterName}" value="<sec:authentication property="principal.username"/>">

            작성자 : <input type="text" name="U_ID" value='<sec:authentication property="principal.username"/>' readonly="readonly" placeholder='<sec:authentication property="principal.username"/>'>


            카메라 <input type="text" name="M_IMGCAMERA" id="M_IMGCAMERA" >
            렌즈 <input type="text" name="M_IMGLENS" id="M_IMGLENS" >
            조리개 <input type="number" name="M_APERTURE" id="M_APERTURE" >
            감도 <input type="number" name="M_ISO" id="M_ISO" >
            초점거리 <input type="number" name="M_FLENGTH" id="M_FLENGTH" >
            셔터스피드 <input type="number" name="M_SHUTTERSPEED" id="M_SHUTTERSPEED" >

            <input type="submit" value="저장">


        </div>
    </div>
</form>
</sec:authorize>

<script>
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");


    $(document).ready(function (){
        $("#imgFile").on('change', function(){
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
                beforeSend : function(xhr){
                    xhr.setRequestHeader(header, token);
                },
                success: function(result){
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


                },
                error: function(e){
                    console.log("error.........");
                    console.log(e);
                }
            });
        });
    });

</script>

</body>
</html>