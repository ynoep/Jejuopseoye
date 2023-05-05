<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="찜 목록" name="title"/>
</jsp:include>

  <!-- Slider main container-->
  <section class="hero-web d-flex align-items-end dark-overlay bg-cover"
    style="background-image: url(${path}/resources/img/photo/hero_bg4.png); background-size: 100% 100%;">
	<img src="${path}/resources/img/coming.png" class="img-fluid mx-auto mb-5">
</section>

  <section class="py-6">
    <div class="container">
      <!-- 경로 -->
      <ol class="breadcrumb ps-0 justify-content-start">
        <li class="breadcrumb-item text-lg"><a href="${path}">홈</a></li>
        <li class="breadcrumb-item text-lg"><a href="${path}/menu/mypage">마이페이지</a></li>
        <li class="breadcrumb-item active text-lg">내가 찜한 리스트</li>
      </ol>

      <h1 class="hero-heading mb-0 my-4">찜 목록 리스트</h1>
      <p class="text-muted mb-3"> </p>

      <div class="table-responsive-pick">
        <table class="table text-gray-700 table-striped table-hover">
          <tr>
            <th class="py-4 text-center align-middle" style="width: 10%">글번호</th>
            <th class="py-4 text-center align-middle" style="width: 50%">제목</th>
            <th class="py-4 text-center align-middle" style="width: 10%"></th>
          </tr>
          <tr>
            <td class="py-4 text-center align-middle">5</td>
            <td class="py-4 ps-5 align-middle">
              <a class="custom-a" href="${path}/board/content/board-detail">봄날 카페</a>
            </td>
            <td class="py-4 text-center align-middle"><button class="pick-button">삭제</button></td>
          </tr>
          <tr>
            <td class="py-4 text-center align-middle">4</td>
            <td class="py-4 ps-5 align-middle">
              <a class="custom-a" href="${path}/board/content/board-detail">서연의 집</a>
            </td>
            <td class="py-4 text-center align-middle"><button class="pick-button">삭제</button></td>
          </tr>
          <tr>
            <td class="py-4 text-center align-middle">3</td>
            <td class="py-4 ps-5 align-middle">
              <a class="custom-a" href="${path}/board/content/board-detail">천지연 폭포</a>
            </td>
            <td class="py-4 text-center align-middle"><button class="pick-button">삭제</button></td>
          </tr>
          <tr>
            <td class="py-4 text-center align-middle">2</td>
            <td class="py-4 ps-5 align-middle">
              <a class="custom-a" href="${path}/board/content/board-detail">몽상드애월</a>
            </td>
            <td class="py-4 text-center align-middle"><button class="pick-button">삭제</button></td>
          </tr>
          <tr>
            <td class="py-4 text-center align-middle">1</td>
            <td class="py-4 ps-5 align-middle">
              <a class="custom-a" href="${path}/board/content/board-detail">향미돈</a>
            </td>
            <td class="py-4 text-center align-middle"><button class="pick-button">삭제</button></td>
          </tr>
        </table>
      </div>
    </div>
  </section>

  <jsp:include page="/WEB-INF/views/common/footer.jsp" />
