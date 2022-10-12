<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<div class="gallery__page">
    <div class="gallery__warp">
        <div style="font-size: 50px; font-weight: 800;">장바구니</div>
        <hr>
        <div style="display: flex; justify-content: space-between;">
            <button type="button" class="profileBtn2">삭제</button>
        </div>
        <br/>

        <table class="member">
            <tr>
                <th><input type="checkbox" name="chk" onclick="checkAll(this)" style="width: 20px;"/></th>
                <th>상품번호</th>
                <th>사진</th>
                <th>화질</th>
                <th>일자</th>
                <th>개수</th>
                <th>가격</th>
            </tr>
<%--            <c:set var="tot" value="${0}"/>--%>
<%--            <c:forEach items="${}"--%>
            <tr>
                <td><input type="checkbox" name="chk" style="width: 20px;"/></td>
                <td>dd</td>
                <td>dd</td>
                <td>dd</td>
                <td>dd</td>
                <td>dd</td>
                <td>dd</td>
            </tr>

            <!--
            <tr>
                <td><input type="checkbox" style="width: 20px;"/></td>
                <td>1</td>
                <td>JONES</td>
                <td>MANAGER</td>
                <td>1981-04-02</td>
                <td>2000</td>
            </tr>
            <tr>
                <td><input type="checkbox" style="width: 20px;"/></td>
                <td>7788</td>
                <td>SCOTT</td>
                <td>ANALYST</td>
                <td>1987-04-19</td>
                <td>3000</td>
            </tr>
            <tr>
                <td><input type="checkbox" style="width: 20px;"/></td>
                <td>7844</td>
                <td>TURNER</td>
                <td>SALESMAN</td>
                <td>1981-09-08</td>
                <td>1500</td>
            </tr>
            <tr>
                <td><input type="checkbox" style="width: 20px;"/></td>
                <td>7876</td>
                <td>ADAMS</td>
                <td>CLERK</td>
                <td>1987-05-23</td>
                <td>1000</td>
            </tr>
            <tr>
                <td><input type="checkbox" style="width: 20px;"/></td>
                <td>7369</td>
                <td>SMITH</td>
                <td>CLERK</td>
                <td>1980-12-17</td>
                <td>800</td>
            </tr>
            <tr>
                <td><input type="checkbox" style="width: 20px;"/></td>
                <td>7839</td>
                <td>KING</td>
                <td>PRESIDENT</td>
                <td>1981-11-17</td>
                <td>5000</td>
            </tr>
            -->
        </table>
        <br/>
        <div style="text-align: right;">
            <button class="profileBtn2" type="button" style="width: 70px;">주문하기</button>
        </div>
    </div>
</div>

<script>
    function checkAll(checkAll) {
        let checkboxes = document.getElementsByName("chk");
        console.log(checkboxes);
        checkboxes.forEach((checkbox) => {
            console.log(checkbox);
            checkbox.checked = checkAll.checked;
        })
    }
</script>


<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
