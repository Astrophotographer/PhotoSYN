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
<style>
    /* The Modal (background) */
    .searchModal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 10; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .search-modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 70%; /* Could be more or less, depending on screen size */
    }
</style>

<div id="modal" class="searchModal">
    <div class="search-modal-content">
        <div class="page-header">
            <h1>MODAL</h1>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="row">
                    <div class="col-sm-12">
                        <h2>Modal창 테스트입니다.</h2>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="closeModal();">
            <span class="pop_bt modalCloseBtn" style="font-size: 13pt;">
            </span>
        </div>
    </div>
</div>

<script>
    jQuery(document).ready(function () {
        $("#modal").show();
    });
    function closeModal() {
        $('.searchModal').hide();
    };
</script>

</body>
</html>
