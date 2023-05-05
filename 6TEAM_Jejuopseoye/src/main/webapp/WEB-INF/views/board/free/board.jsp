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
<title>자유게시판</title>
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

<c:set var="type" value="${param.type}"/>

	<section class="py-6">
		<div class="container mb-3">
			<div class="row mb-6">
				<div class="col-md-4">
					<h1>자유게시판</h1>
				</div>
			</div>
			<!-- 자유게시판 -->
			<div class="table-responsive">
				<table class="table text-gray-700 table-striped table-hover">
					<tr>
						<th class="py-4 text-center align-middle" style="width: 10%">글번호</th>
						<th class="py-4 text-center align-middle" style="width: 50%">제목</th>
						<th class="py-4 text-center align-middle" style="width: 15%">작성일</th>
						<th class="py-4 text-center align-middle" style="width: 15%">작성자</th>
						<th class="py-4 text-center align-middle" style="width: 10%">조회수</th>
					</tr>
					<c:if test="${empty list}">
						<tr>
							<td class="py-4 text-center align-middle" colspan="5">조회된 글이
								없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not empty list}">
						<c:forEach var="board" items="${list}">
							<tr>
								<td class="py-4 text-center align-middle"><c:out
										value="${board.no}" /></td>
								<td class="py-4 ps-5 align-middle"><a class="custom-a"
									href="${path}/board/free/board-detail?no=${board.no}"><c:out
											value="${board.title}" /></a></td>
								<td class="py-4 text-center align-middle"><fmt:formatDate
										type="date" value="${board.createDate}" /></td>
								<td class="py-4 text-center align-middle"><c:out
										value="${board.nickName}" /></td>
								<td class="py-4 text-center align-middle"><c:out
										value="${board.readCount}" /></td>
							</tr>
						</c:forEach>
					</c:if>

				</table>
			</div>
		</div>

		<!-- 페이징 -->
		<div class="row mb-3">
			<nav aria-label="Page navigation example">
				<!-- 이전 페이지 -->
				<ul
					class="pagination pagination-template d-flex justify-content-center">
					<li class="page-item">
						<button class="page-link"
							onclick="movePage('${path}/board/free/board?type=free&page=${pageInfo.prevPage}')">
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
									onclick="movePage('${path}/board/free/board?type=free&page=${status.current}')">
									${status.current}</button>
							</li>
						</c:if>
					</c:forEach>
					<!-- 다음 페이지 -->
					<li class="page-item">
						<button class="page-link"
							onclick="movePage('${path}/board/free/board?type=free&page=${pageInfo.nextPage}')">
							<i class="fa fa-angle-right"></i>
						</button>
					</li>
				</ul>
			</nav>
		</div>

		<!-- 글쓰기 버튼-->
		<c:if test="${loginMember != null}">
			<div class="col-sm-11 pe-4" style="text-align: right;">
				<a href="${path}/board/free/board-write"><button
						class="btn btn-primary" type="submit">글쓰기</button></a>
			</div>
		</c:if>
		<!-- 검색바 -->
		<div class="row">
			<div class="col-xl-4 mx-auto">
				<form action="${path}/board/free/board" method="get">
					<div class="input-group">
						<input type="hidden" name="searchType" value="title"> <input
							type="hidden" name="typeType" value="type"> <input
							type="hidden" name="typeType" id="typeType" value="${type}">
						<input style="border-radius: 8px 0 0 8px/8px 0 0 8px"
							class="form-control" type="text" value="${param.searchValue}"
							id="searchValue" name="searchValue" placeholder="검색어 입력...">
						<button class="btn btn-primary" type="submit">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
	</section>


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