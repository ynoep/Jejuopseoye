<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="예약페이지" name="title" />
</jsp:include>

<!-- Slider main container-->
<section class="hero-web d-flex align-items-end dark-overlay bg-cover"
    style="background-image: url(${path}/resources/img/photo/hero_bg3.png); background-size: 100% 100%;">
	<img src="${path}/resources/img/coming.png" class="img-fluid mx-auto mb-5">
</section>

<!-- 추천 여행지 ooooooooooooooooooooooooooooooooooooooooooooooooooo-->
<!-- section class="py-6 bg-gray-100" -->
<section class="py-5">
    <!-- <div class="container"> -->
    <div>
        <div class="container ms-7">
            <!-- 경로 -->
            <ol class="breadcrumb ps-0 my-5 justify-content-start">
                <li class="breadcrumb-item text-lg"><a href="${path}/">홈</a></li>
                <li class="breadcrumb-item text-lg"><a href="${path}/menu/mypage">마이페이지</a></li>
                <li class="breadcrumb-item active text-lg">예약현황</li>
            </ol>

            <h2 class="mt-5 my-5">나의 예약 리스트 바로가기</h2>
        </div>

        <div class="row mx-xl-7">
            <!-- blog item-->
            <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
                <div class="card shadow border-0 h-100"><a href="${path}/common/not_implemented"><img
                            class="img-fluid card-img-top" src="${path}/resources/img/photo/restaurant-1515164783716-8e6920f3e77c.jpg" alt="..." /></a>
                    <div class="card-body">
                        <h2 class="my-2 text-center"><a class="text-dark" href="${path}/common/not_implemented">예약한 맛집</a>
                        </h2>
                    </div>
                </div>
            </div>
            <!-- blog item-->
            <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
                <div class="card shadow border-0 h-100"><a href="${path}/common/not_implemented"><img
                            class="img-fluid card-img-top" src="${path}/resources/img/photo/photo-1522771739844-6a9f6d5f14af.jpg"
                            alt="..." /></a>
                    <div class="card-body">
                        <h2 class="my-2 text-center"><a class="text-dark" href="${path}/common/not_implemented">예약한 숙소
                            </a></h2>
                    </div>
                </div>
            </div>
            <!-- blog item-->
            <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
                <div class="card shadow border-0 h-100"><a href="${path}/common/not_implemented"><img
                            class="img-fluid card-img-top" src="${path}/resources/img/attractions.jpg" alt="..." /></a>
                    <div class="card-body">
                        <h2 class="my-2 text-center"><a class="text-dark" href="${path}/common/not_implemented">예약한 액티비티
                                <br>
                            </a></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 테이블 추가 -->
<section class="py-5">
    <div class="container ms-7">
        <h2 class="mt-4 my-5">예약한 리스트</h2>
    </div>
    <section class="row mx-xl-7">
        <div class="table-responsive">
            <table class="table text-gray-700 table-striped table-hover" style="border: 1px solid gray;">
                <colgroup>
                    <col style="width: 20%">
                    <col style="width: 20%">
                    <col style="width: 45%">
                    <col style="width: 15%">
                </colgroup>
                <tr>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;">가게명</th>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;">전화번호</th>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;">주소</th>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;">카테고리</th>
                </tr>
                <tr>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;"></th>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;"></th>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;"></th>
                    <th class="py-4 text-center align-middle"></th>
                </tr>
                <tr>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;"></th>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;"></th>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;"></th>
                    <th class="py-4 text-center align-middle"></th>
                </tr>
                <tr>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;"></th>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;"></th>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;"></th>
                    <th class="py-4 text-center align-middle"></th>
                </tr>
                <tr>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;"></th>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;"></th>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;"></th>
                    <th class="py-4 text-center align-middle"></th>
                </tr>
                <tr>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;"></th>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;"></th>
                    <th class="py-4 text-center align-middle" style="border-right: 1px solid gray;"></th>
                    <th class="py-4 text-center align-middle"></th>
                </tr>
            </table>

        </div>
    </section>
</section>

<!-- 구글맵 ooooooooooooooooooooooooooooooooooooooooooooooooooo -->
<section class="py-5">
    <div class="container ms-7">
        <h2 class="mt-4 my-5">예약한 위치정보</h2>
    </div>
    <!-- 구글맵 -->
    <div class="row mx-xl-7">
        <div class="map mx-3 mb-7" style="background-color: #ff9228;">
            <h1>지도 채울공간</h1>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>