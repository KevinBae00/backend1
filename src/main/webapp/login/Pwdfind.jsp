<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>비밀번호 찾기</title>
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");

        html {
            height: 100%;
        }

        body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding-top: 200px;
            padding-bottom: 40px;
            font-family: "Nanum Gothic", arial, helvetica, sans-serif;
            background-repeat: no-repeat;
            background-image: url("https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/back3.jpg");
        }


        .card {
            margin: 0 auto; /* Added */
            float: none; /* Added */
            margin-bottom: 10px; /* Added */
        }

        #btn-Yes {
            background-color: #53eba6;
            border: none;
        }

        .login .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }

        .checkbox {
            margin-right: 20px;
            text-align: right;
        }

        .card-title {
            margin-left: 30px;
        }

        .links {
            text-align: center;
            margin-bottom: 10px;
        }

        a {
            color: black;
            text-decoration: none;
            font-size: small;
        }

        .check {
            color: red;
        }

    </style>
</head>

<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">


<div class="card align-middle" style="width:25rem; background-color:transparent; border-color:white;">

    <div class="card-title" style="margin-top:30px;">
        <h2 class="card-title" style="color:#f58b34;"><img
                src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/algoda.png" width="250px"/></h2>
    </div>


    <form method="post" action="../controller/forgotpwd.do">

        <div class="checkbox">
            <div style="color: #53eba6; margin-right: 20px; text-align:center;">
                <비밀번호 찾기>
            </div>
            <div class="card-body">

                <input type="text" name="id" id="id" class="form-control" placeholder="아이디를 입력하세요" autofocus
                       required><BR>
                <input type="text" name="email" id="email" class="form-control" placeholder="이메일을 입력하세요" required><br>
                <button type="submit" id="btn-Yes" class="btn btn-lg btn-primary btn-block">이메일 보내기</button>
                <a type="button" class="btn btn-lg btn-block"
                   style="background-color: #53eba6 ; border:none ; color:white"
                   href="javascript:window.history.back()">취소</a>

    </form>

</div>

</div>


</body>


</html>