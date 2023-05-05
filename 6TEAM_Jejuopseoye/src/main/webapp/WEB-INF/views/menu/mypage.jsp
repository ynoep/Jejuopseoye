<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="title" />
</jsp:include>


<section class="hero-web d-flex align-items-end dark-overlay bg-cover"
	style="background-image: url(${path}/resources/img/photo/hero_bg4.png); background-size: 100% 100%;">
</section>
<!-- 마이페이지  -->
<section class="py-6">
	<div class="container">
		<!-- 경로 -->
		<ol class="breadcrumb ps-0  justify-content-start">
			<li class="breadcrumb-item text-lg"><a href="${path}">홈</a></li>
			<li class="breadcrumb-item active text-lg">마이페이지</li>
		</ol>
		<h1 class="hero-heading mb-0 my-4">마이페이지</h1>
		<p class="text-muted mb-5"></p>
		<div class="row pt-5 pb-7 pt-md-0 ps-md-5">

			<!--  개인정보, 작성글&댓글	 -->
			<div class="row me-4 m-4">
				<div class="col-6 col-md-5 mx-4 mb-30px">
					<div class="card h-100 border-0 shadow hover-animate">
						<div class="card-body m-6">
							<div class="icon-rounded bg-icon-light mb-3 ms-6">
								<svg class="svg-icon text-secondary w-3rem h-3rem">
                    <use xlink:href="#user-1"> </use>
                  </svg>
							</div>
							<h5 class="card-title text-center py-3">
								<a id="user-1" class="text-decoration-none text-xl text-dark stretched-link"
									href="${path}/member/profile-modify">개인 정보</a>
							</h5>
							<p class="set-card text-center text-muted card-text text-lg my-3">가입시
								입력한 정보를 변경할 수 있습니다.</p>
						</div>
					</div>
				</div>
				<div class="col-6 col-md-5 mx-4 mb-30px">
					<div class="card h-100 border-0 shadow hover-animate">
						<div class="card-body m-6">
							<div class="icon-rounded bg-icon-light mb-3 ms-6">
								<svg class="svg-icon text-secondary w-3rem h-3rem">
                    <use xlink:href="#label-tag-1"> </use>
                  </svg>
							</div>
							<h5 class="card-title text-center py-3">
								<a class="text-decoration-none text-xl text-dark stretched-link"
									href="${path}/member/reservation-list">예약 현황</a>
							</h5>
							<p class="set-card text-center text-muted card-text text-lg my-3">예약현황입니다.</p>
						</div>
					</div>
				</div>
			</div>

			<!--  찜, 예약  -->
			<div class="row me-4 m-4">
				<div class="col-6 col-md-5 mx-4 mb-30px">
					<div class="card h-100 border-0 shadow hover-animate">
						<div class="card-body m-6">
							<div class="icon-rounded bg-icon-light mb-3 ms-6">
								<svg class="svg-icon text-secondary w-3rem h-3rem">
                    <use xlink:href="#love-pin-1"> </use>
                  </svg>
							</div>
							<h5 class="card-title text-center py-3">
								<a class="text-decoration-none text-xl text-dark stretched-link"
									href="${path}/member/pick-list">찜 목록</a>
							</h5>
							<p class="set-card text-center text-muted card-text text-lg my-3">찜목록입니다.</p>
						</div>
					</div>
				</div>
				<div class="col-6 col-md-5 mx-4 mb-30px">
					<div class="card h-100 border-0 shadow hover-animate">
						<div class="card-body m-6">
							<div class="icon-rounded bg-icon-light mb-3 ms-6">
								<svg class="svg-icon text-secondary w-3rem h-3rem">
                    <use xlink:href="#chat-app-1"> </use>
                  </svg>
							</div>
							<h5 class="card-title text-center py-3">
								<a class="text-decoration-none text-xl text-dark stretched-link"
									href="${path}/member/my-board-reply?no=${loginMember.no}">작성글 &amp; 댓글</a>
							</h5>
							<p class="set-card text-center text-muted card-text text-lg my-3">작성한
								모든 글과 댓글을 볼 수 있습니다.</p>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>