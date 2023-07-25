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
            <a class="navbar-brand" href="#">ALGODA</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                    aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                </ul>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown"
                        aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div style="margin-right: 1rem;"><strong>관리자님 환영합니다.</strong></div>
                <button type="button" class="btn btn-outline-primary"
                        onclick="location.href='./Logout.do'"><strong>로그 아웃</strong></button>
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
                            <h3>단어 관리장</h3>
                            <div style="margin-top: 5px">
                                <a href="admin.do?adminlevel=1" class="btn btn-info origncolor">중등 영단어</a>
                                <a href="admin.do?adminlevel=2" class="btn btn-info origncolor">수능 영단어</a>
                                <a href="admin.do?adminlevel=3" class="btn btn-info origncolor">직장인 영단어</a>
                                <a class="btn btn-success float-end" id="btn_q"
                                   data-mdb-ripple-color="dark"
                                   href="admin/detail.jsp">단어 추가하기
                                </a>

                            </div>
                        </div>
                        <div class="card-body" style="margin-top: 40px">
                            <table id="datatablesSimple">
                                <thead>
                                <tr>
                                    <th>단어</th>
                                    <th>정의1</th>
                                    <th>정의2</th>
                                    <th>정의3</th>
                                    <th>유사 어휘1</th>
                                    <th>유사 어휘2</th>
                                    <th>유사 어휘3</th>
                                    <th>Day</th>
                                    <th>수정</th>
                                    <th>삭제</th>

                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${empty adminWords }">
                                        <tr>
                                            <td colspan="6" align="center">
                                                등록된 단어가 없습니다^^*
                                            </td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${adminWords }" var="row" varStatus="loop">
                                            <tr>
                                                <td>${row.word}</td>
                                                <td>${row.meaninga}</td>
                                                <td>${row.meaningb}</td>
                                                <td>${row.meaningc}</td>
                                                <td>${row.similar_worda}</td>
                                                <td>${row.similar_wordb}</td>
                                                <td>${row.similar_wordc}</td>
                                                <td>${row.day}</td>
                                                <td><a href="edit.do?word=${row.word}&level=${level}"
                                                       class="btn btn-warning">수정하기</a></td>
                                                <td><a href="delete.do?word=${row.word}&level=${level}"
                                                       class="btn btn-danger">삭제하기</a></td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
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