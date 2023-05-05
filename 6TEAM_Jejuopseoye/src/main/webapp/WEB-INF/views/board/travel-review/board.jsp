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
<title>여행후기</title>
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
<link rel="shortcut icon" href="${path}/resources/icons/homepage-logo.svg">
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

<body style="padding-top: 72px;">
	<header class="header header-absolute">
		<!-- Navbar-->
		<nav class="navbar navbar-expand-lg navbar-dark bg-black-op">
			<div class="container-fluid">
				<div class="d-flex align-items-center">
					<a class="navbar-brand py-1" href="${path}"><img
						src="${path}/resources/icons/team-logo.png" alt="Team logo"></a>
				</div>
				<!-- Navbar Collapse -->
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item dropdown"><a class="nav-link"
							href="${path}/menu/recommendation">추천</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${path}/board/content/attraction?option=C1">관광지</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${path}/board/content/attraction?option=C3">숙박</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${path}/board/content/attraction?option=C4">음식점</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${path}/board/content/attraction?option=C5">축제/행사</a></li>
						<c:if test="${ loginMember != null }">
							<li class="nav-item"><a class="nav-link"
								href="${path}/menu/mypage">마이페이지</a></li>
						</c:if>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="docsDropdownMenuLink"
							href="#" data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 커뮤니티</a>
							<div class="dropdown-menu" aria-labelledby="homeDropdownMenuLink">
								<a class="dropdown-item text-lg"
									href="${path}/board/notice/board?type=notice">공지사항</a> <a
									class="dropdown-item text-lg"
									href="${path}/board/free/board?type=free">자유게시판</a> <a
									class="dropdown-item text-lg"
									href="${path}/board/travel-review/board?type=review">여행후기</a>
							</div></li>
						<c:if test="${ loginMember.role == 'ROLE_ADMIN' }">
							<li class="nav-item"><a class="nav-link"
								href="${path}/board/notice/board-write">공지작성</a></li>
						</c:if>
					</ul>
					<ul class="navbar-nav ms-auto">
						<li class="nav-item"><a class="nav-link" href="#"> <c:if
									test="${pattern==0}">
									<c:if test="${cloud=='DB01'}">
										<img style="width: 50px; height: 50px;"
											src="${path}/resources/icons/sun.svg" alt="">
									</c:if>
									<c:if test="${cloud=='DB03'}">
										<img style="width: 50px; height: 50px; margin-top: -15px;"
											src="${path}/resources/icons/cloud-sun.svg" alt="">
									</c:if>
									<c:if test="${cloud=='DB04'}">
										<img style="width: 50px; height: 50px;"
											src="${path}/resources/icons/cloud.svg" alt="">
									</c:if>
								</c:if> <c:if test="${pattern==1}">
									<img style="width: 50px; height: 50px;"
										src="${path}/resources/icons/cloud-rain.svg" alt="">
								</c:if> <c:if test="${pattern==2}">
									<img style="width: 50px; height: 50px;"
										src="${path}/resources/icons/cloud-sleet.svg" alt="">
								</c:if> <c:if test="${pattern==3}">
									<img style="width: 50px; height: 50px;"
										src="${path}/resources/icons/cloud-snow.svg" alt="">
								</c:if> <c:if test="${pattern==4}">
									<img style="width: 50px; height: 50px;"
										src="${path}/resources/icons/cloud-rain.svg" alt="">
								</c:if> &nbsp;<c:out value="${temperatures}°" />
						</a></li>
					</ul>
					<ul class="navbar-nav ms-0">
						<c:if test="${ loginMember == null }">
							<li class="nav-item"><a class="nav-link nav-name"
								href="${path}/member/loginview">로그인</a></li>
							<li class="nav-item ms-0"><a class="nav-link nav-name"
								href="${path}/member/signup">회원가입</a></li>
						</c:if>
						<c:if test="${ loginMember != null }">
							<li class="nav-item"><a class="nav-link nav-name">${loginMember.nickName}
									님</a></li>
							<li class="nav-item"><a class="nav-link nav-name"
								href="${path}/logout">로그아웃</a></li>
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
				<form class="pe-xl-3" action="${path}/board/travel-review/board"
					method="get">
					<div class="mb-4">
						<label class="form-label" for="form_search">검색</label>
						<div class="input-label-absolute input-label-absolute-right">
							<div class="label-absolute">
								<i class="fa fa-search"></i>
							</div>
							<input type="hidden" name="typeType" value="type"> <input
								type="hidden" name="typeValue" id="typeValue" value="${type}">
							<input class="form-control pe-4" value="${param.searchValue}"
								id="searchValue" name="searchValue" placeholder="검색어 입력..."
								id="form_search">
						</div>
					</div>
					<div class="mb-4">
						<label class="form-label" for="form_category">카테고리</label> <select
							class="selectpicker form-control" name="searchType"
							id="form_category" data-selected-text-format="count &gt; 1"
							data-none-selected-text="카테고리">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
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
						<p class="mb-3 mb-md-0"></p>
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
				<!-- 여행 후기 게시판 리스트 -->
				<div class="row">
					<c:if test="${empty list}">
						<p>조회된 글이 없습니다.</p>
					</c:if>
					<c:if test="${not empty list}">
						<c:forEach var="board" items="${list}">
							<c:if test="${board.type=='review'}">
								<!-- venue item-->
								<div class="col-sm-6 col-xl-4 mb-5 hover-animate"
									data-marker-id="59c0c8e33b1527bfe2abaf92">
									<div class="card h-100 border-0 shadow">
										<c:if test="${board.renamedFileName != null }">
											<!-- 파일 불러와서 넣기 (수정해야함) -->
											<div class="card-img-top overflow-hidden bg-cover"
												style="background-image: url(${path}/resources/upload/board/${board.renamedFileName}); min-height: 200px;">
												<a class="tile-link"
													href="${path}/board/travel-review/board-detail?no=${board.no}"></a>
											</div>
										</c:if>
										<c:if test="${board.renamedFileName == null }">
											<div class="card-img-top overflow-hidden bg-cover"
												style="background-image: url(${path}/resources/img/photo/hero_bg2.png); min-height: 200px;">
												<a class="tile-link"
													href="${path}/board/travel-review/board-detail?no=${board.no}"></a>
											</div>
										</c:if>
										<div class="card-body">
											<a
												href="${path}/board/travel-review/board-detail?no=${board.no}"
												class="custom-a">
												<h3 class="text-black text-shadow mt-4">
													<c:out value="${board.title}" />
												</h3>
											</a>
											<p class="text-lg text-muted mb-1">
												<c:out value="${board.nickName}" />
											</p>
											<p class="text-base text-muted mb-0">
												<fmt:formatDate type="date" value="${board.createDate}" />
											</p>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</c:if>
				</div>
				<!-- 글쓰기 버튼-->
				<div class="col-sm-12 pe-4" style="text-align: right;">
					<a href="${path}/board/travel-review/board-write"><button
							class="btn btn-primary" type="submit">글쓰기</button></a>
				</div>
				<!-- 페이징 -->
				<nav aria-label="Page navigation example">
					<!-- 이전 페이지 -->
					<ul
						class="pagination pagination-template d-flex justify-content-center">
						<li class="page-item">
							<button class="page-link"
								onclick="movePage('${path}/board/travel-review/board?type=review&page=${pageInfo.prevPage}')">
								<i class="fa fa-angle-left"></i>
							</button>
						</li>

						<!-- 10개 페이지 -->
						<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}"
							step="1" varStatus="status">
							<c:if test="${status.current == pageInfo.currentPage}">
								<li class="page-item active"><button class="page-link"
										disabled>${status.current}</button></li>
							</c:if>
							<c:if test="${status.current != pageInfo.currentPage}">
								<li class="page-item">
									<button class="page-link"
										onclick="movePage('${path}/board/travel-review/board?type=review&page=${status.current}')">
										${status.current}</button>
								</li>
							</c:if>
						</c:forEach>
						<!-- 다음 페이지 -->
						<li class="page-item">
							<button class="page-link"
								onclick="movePage('${path}/board/travel-review/board?type=review&page=${pageInfo.nextPage}')">
								<i class="fa fa-angle-right"></i>
							</button>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>



	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script type="text/javascript">
		function movePage(pageUrl) {
			var searchValue = document.getElementById("searchValue"); // 갤럭시
			var searchTypes = document.getElementsByName("searchType"); // title
			var typeValue = document.getElementById("typeValue"); // 갤럭시
			var typeTypes = document.getElementsByName("typeType"); // title
			var searchType = 'title';
			var typeType = 'type';

			if (searchValue.value.length > 0) {
				for (var i = 0; i < searchTypes.length; i++) {
					if (searchTypes[i].checked == true) {
						searchType = searchTypes[i].value;
					}
				}
				pageUrl = pageUrl + '&searchType=' + searchType
						+ '&searchValue=' + searchValue.value + '&typeType='
						+ typeType + '&typeValue' + typeValue;
			}
			location.href = encodeURI(pageUrl);
		}
	</script>