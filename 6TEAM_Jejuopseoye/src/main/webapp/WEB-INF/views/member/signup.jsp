<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet"
	href="${path}/resources/vendor/nouislider/nouislider.css">
<!-- Google fonts - Playfair Display-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700">
<!-- Google fonts - Poppins-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">
<!-- swiper-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css">
<!-- Magnigic Popup-->
<link rel="stylesheet"
	href="${path}/resources/vendor/magnific-popup/magnific-popup.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="${path}/resources/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="${path}/resources/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon"
	href="${path}/resources/icons/homepage-logo.svg">
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
						<h2>회원가입</h2>
						<p class="text-muted">제주옵서예와 함께 멋진 여행을 계획해보세요</p>
					</div>
					<form class="form-validate" name="memberEnrollFrm"
						action="${path}/member/signup" method="post">
						<input type="hidden" name="kakaoToKen" value="${kakaoMap.id}">

						<div class="mb-3">
							<label class="form-label" for="loginUsername">ID</label>
							<div class="d-flex align-items-center">
								<input class="form-control" name="id" id="userId" type="text"
									maxlength="12" value="${kakaoMap.email}"
									placeholder="영문소문자와 숫자를 조합하여 6~12자로 입력하세요." onkeyup="checkId()"
									required>
								<button type="button" class="btn btn-primary ms-2"
									style="width: 120px;" onclick="IdDuplication()"
									data-toggle="modal" data-target="#myModal">중복확인</button>
							</div>
						</div>

						<div class="mb-3">
							<label class="form-label" for="loginPassword">PASSWORD</label> <input
								class="form-control" name="password" id="pass1"
								onkeyup="passwordCheck();" maxlength="16"
								placeholder="비밀번호를 입력하세요" type="password" required>

						</div>
						<div class="mb-3">
							<label class="form-label" for="loginPassword2">Confirm
								your password</label> <input class="form-control" id="pass2"
								name="passwordConfirm" maxlength="16" onkeyup="passwordCheck()"
								placeholder="위 비밀번호를 다시 입력해주세요." type="password" required>
							<span id="passMessage"
								style="font-style: italic; font-size: 12px;"></span>
						</div>
						<div class="mb-3">
							<label class="form-label" for="Usernickname">NICKNAME</label> <input
								class="form-control" name="nickName" id="Usernickname"
								type="text" value="${kakaoMap.nickname}"
								placeholder="4~8자 닉네임을 입력하세요." required>

						</div>
						<div class="mb-2">
							<label class="form-label" for="loginUseremail">E-MAIL</label><br>
							<div class="mail_box">
								<input name="email1" class="mail" type="text"> @ <input
									name="email2" id="email_input" class="mail" type="text">
								<select id="email-list" class="mail_list">
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
								class="form-control" name="phone" id="UserPhone" type="tel"
								placeholder="'-'제외한 11자리를 입력하세요." maxlength="11">
						</div>

						<div class="d-grid">
							<button class="btn btn-lg btn-primary mt-4" type="submit"
								id="enrollSubmit">가입하기</button>
						</div>
						<hr class="my-3 hr-text letter-spacing-2" data-content="OR">
						<div class="d-grid gap-2">
							<a
								href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=b9964ba9ce3b0df04ba39dea5d837027&redirect_uri=http://localhost/mvc/member/signup/kakao">
								<img src="${path}/resources/img/kakao_signup.png"
								style="width: 100%;">
							</a>
						</div>
						<hr class="my-3">
						<p class="text-center">
							<small class="text-muted text-center">이미 회원이신가요? <a
								href="${path}/member/loginview">로그인 </a></small>
						</p>
						<a class="close-absolute me-md-5 me-xl-6 pt-2" href="${path}"
							style="text-decoration: none;">
							<h6 class="mt-1" style="color: #000; font-weight: 400;">돌아가기</h6>
						</a>
					</form>
				</div>

			</div>
			<div class="col-md-4 col-lg-6 col-xl-6 d-none d-md-block">
				<!-- Image-->
				<div class="bg-cover h-100 me-n3"
					style="background-image: url(${path}/resources/img/photo/signup-photo.png);background-size: 100% 100%;"></div>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">아이디 중복확인</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p id="modalMessage"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							data-bs-dismiss="modal">확인</button>
					</div>
				</div>
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
        emailInputEl.readonly = "readonly"
      } else {   // 직접 입력
        // input 초기화하고 입력 가능하도록 변경
        emailInputEl.value = ""
        document.readonly = false
      }
    })
    // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
    // use your own URL in production, please :)
    // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
    //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
    injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');
    
  </script>

	<script type="text/javascript">
    // 아이디 중복 확인 함수
    function IdDuplication() {
        var userId = $("#userId").val();
        var regex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z0-9]{6,}$/;
        
        if (!regex.test(userId)) {
        	showModal("사용할 수 없는 아이디입니다. 다시 입력해주세요.");
            return;
        }

        $.ajax({
            url: "${path}/member/idCheck",
            type: "POST",
            data: {"id": userId},
            success: function(data) {
                if (data.result === "duplicated") {
                	showModal("중복된 아이디가 있습니다. 다시 입력해주세요.");
                } else {
                  showModal("가입 가능한 아이디입니다.");
                }
            },
            error: function() {
            	showModal("중복확인 검사에 실패했습니다. 다시 시도해주세요.");
            }
        });
    }
    
 	// 모달창 띄우는 함수
    function showModal(message) {
      $("#modalMessage").text(message);
      $("#myModal").modal("show");
    }
	</script>

	<script type="text/javascript">
	function passwordCheck(){
			var pass1=$("#pass1").val();
			var pass2=$("#pass2").val();
			
			if(pass1 !=pass2){
				$("#passMessage").html("<span style='color:red;'>비밀번호가 서로 일치하지 않습니다.");
			}else{

				$("#passMessage").html("<span style='color:blue;'>비밀번호가 일치합니다.");
				$("#password").val(pass1);
			}
		};    
		
		$("#enrollSubmit").on("click", () => {
	    	return false;
	    });
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