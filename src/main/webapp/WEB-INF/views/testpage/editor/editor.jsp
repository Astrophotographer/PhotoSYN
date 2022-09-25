<%--
  Created by IntelliJ IDEA.
  User: pmwkd
  Date: 2022-09-23
  Time: 오후 2:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TestEditor</title>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/resources/testEditor/static/js/HuskyEZCreator.js"
            charset="UTF-8"></script>
</head>
<body>
<div>
    <h1>TestEditor</h1>
    <h5>editor.jsp 에서 작성</h5>
</div>


<script type="text/javascript"
        src="<%=request.getContextPath()%>/resources/testEditor/static/js/HuskyEZCreator.js"
        charset="UTF-8"></script>

<textarea name="editorTxt" id="editorTxt" style="width: 100%; height:500px;">외 않돼?</textarea>

<script>
    //ver1
    // let editor=[];
    //
    // $(() => {
    //     nhn.husky.EZCreator.createInIFrame({
    //         oAppRef: editor,
    //         elPlaceHolder: 'editorTxt',
    //         sSkinURI: 'resources/testEditor/static/SmartEditor2Skin.html',
    //         fCreator: 'createSEditor2'
    //     });
    // });

    //ver2
    // let oEditors = [];
    //
    // smartEditor = function() {
    //     console.log("Naver SmartEditor");
    //
    //     nhn.husky.EZCreator.createInIFrame({
    //         oAppRef: oEditors,
    //         elPlaceHolder: "editorTxt",
    //         sSkinURI: "resources/testEditor/static/SmartEditor2Skin.html",
    //         // htParams:{
    //         //   bUseToolbar: true,
    //         //   bUseVerticalResizer: true,
    //         //   bUseModeChanger: true,
    //         // },
    //         fCreator: "createSEditor2"
    //     })
    //
    //     function pasteHTML(filepath) {
    //
    //         var sHTML = '';
    //
    //         oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
    //
    //     }
    // }
    //
    // $(document).ready(function() {
    //     smartEditor()
    // })

    //ver3
    $(function () {
        console.log('Naver Editor..')

        //전역변수

        let obj = [];
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "editorTxt", // textarea의 name태그
            sSkinURI: "../resources/testEditor/static/SmartEditor2Skin.html",
            // htParams: {
            //     // 툴바 사용 여부
            //     bUseToolbar: true,
            //     // 입력창 크기 조절바 사용 여부
            //     bUseVerticalResizer: true,
            //     // 모드 탭(Editor | HTML | TEXT) 사용 여부
            //     bUseModeChanger: true,
            // },
            fCreator: "createSEditor2"
        });

        function pasteHTML(filepath) {

            let sHTML = '';

            oEditors.getById["editorTxt"].exec("PASTE_HTML", [sHTML]);

        }
        $("#insertBoard").click(function(){

            //id가 smarteditor인 textarea에 에디터에서 대입

            obj.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

            $("#insertBoardFrm").submit();

        });

        submitPost = function(){
            obj.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
            let content = document.getElementById("editorTxt").value;

            if(content==""){
                alert("내용을 입력해주세요");
                obj.getById["editorTxt"].exec("FOCUS");
                return;
            }else {
                console.log(content);
            }
        }
    });

</script>

</body>
</html>
