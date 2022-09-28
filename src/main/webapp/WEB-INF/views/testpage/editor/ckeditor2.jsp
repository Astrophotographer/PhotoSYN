<%--
  Created by IntelliJ IDEA.
  User: pmwkd
  Date: 2022-09-27
  Time: 오후 4:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ckeditor ver2</title>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/testEditor/ckeditor/ckeditor.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<form class="form-horizontal" role="form" id="editorForm" method="post" action="/">
    <div class="form-group">
        <div class="form-group">
            <div class="col-lg-12">
                <textarea name="ckeditor" id="ckeditor"></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-12" align="right">
                <button type="submit" class="btn btn-default">저장</button>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">
    console.log('333')
    // $(function () {
    //     CKEDITOR.replace('ckeditor', {
    //         filebrowserUploadUrl: 'ckeditorUpload3'
    //     });
    // });
    $(function (){
        // CKEDITOR.replace('content',
        CKEDITOR.replace('ckeditor',
            {filebrowserUploadUrl:'editor/food/imageUpload.do'
            });
    });
</script>


</body>
</html>
