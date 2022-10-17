<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp" %>


<form action="/member/mypage/galleryBuyBtn" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <button class="profileBtn2" type="submit" style="width: 100px">
        구매하기
    </button>
</form>

<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">Board Read</h1><br />

<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Testpage</h6>
    </div>
    <div class="card-body">
        <div class="mr-3 ml-3 mb-4">
            <div class="form-group row">
                <label>Bno</label>
                <input type="text" class="form-control" name="bno" value="${gallery.g_NO}" readonly="readonly"/>
            </div>
            <div class="form-group row">
                <label>Content</label>
                <textarea class="form-control" rows="3" name="content" readonly="readonly">${gallery.g_CONTENT}</textarea>
            </div>
            <div class="form-group row">
                <label>Writer</label>
                <input type="text" class="form-control" name="writer" value="${gallery.u_ID}" readonly="readonly"/>
            </div>
        </div>
        <div class="mr-1 ml-1">
            <button class="btn btn-warning" data-service="modify">Modify</button>
            <button class="btn btn-info" data-service="list" >List</button>
        </div>

        <form id="btnForm" action="#" method="get">
            <input type="hidden" name="gno" value="${gallery.g_NO}" id="gno" />
            <input type="hidden" name="pageNum" value="${cri.pageNum}"  />
            <input type="hidden" name="listQty" value="${cri.listQty}"  />
            <input type="hidden" name="sel" value="${cri.sel}"  />
            <input type="hidden" name="keyword" value="${cri.keyword}"  />
        </form>

    </div>
</div>
<!--  content 내용물 끝나는 부분  -->

<!-- 댓글 css 약식 -->
<style>
    .reply_container {
        margin: 0.5rem auto;
        display: flex;
        flex-direction: column;
    }
    .reply_li {
        margin: 1rem 0;
        display: flex;
        flex-direction: column;
        width: 100%;
    }
    .replyer_reg_ctn {
        margin: 0.4rem 0;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        width: 100%;
    }
    .reply_div {
        font-size: 1rem;
        width: 100%;
    }
    .replyer_div {
        font-weight: bold;
        font-size: 0.9rem;
    }
    .replyReg_div {
        font-size: 0.7rem;
    }
    .reply_inputbox {
        display: flex;
        flex-direction: column;
        font-size: 0.7rem;
        width: 100%;
    }
    .rbox_div {
        margin: 0.2rem 0;
        width: 100%;
    }
</style>


<script type="text/javascript">
    $(document).ready(function(){
        let btnForm = $("#btnForm");
        $("button[data-service='modify']").on("click", function(){
            btnForm.attr("action", "/gallery/modify").submit();
        });
        $("button[data-service='list']").on("click", function(){
            btnForm.find("#bno").remove();	// bno 히든태그 삭제
            btnForm.attr("action", "/board/list"); // action 속성값 list로 변경
            btnForm.submit();
        });

    });
</script>


<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp" %>




