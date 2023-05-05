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
  <title>여행후기</title>
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
  <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  <!-- Font Awesome CSS-->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
</head>

<body style="padding-top: 72px;">
  <header class="header header-absolute">
    <!-- Navbar-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-black-op">
      <div class="container-fluid">
        <div class="d-flex align-items-center"><a class="navbar-brand py-1" href="${path}"><img
              src="${path}/resources/icons/team-logo.svg" alt="Team logo"></a>
        </div>
        <!-- Navbar Collapse -->
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item dropdown"><a class="nav-link" href="${path}/menu/recommendation">추천</a></li>
            <li class="nav-item"><a class="nav-link" href="${path}/board/destination">관광지</a></li>
            <li class="nav-item"><a class="nav-link" href="${path}/board/content/attraction?option=C3">숙소</a></li>
            <li class="nav-item"><a class="nav-link" href="${path}/board/content/attraction?option=C4">맛집</a></li>
            <li class="nav-item"><a class="nav-link" href="${path}/board/content/attraction?option=C5">액티비티</a></li>
            <li class="nav-item"><a class="nav-link" href="${path}/menu/mypage">마이페이지</a></li>
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="docsDropdownMenuLink" href="#"
                data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                커뮤니티</a>
              <div class="dropdown-menu" aria-labelledby="homeDropdownMenuLink">
                <a class="dropdown-item text-lg" href="${path}/board/notice/board">공지사항</a>
                <a class="dropdown-item text-lg" href="${path}/board/free/board">자유게시판</a>
                <a class="dropdown-item text-lg" href="${path}/board/travel-review/board">여행후기</a>
              </div>
            </li>
            <c:if test="${ loginMember.role == 'ROLE_ADMIN' }">
            	<li class="nav-item"><a class="nav-link" href="${path}/board/notice/board-write">공지작성</a></li>
            </c:if>
          </ul>
          <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="#"><img src="${path}/resources/icons/cloud-snow.svg" alt=""> &nbsp;0°</a></li>
          </ul>
          <ul class="navbar-nav ms-0">
          	<c:if test="${ loginMember == null }">
            	<li class="nav-item"><a class="nav-link nav-name" href="${path}/member/loginview">로그인</a></li>
            	<li class="nav-item ms-0"><a class="nav-link nav-name" href="${path}/member/signup">회원가입</a></li>
            </c:if>
            <c:if test="${ loginMember != null }">
            	<li class="nav-item"><a class="nav-link nav-name">${loginMember.nickName} 님</a></li>
            	<li class="nav-item"><a class="nav-link nav-name" href="${path}/logout">로그아웃</a></li>
            </c:if>
          </ul>
        </div>
      </div>
    </nav>
    <!-- /Navbar -->
  </header>


<div class="container-fluid py-5 px-lg-5">
	<div class="row border-bottom mb-4">
		<div class="col-12">
			<h1>여행후기</h1>
		</div>
	</div>
	<!-- 여행후기 -->
	<div class="row">
		<div class="col-lg-3 pt-3">
			<form class="pe-xl-3" action="#">
				<div class="mb-4">
					<label class="form-label" for="form_search">검색</label>
					<div class="input-label-absolute input-label-absolute-right">
						<div class="label-absolute">
							<i class="fa fa-search"></i>
						</div>
						<input class="form-control pe-4" type="search" name="search"
							placeholder="검색어 입력..." id="form_search">
					</div>
				</div>
				<div class="mb-4">
					<label class="form-label" for="form_category">카테고리</label> <select
						class="selectpicker form-control" name="category"
						id="form_category" multiple data-style="btn-selectpicker"
						data-selected-text-format="count &gt; 1"
						data-none-selected-text="">
						<option value="category_0">제목</option>
						<option value="category_1">내용</option>
						<option value="category_2">작성자</option>
					</select>
				</div>
				<div class="mb-4">
					<label class="form-label">태그</label>
					<ul class="list-unstyled mb-0">
						<li>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="type_0"
									name="type[]"> <label class="form-check-label"
									for="type_0">관광지</label>
							</div>
						</li>
						<li>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="type_1"
									name="type[]"> <label class="form-check-label"
									for="type_1">숙소</label>
							</div>
						</li>
						<li>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="type_2"
									name="type[]"> <label class="form-check-label"
									for="type_2">맛집</label>
							</div>
						</li>
						<li>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="type_3"
									name="type[]"> <label class="form-check-label"
									for="type_3">액티비티</label>
							</div>
						</li>
					</ul>
				</div>
			</form>
		</div>
		<div class="col-lg-9">
			<div
				class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
				<div class="me-3">
					<p class="mb-3 mb-md-0">
						<strong>12</strong> results found
					</p>
				</div>
				<div>
					<label class="form-label me-2" for="form_sort">정렬</label> <select
						class="selectpicker" name="sort" id="form_sort"
						data-style="btn-selectpicker" title="">
						<option value="sortBy_0">최신순</option>
						<option value="sortBy_1">인기순</option>
					</select>
				</div>
			</div>
			<div class="row">
				<!-- venue item-->
				<div class="col-sm-6 col-xl-4 mb-5 hover-animate"
					data-marker-id="59c0c8e33b1527bfe2abaf92">
					<div class="card h-100 border-0 shadow">
						<div class="card-img-top overflow-hidden dark-overlay bg-cover"
							style="background-image: url(${path}/resources/img/photo/restaurant-1430931071372-38127bd472b8.jpg); min-height: 200px;">
							<a class="tile-link"
								href="${path}/board/travel-review/board-detail"></a>
						</div>
						<div class="card-body">
							<a href="${path}/board/travel-review/board-detail"
								class="custom-a">
								<h3 class="text-black text-shadow mt-4">제목</h3>
							</a>
							<p class="text-lg text-muted mb-1">
								By 홍길동</a>
							</p>
							<p class="text-base text-muted mb-0">2023-01-01</p>
						</div>
					</div>
				</div>
				<!-- venue item-->
				<div class="col-sm-6 col-xl-4 mb-5 hover-animate"
					data-marker-id="59c0c8e322f3375db4d89128">
					<div class="card h-100 border-0 shadow">
						<div class="card-img-top overflow-hidden dark-overlay bg-cover"
							style="background-image: url(${path}/resources/img/photo/restaurant-1436018626274-89acd1d6ec9d.jpg); min-height: 200px;">
							<a class="tile-link"
								href="${path}/board/travel-review/board-detail"></a>
						</div>
						<div class="card-body">
							<a href="${path}/board/travel-review/board-detail"
								class="custom-a">
								<h3 class="text-black text-shadow mt-4">제목</h3>
							</a>
							<p class="text-lg text-muted mb-1">
								By 홍길동</a>
							</p>
							<p class="text-base text-muted mb-0">2023-01-01</p>
						</div>
					</div>
				</div>
				<!-- venue item-->
				<div class="col-sm-6 col-xl-4 mb-5 hover-animate"
					data-marker-id="59c0c8e3a31e62979bf147c9">
					<div class="card h-100 border-0 shadow">
						<div class="card-img-top overflow-hidden dark-overlay bg-cover"
							style="background-image: url(${path}/resources/img/photo/restaurant-1466978913421-dad2ebd01d17.jpg); min-height: 200px;">
							<a class="tile-link"
								href="${path}/board/travel-review/board-detail"></a>
						</div>
						<div class="card-body">
							<a href="${path}/board/travel-review/board-detail"
								class="custom-a">
								<h3 class="text-black text-shadow mt-4">제목</h3>
							</a>
							<p class="text-lg text-muted mb-1">
								By 홍길동</a>
							</p>
							<p class="text-base text-muted mb-0">2023-01-01</p>
						</div>
					</div>
				</div>
				<!-- venue item-->
				<div class="col-sm-6 col-xl-4 mb-5 hover-animate"
					data-marker-id="59c0c8e3503eb77d487e8082">
					<div class="card h-100 border-0 shadow">
						<div class="card-img-top overflow-hidden dark-overlay bg-cover"
							style="background-image: url(${path}/resources/img/photo/restaurant-1477763858572-cda7deaa9bc5.jpg); min-height: 200px;">
							<a class="tile-link"
								href="${path}/board/travel-review/board-detail"></a>
						</div>
						<div class="card-body">
							<a href="${path}/board/travel-review/board-detail"
								class="custom-a">
								<h3 class="text-black text-shadow mt-4">제목</h3>
							</a>
							<p class="text-lg text-muted mb-1">
								By 홍길동</a>
							</p>
							<p class="text-base text-muted mb-0">2023-01-01</p>
						</div>
					</div>
				</div>
				<!-- venue item-->
				<div class="col-sm-6 col-xl-4 mb-5 hover-animate"
					data-marker-id="59c0c8e39aa2eed0626e485d">
					<div class="card h-100 border-0 shadow">
						<div class="card-img-top overflow-hidden dark-overlay bg-cover"
							style="background-image: url(${path}/resources/img/photo/restaurant-1504087697492-238a6bf49ce8.jpg); min-height: 200px;">
							<a class="tile-link"
								href="${path}/board/travel-review/board-detail"></a>
						</div>
						<div class="card-body">
							<a href="${path}/board/travel-review/board-detail"
								class="custom-a">
								<h3 class="text-black text-shadow mt-4">제목</h3>
							</a>
							<p class="text-lg text-muted mb-1">
								By 홍길동</a>
							</p>
							<p class="text-base text-muted mb-0">2023-01-01</p>
						</div>
					</div>
				</div>
				<!-- venue item-->
				<div class="col-sm-6 col-xl-4 mb-5 hover-animate"
					data-marker-id="59c0c8e39aa2edasd626e485d">
					<div class="card h-100 border-0 shadow">
						<div class="card-img-top overflow-hidden dark-overlay bg-cover"
							style="background-image: url(${path}/resources/img/photo/restaurant-1505275350441-83dcda8eeef5.jpg); min-height: 200px;">
							<a class="tile-link"
								href="${path}/board/travel-review/board-detail"></a>
						</div>
						<div class="card-body">
							<a href="${path}/board/travel-review/board-detail"
								class="custom-a">
								<h3 class="text-black text-shadow mt-4">제목</h3>
							</a>
							<p class="text-lg text-muted mb-1">
								By 홍길동</a>
							</p>
							<p class="text-base text-muted mb-0">2023-01-01</p>
						</div>
					</div>
				</div>
				<!-- venue item-->
				<div class="col-sm-6 col-xl-4 mb-5 hover-animate"
					data-marker-id="59c0c8e33b1527bfe2abaf92">
					<div class="card h-100 border-0 shadow">
						<div class="card-img-top overflow-hidden dark-overlay bg-cover"
							style="background-image: url(${path}/resources/img/photo/restaurant-1430931071372-38127bd472b8.jpg); min-height: 200px;">
							<a class="tile-link"
								href="${path}/board/travel-review/board-detail"></a>
						</div>
						<div class="card-body">
							<a href="${path}/board/travel-review/board-detail"
								class="custom-a">
								<h3 class="text-black text-shadow mt-4">제목</h3>
							</a>
							<p class="text-lg text-muted mb-1">
								By 홍길동</a>
							</p>
							<p class="text-base text-muted mb-0">2023-01-01</p>
						</div>
					</div>
				</div>
				<!-- venue item-->
				<div class="col-sm-6 col-xl-4 mb-5 hover-animate"
					data-marker-id="59c0c8e322f3375db4d89128">
					<div class="card h-100 border-0 shadow">
						<div class="card-img-top overflow-hidden dark-overlay bg-cover"
							style="background-image: url(${path}/resources/img/photo/restaurant-1436018626274-89acd1d6ec9d.jpg); min-height: 200px;">
							<a class="tile-link"
								href="${path}/board/travel-review/board-detail"></a>
						</div>
						<div class="card-body">
							<a href="${path}/board/travel-review/board-detail"
								class="custom-a">
								<h3 class="text-black text-shadow mt-4">제목</h3>
							</a>
							<p class="text-lg text-muted mb-1">
								By 홍길동</a>
							</p>
							<p class="text-base text-muted mb-0">2023-01-01</p>
						</div>
					</div>
				</div>
				<!-- venue item-->
				<div class="col-sm-6 col-xl-4 mb-5 hover-animate"
					data-marker-id="59c0c8e3a31e62979bf147c9">
					<div class="card h-100 border-0 shadow">
						<div class="card-img-top overflow-hidden dark-overlay bg-cover"
							style="background-image: url(${path}/resources/img/photo/restaurant-1466978913421-dad2ebd01d17.jpg); min-height: 200px;">
							<a class="tile-link"
								href="${path}/board/travel-review/board-detail"></a>
						</div>
						<div class="card-body">
							<a href="${path}/board/travel-review/board-detail"
								class="custom-a">
								<h3 class="text-black text-shadow mt-4">제목</h3>
							</a>
							<p class="text-lg text-muted mb-1">
								By 홍길동</a>
							</p>
							<p class="text-base text-muted mb-0">2023-01-01</p>
						</div>
					</div>
				</div>
			</div>
			<!-- 글쓰기 버튼-->
			<div class="col-sm-12 pe-4" style="text-align: right;">
				<a href="#"><button class="btn btn-primary" type="submit">글쓰기</button></a>
			</div>
			<!-- 페이징 -->
			<nav aria-label="Page navigation example">
				<ul
					class="pagination pagination-template d-flex justify-content-center">
					<li class="page-item"><a class="page-link" href="#"> <i
							class="fa fa-angle-left"></i></a></li>
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">6</a></li>
					<li class="page-item"><a class="page-link" href="#">7</a></li>
					<li class="page-item"><a class="page-link" href="#">8</a></li>
					<li class="page-item"><a class="page-link" href="#">9</a></li>
					<li class="page-item"><a class="page-link" href="#">10</a></li>
					<li class="page-item"><a class="page-link" href="#"> <i
							class="fa fa-angle-right"></i></a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>