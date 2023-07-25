<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 중복체크</title>

</head>
<body>
<h1>아이디 중복체크</h1>
<input type="text" id="cid" readonly>
<script>
    document.getElementById("cid").value = window.opener.document.getElementById("id").value;
    <%
        int check = (int) request.getAttribute("check");
    %>
    //부모의 값을 자식에서 받기
    function closed() {
        window.opener.document.getElementById("check").value = <%= check %>;
        window.close();
    }
</script>
<%
    String message = (String) request.getAttribute("message");
%>
<%= message %>
<br>
<br>
<input type="button" value="확인" onclick="closed()">


</body>
</html>