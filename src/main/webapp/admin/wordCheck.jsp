<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>단어 중복체크</title>

</head>
<body>
<h1>단어 중복체크</h1>
<input type="text" id="cword">
<input type="button" value="중복확인">

<script>
    //부모의 값을 자식에서 받기
    document.getElementById("cword").value = window.opener.document.getElementById("word").value;


    document.getElementsByTagName("input")[1].addEventListener("click", () => {
        window.opener.document.getElementById("word").value = document.getElementById("cword").value;
        window.close();
    });
</script>

<%
    String message = (String) request.getAttribute("message");
%>

<%= message %>

</body>
</html>