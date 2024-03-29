<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//String alram=(String)request.getAttribute("alarm");
%>
<!DOCTYPE html>
<html>

<!-- 테이블 부트 스트랩 -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<!-- 검색 부트 스트랩-->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<!-- 버튼 부트 스트랩-->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



<script>

	if(${alarm}){
		alert("단어장 단어 삭제 완료");
		location.reload();
	}
</script>


<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Carousel Template · Bootstrap v5.2</title>

   <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/carousel/">


    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
    
    	/* 페이지 프레임CSS */
    	
    	/* 레벨 선택 돌아가기 , 퀴즈 풀어보기 버튼 CSS */
    	#btn_l{
    		position:absolute;
	        padding: 0;
	        width:200px;
	        height:30px;
	        margin-left: 10%;
	        margin-top:100px;
	        font-size: 16px;
    	}
    	
    	#btn_q{
    		position:relative;
	        padding: 0;
	        width:200px;
	        height:30px;
	        margin-left: 80%;
	        margin-top:100px;
	        font-size: 16px;
    	}
    	
    	.navbar-brand{
    		font-size: 35px;
    		margin-bottom:30px;
    	}
    	.nav-link{
    		font-size: 20px;
    	}
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
        
        /* 경계선 */
        /* 테이블 css */
        
        body { 
		  font-size: 140%; 
		}
		
		h2 {
		  text-align: center;
		  padding: 50px 0;
		}
		
		table caption {
		  padding: .5em 0;
		}
		
		table.dataTable th,
		table.dataTable td {
		  white-space: nowrap;
		}
		
		.p {
		  text-align: center;
		  padding-top: 240px;
		  font-size: 14px;
		}
        
        
        /* 검색 CSS */
        
        #custom-search-input {
        	position:relative;
	        padding: 0;
	        width:200px;
	        margin-left: 80%;
    	}
 
	    #custom-search-input .search-query {
	        padding-right: 3px;
	        padding-right: 4px \9;
	        padding-left: 3px;
	        padding-left: 4px \9;
	        /* IE7-8 doesn't have border-radius, so don't indent the padding */
	 
	        margin-bottom: 0;
	        -webkit-border-radius: 3px;
	        -moz-border-radius: 3px;
	        border-radius: 3px;
	    }
	 
	    #custom-search-input button {
	        border: 0;
	        background: none;
	        /** belows styles are working good */
	        padding: 2px 5px;
	        margin-top: 5px;
	        position: relative;
	        left: -28px;
	        /* IE7-8 doesn't have border-radius, so don't indent the padding */
	        margin-bottom: 0;
	        -webkit-border-radius: 3px;
	        -moz-border-radius: 3px;
	        border-radius: 3px;
	        color:#53eba6;
	    }
	 
	    .search-query:focus + button {
	        z-index: 3;   
	    }
	    
	    
	    /* 전체 단어 삭제 버튼CSS */
	    #deleteAll{
	    	position:absolute;
	    	margin-left:11.5%;
	    }
	    
	    /* 버튼 CSS */	
	    .btn-group{
			position:relative;
			margin-left: 45%;
		}
		
		/* 단어장 추가 버튼 CSS */	
		.fs-it-btn {
		  margin-top: 10px;
		  border: 1px solid #a2a2a2;
		  border-radius: 0;
		  color: #fff;
		  font-weight: bold;
		}
		.fs-it-btn-vertical-line {
		  text-align:center;
		  padding: 4px 0 5px 10px;
		  margin-left: 20px;
		  border-left: 1px solid #a2a2a2;
		}
		.bg-blue {
		    background-color: #53eba6;
		}
		.text-uppercase {
		    text-transform: uppercase;
		}
    </style>


    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet"> 
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top " style="background-color:#53eba6">
        <div class="container-fluid">
            <a class="navbar-brand" href="../word/Main.jsp">ALGODA</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                    aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    
                </ul>

                <button type="button" class="btn btn-outline-primary"
                	onclick="location.href='../Logout.do'"><strong>로그 아웃</strong></button>
            </div>
        </div>
    </nav>
</header>

<main>

<button type="button" class="btn btn-outline-success" id="btn_q" data-mdb-ripple-color="dark"
	onclick="location.href='../exam.do?method=vol'">퀴즈 풀어 보기</button>


<h2 style="font-size:40px">나만의 단어장</h2>

<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table class="table table-bordered table-hover dt-responsive">
        
        <thead>
          <tr>
            <th>번호</th>
            <th>단어</th>
            <th>정의</th>
            <th>유사 어희군</th>
            <th>단어 레벨</th>
            <th>DAY</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          
          
          <c:choose>
           <c:when test="${empty boardLists }">
              <tr>
                  <td colspan="6" align="center">
                         등록된 게시물이 없습니다
                  </td>
              </tr>
           </c:when>
           
           <c:otherwise>
              <c:forEach items="${boardLists }" var="row" varStatus="loop" >
              <tr>
                 <td>
                    ${  (((map.pageNum-1) * map.pageSize) + loop.index) + 1}  
                 </td>
                 <td >${ row.word }</td>
                 <td>${ row.MEANINGA },${ row.MEANINGB },${ row.MEANINGC }</td>
                 <td>${ row.SIMILAR_WORDA } , ${ row.SIMILAR_WORDB } , ${ row.SIMILAR_WORDC }</td>
                 <td>${ row.WORD_LEVEL }</td>
                 <td>${ row.DAY }일차</td>
                 <td>
				 <button type="button" class="btn btn-dark" style="background-color:#53eba6; border:none">발음 듣기</button>
				 </td>
	             <td>
				 <button type="button" class="btn btn-dark" style="background-color:#53eba6; border:none"
				 	onclick="location.href='../controller/voc.do?mode=delete&word=${ row.word }';">단어 삭제</button>
				 </td>
              </tr>
              </c:forEach>
           </c:otherwise>
      </c:choose>
          
          
        </tbody>
        <tfoot>
          <tr align="center">
          		
           		<td colspan='8'>${map.pagingImg }</td>
           		
          </tr>
        </tfoot>
      </table>
    </div>
  </div>
</div>

<button type="button" class="btn btn-outline-danger" id="deleteAll" data-mdb-ripple-color="dark"
	onclick="location.href='../controller/voc.do?mode=deleteAll';">전체 단어 삭제</button>

<!-- <div class="btn-group">
  <button type="button" class="btn btn-round btn-default">«</button>
  <button type="button" class="btn btn-default">1</button>
  <button type="button" class="btn btn-default">2</button>
  <button type="button" class="btn btn-default">3</button>
  <button type="button" class="btn btn-default">4</button>
  <button type="button" class="btn btn-default">5</button>
  <button type="button" class="btn btn-round btn-default">»</button>
</div> -->

<div class="container">
	<div class="row">
           <div id="custom-search-input">
          			<form method="get" action="../controller/voc.do">
                            <div class="input-group col-md-12">
                                <input type="text" class="search-query form-control" 
                                placeholder="단어 검색" name="searchWord"/>
                                <span class="input-group-btn">
                                    <button class="btn btn-danger" type="submit">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                     
		                    	</span>
		                	</div>
                	</form>
            </div> 
	</div>
</div>


<p class="p">Demo by Team Algoda.</p>


  
    


    <!-- FOOTER -->
    <footer class="container">
        <img class="float-end" src="img/logo.png" alt="" width="90" >
        
    </footer>
</main>


<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>