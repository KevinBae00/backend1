<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Tables - SB Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet"/>
    <link href="css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <style>
        .origncolor {
            background-color: #53eba6;
            border: #53eba6;
        }
    </style>
</head>
<body class="sb-nav-fixed">
<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top " style="background-color: #53eba6">
        <div class="container-fluid">
            <a class="navbar-brand" href="word/Main.jsp">ALGODA</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                    aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item">
                        <a class="nav-link" href="controller/voc.do" style="color: mediumpurple"
                        >내 단어장</a>
                    </li>
                </ul>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown"
                        aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <button type="button" class="btn btn-outline-primary"
                	onclick="location.href='../Logout.do'"><strong>로그 아웃</strong></button>
            </div>
        </div>
    </nav>
</header>
<main>
    <div id="layoutSidenav" style="margin-top: 70px">
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">${section}</h1>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            랭킹
                            <div style="margin-top: 3px">
                                <a href="rank.do?level=1" class="btn btn-info btn-sm origncolor">중등 영단어</a>
                                <a href="rank.do?level=2" class="btn btn-info btn-sm origncolor">수능 영단어</a>
                                <a href="rank.do?level=3" class="btn btn-info btn-sm origncolor">직장인 영단어</a>
                            </div>
                        </div>
                        <div class="card-body" style="margin-top: 40px">
                            <table id="datatablesSimple">
                                <thead>
                                <tr>
                                    <th>랭킹</th>
                                    <th>닉네임</th>
                                    <th>아이디</th>
                                    <th>평균 점수</th>
                                    <th>시험 횟수</th>

                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${empty ranklist }">
                                        <tr>
                                            <td colspan="6" align="center">
                                                등록된 회원 없습니다^^*
                                            </td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${ranklist }" var="row" varStatus="loop">
                                            <tr>
                                                <c:if test="${{row.id} eq {id}}">
                                                    <c:set var="rank" value="${loop.index+1}"/>
                                                    <c:set var="nickname" value="${row.name}"/>
                                                </c:if>
                                                <td>${loop.index+1}</td>
                                                <td>${row.name}</td>
                                                <td>${row.id}</td>
                                                <td>${row.score}</td>
                                                <td>${row.count}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-body">
                            <c:out value="${nickname}"/>님의 랭킹은 ${rank} 등입니다.
                        </div>
                    </div>
                </div>
            </main>
            <footer class="container mt-4">
                <img class="float-end" src="img/logo.png" alt="" width="90">
                <h1>ALGODA</h1>
            </footer>
        </div>
    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script>window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        // document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});</script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
        integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
        crossorigin="anonymous"></script>
<script>
    window.addEventListener('DOMContentLoaded', event => {
        // Simple-DataTables
        // https://github.com/fiduswriter/Simple-DataTables/wiki

        const datatablesSimple = document.getElementById('datatablesSimple');
        if (datatablesSimple) {
            new simpleDatatables.DataTable(datatablesSimple);
        }
    });
</script>
</body>
</html>