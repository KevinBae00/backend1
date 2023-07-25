<%@ page import="java.util.ArrayList" %>
<%@ page import="com.algoda.exam.controller.Checkdto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<!-- 테이블 부트 스트랩 -->
<script src="../assets/js/color-modes.js"></script>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Carousel Template · Bootstrap v5.2</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/carousel/">


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


        /* 경계선 */
        /* 테이블 css */

        main {
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
            position: relative;
            padding: 0;
            width: 200px;
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
            color: #D9230F;
        }

        .search-query:focus + button {
            z-index: 3;
        }


        /* 버튼 CSS */
        .btn-group {
            position: relative;
            margin-left: 45%;
        }

        /* 추가 버튼 CSS */
        .fs-it-btn {
            margin-top: 10px;
            border: 1px solid #a2a2a2;
            border-radius: 0;
            color: #fff;
            font-weight: bold;
        }

        .fs-it-btn-vertical-line {
            text-align: center;
            padding: 4px 0 5px 10px;
            margin-left: 10px;
            border-left: 1px solid #a2a2a2;
        }

        .bg-blue {
            background-color: #2c9deb;
        }

        .text-uppercase {
            text-transform: uppercase;
        }
    </style>

    <!-- Custom styles for this template -->
    <link href="../word/carousel.css" rel="stylesheet">
</head>
<body>

<header data-bs-theme="dark" class="pt-5" style="padding: 1rem;">
    <nav class="navbar navbar-expand-md navbar-dark fixed-top " style="background-color: #53eba6">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <a class="btn btn-primary" href="word/Main.jsp">홈으로 가기</a>
                <div class="navbar-nav me-auto mb-2 mb-md-0"></div>
                <div class="p-2 border border-5 rounded-3 d-flex"
                     style="color: white; background-color: gray;">
                    <label for="Timer">총걸린 시간:</label>
                    <input id="Timer" type="text" name="Timer" value="${Timer}" readonly/>
                </div>
            </div>
        </div>
    </nav>
</header>

<main>

    <h2 class="fs-1 fw-bold text-success">${right} / 10</h2>
    <div class="container" style="text-align: center">
        <div class="row">
            <div class="col-xs-12">
                <table summary="This table shows how to create responsive tables using Datatables' extended functionality"
                       class="table table-bordered table-hover dt-responsive">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>영어단어</th>
                        <th>내가 쓴 단어</th>
                        <th>정답</th>
                        <th>채점 결과</th>
                        <th>동의어</th>
                        <th>단어장에 추가하기</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList examLists = (ArrayList<Checkdto>) request.getAttribute("checklist");
                        request.setAttribute("checklist", examLists);
                    %>
                    <c:choose>
                        <c:when test="${empty checklist }">
                            <tr>
                                <td colspan="6" align="center">
                                    등록된 문제가 없습니다^^*
                                </td>
                            </tr>
                        </c:when>

                        <c:otherwise>
                            <c:forEach items="${checklist }" var="row" varStatus="loop">
                                <tr align="center">
                                    <td> ${ loop.index+1}</td>
                                    <td>${ row.word }</td>
                                    <td>${ row.ans }</td>
                                    <c:choose>
                                        <c:when test="${row.check}">
                                            <td style="color: green;">${ row.meaninga }</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td style="color: red;">${ row.meaninga }</td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td>${ row.check }</td>
                                    <td>${ row.similiar_worda }</td>

                                    <td>
                                        <button type="button" class="btn btn-warning btn-lg">추가하기</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>


                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div>
        <c:choose>
            <c:when test="${empty examType}">
                <a href="exam.do" class="btn btn-primary btn-lg" style="margin-left: 90%">다시풀기</a>
            </c:when>
            <c:otherwise>
                <a href="exam.do?method=vol" class="btn btn-primary btn-lg" style="margin-left: 90%">다시풀기</a>
            </c:otherwise>
        </c:choose>

    </div>

    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->


    <!-- FOOTER -->
    <footer class="container mt-5">
        <img class="float-end" src="img/logo.png" alt="" width="90">
        <h1>ALGODA</h1>
    </footer>
</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script>
    $(function () {
        history.pushState(null, null, location.href);
        window.onpopstate = function () {
            history.go(1);
        };
        window.onpopstate;
    });
</script>

<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
        integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
        crossorigin="anonymous"></script>

</body>
</html>