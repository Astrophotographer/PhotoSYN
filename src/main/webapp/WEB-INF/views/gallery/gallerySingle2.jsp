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


        <label>ISO</label>
        <input type="text" class="form-control" name="writer" value="${metadata.m_ISO}" readonly="readonly"/>

        <label>SHUTTERSPEED</label>
        <input type="text" class="form-control" name="writer" value="${metadata.m_SHUTTERSPEED}" readonly="readonly"/>
        <label>FLENGTH</label>
        <input type="text" class="form-control" name="writer" value="${metadata.m_FLENGTH}" readonly="readonly"/>
        <label>APERTURE</label>
        <input type="text" class="form-control" name="writer" value="${metadata.m_APERTURE}" readonly="readonly"/>
<%--  메타데이터 필드 추가 --%>
    </div>


    <div style="text-align: right;">
        <button class="profileBtn2" type="button" style="width: 70px;">구매하기</button>
    </div>


    <button onclick="window.location='/gallery/download?fileName=${gallery.g_HNAME}'">다운받기</button>





</div>








<%@ include file="/WEB-INF/views/includes/footer.jsp" %>