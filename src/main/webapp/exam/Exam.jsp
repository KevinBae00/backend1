<%@ page import="com.algoda.word.model.Worddto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
    <script src="../assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.112.5">
    <title>Carousel Template · Bootstrap v5.3</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">


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
            width: 100%;
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

        .btn-bd-primary {
            --bd-violet-bg: #712cf9;
            --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

            --bs-btn-font-weight: 600;
            --bs-btn-color: var(--bs-white);
            --bs-btn-bg: var(--bd-violet-bg);
            --bs-btn-border-color: var(--bd-violet-bg);
            --bs-btn-hover-color: var(--bs-white);
            --bs-btn-hover-bg: #6528e0;
            --bs-btn-hover-border-color: #6528e0;
            --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
            --bs-btn-active-color: var(--bs-btn-hover-color);
            --bs-btn-active-bg: #5a23c8;
            --bs-btn-active-border-color: #5a23c8;
        }

        .bd-mode-toggle {
            z-index: 1500;
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="../word/carousel.css" rel="stylesheet">
</head>
<body>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="check2" viewBox="0 0 16 16">
        <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"></path>
    </symbol>
    <symbol id="circle-half" viewBox="0 0 16 16">
        <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"></path>
    </symbol>
    <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"></path>
        <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"></path>
    </symbol>
    <symbol id="sun-fill" viewBox="0 0 16 16">
        <path d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"></path>
    </symbol>
</svg>
<form action="result.do" method="post">
    <header data-bs-theme="dark" class="pt-5" style="padding: 1rem;">
        <nav class="navbar navbar-expand-md navbar-dark fixed-top " style="background-color: #53eba6">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <a class="btn btn-primary" href="word/Main.jsp">홈으로 가기</a>
                    <div class="navbar-nav me-auto mb-2 mb-md-0"></div>
                    <div class="p-2 border border-5 rounded-3 d-flex"
                         style="color: white; background-color: gray;">
                        <label for="Timer">걸리는 시간:</label>
                        <input id="Timer" type="text" name="Timer" value="" readonly/>
                    </div>
                </div>
            </div>
        </nav>
    </header>

    <main>
            <%
        ArrayList list = (ArrayList<Worddto>) session.getAttribute("examLists");
    %>
        <div style="display: flex; justify-content: center;">
            <div class="card" id="box1"
                 style="width: 50rem; margin-top: 3rem; background-color: #BDFCC9;">
                <div class="card-img-top">1/10</div>
                <div class="card-body">
                    <p class="fs-3">${examLists[0].word}</p>
                    <h5 class="card-title">회원님의 답</h5>
                    <input type="text" class="card-text form-control" aria-label="Small"
                           aria-describedby="inputGroup-sizing-sm"
                           placeholder="영어로 정답을 입력하세요" name="ans"></input>
                    <a href="#box2" class="btn btn-primary" style="margin-top: 0.3em; float: right">next</a>
                </div>
            </div>
        </div>
        <div id="box2" style="height: 1em;"></div>
        <div style="display: flex; justify-content: center;">
            <div class="card"
                 style="width: 50rem; background-color: #BDFCC9; margin-top: 3rem; ">
                <div class="card-img-top">2/10</div>
                <div class="card-body">
                    <p class="fs-3">${examLists[1].word}</p>
                    <h5 class="card-title">회원님의 답</h5>
                    <input type="text" class="card-text form-control" aria-label="Small"
                           aria-describedby="inputGroup-sizing-sm"
                           placeholder="영어로 정답을 입력하세요" name="ans"></input>
                    <a href="#box3" class="btn btn-primary" style="margin-top: 0.3em; float: right">next</a>
                </div>
            </div>
        </div>
        <div id="box3" style="height: 1em;"></div>
        <div style="display: flex; justify-content: center;">
            <div class="card"
                 style="width: 50rem; background-color: #BDFCC9; margin-top: 3rem; ">
                <div class="card-img-top">3/10</div>
                <div class="card-body">
                    <p class="fs-3">${examLists[2].word}</p>
                    <h5 class="card-title">회원님의 답</h5>
                    <input type="text" class="card-text form-control" aria-label="Small"
                           aria-describedby="inputGroup-sizing-sm"
                           placeholder="영어로 정답을 입력하세요" name="ans"></input>
                    <a href="#box4" class="btn btn-primary" style="margin-top: 0.3em; float: right">next</a>
                </div>
            </div>
        </div>
        <div id="box4" style="height: 1em;">

        </div>
        <div style="display: flex; justify-content: center;">
            <div class="card"
                 style="width: 50rem; background-color: #BDFCC9; margin-top: 3rem; ">
                <div class="card-img-top">4/10</div>
                <div class="card-body">
                    <p class="fs-3">${examLists[3].word}</p>
                    <h5 class="card-title">회원님의 답</h5>
                    <input type="text" class="card-text form-control" aria-label="Small"
                           aria-describedby="inputGroup-sizing-sm"
                           placeholder="영어로 정답을 입력하세요" name="ans"></input>
                    <a href="#box5" class="btn btn-primary" style="margin-top: 0.3em; float: right">next</a>
                </div>
            </div>
        </div>
        <div id="box5" style="height: 1em;">

        </div>
        <div style="display: flex; justify-content: center;">
            <div class="card"
                 style="width: 50rem; background-color: #BDFCC9; margin-top: 3rem; ">
                <div class="card-img-top">5/10</div>
                <div class="card-body">
                    <p class="fs-3">${examLists[4].word}</p>
                    <h5 class="card-title">회원님의 답</h5>
                    <input type="text" class="card-text form-control" aria-label="Small"
                           aria-describedby="inputGroup-sizing-sm"
                           placeholder="영어로 정답을 입력하세요" name="ans"></input>
                    <a href="#box6" class="btn btn-primary" style="margin-top: 0.3em; float: right">next</a>
                </div>
            </div>
        </div>
        <div id="box6" style="height: 1em;"></div>
        <div style="display: flex; justify-content: center;">
            <div class="card"
                 style="width: 50rem; background-color: #BDFCC9; margin-top: 3rem; ">
                <div class="card-img-top">6/10</div>
                <div class="card-body">
                    <p class="fs-3">${examLists[5].word}</p>
                    <h5 class="card-title">회원님의 답</h5>
                    <input type="text" class="card-text form-control" aria-label="Small"
                           aria-describedby="inputGroup-sizing-sm"
                           placeholder="영어로 정답을 입력하세요" name="ans"></input>
                    <a href="#box7" class="btn btn-primary" style="margin-top: 0.3em; float: right">next</a>
                </div>
            </div>
        </div>
        <div id="box7" style="height: 1em;"></div>
        <div style="display: flex; justify-content: center;">
            <div class="card"
                 style="width: 50rem; background-color: #BDFCC9; margin-top: 3rem; ">
                <div class="card-img-top">7/10</div>
                <div class="card-body">
                    <p class="fs-3">${examLists[6].word}</p>
                    <h5 class="card-title">회원님의 답</h5>
                    <input type="text" class="card-text form-control" aria-label="Small"
                           aria-describedby="inputGroup-sizing-sm"
                           placeholder="영어로 정답을 입력하세요" name="ans"></input>
                    <a href="#box8" class="btn btn-primary" style="margin-top: 0.3em; float: right">next</a>
                </div>
            </div>
        </div>
        <div id="box8" style="height: 1em;"></div>
        <div style="display: flex; justify-content: center;">
            <div class="card"
                 style="width: 50rem; background-color: #BDFCC9; margin-top: 3rem; ">
                <div class="card-img-top">8/10</div>
                <div class="card-body">
                    <p class="fs-3">${examLists[7].word}</p>
                    <h5 class="card-title">회원님의 답</h5>
                    <input type="text" class="card-text form-control" aria-label="Small"
                           aria-describedby="inputGroup-sizing-sm"
                           placeholder="영어로 정답을 입력하세요" name="ans"></input>
                    <a href="#box9" class="btn btn-primary" style="margin-top: 0.3em; float: right">next</a>
                </div>
            </div>
        </div>
        <div id="box9" style="height: 1em;"></div>
        <div style="display: flex; justify-content: center;">
            <div class="card"
                 style="width: 50rem; background-color: #BDFCC9; margin-top: 3rem; ">
                <div class="card-img-top">9/10</div>
                <div class="card-body">
                    <p class="fs-3">${examLists[8].word}</p>
                    <h5 class="card-title">회원님의 답</h5>
                    <input type="text" class="card-text form-control" aria-label="Small"
                           aria-describedby="inputGroup-sizing-sm"
                           placeholder="영어로 정답을 입력하세요" name="ans"></input>
                    <a href="#box10" class="btn btn-primary" style="margin-top: 0.3em; float: right">next</a>
                </div>
            </div>
        </div>
        <div id="box10" style="height: 1em;"></div>
        <div style="display: flex; justify-content: center;">
            <div class="card"
                 style="width: 50rem; background-color: #BDFCC9; margin-top: 3rem; ">
                <div class="card-img-top">10/10</div>
                <div class="card-body">
                    <p class="fs-3">${examLists[9].word}</p>
                    <h5 class="card-title">회원님의 답</h5>
                    <input type="text" class="card-text form-control" aria-label="Small"
                           aria-describedby="inputGroup-sizing-sm"
                           placeholder="영어로 정답을 입력하세요" name="ans"></input>
                </div>
            </div>
        </div>

        <div style="display: flex; justify-content: center; margin-top: 5em">
            <button type="submit" class="btn btn-success" style="width: 20em;">제출</button>
        </div>
</form>
</main>
<!-- FOOTER -->
<footer class="container mt-4">
    <img class="float-end" src="../word/img" alt="" width="90">
    <h1>ALGODA</h1>
</footer>
</main>

<script>
    const Timer = document.getElementById('Timer'); //스코어 기록창-분
    let time = 0;
    let min = 0;
    let sec = 0;


    Timer.value = min + ":" + '00';

    function TIMER() {
        PlAYTIME = setInterval(function () {
            time = time + 1000; //1초씩 줄어듦
            min = time / (60 * 1000); //초를 분으로 나눠준다.

            if (sec < 60) { //sec=60 에서 1씩 빼서 출력해준다.
                sec = sec + 1;
                Timer.value = Math.floor(min) + ':' + sec; //실수로 계산되기 때문에 소숫점 아래를 버리고 출력해준다.

            }
            if (sec === 60) {
                // 0에서 -1을 하면 -59가 출력된다.
                // 그래서 0이 되면 바로 sec을 60으로 돌려주고 value에는 0을 출력하도록 해준다.
                sec = 0;
                Timer.value = Math.floor(min) + ':' + '00'
            }

        }, 1000); //1초마다
    }


    TIMER();

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
