<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <!-- 게시판 css -->
    <link rel="stylesheet" href="css/css.css?after">

    <script>

        var form = document.getElementById('frm');

        /* form.setAttribute('method', 'get'); */
        /* form.setAttribute('action', action); */
        document.charset = "utf-8";

        function chk_form(update_pwd) {

            var form = document.getElementById('frm');


            if (document.getElementById("title").value == "") {
                alert("제목을 입력 해주세요.");
                return false;
            }
            if (document.getElementById("update_pwd").value == "") {
                alert("비밀번호를 입력 해주세요.");
                return false;
            }
            if (document.getElementById("content").value == "") {
                alert("내용을 입력 해주세요.");
                return false;
            }
            if (document.getElementById("update_pwd").value != update_pwd) {
                alert("작성당시 입력한 비밀번호와 일치 하지 않습니다.");
                return false;
            }
            alert("수정이 완료 되었습니다.");
            form.submit();
        }


        function remove_validate(update_pwd, title) {


            alert(document.getElementById("title").value);
            var form = document.getElementById('frm');
            if (document.getElementById("title").value == "") {
                alert("제목을 입력 해주세요.");
                return false;
            }
            if (document.getElementById("update_pwd").value == "") {
                alert("비밀번호를 입력 해주세요.");
                return false;
            }
            if (document.getElementById("content").value == "") {
                alert("내용을 입력 해주세요.");
                return false;
            }
            if (document.getElementById("update_pwd").value != update_pwd) {
                alert("작성당시 입력한 비밀번호와 일치 하지 않습니다.");
                alert(update_pwd);
                return false;
            }


            alert("삭제가 완료 되었습니다.");
            form.method = "post";
            form.action = "../boardedit.do?mode=delete&title=" + title;

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

            <form id="frm" action="../boardedit.do?mode=edit" method="post">

                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" name="title" id="title" value="${param.title }"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>작성자</dt>
                        <dd><input type="text" name="writer" id="writer" value="${param.writer }" readonly="readonly">
                        </dd>
                    </dl>
                    <dl>
                        <dt>비밀번호</dt>
                        <dd><input type="password" name="update_pwd" id="update_pwd"></dd>

                    </dl>
                </div>
                <div class="cont">
                    <textarea name="content" id="content">${ param.content }</textarea>
                </div>


                <div class="bt_wrap">
                    <a onclick="return chk_form(${param.update_pwd})" class="on">수정 완료</a>
                    <a href="#" onclick="return remove_validate('${param.update_pwd}','${param.title}')">게시물 삭제</a>
                    <a href="javascript:window.history.back()">취소</a>
                </div>
            </form>
        </div>

        <%-- <a href="#" onclick="return remove_validate(${param.update_pwd},${param.title})">게시물 삭제</a> --%>

        <a href="#" onclick="return remove_validate(${param.update_pwd},${param.title})">게시물 삭제</a>

    </div>
</div>


</body>
</html>