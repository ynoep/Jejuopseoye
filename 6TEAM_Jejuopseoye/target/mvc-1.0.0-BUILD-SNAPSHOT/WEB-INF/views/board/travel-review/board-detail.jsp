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


<section class="py-6">
	<div class="container">
		<div class="row mb-6">
			<div class="col-md-4">
				<h1>여행후기</h1>
			</div>
		</div>
		<!-- 여행후기 상세 -->
		<div class="table-responsive">
			<table
				class="table table-bordered text-gray-700 table-striped table-hover notice-detail">
				<tr>
					<th class="py-4 text-center align-middle" style="width: 20%">제목</th>
					<td class="py-4 text-center align-middle" style="width: 80%">제목</td>
				</tr>
				<tr>
					<th class="py-4 text-center align-middle">사진</th>
					<td class="py-4 text-center align-middle">
						<div style="min-height: 400px;">
							<img class="travel-pic" src="img/photo/hero_bg.png" alt="">
						</div>
					</td>
				</tr>
				<tr>
					<th class="py-4 text-center align-middle">내용</th>
					<td class="py-4 text-center align-middle">
						<div style="min-height: 400px;">내용입니다.</div>
					</td>
				</tr>
				<tr>
					<th class="py-4 text-center align-middle">작성자</th>
					<td class="py-4 text-center align-middle">홍길동</td>
				</tr>
				<tr>
					<th class="py-4 text-center align-middle">작성일</th>
					<td class="py-4 text-center align-middle">2023-01-01</td>
				</tr>
				<tr>
					<th class="py-4 text-center align-middle">조회수</th>
					<td class="py-4 text-center align-middle">2022</td>
				</tr>
				<tr>
					<th class="py-4 text-center align-middle">첨부파일</th>
					<td class="py-4 text-center align-middle">-</td>
				</tr>
			</table>
		</div>
		
		 <!-- 댓글 시작-->
              <div class="text-black mt-5">
                <div class="d-flex d-block d-sm-flex review mt-5">
                  <div>
                    <h6 class="mt-1 mb-1">닉네임 1</h6>
                    <div class="mb-2">
                      2022.12.31
                    </div>
                    <p class="text-muted text-base">재밌게 놀고 가요.</p>
                  </div>
                  <div class="ms-auto">
                    <button class="btn text-white border-start-0" type="submit"
                      style="background-color: rgb(107, 99, 99)">수정</button>
                    <button class="btn text-white border-start-0" type="submit"
                      style="background-color: rgb(107, 99, 99)">삭제</button>
                  </div>
                </div>
                <div class="d-flex d-block d-sm-flex review">
                  <div>
                    <h6 class="mt-1 mb-1">닉네임 2</h6>
                    <div class="mb-2">
                      2022.12.31
                    </div>
                    <p class="text-muted text-base">재밌게 놀고 가요.</p>
                  </div>
                  <div class="ms-auto">
                    <button class="btn text-white border-start-0" type="submit"
                      style="background-color: rgb(107, 99, 99)">수정</button>
                    <button class="btn text-white border-start-0" type="submit"
                      style="background-color: rgb(107, 99, 99)">삭제</button>
                  </div>
                </div>
                <div class="d-flex d-block d-sm-flex review">
                    <div>
                        <h6 class="mt-1 mb-1">닉네임 2</h6>
                        <div class="mb-2">
                          2022.12.31
                        </div>
                    <p class="text-muted text-base">재밌게 놀고 가요.</p>
                  </div>
                  <div class="ms-auto">
                    <button class="btn text-white border-start-0" type="submit"
                      style="background-color: rgb(107, 99, 99)">수정</button>
                    <button class="btn text-white border-start-0" type="submit"
                      style="background-color: rgb(107, 99, 99)">삭제</button>
                  </div>
                </div>
              </div>
              <div class="input-group mb-5">
                <input class="form-control form-control-lg bg-transparent border-1 border-end-0" type="text"
                  placeholder="댓글 남기기">
                <button class="btn text-white border-start-0 fs-6" type="submit"
                  style="background-color: rgb(107, 99, 99);">&nbsp; 등록&nbsp;</button>
              </div>
              
              
		<!-- 목록 버튼 -->
		<div class="text-center align-middle">
			<a href="${path}/board/travel-review/board">
				<button class="btn btn-primary" type="submit">목록</button>
			</a>
		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>