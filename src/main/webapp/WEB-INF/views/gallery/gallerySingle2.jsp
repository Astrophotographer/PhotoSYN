<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>


<style>
    .main-container {
        margin: 0 auto;
    }


</style>


<div class="main-container">

    <div class="card-body">
        <label>게시글 번호</label>
        <input type="text" class="form-control" name="bno" value="${gallery.g_NO}" readonly="readonly"/>
        </br>
        <label>작성자</label>
        <input type="text" class="form-control" name="writer" value="${gallery.u_ID}" readonly="readonly"/>
        </br></br>

        <img src="/resources/gallery/images/${gallery.g_HNAME}" width="1500px" align="center" />
        </br></br>


        <label>Content</label>
        <textarea class="form-control" rows="3" name="content" readonly="readonly">${gallery.g_CONTENT}</textarea>

        <label>CAMERA MODEL</label>
        <input type="text" class="form-control" name="writer" value="${metadata.m_IMGCAMERA}" readonly="readonly"/>

        <label>LENSE MODEL</label>
        <input type="text" class="form-control" name="writer" value="${metadata.m_IMGLENS}" readonly="readonly"/>

        <label>APERTURE</label>
        <input type="text" class="form-control" name="writer" value="${metadata.m_APERTURE}" readonly="readonly"/>

        <label>FLength</label>
        <input type="text" class="form-control" name="writer" value="${metadata.m_FLENGTH}" readonly="readonly"/>

        <label>ISO</label>
        <input type="text" class="form-control" name="writer" value="${metadata.m_ISO}" readonly="readonly"/>

        <label>SHUTTERSPEED</label>
        <input type="text" class="form-control" name="writer" value="${metadata.m_SHUTTERSPEED}" readonly="readonly"/>




        <input type="hidden" name="pageNum" value="${cri.pageNum}" />
        <input type="hidden" name="listQty" value="${cri.listQty}" />
        <input type="hidden" name="sel" value="${cri.sel}" />
        <input type="hidden" name="keyword" value="${cri.keyword}" />
<%--  메타데이터 필드 추가 --%>
    </div>


    <div style="text-align: center;">
        <button class="profileBtn2" type="button" style="width: 80px;">구매하기</button>
        <button class="profileBtn2" onclick="window.location='/gallery/download?fileName=${gallery.g_HNAME}'">다운로드</button>

        <button class="profileBtn2" type="button" onclick="window.location='/gallery/hide?G_NO=${gallery.g_NO}'">숨기기</button>

    </div>
</div>
<!-- 버튼에 따른 이벤트 처리 스크립트 추가  -->
<script type="text/javascript">
    $(document).ready(function(){
        let formObj = $("#modifyForm");	// form 태그 가져오기
        $("button").on("click", function(e){
            e.preventDefault(); 	// 기본 동작 취소 (submit의 이동기능 취소)
            //console.log(e);
            let service = $(this).data("service");
            //console.log(service);
            if(service == 'hide'){
                formObj.attr("action", "/gallery/hide");
            }else if(service == 'list'){
                //formObj.attr("action", "/board/list");
                //self.location = "/board/list";
                //return;

                // 폼태그의 action과 method 속성을 변경
                formObj.attr("action", "/gallery/list").attr("method", "get");
                // list로 이동할때는 폼태그안에 있는 데이터 전부 보낼필요가 없으니
                // pageNum과 listQty 히든태그를 복사해놓고
                // 내용물 전부 삭제하고
                // 복사해둔 pageNum, listQty 태그만 다시 추가해서
                // 이동시킴 (form submit날려서 이동)
                let pageNumTag = $("input[name='pageNum']").clone();
                let listQtyTag = $("input[name='listQty']").clone();
                let selTag = $("input[name='sel']").clone();
                let keywordTag = $("input[name='keyword']").clone();
                formObj.empty();
                formObj.append(pageNumTag);
                formObj.append(listQtyTag);
                formObj.append(selTag);
                formObj.append(keywordTag);
            }

            // js로 폼의 submit 버튼 누른 효과와 동일
            formObj.submit();

        });



    });
    function  HideConfirm(){

    }

    function orderValue() {
        var url = "galleryBuyBtn";
        var valueArr = new Array();
        var list = $("input[name='RowCheck']");

        for (var i = 0; i < list.length; i++) {
            // 선택되어 있으면 배열에 값을 저장함
            if (list[i].checked) {
                valueArr.push(list[i].value);
            }
        }
        if (valueArr.length == 0) {
            alert("선택된 상품이 없습니다.");
        } else {
            var header = $("meta[name='_csrf_header']").attr("content");
            var token = $("meta[name='_csrf']").attr("content");
            var chk = confirm("구매하시겠습니까?");

            if (chk == true) {
                $.ajax({
                    url        : url,
                    type       : 'POST',
                    traditional: true,
                    data       : {
                        valueArr: valueArr
                    },
                    beforeSend : function (xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    success    : function (jdata) {
                        if (jdata = 1) {
                            alert("구매 완료");
                            location.replace("profileCart");
                        } else {
                            alert("구매 실패");
                        }
                    }
                });
            } else {
                alert("구매 취소");
            }
        }
    }
</script>
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
