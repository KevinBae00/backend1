<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!Doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Algoda 회원가입</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">


    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/checkout/">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script>


        function validateform() {

            var joinform = document.joinform;

            if (joinform.name.value == "") {
                alert("이름을 입력해 주세요.");
                joinform.name.focus();
                return false;
            }

            if (joinform.id.value == "") {
                alert("아이디를 입력해 주세요.");
                joinform.id.focus();
                return false;
            }

            if (joinform.pwd.value == "") {
                alert("비밀번호를 입력해 주세요.");
                joinform.pwd.focus();
                return false;
            }

            if (joinform.pwd2.value == "") {
                alert("비밀번호 확인을 입력해 주세요.");
                joinform.pwd2.focus();
                return false;
            }

            if (joinform.pwd.value != joinform.pwd2.value) {
                alert("비밀번호가 일치하지 않습니다.");
                joinform.pwd.select();
                return false;
            }


            if (joinform.email.value == "") {
                alert("이메일을 입력해 주세요.");
                joinform.email.focus();
                return false;
            }

            if (joinform.tel.value == "") {
                alert("연락처를 입력해 주세요.");
                joinform.tel.focus();
                return false;
            }


            var passhintSelect = joinform.hint;

            if (passhintSelect.value.trim() === "" || passhintSelect.value === "0") {
                alert("비밀번호 힌트 질문을 선택해 주세요.");
                passhintSelect.focus();
                return false;
            }


            if (joinform.hint_asw.value == "") {
                alert("비밀번호 힌트 답변을 입력해 주세요.");
                joinform.hint_asw.focus();
                return false;
            }

            if (joinform.hint_asw.value == "") {
                alert("비밀번호 힌트 답변을 입력해 주세요.");
                joinform.hint_asw.focus();
                return false;
            }

            if (joinform.check.value != "1") {
                alert("중복 상태를 확인해 주세요");
                return false;
            }

            alert("회원 가입되셨습니다. 로그인 화면으로 이동합니다.");
            joinform.action = "../Memberjoin.do";
            joinform.submit();
        }


        let openWin;

        function Idcheck() {
            var id = document.getElementById("id").value;

            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("Idcheck.do?id=" + id, "childForm", "width=570, height=350, resizable = no, scrollbars = no");
            openWin.document.getElementById("cInput").value = document.getElementById("id").value;
        }

        function cancel() {
            joinform.action = "Login.jsp";
            joinform.submit();

        }


    </script>

    <style>
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
    </style>


    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
</head>

<body class="bg-light">


<div class="container mx-auto" style="margin: 0 auto;">
    <main>
        <div class="py-5 text-center">

            <h2>회원가입</h2>

        </div>


        <div class="row justify-content-center">
            <form class="needs-validation" novalidate method="post" name="joinform" id="joinform">

                <input type="hidden" id="check" name="check">

                <div class="col-12">
                    <label for="name" class="form-label">이름(실명)</label>
                    <div class="input-group has-validation">

                        <input type="text" class="form-control" name="name" id="name" placeholder="이름(3자 이상)" required>

                    </div>
                </div>

                <div class="col-12">
                    <label for="id" class="form-label">아이디</label>
                    <div class="input-group has-validation">

                        <input type="text" class="form-control" name="id" id="id" placeholder="아이디 입력" required
                               onchange="">
                        <button class="btn btn-secondary" type="button" name="idbtn" id="idbtn" onclick="Idcheck()">
                            중복확인
                        </button>

                    </div>
                </div>

                <div class="col-12">
                    <label for="password" class="form-label">비밀번호</label>
                    <div class="input-group has-validation">

                        <input type="password" class="form-control" name="pwd" id="pwd" minlength="8" maxlength="20"
                               placeholder="8자 이상~영문, 숫자, 특수기호 조합" required>

                    </div>
                </div>


                <div class="col-12">
                    <label for="password" class="form-label">비밀번호 확인</label>
                    <div class="input-group has-validation">

                        <input type="password" class="form-control" name="pwd2" id="pwd2" minlength="8" maxlength="20"
                               placeholder="비밀번호 확인" required>

                    </div>
                </div>


                <div class="col-12">
                    <label for="email" class="form-label">이메일 </label>
                    <input type="email" class="form-control" name="email" id="email" placeholder="Algoda@example.com">

                </div>

                <div class="col-12">
                    <label for="phonenumber" class="form-label">연락처</label>
                    <input type="text" class="form-control" name="tel" id="tel" maxlength="20" placeholder="-없이 숫자만 입력"
                           required>

                </div>


                <div class="col-12">
                    <label for="hint" class="form-label">비밀번호 힌트 질문</label><br>
                    <select class="form-select" aria-label="Default select example" name="hint" id="hint" required>
                        <option selected disable value>--질문을 선택하세요---</option>
                        <option value="1">가장 좋아하는 색은?</option>
                        <option value="2">통학했던 초등학교 이름은?</option>
                        <option value="3">다시 태어난다면 되고 싶은 것은?</option>
                        <option value="4">존경했던 선생님 성함은?</option>
                        <option value="5">가장 소중한 보물은?</option>
                        <option value="6">좋아하는 연예인 이름은?</option>
                        <option value="7">감명깊게 읽었던 책 이름은?</option>
                    </select>

                </div>

                <div class="col-12">
                    <label for="hint_asw" class="form-label">힌트 답변</label>
                    <input type="text" class="form-control" name="hint_asw" id="hint_asw" maxlength="20"
                           placeholder="--직접 입력--"
                           required>

                </div>


                <br>
                <div class="text-center">
                    <button class="w-10 btn btn-secondary btn-lg" type="submit"
                            onclick="return validateform()">가입하기
                    </button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="w-10 btn btn-secondary btn-lg" type="reset">다시입력</button>&nbsp;
                    <button class="w-10 btn btn-secondary btn-lg" onclick="cancel()">취소</button>
                </div>


            </form>
        </div>
</div>
</div>
</main>
</div>
<footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; Demo by Team Algoda.</p>
    <ul class="list-inline">
        <li class="list-inline-item"><a href="#">Privacy</a></li>
        <li class="list-inline-item"><a href="#">Terms</a></li>
        <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
</footer>
</div>


<!--   <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->

<script src="form-validation.js"></script>
</body>

</html>

</body>

</html>