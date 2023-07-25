<%@page import="com.algoda.member.model.Memberdto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/header/style.css">
<link rel="stylesheet" href="/css/header/responsive.css">
<script type="text/javascript" src="/js/bootstrap.js"></script>
<%
	request.setCharacterEncoding("UTF-8");
	Memberdto dto = (Memberdto)request.getAttribute("memberdto");
%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>아이디 찾기 폼</title>
    <style>
       @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
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

    #btn-Yes{
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
    .checkbox{
        margin-right: 20px;
        text-align: right;
    }
    .card-title{
        margin-left: 30px;
    }

    .links{
        text-align: center;
        margin-bottom: 10px;
    }
    a{ 
    	color: black; text-decoration: none; 
        font-size: small;
    }
    .check{
    	color : red;
    }
	 
    </style>
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

    
	<div class="card align-middle" style="width:25rem; background-color:transparent; border-color:white;">
		<div class="card-title" style="margin-top:30px;">
            
			<h2 class="card-title" style="color:#f58b34;"><img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/algoda.png" width="250px"/></h2>
		</div>

    
        <div class="checkbox">
            <div style="color: #53eba6; margin-right: 20px; text-align:center;"><아이디 찾기></div>
		<div class="card-body">
        
        <center>
        <div class="wrap">
		<div id="userName"><%=dto.getName()%>님의 아이디는</div><br>
		<div id="userId">[ <%=dto.getId() %> ] 입니다.</div>
		<button id="button" class="btn btn-outline-info " onclick="location.href='../login/Login.jsp'">로그인</button>
		</center>
		</div>
        
        <!-- <input id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" value="로그인"> -->
      
    
		</div>
        
	</div>

    
    
   
  </body>

  
</html>