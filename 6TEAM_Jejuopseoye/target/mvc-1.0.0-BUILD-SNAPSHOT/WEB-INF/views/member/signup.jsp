<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>회원가입</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Price Slider Stylesheets -->
<link rel="stylesheet"	href="${path}/resources/vendor/nouislider/nouislider.css">
<!-- Google fonts - Playfair Display-->
<link rel="stylesheet"	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
<!-- Google fonts - Poppins-->
<link rel="stylesheet"	href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
<!-- swiper-->
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
<!-- Magnigic Popup-->
<link rel="stylesheet"	href="${path}/resources/vendor/magnific-popup/magnific-popup.css">
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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
</head>

<body>
	<div class="container-fluid px-0">
		<div class="row min-vh-100">
			<div class="col-md-8 col-lg-6 col-xl-6 d-flex align-items-center">
				<div class="w-75 mx-md-auto px-xxl-6 position-relative">
					<div class="mb-4">
						<h2>회원가입</h2>
						<p class="text-muted">제주옵서예와 함께 멋진 여행을 계획해보세요</p>
					</div>
					<form class="form-validate">
						<div class="mb-3">
							<label class="form-label" for="loginUsername">ID</label> <input
								class="form-control" name="loginUsername" id="loginUsername"
								type="email" placeholder="아이디를 입력하세요" autocomplete="off"
								data-msg="Please enter your id" required>
						</div>

						<div class="mb-3">
							<label class="form-label" for="loginPassword">PASSWORD</label> <input
								class="form-control" name="loginPassword" id="loginPassword"
								placeholder="Password" type="password"
								data-msg="Please enter your password" required>
						</div>
						<div class="mb-3">
							<label class="form-label" for="loginPassword2">Confirm
								your password</label> <input class="form-control" name="loginPassword2"
								id="loginPassword2" placeholder="Password" type="password"
								data-msg="Please enter your password" required>
						</div>
						<div class="mb-3">
							<label class="form-label" for="Usernickname">NICKNAME</label> <input
								class="form-control" name="Usernickname" id="Usernickname"
								type="email" placeholder="닉네임을 입력하세요(4~8자)" autocomplete="off"
								data-msg="Please enter your nickname" required>
						</div>
						<div class="mb-2">
							<label class="form-label" for="loginUseremail">E-MAIL</label><br>
							<div class="mail_box">
								<input class="mail" type="text"> @ <input
									id="email_input" class="mail" type="text"> <select
									id="email-list" class="mail_list">
									<option value="type" selected>직접 입력</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
								</select>
							</div>
						</div>
						<div class="mb-3">
							<label class="form-label" for="UserPhone">PHONE</label> <input
								class="form-control" name="UserPhone" id="UserPhone"
								type="email" placeholder="'-'제외한 11자리를 입력하세요" autocomplete="off"
								required data-msg="Please enter your phone">
						</div>

						<div class="d-grid">
							<button class="btn btn-lg btn-primary mt-4" type="submit">가입하기</button>
						</div>
						<hr class="my-3 hr-text letter-spacing-2" data-content="OR">
						<div class="d-grid gap-2">
							<button class="btn btn btn-social">
								<img src="${path}/resources/img/kakao_signup.png"
									style="width: 100%;"></span>
							</button>
						</div>
						<hr class="my-3">
						<p class="text-center">
							<small class="text-muted text-center">이미 회원이신가요? <a
								href="${path}/member/loginview">로그인 </a></small>
						</p>
					</form>
					<a class="close-absolute me-md-5 me-xl-6 pt-2" href="${path}"
						style="text-decoration: none;">
						<h6 class="mt-1" style="color: #000; font-weight: 400;">돌아가기</h6>
					</a>
				</div>
			</div>
			<div class="col-md-4 col-lg-6 col-xl-6 d-none d-md-block">
				<!-- Image-->
				<div class="bg-cover h-100 me-n3"
					style="background-image: url(${path}/resources/img/photo/signup-photo.png);background-size: 100% 100%;"></div>
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

    const emailListEl = document.querySelector('#email-list')
    const emailInputEl = document.querySelector('#email_input')

    emailListEl.addEventListener('change', (event) => {
      // email 선택 시 disabled
      if (event.target.value !== "type") {
        emailInputEl.value = event.target.value
        emailInputEl.disabled = true
      } else {   // 직접 입력
        // input 초기화하고 입력 가능하도록 변경
        emailInputEl.value = ""
        emailInputEl.disabled = false
      }
    })
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