<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- 게시판 css -->
	 <link rel="stylesheet" href="css/css.css">
	
<style>


</style>
	
</head>
<body>
<div class="board_wrap">
        <div class="board_title">
            <strong>건의사항</strong>
            <p>저희 사이트의 아쉬운점을 건의해 주세요.</p>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                    	글제목: ${param.title }
                </div>
                <div class="info">
                    
                    <dl>
                        <dt>작성자</dt>
                        <dd>${param.writer }</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd> <%= session.getAttribute("view_postdate") %></dd>
                    </dl>
                    
                    <dl>
                        <dt>조회수</dt>
                        <dd>${param.visitcount }</dd>
                    </dl>
                </div>
                <div class="cont">
		             ${ param.content }
                </div>
            </div>
            <div class="bt_wrap">
                <a href="../boardlist.do" class="on">목록</a>
                <a href="../boardview.do?title=${param.title}&mode=editview">수정/삭제</a>
                
            </div>
        </div>
    </div>
</body>
</html>