<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>로그인</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Price Slider Stylesheets -->
<link rel="stylesheet" href="${path}/resources/vendor/nouislider/nouislider.css">
<!-- Google fonts - Playfair Display-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
<!-- Google fonts - Poppins-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
<!-- swiper-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
<!-- Magnigic Popup-->
<link rel="stylesheet" href="${path}/resources/vendor/magnific-popup/magnific-popup.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="${path}/resources/css/style.default.css" id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="${path}/resources/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="${path}/resources/icons/team-logo.svg">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
</head>

<body>
	<div class="container-fluid px-0">
		<div class="row min-vh-100">
			<div class="col-md-8 col-lg-6 col-xl-6 d-flex align-items-center">
				<div class="w-75 mx-md-auto px-xxl-6 position-relative">
					<div class="mb-4">
						<h2>로그인</h2>
					</div>
					<form class="form-validate" action="${path}/login" method="post">
						<div class="mb-4">
							<label class="form-label" for="loginUsername"> ID </label> <input
								class="form-control" name="loginUsername" id="loginUsername"
								type="email" placeholder="아이디를 입력하세요" autocomplete="off"
								data-msg="Please enter your id" required>
						</div>
						<div class="mb-4">
							<div class="row">
								<div class="col">
									<label class="form-label" for="loginPassword"> PASSWORD
									</label>
								</div>
								<div class="col-auto">
									<a class="form-text small text-primary" href="#">비밀번호를
										잊으셨나요?</a>
								</div>
							</div>
							<input class="form-control" name="loginPassword"
								id="loginPassword" placeholder="비밀번호를 입력하세요" type="password"
								data-msg="Please enter your password" required>
						</div>
						<div class="mb-4">
							<div class="form-check">
								<input class="form-check-input" id="loginRemember"
									type="checkbox"> <label
									class="form-check-label text-muted" for="loginRemember">
									<span class="text-sm">아이디 저장</span>
								</label>
							</div>
						</div>
						<!-- Submit-->
						<div class="d-grid">
							<button class="btn btn-lg btn-primary mt-3" type="submit">로그인</button>
						</div>
						<hr class="my-3 hr-text letter-spacing-2" data-content="OR">
						<div class="d-grid gap-2">
							<button class="btn btn btn-social">
								<img src="${path}/resources/img/kakao_login.png" alt=""
									style="width: 100%;"></span>
							</button>
						</div>
						<hr class="my-3">
						<p class="text-center">
							<small class="text-muted text-center">아직 회원이 아니신가요? <a
								href="${path}/member/signup">가입하기</a>
							</small>
						</p>
					</form>
					<a class="close-absolute me-md-5 me-xl-6 pt-2" href="${path}"
						style="text-decoration: none;">
						<h6 class="mt-2" style="color: #000; font-weight: 400;">돌아가기</h6>
					</a>
				</div>
			</div>
			<div class="col-md-4 col-lg-6 col-xl-6 d-none d-md-block">
				<!-- Image-->
				<div class="bg-cover h-100 me-n3"
					style="background-image: url(${path}/resources/img/photo/login-photo.png);background-size: 100% 100%;"></div>
			</div>
		</div>
	</div>

	<!-- JavaScript files-->
	<script>
    // ------------------------------------------------------- //
    //   Inject SVG Sprite - 
    //   see more here 
    //   https://css-tricks.com/ajaxing-svg-sprite/
    // ------------------------------------------------------ //
    function injectSvgSprite(path) {

      var ajax = new XMLHttpRequest();
      ajax.open("GET", path, true);
      ajax.send();
      ajax.onload = function (e) {
        var div = document.createElement("div");
        div.className = 'd-none';
        div.innerHTML = ajax.responseText;
        document.body.insertBefore(div, document.body.childNodes[0]);
      }
    }
    // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
    // use your own URL in production, please :)
    // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
    //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
    injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');

    </script>
	<!-- jQuery-->
	<script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
	<!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
	<script
		src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Magnific Popup - Lightbox for the gallery-->
	<script
		src="${path}/resources/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
	<!-- Smooth scroll-->
	<script
		src="${path}/resources/vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
	<!-- Bootstrap Select-->
	<script
		src="${path}/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
	<script src="${path}/resources/vendor/object-fit-images/ofi.min.js"></script>
	<!-- Swiper Carousel                       -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
	<script>var basePath = ''</script>
	<!-- Main Theme JS file    -->
	<script src="${path}/resources/js/theme.js"></script>
</body>

</html>