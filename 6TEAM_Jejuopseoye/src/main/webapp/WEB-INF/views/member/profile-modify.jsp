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
                <form class="form-outline" action="${path}/member/update" method="post">
                  <div class="row">
                    <div class="col-md-6 mb-3">
                      <div class="form-group">
                        <label for="User_Id">ID</label>
                        <input class="form-control" name="id" id="first_name" type="text" value="${loginMember.id}" readonly />
                      </div>
                    </div>
                    <div class="col-md-6 mb-3">
                      <div class="form-group">
                        <label for="User_Name">Nickname</label>
                        <input class="form-control" name="nickName" id="last_name" type="text" value="${loginMember.nickName}" readonly />
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
                          <input name="email1" class="mail" type="text" value="${loginMember.email1}" /> @ <input id="email_input"
                            class="mail col-5" type="text" name="email2" value="${loginMember.email2}" />
                          <select id="email-list" class="mail_list_p" name="email3">
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
                        <input class="form-control" name="phone" id="phone" type="tel"
                          autocomplete="off" value="${loginMember.phone}" />
                      </div>
                    </div>
                  </div>
                  <div class="mt-6 text-center">
                    <button type="submit" class="btn btn-primary">저장하기</button>
                    <button type="button" class="btn btn-dark" id="deleteMember">탈퇴하기</button>
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
  
  <script type="text/javascript">
	$(function () {
		$("#deleteMember").on("click", (e) => {
			if(confirm("정말로 탈퇴하시겠습니까?!")) {
				location.replace('${path}/member/delete');
			}
		});
		
		
	});
</script>

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
        div.className = 'd-none';
        div.innerHTML = ajax.responseText;
        document.body.insertBefore(div, document.body.childNodes[0]);
      }
    }

   const emailListEl = document.querySelector('#email-list')
   const emailInputEl = document.querySelector('#email_input')

    emailListEl.addEventListener('change', (event) => {
      // email 선택 시 disabled
      if (event.target.value !== "type") {
        emailInputEl.value = event.target.value
      } else {   // 직접 입력
        // input 초기화하고 입력 가능하도록 변경
        emailInputEl.value = ""
      }
    })
    // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
    // use your own URL in production, please :)
    // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
    //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
    injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');
    

  </script>