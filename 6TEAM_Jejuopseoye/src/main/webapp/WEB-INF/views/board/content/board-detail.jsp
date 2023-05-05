<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="여행정보 상세" name="title" />
</jsp:include>

<section class="pt-6 pb-3">
	<div class="container mt-5">
		<div class="row">
			<!-- 왼쪽 시작 -->
			<div class="col-lg-7">
				<!-- 상세페이지 이미지 시작-->
				<div class="text-block">
					<!-- 큰 이미지 -->
					<img style="width: 100%; height: 100%" class="img-fluid"
						src="${content.imgpath}" alt="...">
					<!-- 작은 이미지-->
					<div class="row gallery ms-n1 me-n1 mt-3">
						<div class="col-lg-2 col-6 px-1 mb-2">
							<a href="${path}/resources/img/photo/photo2/tourist_spot_1.jpg"><img
								class="img-fluid"
								src="${path}/resources/img/photo/photo2/tourist_spot_1.jpg"
								alt="tourist_spot"></a>
						</div>
						<div class="col-lg-2 col-6 px-1 mb-2">
							<a href="${path}/resources/img/photo/photo2/tourist_spot_14.jpg"><img
								class="img-fluid"
								src="${path}/resources/img/photo/photo2/tourist_spot_14.jpg"
								alt="tourist_spot"></a>
						</div>
						<div class="col-lg-2 col-6 px-1 mb-2">
							<a href="${path}/resources/img/photo/photo2/tourist_spot_6.jpg"><img
								class="img-fluid"
								src="${path}/resources/img/photo/photo2/tourist_spot_6.jpg"
								alt="tourist_spot"></a>
						</div>
						<div class="col-lg-2 col-6 px-1 mb-2">
							<a href="${path}/resources/img/photo/photo2/tourist_spot_2.jpg"><img
								class="img-fluid"
								src="${path}/resources/img/photo/photo2/tourist_spot_2.jpg"
								alt="tourist_spot"></a>
						</div>
						<div class="col-lg-2 col-6 px-1 mb-2">
							<a href="${path}/resources/img/photo/photo2/tourist_spot_3.jpg"><img
								class="img-fluid"
								src="${path}/resources/img/photo/photo2/tourist_spot_3.jpg"
								alt="tourist_spot"></a>
						</div>
						<div class="col-lg-2 col-6 px-1 mb-2">
							<a href="${path}/resources/img/photo/photo2/tourist_spot_4.jpg"><img
								class="img-fluid"
								src="${path}/resources/img/photo/photo2/tourist_spot_4.jpg"
								alt="tourist_spot"></a>
						</div>
					</div>
					<!-- 댓글창 -->
					<div class="input-group mt-5">
						<input
							class="form-control form-control-lg bg-transparent border-1 border-end-0"
							type="text" placeholder="댓글 남기기">
						<button class="btn text-white border-start-0 fs-6" type="submit"
							style="background-color: rgb(107, 99, 99);">&nbsp;
							등록&nbsp;</button>
					</div>
					<div class="text-black">
						<div class="d-flex d-block d-sm-flex review mt-4">
							<div>
								<h6 class="mt-2 mb-1">데이터조사하는지연이</h6>
								<div class="mb-2">2022.12.31</div>
								<p class="text-muted text-lg">제가 갔던 곳 중에서 정말 좋았어요</p>
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
								<h6 class="mt-2 mb-1">제주디자이너윤희</h6>
								<div class="mb-2">2022.12.31</div>
								<p class="text-muted text-lg">또 한번 가보고싶어요</p>
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
								<h6 class="mt-2 mb-1">월클손흥민</h6>
								<div class="mb-2">2022.12.31</div>
								<p class="text-muted text-lg">조기축구회에서 다 같이 다녀왔습니다.</p>
							</div>
							<div class="ms-auto">
								<button class="btn text-white border-start-0" type="submit"
									style="background-color: rgb(107, 99, 99)">수정</button>
								<button class="btn text-white border-start-0" type="submit"
									style="background-color: rgb(107, 99, 99)">삭제</button>
							</div>
						</div>
					</div>
					<!-- 댓글 끝 -->
					<!-- 페이지 시작 -->
					<nav aria-label="Page navigation example">
						<ul
							class="pagination pagination-template d-flex justify-content-center">
							<li class="page-item"><a class="page-link" href="#"> <i
									class="fa fa-angle-left"></i></a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"> <i
									class="fa fa-angle-right"></i></a></li>
						</ul>
					</nav>
					<!-- 페이지 끝 -->
				</div>
			</div>
			<!-- =============================================================================== -->
			<!-- 오른쪽 시작 -->
			<div class="col-lg-5">
				<div class="ps-xl-4">
					<!-- 관광지 시작 -->
					<div class="card border-0 shadow mb-5">
						<div class="card-header bg-gray-100 py-4 border-0">
							<div class="d-flex align-items-center justify-content-between">
								<div>
									<p class="subtitle text-sm text-primary">${content.contentscdLabel}</p>
									<h4 class="mb-0 fs-2">${content.title}</h4>
								</div>
								<svg
									class="svg-icon svg-icon svg-icon-light w-3rem h-3rem ms-3 text-muted flex-shrink-0">
                    <use xlink:href="#fountain-pen-1"> </use>
                  </svg>
							</div>
						</div>
						<div class="card-body">
							<table class="table text-sm mb-0">
								<tr>
									<th class="ps-0 fs-5 col-2 border-0">주소</th>
									<td class=" pe-0 fs-5 border-0"><c:if
											test="${content.address!=null}">
											<c:out value="${content.address}" />
										</c:if> <c:if test="${content.address==null}">
                    		주소 정보가 없습니다.
                    	</c:if></td>
								</tr>
								<tr>
									<th class="ps-0 fs-5 col-2 border-0">번호</th>
									<td class="pe-0 fs-5 border-0">${content.phoneno}</td>
								</tr>
								<tr>
									<th class="ps-0 fs-5 col-2 border-0">분류</th>
									<td class="pe-0 fs-5 border-0">${content.contentscdLabel}</td>
								</tr>
								<tr>
									<th class="ps-0 fs-5 col-2 border-0">소개</th>
									<td class="pe-0 fs-5 border-0">${content.introduction}</td>
								</tr>
							</table>
						</div>
					</div>
					<!-- 길찾기 시작 -->
					<div class=" card border-0 shadow mb-5">
						<div class="card-header bg-gray-100 py-4 border-0">
							<div class="d-flex align-items-center justify-content-between">
								<div>
									<h4 class="mb-0 fs-2">길찾기</h4>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="text-block">
								<!-- 지도-->
								<div class="map-wrapper-300 mb-3">
									<div class="h-100" id="detailMap">
										<div id="map" style="width: 100%; height: 100%;"></div>
									</div>
								</div>
							</div>
							<div class="d-grid text-center">
								<a class="btn btn-outline-primary" href="#"> <i
									class="far fa-paper-plane me-2"></i>지도 펼쳐보기
								</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>
<div class="py-5 bg-gray-100">
	<div class="container">
		<h4 class="mb-4">근처 관광지</h4>
		<!-- Slider main container-->
		<div
			class="swiper-container swiper-container-mx-negative items-slider">
			<!-- Additional required wrapper-->
			<div class="swiper-wrapper pb-5">
				<!-- Slides-->
				<div class="swiper-slide h-auto px-2">
					<!-- venue item-->
					<div class="w-100 h-100" data-marker-id="59c0c8e33b1527bfe2abaf92">
						<div class="card h-100 border-0 shadow">
							<div class="card-img-top overflow-hidden bg-cover"
								style="background-image: url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/201908/29/5e753684-1bfd-4a01-bd60-61d10df8b14b.jpg); min-height: 200px;">
								<a class="tile-link" href="${path}/board/content/board-detail?id=CONT_000000000500343"></a>
								<div
									class="card-img-overlay-top d-flex justify-content-between align-items-center">
									<!-- 찜 버튼 시작 -->
									<a class="card-fav-icon position-relative z-index-40"
										href="javascript: void();"> <svg
											class="svg-icon text-white">
                        <use xlink:href="#heart-1"> </use>
                      </svg>
									</a>
									<!-- 찜 버튼 끝 -->
								</div>
							</div>
							<div class="card-body">
								<h4>섭지코지</h4>
								<p class="text-sm text-muted mb-3">주소 | 제주특별자치도 서귀포시 성산읍 섭지코지로 107
									768</p>
								<p class="text-sm text-muted mb-3">번호 | (+82) 064-740-6000</p>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-slide h-auto px-2">
					<!-- venue item-->
					<div class="w-100 h-100" data-marker-id="59c0c8e322f3375db4d89128">
						<div class="card h-100 border-0 shadow">
							<div class="card-img-top overflow-hidden bg-cover"
								style="background-image: url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/202205/30/0fd26cbb-6620-4119-a4c8-e945a0ec5beb.jpg); min-height: 200px;">
								<a class="tile-link" href="${path}/board/content/board-detail?id=CONT_000000000500565"></a>
								<div
									class="card-img-overlay-top d-flex justify-content-between align-items-center">
									<!-- 찜 버튼 시작 -->
									<a class="card-fav-icon position-relative z-index-40"
										href="javascript: void();"> <svg
											class="svg-icon text-white">
                        <use xlink:href="#heart-1"> </use>
                      </svg>
									</a>
									<!-- 찜 버튼 끝 -->
								</div>
							</div>
							<div class="card-body">
								<h4>아쿠아플라넷 제주</h4>
								<p class="text-sm text-muted mb-3">주소 | 제주특별자치도 서귀포시 성산읍 섭지코지로 95
									768</p>
								<p class="text-sm text-muted mb-3">번호 | (+82) 1833-7001</p>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-slide h-auto px-2">
					<!-- venue item-->
					<div class="w-100 h-100" data-marker-id="59c0c8e3a31e62979bf147c9">
						<div class="card h-100 border-0 shadow">
							<div class="card-img-top overflow-hidden bg-cover"
								style="background-image: url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/201810/17/e798d53c-1c8a-4d44-a8ab-111beae96db4.gif); min-height: 200px;">
								<a class="tile-link" href="${path}/board/content/board-detail?id=CONT_000000000500349"></a>
								<div
									class="card-img-overlay-top d-flex justify-content-between align-items-center">
									<!-- 찜 버튼 시작 -->
									<a class="card-fav-icon position-relative z-index-40"
										href="javascript: void();"> <svg
											class="svg-icon text-white">
                        <use xlink:href="#heart-1"> </use>
                      </svg>
									</a>
									<!-- 찜 버튼 끝 -->
								</div>
							</div>
							<div class="card-body">
								<h4>성산일출봉(UNESCO 세계자연유산)</h4>
								<p class="text-sm text-muted mb-3">주소 | 제주특별자치도 서귀포시 성산읍 일출로 284-12
									768</p>
								<p class="text-sm text-muted mb-3">번호 | (+82) 064-783-0959</p>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-slide h-auto px-2">
					<!-- venue item-->
					<div class="w-100 h-100" data-marker-id="59c0c8e3503eb77d487e8082">
						<div class="card h-100 border-0 shadow">
							<div class="card-img-top overflow-hidden bg-cover"
								style="background-image: url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/202012/16/e8969aa3-904e-4cdb-b45e-1df7d8cdce6f.jpg); min-height: 200px;">
								<a class="tile-link" href="${path}/board/content/board-detail?id=CNTS_200000000010958"></a>
								<div
									class="card-img-overlay-top d-flex justify-content-between align-items-center">
									<!-- 찜 버튼 시작 -->
									<a class="card-fav-icon position-relative z-index-40"
										href="javascript: void();"> <svg
											class="svg-icon text-white">
                        <use xlink:href="#heart-1"> </use>
                      </svg>
									</a>
									<!-- 찜 버튼 끝 -->
								</div>
							</div>
							<div class="card-body">
								<h4>아르떼뮤지엄</h4>
								<p class="text-sm text-muted mb-3">주소 | 제주특별자치도 제주시 애월읍 어림비로 478
									768</p>
								<p class="text-sm text-muted mb-3">번호 | (+82) 1899-5000</p>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-slide h-auto px-2">
					<!-- venue item-->
					<div class="w-100 h-100" data-marker-id="59c0c8e39aa2eed0626e485d">
						<div class="card h-100 border-0 shadow">
							<div class="card-img-top overflow-hidden bg-cover"
								style="background-image: url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/202203/10/842d28b8-8892-4b2a-8fdc-598f02ee0c12.jpg); min-height: 200px;">
								<a class="tile-link" href="${path}/board/content/board-detail?id=CNTS_200000000013054"></a>
								<div
									class="card-img-overlay-top d-flex justify-content-between align-items-center">
									<!-- 찜 버튼 시작 -->
									<a class="card-fav-icon position-relative z-index-40"
										href="javascript: void();"> <svg
											class="svg-icon text-white">
                        <use xlink:href="#heart-1"> </use>
                      </svg>
									</a>
									<!-- 찜 버튼 끝 -->
								</div>
							</div>
							<div class="card-body">
								<h4>솔동산고기국수</h4>
								<p class="text-sm text-muted mb-3">주소 | 제주특별자치도 서귀포시 부두로 23
									768</p>
								<p class="text-sm text-muted mb-3">번호 | (+82) 064-733-5353</p>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-slide h-auto px-2">
					<!-- venue item-->
					<div class="w-100 h-100" data-marker-id="59c0c8e39aa2edasd626e485d">
						<div class="card h-100 border-0 shadow">
							<div class="card-img-top overflow-hidden bg-cover"
								style="background-image: url(https://api.cdn.visitjeju.net/photomng/thumbnailpath/201812/21/2c2bb4e0-a45c-4e4e-9913-381a176da233.JPG); min-height: 200px;">
								<a class="tile-link" href="${path}/board/content/board-detail?id=CNTS_200000000008050"></a>
								<div
									class="card-img-overlay-top d-flex justify-content-between align-items-center">
									<!-- 찜 버튼 시작 -->
									<a class="card-fav-icon position-relative z-index-40"
										href="javascript: void();"> <svg
											class="svg-icon text-white">
                        <use xlink:href="#heart-1"> </use>
                      </svg>
									</a>
									<!-- 찜 버튼 끝 -->
								</div>
							</div>
							<div class="card-body">
								<h4>한라산소주공장</h4>
								<p class="text-sm text-muted mb-3">주소 | 제주특별자치도 제주시 한림읍 한림로 555
									768</p>
								<p class="text-sm text-muted mb-3">번호 | (+82) 064-729-1958</p>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- If we need pagination-->
			<div class="swiper-pagination"></div>
		</div>
	</div>
</div>






<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5de518fd6ecf83dcfc6a5b1a8e88c21b"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
	    center: new kakao.maps.LatLng(${content.latitude}, ${content.longitude}), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [
		{
			content: '<div>${content.title}</div>',
			latlng: new kakao.maps.LatLng(${content.latitude}, ${content.longitude})
		}
		
	];
	
	for (var i = 0; i < positions.length; i ++) {
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    map: map, // 마커를 표시할 지도
	    position: positions[i].latlng // 마커의 위치
	});
	
	// 마커에 표시할 인포윈도우를 생성합니다 
	var infowindow = new kakao.maps.InfoWindow({
	    content: positions[i].content // 인포윈도우에 표시할 내용
	});
	
	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	// 이벤트 리스너로는 클로저를 만들어 등록합니다 
	// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}
	
	//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	return function() {
	    infowindow.open(map, marker);
	};
	}
	
	//인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	return function() {
	    infowindow.close();
	};
	}
</script>
