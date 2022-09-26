<%--
  Created by IntelliJ IDEA.
  User: pmwkd
  Date: 2022-09-26
  Time: 오전 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SummerEditor</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- 서머노트를 위해 추가해야할 부분 -->
    <script src="${pageContext.request.contextPath}/resources/testEditor/summernote-0.8.18-dist/summernote-lite.js"></script>
    <script src="${pageContext.request.contextPath}/resources/testEditor/summernote-0.8.18-dist/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/testEditor/summernote-0.8.18-dist/summernote-lite.css">
</head>
<body>

<div class="container">
    <form action="/editor/summerwrite" method="post">
        <input type="text" name="subject" placeholder="제목">
        <textarea class="summernote" name="content" id="content" cols="30" rows="10"></textarea>

        <input type="text" name="writer" id="writer" placeholder="writer"/>
        <input type="button" id="subBtn" value="글 작성" style="float : right;" onclick="goWrite(this.form)"/>
    </form>
</div>
<script>
    $('.summernote').summernote({
        placeholder: '내용을 입력하세요.',
        tabsize: 2,
        height: 500,
        width: 1000,
        minHeight: null,
        maxHeight: null,
        focus: true,
        lang: 'ko-KR',
        //콜백함수
        callback: {
            onImageUpload: function (files, editor, welEditable) {
                // sendFile(files[0], this);

                //다중 업로드를 위해 반복문 사용. 파일업로드시키기
                for (var i = files.length - 1; i >= 0; i--) {
                    sendFile(files[i], this);
                }
            }
        },
        disableResizeEditor: true,	// 크기 조절 기능 삭제
        toolbar: [
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
            ['color', ['forecolor', 'color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert', ['picture', 'link', 'video']],
            ['view', ['fullscreen', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']

    });

    $('#summernote').summernote('fontSize', 24);

    <%--function sendFile(file, el) {--%>
    <%--    var data = new FormData();--%>
    <%--    data.append("file", file);--%>
    <%--    $.ajax({--%>
    <%--        data: data,--%>
    <%--        type: "POST",--%>
    <%--        url: "${pageContext.request.contextPath}/editor/uploadSummernoteImageFile",--%>
    <%--        contentType: false,--%>
    <%--        cache: false,--%>
    <%--        enctype: 'multipart/form-data',--%>
    <%--        processData: false,--%>
    <%--        success: function (data) {--%>
    <%--            var json = JSON.parse(data);--%>
    <%--            $(el).summernote("editor.insertImage", json["url"]);--%>
    <%--            jsonarray.push(json["url"]);--%>
    <%--            jsonFn(jsonarray);--%>
    <%--            // uploadImageTest();--%>
    <%--        },--%>
    <%--        error: function (e) {--%>
    <%--            alert("에러발생 ");--%>
    <%--        }--%>
    <%--    });--%>
    <%--}--%>

    <%--function uploadImageTest() {--%>
    <%--    let bodyData = new FormData();--%>
    <%--    let imageFile = document.querySelector("#imageFile").files[0];--%>
    <%--    bodyData.append("imageFile", imageFile);--%>

    <%--    fetch("https://api.imgur.com/3/image", {--%>
    <%--        method: "POST",--%>
    <%--        headers: {--%>
    <%--            Authorization: "Client-ID "--%>
    <%--        },--%>
    <%--        body: bodyData--%>
    <%--    })--%>
    <%--        .then(response => response.json())--%>
    <%--        .then(result => {--%>
    <%--            console.log(result);--%>
    <%--            let imageLink = result.data.link;--%>
    <%--            let imageTag = `<img src="${imageLink}" alt=""/>`;--%>
    <%--            document.querySelector("#summernote").value += imageTag;--%>
    <%--        })--%>
    <%--        .catch(error => {--%>
    <%--            console.error('Error:', error);--%>
    <%--        });--%>
    <%--}--%>

    function goWrite(form) {
        var subject = form.subject.value;
        var content = form.content.value;
        var writer = form.writer.value;

        if (subject.trim() == '') {
            alert('제목을 입력하세요.');
            form.subject.focus();
            return false;
        }
        if (content.trim() == '') {
            alert('내용을 입력하세요.');
            form.content.focus();
            return false;
        }
        if (writer.trim() == '') {
            alert('작성자를 입력하세요.');
            form.writer.focus();
            return false;
        }
        form.submit();
    }
</script>


</body>
</html>
