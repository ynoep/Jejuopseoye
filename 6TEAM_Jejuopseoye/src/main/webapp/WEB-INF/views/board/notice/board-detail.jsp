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
<title>공지사항 글내용</title>
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


	<section class="py-6">
		<div class="container">
			<div class="row mb-6">
				<div class="col-md-4">
					<h1>공지사항</h1>
				</div>
			</div>
			<!-- 공지사항 상세 -->
			<div class="table-responsive">
				<table
					class="table table-bordered text-gray-700 table-striped table-hover notice-detail">
					<tr>
						<th class="py-4 text-center align-middle" style="width: 20%">제목</th>
						<td class="py-4 text-center align-middle" style="width: 80%"><c:out
								value="${board.title}" /></td>
					</tr>
					<tr>
						<th class="py-4 text-center align-middle">내용</th>
						<td class="py-4 text-center align-middle">
							<div style="min-height: 400px;">
								<c:out value="${board.content}" escapeXml="false"/>
							</div>
						</td>
					</tr>
					<tr>
						<th class="py-4 text-center align-middle">공지시간</th>
						<td class="py-4 text-center align-middle"><fmt:formatDate
								type="both" value="${board.createDate}" /></td>
					</tr>
					<tr>
						<th class="py-4 text-center align-middle">첨부파일</th>
						<td class="py-4 text-center align-middle"><c:if
								test="${ !empty board.originalFileName }">
								<a
									href="javascript:fileDownload('${board.originalFileName}', '${board.renamedFileName}')">
									<img src="${path}/resources/images/file.png" width="20"
									height="20" /> <c:out value="${board.originalFileName}"></c:out>
								</a>
								<script>
						function fileDownload(oriname, rename) {
							const url = "${path}/board/fileDown";
							
							let oName = encodeURIComponent(oriname);
							let rName = encodeURIComponent(rename);
							
							location.assign(url + "?oriname=" + oName + "&rename=" + rName);
						}
					</script>
							</c:if> <c:if test="${empty board.originalFileName}">
								<span> - </span>
							</c:if></td>
					</tr>
				</table>
			</div>
			<div class="text-center align-middle mb-3">
				<a href="${path}/board/notice/board">
					<button class="btn btn-primary" type="button">목록</button>
				</a>
				<c:if
					test="${not empty loginMember && loginMember.role == 'ROLE_ADMIN'}">
					<button style="margin-left: 20px;" class="btn btn-primary"
						type="button" id="btnUpdate">수정</button>
					<button style="margin-left: 20px;" class="btn btn-dark"
						type="button" id="btnDelete">삭제</button>

				</c:if>
			</div>
		</div>
	</section>


	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script>
	$(document).ready(() => {
		$("#btnUpdate").on("click", (e) => {
			location.href = "${path}/board/notice/board-update?no=${board.no}";
		});
		
		$("#btnDelete").on("click", (e) => {
			if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
				location.replace("${path}/board/notice/delete?boardNo=${board.no}");
			}
		});
	});
</script>