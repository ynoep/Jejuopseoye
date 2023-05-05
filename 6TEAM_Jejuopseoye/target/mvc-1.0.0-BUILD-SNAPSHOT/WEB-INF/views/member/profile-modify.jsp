<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="내 정보" name="title" />
</jsp:include>

      <div class="swiper-slide bg-cover dark-overlay"
        style="background-size: 100% 100%; background-image: url('${path}/resources/img/photo/hero_bg4.png');">
  </div>

  <section class="py-6">
    <div class="container">
      <!-- 경로 -->
      <ol class="breadcrumb ps-0 justify-content-start">
        <li class="breadcrumb-item text-lg"><a href="${path}">홈</a></li>
        <li class="breadcrumb-item text-lg"><a href="${path}/menu/mypage">마이페이지</a></li>
        <li class="breadcrumb-item active text-lg">내 정보</li>
      </ol>

      <h1 class="hero-heading mb-0 my-4">내 정보</h1>
      <p class="text-muted mb-6"> </p>

      <!-- 회원정보 -->
      <div class="row pt-5 pb-7 pt-md-0 ps-md-5">
        <div class="col-12 col-lg-12">
          <div class="row">
            <div class="col-lg-9 mx-6 my-5">
              <div class="card card-body bg-white border-light mx-5 mb-4">
                <h2 class="h5 my-3 mb-5 text-center text-xl">회원 정보</h2>
                <form class="form-outline">
                  <div class="row">
                    <div class="col-md-6 mb-3">
                      <div class="form-group">
                        <label for="User_Id">ID</label>
                        <input class="form-control" id="first_name" type="text" placeholder="${loginMember.id}" readonly />
                      </div>
                    </div>
                    <div class="col-md-6 mb-3">
                      <div class="form-group">
                        <label for="User_Name">Nickname</label>
                        <input class="form-control" id="last_name" type="text" placeholder="${loginMember.nickname}" readonly />
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-md-6 mb-3">
                      <label for="password">Current Password</label>
                      <input class="form-control" type="password" name="password-current" id="password-current"
                        placeholder="******" readonly />
                    </div>
                    <div class="col-md-6 mb-2">
                      <a class="btn btn-primary" type="button" href="${path}/member/original/updatePwd" id="password_change">비밀번호 변경</a>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12 mb-3">
                      <div class="form-group">
                        <label for="Email">E-Mail</label>
                        <div class="box">
                          <input class="mail" type="text" placeholder="welcomejeju" /> @ <input id="email_input"
                            class="mail col-5" type="text" />
                          <select id="email-list" class="mail_list_p">
                            <option value="type" selected>직접 입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option value="nate.com">nate.com</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6 mb-3">
                      <div class="form-group">
                        <label for="phone">Phone</label>
                        <input class="form-control" name="loginUsername" id="phone" type="email"
                          placeholder="010-1234-5678" autocomplete="off" />
                      </div>
                    </div>
                  </div>
                  <div class="mt-6 text-center">
                    <button type="submit" class="btn btn-primary">저장하기</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  
  
  <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>