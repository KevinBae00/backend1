<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
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
        .navbar-brand {
            font-size: 30px;
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

        .blue {
            color: blue;
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top" style="background-color: #53eba6">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">ALGODA</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                    aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item">
                        <a class="nav-link" href="#" style="color: mediumpurple"
                           onclick="location.href='../controller/voc.do'">내 단어장</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../rank.do?level=1" style="color: mediumpurple">랭킹 보기</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="../boardlist.do" style="color: mediumpurple">건의 사항</a>
                    </li>
                </ul>

                <div style="margin-right: 1rem;"><strong>${username}님 환영합니다.</strong></div>
                <button type="button" class="btn btn-outline-primary"
                        onclick="location.href='../Logout.do'"><strong>로그아웃</strong></button>
            </div>
        </div>
    </nav>
</header>

<main>

    <div id="myCarousel" class="carousel slide" data-bs-ride="word">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true"
                    aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                     aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <image width="100%"
                           href="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/back3.jpg"></image>
                </svg>

                <div class="container ">
                    <div class="carousel-caption blue">
                        <h1>
                            ${Todaywords[0].word}
                        </h1>
                        <p>${Todaywords[0].meaninga}</p>
                        <p><a class="btn btn-lg" href="#" style="background-color: #53eba6">단어장에 넣기</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                     aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <image width="100%"
                           href="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/back3.jpg"></image>
                </svg>

                <div class="container">
                    <div class="carousel-caption blue">
                        <h1>
                            ${Todaywords[1].word}
                        </h1>
                        <p>${Todaywords[1].meaninga}</p>
                        <p><a class="btn btn-lg" href="#" style="background-color: #53eba6">단어장에 넣기</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg"
                     aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <image width="100%"
                           href="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/back3.jpg"></image>
                </svg>

                <div class="container">
                    <div class="carousel-caption blue">
                        <h1>
                            ${Todaywords[2].word}
                        </h1>
                        <p>${Todaywords[2].meaninga}</p>
                        <p><a class="btn btn-lg" href="#" style="background-color: #53eba6">단어장에 넣기</a></p>
                    </div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">
        <!-- Three columns of text below the algoda -->
        <div class="row">
            <div class="col-lg-4">
                <img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/KakaoTalk_20230720_183601886_03.jpg"
                     alt="">
                <h2 class="fw-normal">중등 영단어</h2>
                <p>중고등 학생 떄 배워야 할 필수 영단어 1000개 모음집</p>
                <p>
                    <button class="btn" href="#" style="background-color: #53eba6"
                            onclick="location.href='../controller/word.do?wordLevel=1&pageNum=1'">영단어 바로 보기 &raquo;
                    </button>
                </p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/KakaoTalk_20230720_183601886_04.jpg"
                     alt="">
                <h2 class="fw-normal">수능 영단어</h2>
                <p>대학 입시, 좋은 대학을 가기 위한 필수 영단어 1000개 모음집</p>
                <p>
                    <button class="btn" href="#" style="background-color: #53eba6"
                            onclick="location.href='../controller/word.do?wordLevel=2'">영단어 바로 보기 &raquo;
                    </button>
                </p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/KakaoTalk_20230720_183601886_01.jpg"
                     alt="">
                <h2 class="fw-normal">직장인 영단어</h2>
                <p>영어가 필수인 세대! 직장인들을 위한 필수 영단어 1000개 모음집</p>
                <p>
                    <button class="btn" href="#" style="background-color: #53eba6"
                            onclick="location.href='../controller/word.do?wordLevel=3'">영단어 바로 보기 &raquo;
                    </button>
                </p>
            </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->

        <hr class="featurette-divider">

    </div><!-- /.container -->


    <!-- FOOTER -->
    <footer class="container">
        <img class="float-end" src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/algoda.png" alt=""
             width="90">
        <h1>ALGODA</h1>
    </footer>
</main>


<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
        integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
        crossorigin="anonymous"></script>

</body>
</html>