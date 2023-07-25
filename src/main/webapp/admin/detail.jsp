<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Checkout example · Bootstrap v5.2</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/checkout/">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

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

        #synonym1 {
            flex-wrap: wrap;
        }

        .word > input {
            display: block;
        }


    </style>


    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">

    <script>
        let openWin;

        function wordcheck() {
            var word = document.getElementById("word").value;

            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("../wordcheck.do?word=" + word, "childForm", "width=570, height=350, resizable = no, scrollbars = no");
            openWin.document.getElementById("cInput").value = document.getElementById("word").value;
        }
    </script>
</head>
<body class="bg-light">

<!-- <div class="container row" style="float: none; margin: 100 auto;">
  <div class="col-md-8" style="float: none; margin: 0 auto;"> -->
<main>
    <div class="py-5 text-center">

        <h2>영단어 관리(관리자)</h2>

    </div>

    <!-- <div class="row g-5"> -->

    </div>


    <div class="container row" style="float: none; margin: 100 auto; margin-left:150px "></div>
    <div class="col-md-8" style="float: none; margin: 0 auto;">
        <h5></h5>
        <c:choose>
        <c:when test="${mode == 'edit'}">
        <form class="needs-validation" method="post" action="edit.do">
            </c:when>
            <c:otherwise>
            <form class="needs-validation" method="post" action="../add.do">
                </c:otherwise>
                </c:choose>
                <div class="row g-3">

                    <br><br><br>
                    <c:choose>
                        <c:when test="${mode == 'edit'}">
                            <div class="col-sm-12">
                                <label for="word" class="form-label">word(단어)</label>
                                <div class="word">
                                    <h3>${pagedto.word}</h3>
                                </div>
                            </div>
                            <input type="hidden" name="word" value="${pagedto.word}">
                            <div class="col-sm-6">
                                <label for="level" class="form-label">level</label>
                                <div>
                                    <h3>${adminlevel}</h3>
                                </div>
                            </div>
                            <input type="hidden" name="level" value="${adminlevel}">
                        </c:when>
                        <c:otherwise>
                            <div class="col-sm-12">
                                <label for="word" class="form-label">word(단어)</label>
                                <div class="word">
                                    <input type="text" class="form-control" id="word" name="word" required>
                                    <button class="btn btn-secondary" type="button" name="wordbtn" id="wordbtn"
                                            onclick="wordcheck()">
                                        중복확인
                                    </button>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <label class="form-label">level</label>
                                <div>
                                    <select id="level" name="level" style="width: 10em">
                                        <option value="1">중등 영단어</option>
                                        <option value="2">수능 영단어</option>
                                        <option value="3">직장인 영단어</option>
                                    </select>
                                </div>

                            </div>
                        </c:otherwise>
                    </c:choose>


                    <br><br><br>
                    <div class="col-sm-6">
                        <label for="day" class="form-label">day</label>
                        <input type="text" class="form-control" id="day" name="day" value="${pagedto.day}"
                               placeholder="숫자만 써주세요" required>

                    </div>


                    <br><br>
                    <div class="col-sm-12">
                        <label for="mean1" class="form-label">meaning1(뜻)</label>
                        <input type="text" class="form-control" id="mean1" name="mean1"
                               value="${pagedto.meaninga}" required>

                    </div>

                    <div class="col-sm-12">
                        <label for="mean2" class="form-label">meaning2(뜻)</label>
                        <div class="input-group has-validation">

                            <input type="text" class="form-control" id="mean2" name="mean2"
                                   value="${pagedto.meaningb}">
                            <div class="invalid-feedback">

                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12">
                        <label for="mean3" class="form-label">meaning3(뜻)</label>
                        <input type="text" class="form-control" id="mean3" name="mean3" value="${pagedto.meaningc}">

                    </div>

                    <div class="col-sm-12">
                        <label for="synonym1" class="form-label">synonym(동의어1)</label>
                        <input type="text" class="form-control" id="synonym1" name="synonym1"
                               value="${pagedto.similar_worda}">

                    </div>

                    <br><br>
                    <div class="col-sm-12 flex-wrap">
                        <label for="synonym2" class="form-label">synonym(동의어2) </label>
                        <input type="text" class="form-control" id="synonym2" name="synonym2"
                               value="${pagedto.similar_wordb}">
                    </div>

                    <br><br>
                    <div class="col-sm-12">
                        <label for="synonym3" class="form-label">synonym(동의어3) </label>
                        <input type="text" class="form-control" id="synonym3" name="synonym3"
                               value="${pagedto.similar_wordc}">
                    </div>

                    <br><br><br><br><br><br>
                    <div class="text-md-center">
                        <button class="col-sm-3 btn btn-success btn-lg" type="submit">
                            <c:choose>
                                <c:when test="${mode == 'edit'}">
                                    수정하기
                                </c:when>
                                <c:otherwise>
                                    추가하기
                                </c:otherwise>
                            </c:choose>
                        </button>&nbsp;&nbsp;
                        <button class="col-sm-3 btn btn-success btn-lg" onclick="history.back();">뒤로</button>
                    </div>
                </div>
            </form>
    </div>
</main>
</div>
</div>

<footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2023 Algoda</p>
    <ul class="list-inline">
        <li class="list-inline-item"><a href="#">Privacy</a></li>
        <li class="list-inline-item"><a href="#">Terms</a></li>
        <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
</footer>
</div>


<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

<script src="form-validation.js"></script>
</body>
</html>