<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
    <script src="../assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.112.5">
    <title>로그인화면</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/heroes/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

    <script>
        $(function () {
            $('.slider1').bxSlider({
                slideWidth: 200,
                speed: 0.01,
                minSlides: 2,
                maxSlides: 10,
                slideMargin: 10,
                mode: 'horizontal',
                auto: true,        // 자동 실행 여부
                autoHover: true,   // 마우스 호버시 정지 여부


            });
        });


    </script>


    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-image: url("https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/back3.jpg");
            width: 100%;
            height: 100%;

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
            --bd-violet-bg: #53eba6;
            --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

            --bs-btn-font-weight: 600;
            --bs-btn-color: var(--bs-white);
            --bs-btn-bg: var(--bd-violet-bg);
            --bs-btn-border-color: var(--bd-violet-bg);
            --bs-btn-hover-color: var(--bs-white);
            --bs-btn-hover-bg: #53eba6;
            --bs-btn-hover-border-color: #53eba6;
            --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
            --bs-btn-active-color: var(--bs-btn-hover-color);
            --bs-btn-active-bg: #53eba6;
            --bs-btn-active-border-color: #53eba6;
        }

        .bd-mode-toggle {
            z-index: 1500;
        }

        .slider1 {
            display: d-flex;
            justify-content: center;
        }


        @media (min-width: 992px) {
            .rounded-lg-3 {
                border-radius: .3rem;
            }
        }


    </style>


    <!-- Custom styles for this template  -->
    <link href="heroes.css" rel="stylesheet">
</head>
<body>


<main>


    <div class="container col-xl-10 col-xxl-8 px-4 py-5">
        <div class="row align-items-center g-lg-5 py-5">
            <div class="col-lg-7 text-center text-lg-start">
                <h1 class="display-4 fw-bold lh-1 text-body-emphasis mb-3" style="background-color: #36c283;">
                    ALGODA </h1>
                <p class="col-lg-10 fs-4" style="font-style: italic;">Algoda is an English vocabulary book that you can
                    customize.</p>
                <p class="col-lg-10 fs-4">알고다로 세상에서 단 하나 뿐인 여러분만의 <br>단어장을 만들어보세요!</p>

            </div>
            <div class="col-md-10 mx-auto col-lg-5">


                <form class="p-4 p-md-5 border rounded-3 bg-body-tertiary" action="../Login.do"
                      method="post">
                    <img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/algoda.png" width="200px"
                         alt="" style="margin-bottom: 20px;">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="id" name="id">
                        <label for="floatingInput">아이디</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" id="pwd" placeholder="Password" name="pwd">
                        <label for="floatingPassword">비밀번호</label>
                    </div>
                    <!-- <div class="checkbox mb-3">
                      <label>
                        <input type="checkbox" id="remember-me" name="remember-me" value="remember-me"> Remember me
                      </label>
                    </div> -->
                    <button class="w-100 btn btn-lg" type="submit" onclick="return selectloginMember()"
                            style="background-color: #53eba6; color: white;">로 그 인
                    </button>

                    <div class="links" style="text-align: center; color: #36c283; margin-top: 20px;">
                        <a href="Idfind.jsp" style=" color: white;">아이디 찾기</a> |
                        <a href="Agreeinfo.jsp" style=" color: white;">비밀번호 찾기</a> |
                        <a href="Agreeinfo.jsp" style="  color: white;">회원가입</a>

                    </div>


                </form>
            </div>
        </div>
    </div>


    <div class="slider1">
        <div class="slide"><img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/mid2000.jpg"></div>
        <div class="slide"><img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/midalzza.jpg"></div>
        <div class="slide"><img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/mid1800.jpg"></div>
        <div class="slide"><img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/midky.jpg"></div>
        <div class="slide"><img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/hky2.jpg"></div>
        <div class="slide"><img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/hkyjpg.jpg"></div>
        <div class="slide"><img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/hlv1.jpg"></div>
        <div class="slide"><img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/hslv1.jpg"></div>
        <div class="slide"><img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/tedu.jpg"></div>
        <div class="slide"><img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/thk.jpg"></div>
        <div class="slide"><img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/tky.jpg"></div>
        <div class="slide"><img src="https://jae73wonbuck.s3.ap-northeast-2.amazonaws.com/images/t900jpg.jpg"></div>
    </div>


    <script>
        function selectloginMember() {
            var id = document.getElementById("id").value;
            var pwd = document.getElementById("pwd").value;

            if (id == "" || pwd == "") {
                alert("모든 정보를 입력해주세요.");

                return false;

            }


        }

    </script>


</main>
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>