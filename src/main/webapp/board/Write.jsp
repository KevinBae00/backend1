<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 게시판 css -->
	<link rel="stylesheet" href="css/css.css">


<script>
	function chk_form() {
		
		var form = document.getElementById('frm')
		form.setAttribute('method', 'get');
		/* form.setAttribute('action', action); */
		document.charset = "utf-8";
		
		
		if(document.getElementById("title").value==""){
			alert("제목을 입력 해주세요.");
			return false;
			}
		if(document.getElementById("writer").value==""){
			alert("작성자를 입력 해주세요.");
			return false;
			}
		
		if(document.getElementById("update_pwd").value==""){
			alert("비밀번호를 입력 해주세요.");
			return false;
			}
		if(document.getElementById("content").value==""){
			alert("내용을 입력 해주세요.");
			return false;
			}
			form.submit();
		}


	</script>


</head>
<body>
	<div class="board_wrap">
        <div class="board_title">
            <strong>건의사항</strong>
            <p>저희 사이트의 아쉬운점을 건의해 주세요.</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
            
            	<form id="frm" action="../boardwrite.do">
	                <div class="title">
	                    <dl>
	                        <dt>제목</dt>
	                        <dd><input type="text" name="title" id="title" placeholder="제목 입력"></dd>
	                    </dl>
	                </div>
	                <div class="info">
	                    <dl>
	                        <dt>작성자</dt>
	                        <dd><input type="text" name="writer" id="writer" placeholder="작성자 입력"></dd>
	                    </dl>
	                    <dl>
	                        <dt>비밀번호</dt>
	                        <dd><input type="password" name="update_pwd" id="update_pwd"  placeholder="비밀번호 입력"></dd>
	                    </dl>
	                </div>
	                <div class="cont">
	                    <textarea  name="content"  id="content" placeholder="내용 입력"></textarea>
	                </div>
	                
	            </form>
		            </div>
		            <div class="bt_wrap">
		                <a onclick="return chk_form()" class="on">등록</a>
		                <a href="../boardlist.do">취소</a>
		            </div>
            
             	
        </div>
    </div>
    
    
</body>
</html>