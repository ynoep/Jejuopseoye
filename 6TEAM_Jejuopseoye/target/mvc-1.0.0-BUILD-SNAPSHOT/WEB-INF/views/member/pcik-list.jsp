<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="찜 목록" name="title"/>
</jsp:include>

  <!-- Slider main container-->
  <div class="swiper-container home-slider multi-slider_modify">
    <!-- Additional required wrapper-->
    <div class="swiper-wrapper">
      <!-- Slides-->
      <div class="swiper-slide bg-cover dark-overlay"
        style="background-size: 100% 100%; background-image: url('${path}/resources/img/photo/hero_bg4.png');">
      </div>
    </div>
  </div>

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

  <!-- Footer-->
  <footer class="position-relative z-index-10 d-print-none">

    <!-- Copyright section of the footer-->
    <div class="py-4 fw-light bg-gray-800 text-gray-300">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md-6 text-center text-md-start">
            <p class="text-sm mb-md-0">
              &copy; 2021, Your company. All rights reserved.
            </p>
          </div>
          <div class="col-md-6">
            <ul class="list-inline mb-0 mt-2 mt-md-0 text-center text-md-end">
              <li class="list-inline-item">
                <img class="w-2rem" src="img/visa.svg" alt="..." />
              </li>
              <li class="list-inline-item">
                <img class="w-2rem" src="img/mastercard.svg" alt="..." />
              </li>
              <li class="list-inline-item">
                <img class="w-2rem" src="img/paypal.svg" alt="..." />
              </li>
              <li class="list-inline-item">
                <img class="w-2rem" src="img/western-union.svg" alt="..." />
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <!-- JavaScript files-->
  <script>
    // ------------------------------------------------------- //
    //   Inject SVG Sprite -
    //   see more here
    //   https://css-tricks.com/ajaxing-svg-sprite/
    // ------------------------------------------------------ //
    function injectSvgSprite(path) {
      var ajax = new XMLHttpRequest();
      ajax.open("GET", path, true);
      ajax.send();
      ajax.onload = function (e) {
        var div = document.createElement("div");
        div.className = "d-none";
        div.innerHTML = ajax.responseText;
        document.body.insertBefore(div, document.body.childNodes[0]);
      };
    }

    // 이메일 폼
    const emailListEl = document.querySelector("#email-list");
    const emailInputEl = document.querySelector("#email_input");

    emailListEl.addEventListener("change", (event) => {
      // email 선택 시
      if (event.target.value !== "type") {
        emailInputEl.value = event.target.value;
        emailInputEl.disabled = true;
      } else {
        // 직접 입력
        // input 내용 초기화 & 입력 가능하도록 변경
        emailInputEl.value = "";
        emailInputEl.disabled = false;
      }
    });

    // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
    // use your own URL in production, please :)
    // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
    //- injectSvgSprite('${path}icons/orion-svg-sprite.svg');
    injectSvgSprite(
      "https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg"
    );
  </script>
  <!-- jQuery-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <!-- Bootstrap JS bundle - Bootstrap + PopperJS-->
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Magnific Popup - Lightbox for the gallery-->
  <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
  <!-- Smooth scroll-->
  <script src="vendor/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
  <!-- Bootstrap Select-->
  <script src="vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
  <!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
  <script src="vendor/object-fit-images/ofi.min.js"></script>
  <!-- Swiper Carousel                       -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
  <script>
    var basePath = "";
  </script>
  <!-- Main Theme JS file    -->
  <script src="js/theme.js"></script>