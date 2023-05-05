<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="제주옵서예" name="title" />
</jsp:include>


<section class="hero-web d-flex align-items-end dark-overlay bg-cover"
	style="background-image: url(${path}/resources/img/photo/hero_bg.png);">
	<div class="container text-white overlay-content text-center">
		<div class="row">
			<div class="col-xl-10 mx-auto">
				<div class="overlay-content text-start text-shadow fw-bolder">
					<h1>제주도에서만 느낄 수 있는 특별함</h1>
					<h1>지금 바로 확인하세요</h1>
				</div>
				<div class="search-bar mb-5 p-3 p-lg-1 ps-lg-4">
					<form action="${path}/board/content/attraction" method="get">
						<div class="row">
							<div class="col-lg-3 d-flex align-items-center form-group">
								<select name="option" class="selectpicker text-lg"
									data-style="btn-form-control">
									<option value="C1">관광지</option>
									<option value="C3">숙박</option>
									<option value="C4">음식점</option>
									<option value="C5">축제/행사</option>
								</select>
							</div>
							<div
								class="col-lg-7 d-flex align-items-center form-group no-divider">
								<input type="hidden" name="searchType" value="title">
								<input class="form-control border-0 shadow-0 text-lg"
									type="text" name="searchValue" placeholder="키워드">
							</div>
							<div class="col-lg-2 d-grid">
								<button class="btn btn-primary rounded-pill h-100 text-lg"
									type="submit">검색</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
<img style="width: 50px; height: 50px;"
	src="${path}/resources/icons/weather/sun.svg" alt="">

<!-- 추천 여행지 ooooooooooooooooooooooooooooooooooooooooooooooooooo-->
<section class="pt-6 pb-0">
	<div class="container">
		<div class="row mb-5">
			<div class="col-md-8 mb-4">
				<h1>추천 여행지</h1>
			</div>
			<div
				class="col-md-4 d-md-flex align-items-center justify-content-end mb-3">
				<a class="text-muted text-lg" href="${path}/menu/recommendation">
					더보기<i class="fas fa-angle-double-right ms-2"></i>
				</a>
			</div>
			<div class="row">
				<div class="d-flex align-items-lg-stretch mb-4 col-lg-8">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate dark-overlay"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/imgpath/202110/20/32ec3ee6-fad9-440d-95ea-628ff6453a48.jpg) no-repeat; background-size: cover;">
						<a class="tile-link"
							href="${path}/board/content/board-detail?id=CONT_000000000500697"> </a>
						<div
							class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7 z-index-20">
							<h3 class="text-shadow text-uppercase mb-0">협재해수욕장</h3>
						</div>
					</div>
				</div>
				<div class="d-flex align-items-lg-stretch mb-4 col-lg-4">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate dark-overlay"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/imgpath/202110/20/fb0a5c04-e09e-4dee-8d9e-68c4ad774388.JPG) no-repeat; background-size: cover;">
						<a class="tile-link"
							href="${path}/board/content/board-detail?id=CNTS_000000000001195"> </a>
						<div
							class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7 z-index-20">
							<h3 class="text-shadow text-uppercase mb-0">카멜리아힐</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="d-flex align-items-lg-stretch col-lg-4">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate dark-overlay"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/c9c42359-f82f-43a4-919e-03ecd197a2eb.jpg) no-repeat; background-size: cover;">
						<a class="tile-link"
							href="${path}/board/content/board-detail?id=CONT_000000000500281"> </a>
						<div
							class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7 z-index-20">
							<h3 class="text-shadow text-uppercase mb-0">사려니숲길</h3>
						</div>
					</div>
				</div>
				<div class="d-flex align-items-lg-stretch col-lg-4">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate dark-overlay"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/imgpath/202110/21/ccba6a29-76b5-476c-b855-0473deb03e0e.png) no-repeat; background-size: cover;">
						<a class="tile-link"
							href="${path}/board/content/board-detail?id=CONT_000000000500438"> </a>
						<div
							class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7 z-index-20">
							<h3 class="text-shadow text-uppercase mb-0">에코랜드</h3>
						</div>
					</div>
				</div>
				<div class="d-flex align-items-lg-stretch col-lg-4">
					<div class="card shadow-lg border-0 w-100 border-0 hover-animate dark-overlay"
						style="background: center center url(https://api.cdn.visitjeju.net/photomng/imgpath/201804/30/ddae61fc-1e34-47b2-854d-3b97ffe1b76b.jpg) no-repeat; background-size: cover;">
						<a class="tile-link"
							href="${path}/board/content/board-detail?id=CNTS_000000000019536"> </a>
						<div
							class="d-flex align-items-center h-100 text-white justify-content-center py-6 py-lg-7 z-index-20">
							<h3 class="text-shadow text-uppercase mb-0">가메오름</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
</section>

<!-- 여행 후기 ooooooooooooooooooooooooooooooooooooooooooooooooooo -->
<section class="py-5">
	<div class="container">
		<div class="row mb-4">
			<div class="col-md-8">
				<h1 class="mb-md-0">여행 후기</h1>
			</div>
			<div
				class="col-md-4 d-md-flex align-items-center justify-content-end mb-3">
				<a class="text-muted text-lg"
					href="${path}/board/travel-review/board?type=review"> 더보기<i
					class="fas fa-angle-double-right ms-2"></i></a>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<!-- Slider main container-->
		<div
			class="swiper-container swiper-container-mx-negative items-slider-full px-lg-5 pt-3">
			<!-- Additional required wrapper-->
			<div class="swiper-wrapper pb-5">
				<!-- Slides-->
				<div class="swiper-slide h-auto px-2">
					<div class="w-100 h-100 hover-animate"
						data-marker-id="59c0c8e3503eb77d487e8082">
						<div class="card h-100 border-0 shadow">
							<div class="card-img-top overflow-hidden gradient-overlay" style="height: 60%;">
								<img class="img-fluid"
									style="height: 100%;"
									src="${path}/resources/upload/board/20221230_143247782.jpg"
									alt="Sunny Private Studio-Apartment" /><a class="tile-link"
									href="${path}/board/travel-review/board-detail?no=7"></a>
							</div>
							<div class="card-body d-flex align-items-center">
								<div class="w-100">
									<h3 class="card-title">
										<a class="text-decoration-none text-dark"
											href="${path}/board/travel-review/board-detail=no=7">제주협재해수욕장</a>
									</h3>
									<p class="text-lg text-muted text-uppercase">2박3일 | 커플 |
										전시와 행사</p>
									<p
										class="card-text d-flex justify-content-around text-gray-800 text-lg">
										<span><img
											src="${path}/resources/img/hand-thumbs-up.svg" /> 47</span>&nbsp;&nbsp;
										<span><img
											src="${path}/resources/img/bookmark-heart.svg" /> 651</span>&nbsp;&nbsp;
										<span><img src="${path}/resources/img/chat-dots.svg" />
											141</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-slide h-auto px-2">
					<div class="w-100 h-100 hover-animate"
						data-marker-id="59c0c8e322f3375db4d89128">
						<div class="card h-100 border-0 shadow">
							<div class="card-img-top overflow-hidden gradient-overlay" style="height: 60%;">
								<img class="img-fluid"
									style="height: 100%;"
									src="${path}/resources/upload/board/20221230_143445718.jpg"
									alt="Cute Quirky Garden apt, NYC adjacent" /><a
									class="tile-link"
									href="${path}/board/travel-review/board-detail?no=15"></a>
							</div>
							<div class="card-body d-flex align-items-center">
								<div class="w-100">
									<h3 class="card-title">
										<a class="text-decoration-none text-dark"
											href="${path}/board/travel-review/board-detail?no=15">월정리해변</a>
									</h3>
									<p class="text-lg text-muted text-uppercase">1박2일 | 아이 |
										휴식과 자유여행</p>
									<p
										class="card-text d-flex justify-content-around text-gray-800 text-lg">
										<span><img
											src="${path}/resources/img/hand-thumbs-up.svg" /> 47</span>&nbsp;&nbsp;
										<span><img
											src="${path}/resources/img/bookmark-heart.svg" /> 651</span>&nbsp;&nbsp;
										<span><img src="${path}/resources/img/chat-dots.svg" />
											141</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-slide h-auto px-2">
					<div class="w-100 h-100 hover-animate"
						data-marker-id="59c0c8e3a31e62979bf147c9">
						<div class="card h-100 border-0 shadow">
							<div class="card-img-top overflow-hidden gradient-overlay" style="height: 60%;">
								<img class="img-fluid"
									style="height: 100%;"
									src="${path}/resources/upload/board/20221230_143405452.jpg"
									alt="Modern Apt - Vibrant Neighborhood!" /><a
									class="tile-link"
									href="${path}/board/travel-review/board-detail?no=12"></a>
							</div>
							<div class="card-body d-flex align-items-center">
								<div class="w-100">
									<h3 class="card-title">
										<a class="text-decoration-none text-dark"
											href="${path}/board/travel-review/board-detail?no=12">한라산국립공원</a>
									</h3>
									<p class="text-lg text-muted text-uppercase">3박4일 | 부모 |
										휴식과 자유 여행</p>
									<p
										class="card-text d-flex justify-content-around text-gray-800 text-lg">
										<span><img
											src="${path}/resources/img/hand-thumbs-up.svg" /> 47</span>&nbsp;&nbsp;
										<span><img
											src="${path}/resources/img/bookmark-heart.svg" /> 651</span>&nbsp;&nbsp;
										<span><img src="${path}/resources/img/chat-dots.svg" />
											141</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-slide h-auto px-2">
					<div class="w-100 h-100 hover-animate"
						data-marker-id="59c0c8e3503eb77d487e8082">
						<div class="card h-100 border-0 shadow">
							<div class="card-img-top overflow-hidden gradient-overlay" style="height: 60%;">
								<img class="img-fluid"
									style="height: 100%;"
									src="${path}/resources/upload/board/20221230_143421545.jpg"
									alt="Sunny Private Studio-Apartment" /><a class="tile-link"
									href="${path}/board/travel-review/board-detail?no=13"></a>
							</div>
							<div class="card-body d-flex align-items-center">
								<div class="w-100">
									<h3 class="card-title">
										<a class="text-decoration-none text-dark"
											href="${path}/board/travel-review/board-detail?no=13">피톤치드 향을 맘껏 느꼈습니다!</a>
									</h3>
									<p class="text-lg text-muted text-uppercase">2박3일 | 혼자 |
										나홀로 힐링여행</p>
									<p
										class="card-text d-flex justify-content-around text-gray-800 text-lg">
										<span><img
											src="${path}/resources/img/hand-thumbs-up.svg" /> 47</span>&nbsp;&nbsp;
										<span><img
											src="${path}/resources/img/bookmark-heart.svg" /> 651</span>&nbsp;&nbsp;
										<span><img src="${path}/resources/img/chat-dots.svg" />
											141</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-slide h-auto px-2">
					<div class="w-100 h-100 hover-animate"
						data-marker-id="59c0c8e322f3375db4d89128">
						<div class="card h-100 border-0 shadow">
							<div class="card-img-top overflow-hidden gradient-overlay" style="height: 60%;">
								<img class="img-fluid"
									style="height: 100%;"
									src="${path}/resources/upload/board/20221230_143455944.jpg"
									alt="Cute Quirky Garden apt, NYC adjacent" /><a
									class="tile-link"
									href="${path}/board/travel-review/board-detail?no=16"></a>
							</div>
							<div class="card-body d-flex align-items-center">
								<div class="w-100">
									<h3 class="card-title">
										<a class="text-decoration-none text-dark"
											href="${path}/board/travel-review/board-detail?no=16">비자림</a>
									</h3>
									<p class="text-lg text-muted text-uppercase">1박2일 | 아이 |
										아이와 힐링여행</p>
									<p
										class="card-text d-flex justify-content-around text-gray-800 text-lg">
										<span><img
											src="${path}/resources/img/hand-thumbs-up.svg" /> 47</span>&nbsp;&nbsp;
										<span><img
											src="${path}/resources/img/bookmark-heart.svg" /> 651</span>&nbsp;&nbsp;
										<span><img src="${path}/resources/img/chat-dots.svg" />
											141</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- If we need pagination-->
			<div class="swiper-pagination"></div>
		</div>
	</div>
</section>

<!-- 광고 시작-->
<section class="py-5 position-relative dark-overlay">
	<img class="bg-image"
		src="${path}/resources/img/photo/photo2/orange-1099328.jpg" alt="">
	<div class="container">
		<div class="overlay-content text-white py-lg-1">
			<h3 class="display-7 text-serif text-shadow mb-2">내 손으로 직접 따서 더
				맛있는</h3>
			<h3 class="display-5 fw-bold text-serif text-shadow mb-3">감귤 농장
				체험하러 가기</h3>
			<a class="btn btn-light" href="${path}/common/not_implemented">바로가기</a>
		</div>
	</div>
</section>
<!-- 광고 끝-->

<div class="container-fluid py-5 px-lg-5 pb-0">
	<div class="row">
		<div class="col">
			<!-- 제주도 추천 맛집 카페 OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO-->
			<section class="py-4">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="row">
								<div class="col-md-8">
									<h1 class="ms-4">제주도 추천 맛집&카페</h1>
								</div>
								<div
									class="col-md-4 d-md-flex align-items-center justify-content-end">
									<a class="text-muted text-lg pe-5"
										href="${path}/board/content/attraction?option=C4"> 더보기<i
										class="fas fa-angle-double-right ms-2"></i></a>
								</div>
							</div>
							<div class="text-block">
								<div class="d-flex d-block d-sm-flex review">
									<div class="text-md-center flex-shrink-0 me-4 me-xl-5">
										<a href="${path}/board/content/board-detail?id=CNTS_000000000018337"><img
											class="d-block foodAvatar foodAvatar-xxl p-1 mb-2 hover-scale"
											src="https://api.cdn.visitjeju.net/photomng/imgpath/201804/30/88f3b319-b8d8-4618-bc75-7202ba68a578.jpg"
											alt=""></a>
									</div>
									<div>
										<a class="custom-a"
											href="${path}/board/content/board-detail?id=CNTS_000000000018337">
											<h3 class="mt-2 mb-3 text-black">봄날 카페</h3>
										</a>
										<p class="text-muted text-lg mb-0">제주시 > 애월</p>
										<p class="text-muted text-lg">#음식 #콜드브루 #아메리카노 #바닐라라떼</p>
										<p>
											<span><img
												src="${path}/resources/img/hand-thumbs-up.svg" /> 47</span>&nbsp;&nbsp;
											<span><img
												src="${path}/resources/img/bookmark-heart.svg" /> 651</span>&nbsp;&nbsp;
											<span><img src="${path}/resources/img/chat-dots.svg" />
												141</span>
										</p>
									</div>
								</div>
								<div class="d-flex d-block d-sm-flex review">
									<div class="text-md-center flex-shrink-0 me-4 me-xl-5">
										<a href="${path}/board/content/board-detail?id=CNTS_000000000020519"><img
											class="d-block foodAvatar foodAvatar-xxl p-1 mb-2 hover-scale"
											src="https://api.cdn.visitjeju.net/photomng/imgpath/202111/25/77c8aaca-5edd-441d-9d6b-a461003484f1.jpg"
											alt="Luke Skywalker"></a>
									</div>
									<div>
										<a class="custom-a"
											href="${path}/board/content/board-detail?id=CNTS_000000000020519">
											<h3 class="mt-2 mb-3 text-black">카페숑</h3>
										</a>
										<p class="text-muted text-lg mb-0">서귀포시 > 남원</p>
										<p class="text-muted text-lg">#음식 #디저트 #빵 #와플</p>
										<p>
											<span><img
												src="${path}/resources/img/hand-thumbs-up.svg" /> 47</span>&nbsp;&nbsp;
											<span><img
												src="${path}/resources/img/bookmark-heart.svg" /> 651</span>&nbsp;&nbsp;
											<span><img src="${path}/resources/img/chat-dots.svg" />
												141</span>
										</p>
									</div>
								</div>
								<div class="d-flex d-block d-sm-flex review">
									<div class="text-md-center flex-shrink-0 me-4 me-xl-5">
										<a href="${path}/board/content/board-detail?id="><img
											class="d-block foodAvatar foodAvatar-xxl p-1 mb-2 hover-scale"
											src="https://api.cdn.visitjeju.net/photomng/imgpath/201804/30/ef12eb59-756e-4e9b-a227-60eb3fbd8cf4.gif"
											alt="Princess Leia"></a>
									</div>
									<div>
										<a class="custom-a"
											href="${path}/board/content/board-detail?id=CNTS_000000000020047">
											<h3 class="mt-2 mb-3 text-black">명진전복</h3>
										</a>
										<p class="text-muted text-lg mb-0">제주시 > 구좌</p>
										<p class="text-muted text-lg">#음식 #전복해물탕 #전복죽</p>
										<p>
											<span><img
												src="${path}/resources/img/hand-thumbs-up.svg" /> 47</span>&nbsp;&nbsp;
											<span><img
												src="${path}/resources/img/bookmark-heart.svg" /> 651</span>&nbsp;&nbsp;
											<span><img src="${path}/resources/img/chat-dots.svg" />
												141</span>
										</p>
									</div>
								</div>
								<div class="d-flex d-block d-sm-flex review">
									<div class="text-md-center flex-shrink-0 me-4 me-xl-5">
										<a href="${path}/board/content/board-detail?id="><img
											class="d-block foodAvatar foodAvatar-xxl p-1 mb-2 hover-scale"
											src="https://api.cdn.visitjeju.net/photomng/imgpath/201909/30/fd3e8aae-900d-4cfb-8442-d59790e0da13.jpg"
											alt="Jabba Hut"></a>
									</div>
									<div>
										<a class="custom-a"
											href="${path}/board/content/board-detail?id=CNTS_000000000019253">
											<h3 class="mt-2 mb-3 text-black">몽상드애월(몽상)</h3>
										</a>
										<p class="text-muted text-lg mb-0">제주시 > 애월</p>
										<p class="text-muted text-lg">#디저트 #음식 #아메리카노</p>
										<p>
											<span><img
												src="${path}/resources/img/hand-thumbs-up.svg" /> 47</span>&nbsp;&nbsp;
											<span><img
												src="${path}/resources/img/bookmark-heart.svg" /> 651</span>&nbsp;&nbsp;
											<span><img src="${path}/resources/img/chat-dots.svg" />
												141</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<div class="col">

			<!-- 여행지 4가지 OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO -->
			<section class="mt-3 pt-6">
				<div class="container-fluid">
					<div class="row">
						<div class="col">
							<a class="custom-a" href="${path}/board/content/board-detail?id=CNTS_000000000018456">
								<div
									class="d-flex align-items-center dark-overlay hover-scale-bg-image">
									<img class="bg-image"
										src="https://api.cdn.visitjeju.net/photomng/imgpath/202111/30/010bc443-8fa8-4379-83f9-4598e27bf383.JPG" alt="">
									<div class="p-3 p-sm-3 mt-7 text-white z-index-20">
										<h3 class="h3">화순리 유채꽃길</h3>
										<p class="mb-4 text-lg">#자연관광 #포토스팟</p>
									</div>
								</div>
							</a>
						</div>
						<div class="col">
							<a class="custom-a" href="${path}/board/content/board-detail?id=CNTS_200000000013708">
								<div
									class="d-flex align-items-center dark-overlay hover-scale-bg-image">
									<img class="bg-image"
										src="https://api.cdn.visitjeju.net/photomng/imgpath/202208/10/ddb1c332-2239-436c-bec1-175a83813f2d.jpg" alt="">
									<div class="p-3 p-sm-3 mt-7 text-white z-index-20">
										<h3 class="h3">해녀체험</h3>
										<p class="mb-4 text-lg">#문화관광 #이색체험</p>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="row pt-4">
						<div class="col">
							<a class="custom-a"
								href="${path}/board/content/board-detail?id=CONT_000000000500281">
								<div
									class="d-flex align-items-center dark-overlay hover-scale-bg-image">
									<img class="bg-image"
										src="https://api.cdn.visitjeju.net/photomng/thumbnailpath/201804/30/c9c42359-f82f-43a4-919e-03ecd197a2eb.jpg"
										alt="">
									<div class="p-3 p-sm-3 mt-7 text-white z-index-20">
										<h3 class="h3">사려니숲길</h3>
										<p class="mb-4 text-lg">#테마여행 #제주의 숨은 비경</p>
									</div>
								</div>
							</a>
						</div>
						<div class="col">
							<a class="custom-a" href="${path}/board/content/board-detail?id=CNTS_200000000014386">
								<div
									class="d-flex align-items-center dark-overlay hover-scale-bg-image">
									<img class="bg-image"
										src="https://api.cdn.visitjeju.net/photomng/imgpath/202212/28/7ce3acf6-f1e1-4c6c-ae04-703f98610836.jpg" alt="">
									<div class="p-3 p-sm-3 mt-7 text-white z-index-20">
										<h3 class="h3">송악산둘레길</h3>
										<p class="mb-4 text-lg">#도보여행 #제주올레 10코스</p>
									</div>
								</div>
							</a>
						</div>

					</div>
				</div>
			</section>
			<!-- 공지사항 -->
			<section class="mt-3 pt-5">
				<div class="container">
					<div class="row">
						<div class="col-md-8">
							<h2 class="pb-2">&nbsp;&nbsp;공지사항</h2>
						</div>
						<div
							class="col-md-4 d-md-flex align-items-center justify-content-end">
							<a class="text-muted text-lg pe-4"
								href="${path}/board/notice/board?type=notice"> 더보기<i
								class="fas fa-angle-double-right ms-2"></i></a>
						</div>
					</div>
					<div class="table-responsive">
						<table class="table text-gray-700 table-striped table-hover">
							<tr>
								<th class="py-3 align-middle text-lg"><a
									class="custom-a text-black"
									href="${path}/board/notice/board-detail?no=1">개인정보처리방침 개정 시행안내</a></th>
							</tr>
							<tr>
								<th class="py-3 align-middle text-lg"><a
									class="custom-a text-black"
									href="${path}/board/notice/board-detail?no=2">사이트 이용사항</a></th>
							</tr>
							<tr>
								<th class="py-3 align-middle text-lg"><a
									class="custom-a text-black"
									href="${path}/board/notice/board-detail?no=3">처음 이용하는 고객님들을 위한</a></th>
							</tr>
							<tr>
								<th class="py-3 align-middle text-lg"><a
									class="custom-a text-black"
									href="${path}/board/notice/board-detail?no=4">이벤트 당첨자 공지</a></th>
							</tr>
							<tr>
								<th class="py-3 align-middle text-lg"><a
									class="custom-a text-black"
									href="${path}/board/notice/board-detail?no=5">마지막으로 팀원분들에게</a></th>
							</tr>
						</table>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>
<!-- Instagram-->
<section>
	<div class="container-fluid px-0">
		<div class="swiper-container instagram-slider">
			<div class="swiper-wrapper">
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/instagram/instagram-1.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/instagram/instagram-2.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/instagram/instagram-3.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/instagram/instagram-4.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/photo/photo2/img.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/instagram/instagram-6.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/photo/photo2/20180323-125613-largejpg.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/instagram/instagram-8.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/instagram/instagram-9.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/photo/photo2/mandarin.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/photo/photo2/sea_girl.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/photo/photo2/jeju_footer_img.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/instagram/instagram-13.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/instagram/instagram-14.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/photo/photo2/mandarin.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/photo/photo2/sea_girl.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/photo/photo2/jeju_footer_img.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/photo/photo2/20180323-125613-largejpg.jpg" alt=" "></a>
				</div>
				<div class="swiper-slide overflow-hidden">
					<a href="#"><img class="img-fluid hover-scale"
						src="${path}/resources/img/photo/photo2/img.jpg" alt=" "></a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Footer-->
<footer class="position-relative z-index-10 d-print-none">
	<!-- Main block - menus, subscribe form-->
	<div class="py-6 bg-gray-400 text-muted">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 mb-5 mb-lg-0">
					<div class="ms-n4">
						<img src="${path}/resources/icons/team-logo.png" alt="Team logo">
					</div>
					<p>제주도로 떠나고 싶은 마음에 만들게 된 사이트</p>
					<ul class="list-inline">
						<li class="list-inline-item"><a
							class="text-muted text-primary-hover" href="#" target="_blank"
							title="twitter"><i class="fab fa-twitter"></i></a></li>
						<li class="list-inline-item"><a
							class="text-muted text-primary-hover" href="#" target="_blank"
							title="facebook"><i class="fab fa-facebook"></i></a></li>
						<li class="list-inline-item"><a
							class="text-muted text-primary-hover" href="#" target="_blank"
							title="instagram"><i class="fab fa-instagram"></i></a></li>
						<li class="list-inline-item"><a
							class="text-muted text-primary-hover" href="#" target="_blank"
							title="pinterest"><i class="fab fa-pinterest"></i></a></li>
						<li class="list-inline-item"><a
							class="text-muted text-primary-hover" href="#" target="_blank"
							title="vimeo"><i class="fab fa-vimeo"></i></a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
					<h6 class="text-uppercase text-dark mb-3">concat</h6>
					<ul class="list-unstyled">
						<li><a class="text-muted" href="${path}">02-1544-9001</a></li>
					</ul>
					<h6 class="text-uppercase text-dark mb-3">address</h6>
					<ul class="list-unstyled">
						<li><a class="text-muted" href="${path}">서울특별시 강남구 언주로
								508 14층</a></li>
					</ul>
				</div>
				<div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
					<ul class="list-unstyled">
						<li><a class="text-muted" href="${path}">개인정보처리방침</a></li>
						<li><a class="text-muted" href="${path}">이용약관</a></li>
						<li><a class="text-muted" href="${path}">틀린정보신고</a></li>
						<li><a class="text-muted" href="${path}">제주관광문의</a></li>
						<li><a class="text-muted" href="${path}">제주소식</a></li>
					</ul>
				</div>
				<div class="col-lg-4">
					<h6 class="text-uppercase text-dark mb-3">Daily Offers &
						Discounts</h6>
					<p class="mb-3">제주옵서예 소식을 가장 빨리 받아보세요.</p>
					<form action="#" id="newsletter-form">
						<div class="input-group mb-3">
							<input
								class="form-control bg-transparent border-dark border-end-0"
								type="email" placeholder="Your Email Address"
								aria-label="Your Email Address">
							<button class="btn btn-outline-dark border-start-0" type="submit">
								<i class="fa fa-paper-plane text-lg"></i>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</footer>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>



