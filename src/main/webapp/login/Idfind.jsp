<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
        /* background-color:#53eba6; */
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

    
	<div class="card align-middle" style="width: 25rem; background-color:transparent; border-color:white;">
		<div class="card-title" style="margin-top:30px;">
            
			<h2 class="card-title" style="color:#f58b34;"><img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/algoda.png" width="250px" /></h2>
            
		</div>

        
	<form method="get" action="../controller/login.do">
        
      <form name="idfindFrm">
        <div class="checkbox">
             <div style="color: #06f589; margin-right: 20px; text-align:center;"><아이디 찾기></div> 
             </div>
    
		<div class="card-body">
            
        
        <input type="text" name="email" id="email" class="form-control" placeholder="이메일을 입력하세요" autofocus><BR>
        
        <input type="password" name="pwd" id="pwd" class="form-control" placeholder="비밀번호를 입력하세요"  ><br>
        
       
        
        <select class="form-select" name="hint"  id="hint"  style="width: 358px; color: gray;">
           <option selected disable value style= "color:gray">--질문을 선택하세요---</option>
           <option value="1">가장 좋아하는 색은?</option>
           <option value="2">통학했던 초등학교 이름은?</option>
           <option value="3">다시 태어난다면 되고 싶은 것은?</option>
           <option value="4">존경했던 선생님 성함은?</option>
           <option value="5">가장 소중한 보물은?</option>
           <option value="6">좋아하는 연예인 이름은?</option>
           <option value="7">감명깊게 읽었던 책 이름은?</option>
        </select>
        
        <input type="text" name="hint_asw" id="hint_asw" class="form-control" placeholder="힌트 질문에 대한 답을 입력하세요"  ><br>
        
          
           
        <div></div>
        <!--  <input id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" value="아이디 찾기" onclick="searchId()">  -->
        
	        
	        	 <button type="submit" id="btn-Yes" class= "btn btn-lg btn-primary btn-block"  onclick="searchId()">아이디 찾기</button>
	      	</form>
      	
      </form>
    
    
		</div>
        
	</div>

    
    
   
  </body>
  
  <script>
      function searchId(){
         var email = document.getElementById("email").value;
         var pwd = document.getElementById("pwd").value;
         var passhint = document.getElementById("hint").value;
         var hintanswer = document.getElementById("hint_asw").value;
         if(email == "" || pwd == "" || passhint == "" || hintanswer == ""){
            alert("모든 정보를 입력해주세요.");
           
            
         }
         
         
         return false;
        
      } 
     
      
      
      
      
      
      
      
      
   </script>

  
</html>