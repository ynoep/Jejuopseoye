<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="추천" name="title"/>
</jsp:include>


 <section class="hero-web d-flex align-items-end dark-overlay bg-cover"
    style="background-image: url(${path}/resources/img/photo/photo2/oranges-1117644.jpg);">
    <div class="container text-white overlay-content text-center">
      <div class="row">
        <div class="col-xl-10 mx-auto">
          <div class="overlay-content text-start text-shadow fw-bolder">
            <h1>제주도에서만 느낄 수 있는 특별함</h1>
            <h1>지금 바로 확인하세요</h1>
          </div>
        </div>
      </div>
    </div>
  </section>

<section class="py-5">
		<div class="container">
			<div class="row mb-3">
				<div class="col-md-8">
					<h2>관광지 추천</h2>
				</div>
				<div class="col-md-4 d-md-flex align-items-center justify-content-end"><a class="text-muted text-sm"
						href="${path}/board/content/attraction?option=C1">
						관광지 자세히 보기<i class="fas fa-angle-double-right ms-2"></i></a></div>
			</div>
			<div class="row">
				<div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/c9c42359-f82f-43a4-919e-03ecd197a2eb.jpg) no-repeat; background-size: cover;">
						<a class="tile-link" href="${path}/board/content/board-detail?no=4561"> </a>
						<div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
							<h3 class="text-shadow text-uppercase mb-0">사려니숲길</h3>
						</div>
					</div>
				</div>
				<div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/202110/20/b06b8d55-0f87-4efd-8a9f-a682a48a4868.JPG) no-repeat; background-size: cover;">
						<a class="tile-link" href="${path}/board/content/board-detail?no=4363"> </a>
						<div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
							<h3 class="text-shadow text-uppercase mb-0">카멜리아힐</h3>
						</div>
					</div>
				</div>
				<div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/e9cb50d3-bb50-4f68-b6ae-05887ec8715d.jpg) no-repeat; background-size: cover;">
						<a class="tile-link" href="${path}/board/content/board-detail?no=4536"> </a>
						<div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
							<h3 class="text-shadow text-uppercase mb-0">한라산국립공원</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 관광지 끝-->
	<!-- ================================================================================================== -->
	<!-- 액티비티 시작-->
	<section class="pb-5">
		<div class="container">
			<div class="row mb-3">
				<div class="col-md-8">
					<h2>축제/행사 추천</h2>
				</div>
				<div class="col-md-4 d-md-flex align-items-center justify-content-end"><a class="text-muted text-sm"
						href="${path}/board/content/attraction?option=C5">
						축제/행사 자세히 보기<i class="fas fa-angle-double-right ms-2"></i></a></div>
			</div>
			
			<div class="row">
				<div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/201807/09/423946ab-3175-4d3f-b475-5ea08bc0ace0.jpg) no-repeat; background-size: cover;">
						<a class="tile-link" href="${path}/board/content/board-detail?no=1029"> </a>
						<div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
							<h3 class="text-shadow text-uppercase mb-0">이호테우축제</h3>
						</div>
					</div>
				</div>
				<div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/201903/28/bdc57a77-614b-4e88-9352-0c10796b9507.jpg) no-repeat; background-size: cover;">
						<a class="tile-link" href="${path}/board/content/board-detail?no=1825"> </a>
						<div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
							<h3 class="text-shadow text-uppercase mb-0">우도소라축제</h3>
						</div>
					</div>
				</div>
				<div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/202210/06/faa437fc-c097-4acc-8d63-9c9722570ea8.jpg) no-repeat; background-size: cover;">
						<a class="tile-link" href="${path}/board/content/board-detail?no=1380"> </a>
						<div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
							<h3 class="text-shadow text-uppercase mb-0">수눌음 축제</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 액티비티 끝-->
	<!-- ================================================================================================== -->
	<!-- 맛집 시작-->
	<section class="pb-5">
		<div class="container">
			<div class="row mb-3">
				<div class="col-md-8">
					<h2>맛집 추천</h2>
				</div>
				<div class="col-md-4 d-md-flex align-items-center justify-content-end"><a class="text-muted text-sm"
						href="${path}/board/content/attraction?option=C4">
						맛집 자세히 보기<i class="fas fa-angle-double-right ms-2"></i></a></div>
			</div>
			
			<div class="row">
				<div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/37e69b3a-551a-47a9-b624-0894afdfba0a.png) no-repeat; background-size: cover;">
						<a class="tile-link" href="${path}/board/content/board-detail?no=2352"> </a>
						<div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
							<h3 class="text-shadow text-uppercase mb-0">아꼬떼카페</h3>
						</div>
					</div>
				</div>
				<div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/201910/31/bbae330f-4925-49b6-94eb-3d7b8061fd5a.jpg) no-repeat; background-size: cover;">
						<a class="tile-link" href="${path}/board/content/board-detail?no=1069"> </a>
						<div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
							<h3 class="text-shadow text-uppercase mb-0">빅토리아</h3>
						</div>
					</div>
				</div>
				<div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/15c24e32-962b-47b8-a5e6-8d528644de3b.jpg) no-repeat; background-size: cover;">
						<a class="tile-link" href="${path}/board/content/board-detail?no=3591"> </a>
						<div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
							<h3 class="text-shadow text-uppercase mb-0">앞돈지</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 맛집 끝-->
	<!-- ================================================================================================== -->
	<!-- 숙소 시작-->
	<section class="pb-5">
		<div class="container">
			<div class="row mb-3">
				<div class="col-md-8">
					<h2>숙소 추천</h2>
				</div>
				<div class="col-md-4 d-md-flex align-items-center justify-content-end"><a class="text-muted text-sm"
						href="${path}/board/content/attraction?option=C3">
						숙소 자세히 보기<i class="fas fa-angle-double-right ms-2"></i></a></div>
			</div>
			<div class="row">
				<div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/201902/12/80e170ec-8d61-4c13-94f3-ef320d9644c8.jpg) no-repeat; background-size: cover;">
						<a class="tile-link" href="${path}/board/content/board-detail?no=84"> </a>
						<div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
							<h3 class="text-shadow text-uppercase mb-0">디셈버호텔</h3>
						</div>
					</div>
				</div>
				<div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/49ae88ef-8dce-4ae8-a556-bfe6f77f9d2b.gif) no-repeat; background-size: cover;">
						<a class="tile-link" href="${path}/board/content/board-detail?no=99"> </a>
						<div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
							<h3 class="text-shadow text-uppercase mb-0">비치조아</h3>
						</div>
					</div>
				</div>
				<div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/c6adbf29-9ac2-43a3-848d-3a98773a3faf.jpg) no-repeat; background-size: cover;">
						<a class="tile-link" href="${path}/board/content/board-detail?no=2201"> </a>
						<div class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7">
							<h3 class="text-shadow text-uppercase mb-0">서귀포귤림성</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 숙소 끝-->


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
