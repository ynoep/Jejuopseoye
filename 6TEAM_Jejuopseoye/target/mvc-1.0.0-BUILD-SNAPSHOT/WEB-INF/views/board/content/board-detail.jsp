<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="여행정보 상세" name="title"/>
</jsp:include>

<section class="pt-6 pb-3">
    <div class="container mt-5">
      <div class="row">
        <!-- 왼쪽 시작 -->
        <div class="col-lg-7">
          <!-- 상세페이지 이미지 시작-->
          <div class="text-block">
            <!-- 큰 이미지 -->
            <img style="width: 100%; height: 100%" class="img-fluid" src="${content.imgpath}" alt="...">
            <!-- 작은 이미지-->
            <div class="row gallery ms-n1 me-n1 mt-3">
              <div class="col-lg-2 col-6 px-1 mb-2"><a href="${path}/resources/img/photo/photo2/tourist_spot_1.jpg"><img class="img-fluid"
                    src="${path}/resources/img/photo/photo2/tourist_spot_1.jpg" alt="tourist_spot"></a></div>
              <div class="col-lg-2 col-6 px-1 mb-2"><a href="${path}/resources/img/photo/photo2/tourist_spot_14.jpg"><img class="img-fluid" 
                    src="${path}/resources/img/photo/photo2/tourist_spot_14.jpg" alt="tourist_spot"></a></div>
              <div class="col-lg-2 col-6 px-1 mb-2"><a href="${path}/resources/img/photo/photo2/tourist_spot_6.jpg"><img class="img-fluid"
                    src="${path}/resources/img/photo/photo2/tourist_spot_6.jpg" alt="tourist_spot"></a></div>
              <div class="col-lg-2 col-6 px-1 mb-2"><a href="${path}/resources/img/photo/photo2/tourist_spot_2.jpg"><img class="img-fluid"
                    src="${path}/resources/img/photo/photo2/tourist_spot_2.jpg" alt="tourist_spot"></a></div>
              <div class="col-lg-2 col-6 px-1 mb-2"><a href="${path}/resources/img/photo/photo2/tourist_spot_3.jpg"><img class="img-fluid"
                    src="${path}/resources/img/photo/photo2/tourist_spot_3.jpg" alt="tourist_spot"></a></div>
              <div class="col-lg-2 col-6 px-1 mb-2"><a href="${path}/resources/img/photo/photo2/tourist_spot_4.jpg"><img class="img-fluid"
                    src="${path}/resources/img/photo/photo2/tourist_spot_4.jpg" alt="tourist_spot"></a></div>
            </div>
            <!-- 댓글창 -->
            
            <!-- 댓글 끝 -->
            <!-- 페이지 시작 -->
            
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
                  <svg class="svg-icon svg-icon svg-icon-light w-3rem h-3rem ms-3 text-muted flex-shrink-0">
                    <use xlink:href="#fountain-pen-1"> </use>
                  </svg>
                </div>
              </div>
              <div class="card-body">
                <table class="table text-sm mb-0">
                  <tr>
                    <th class="ps-0 fs-5 col-2 border-0">주소</th>
                    <td class=" pe-0 fs-5 border-0">
                    	<c:if test="${content.address!=null}">
                    		<c:out value="${content.address}" />
                    	</c:if>
                    	<c:if test="${content.address==null}">
                    		주소 정보가 없습니다.
                    	</c:if>
                    </td>
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
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d106635.52282679426!2d126.47965200232473!3d33.36166396733301!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x350cff51e4901447%3A0x9e789970e40c6824!2z7ZWc65287IKw!5e0!3m2!1sko!2skr!4v1672293583361!5m2!1sko!2skr" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                  </div>
                  </div>
                </div>
                <div class="d-grid text-center"><a class="btn btn-outline-primary" href="#"> <i
                      class="far fa-paper-plane me-2"></i>지도 펼쳐보기</a></div>
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
      <div class="swiper-container swiper-container-mx-negative items-slider">
        <!-- Additional required wrapper-->
        <div class="swiper-wrapper pb-5">
          <!-- Slides-->
          <div class="swiper-slide h-auto px-2">
            <!-- venue item-->
            <div class="w-100 h-100" data-marker-id="59c0c8e33b1527bfe2abaf92">
              <div class="card h-100 border-0 shadow">
                <div class="card-img-top overflow-hidden bg-cover"
                  style="background-image: url(${path}/resources/img/photo/photo2/jeju-island-2580729.jpg); min-height: 200px;">
                  <a class="tile-link" href="${path}/board/content/board-detail"></a>
                  <div class="card-img-overlay-top d-flex justify-content-between align-items-center">
                    <!-- 찜 버튼 시작 -->
                    <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                      <svg class="svg-icon text-white">
                        <use xlink:href="#heart-1"> </use>
                      </svg>
                    </a>
                    <!-- 찜 버튼 끝 -->
                  </div>
                </div>
                <div class="card-body">
                  <h4>삼굼부리</h4>
                  <p class="text-sm text-muted mb-3"> 주소 | 제주특별자치도 제주시 조천읍 비자림로 768</p>
                  <p class="text-sm text-muted mb-3"> 번호 | (+82) 062-783-9900</p>
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
                  style="background-image: url(${path}/resources/img/photo/photo2/beauty-2210701.jpg); min-height: 200px;">
                  <a class="tile-link" href="${path}/board/content/board-detail"></a>
                  <div class="card-img-overlay-top d-flex justify-content-between align-items-center">
                    <!-- 찜 버튼 시작 -->
                    <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                      <svg class="svg-icon text-white">
                        <use xlink:href="#heart-1"> </use>
                      </svg>
                    </a>
                    <!-- 찜 버튼 끝 -->
                  </div>
                </div>
                <div class="card-body">
                  <h4>삼굼부리</h4>
                  <p class="text-sm text-muted mb-3"> 주소 | 제주특별자치도 제주시 조천읍 비자림로 768</p>
                  <p class="text-sm text-muted mb-3"> 번호 | (+82) 062-783-9900</p>
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
                  style="background-image: url(${path}/resources/img/photo/photo2/cabin-2606781.jpg); min-height: 200px;">
                  <a class="tile-link" href="${path}/board/content/board-detail"></a>
                  <div class="card-img-overlay-top d-flex justify-content-between align-items-center">
                    <!-- 찜 버튼 시작 -->
                    <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                      <svg class="svg-icon text-white">
                        <use xlink:href="#heart-1"> </use>
                      </svg>
                    </a>
                    <!-- 찜 버튼 끝 -->
                  </div>
                </div>
                <div class="card-body">
                  <h4>삼굼부리</h4>
                  <p class="text-sm text-muted mb-3"> 주소 | 제주특별자치도 제주시 조천읍 비자림로 768</p>
                  <p class="text-sm text-muted mb-3"> 번호 | (+82) 062-783-9900</p>
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
                  style="background-image: url(${path}/resources/img/photo/photo2/autumn-4608184.jpg); min-height: 200px;">
                  <a class="tile-link" href="${path}/board/content/board-detail"></a>
                  <div class="card-img-overlay-top d-flex justify-content-between align-items-center">
                    <!-- 찜 버튼 시작 -->
                    <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                      <svg class="svg-icon text-white">
                        <use xlink:href="#heart-1"> </use>
                      </svg>
                    </a>
                    <!-- 찜 버튼 끝 -->
                  </div>
                </div>
                <div class="card-body">
                  <h4>삼굼부리</h4>
                  <p class="text-sm text-muted mb-3"> 주소 | 제주특별자치도 제주시 조천읍 비자림로 768</p>
                  <p class="text-sm text-muted mb-3"> 번호 | (+82) 062-783-9900</p>
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
                  style="background-image: url(${path}/resources/img/photo/photo2/bedroom-747527.jpg); min-height: 200px;">
                  <a class="tile-link" href="${path}/board/content/board-detail"></a>
                  <div class="card-img-overlay-top d-flex justify-content-between align-items-center">
                    <!-- 찜 버튼 시작 -->
                    <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                      <svg class="svg-icon text-white">
                        <use xlink:href="#heart-1"> </use>
                      </svg>
                    </a>
                    <!-- 찜 버튼 끝 -->
                  </div>
                </div>
                <div class="card-body">
                  <h4>삼굼부리</h4>
                  <p class="text-sm text-muted mb-3"> 주소 | 제주특별자치도 제주시 조천읍 비자림로 768</p>
                  <p class="text-sm text-muted mb-3"> 번호 | (+82) 062-783-9900</p>
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
                  style="background-image: url(${path}/resources/img/photo/photo2/doll-2853764.jpg); min-height: 200px;">
                  <a class="tile-link" href="${path}/board/content/board-detail"></a>
                  <div class="card-img-overlay-top d-flex justify-content-between align-items-center">
                    <!-- 찜 버튼 시작 -->
                    <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                      <svg class="svg-icon text-white">
                        <use xlink:href="#heart-1"> </use>
                      </svg>
                    </a>
                    <!-- 찜 버튼 끝 -->
                  </div>
                </div>
                <div class="card-body">
                  <h4>삼굼부리</h4>
                  <p class="text-sm text-muted mb-3"> 주소 | 제주특별자치도 제주시 조천읍 비자림로 768</p>
                  <p class="text-sm text-muted mb-3"> 번호 | (+82) 062-783-9900</p>
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
