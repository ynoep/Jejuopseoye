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


<section class="py-6">
    <div class="container">
      <!-- 경로 -->
      <ol class="breadcrumb ps-0 justify-content-start">
        <li class="breadcrumb-item text-lg"><a href="${path}">홈</a></li>
        <li class="breadcrumb-item text-lg"><a href="${path}/menu/mypage">마이페이지</a></li>
        <li class="breadcrumb-item active text-lg">작성글&댓글</li>
      </ol>

      <h1 class="hero-heading mb-0 my-4">작성글&댓글</h1>
      <p class="text-muted mb-6"> </p>

      <!-- 회원정보 -->
      <section class="py-5 p-print-0">
        <div class="container">
          <div class="table-responsive text-sm mb-5">
            <table class="table table-striped">
              <thead class="bg-gray-200">
                <tr class="border-0">
                  <th class="text-center" style="width: 15%;">카테고리</th>
                  <th class="text-center" style="width: 10%;">글번호</th>
                  <th style="width: 50%;">제목</th>
                  <th class="text-center" style="width: 15%;">작성일</th>
                  <th class="text-center" style="width: 10%;">조회수</th>
                </tr>
              </thead>
              <tbody>
              <c:if test="${empty boardList}">
					<tr>
						<td class="text-center" colspan="5">조회된 글이 없습니다.</td>
					</tr>
			  </c:if>
			  <c:if test="${not empty boardList}">
						<c:forEach var="board" items="${boardList}">
                <tr>
                	<c:if test="${board.type=='free'}">
                  		<td class="text-center">자유게시판</td>
                  	</c:if>
                	<c:if test="${board.type=='notice'}">
                  		<td class="text-center">공지사항</td>
                  	</c:if>
                	<c:if test="${board.type=='review'}">
                  		<td class="text-center">여행후기</td>
                  	</c:if>
                  <td class="text-center">${board.no}</td>
                  <td class="fw-bold">${board.title}</td>
                  <td class="text-center">
                  	<fmt:formatDate type="date" value="${board.createDate}"/>
                  </td>
                  <td class="text-center">${board.readCount}</td>
                </tr>
                </c:forEach>
                </c:if>
              </tbody>
            </table>
          </div>
        </div>
        <!-- 페이징 -->
        <nav aria-label="Page navigation example">
				<!-- 이전 페이지 -->
				<ul
					class="pagination pagination-template d-flex justify-content-center">
					<li class="page-item">
						<button class="page-link"
							onclick="movePage('${path}/member/my-board-reply?no=${loginMember.no}&page=${boardPageInfo.prevPage}')">
							<i class="fa fa-angle-left"></i>
						</button>
					</li>

					<!-- 10개 페이지 -->
					<c:forEach begin="${boardPageInfo.startPage}" end="${boardPageInfo.endPage}"
						step="1" varStatus="status">
						<c:if test="${status.current == boardPageInfo.currentPage}">
							<li class="page-item active"><button class="page-link"
									disabled>${status.current}</button></li>
						</c:if>
						<c:if test="${status.current != boardPageInfo.currentPage}">
							<li class="page-item">
								<button class="page-link"
									onclick="movePage('${path}/member/my-board-reply?no=${loginMember.no}&page=${status.current}')">
									${status.current}</button>
							</li>
						</c:if>
					</c:forEach>
					<!-- 다음 페이지 -->
					<li class="page-item">
						<button class="page-link"
							onclick="movePage('${path}/member/my-board-reply?no=${loginMember.no}&page=${boardPageInfo.nextPage}')">
							<i class="fa fa-angle-right"></i>
						</button>
					</li>
				</ul>
			</nav>
      </section>


      <section class="py-5 p-print-0">
        <div class="container">
          <div class="table-responsive text-sm mb-5">
            <table class="table table-striped">
              <thead class="bg-gray-200">
                <tr class="border-0">
                  <th style="width: 75%;">댓글</th>
                  <th class="text-center" style="width: 25%;">작성일</th>
                </tr>
              </thead>
              <tbody>
              <c:if test="${empty replyList}">
					<tr>
						<td class="text-center" colspan="2">조회된 댓글이 없습니다.</td>
					</tr>
			  </c:if>
			  <c:if test="${not empty replyList}">
						<c:forEach var="reply" items="${replyList}">
                <tr>
                  <td class="fw-bold">${reply.content}</td>
                  <td class="text-center">
                  	<fmt:formatDate type="date" value="${reply.createDate}"/>
                  </td>
                </tr>
                </c:forEach>
                </c:if>
              </tbody>
            </table>
          </div>
        </div>
        <!-- 페이징 -->
        <nav aria-label="Page navigation example">
				<!-- 이전 페이지 -->
				<ul
					class="pagination pagination-template d-flex justify-content-center">
					<li class="page-item">
						<button class="page-link"
							onclick="movePage('${path}/member/my-board-reply?no=${loginMember.no}&page=${replyPageInfo.prevPage}')">
							<i class="fa fa-angle-left"></i>
						</button>
					</li>

					<!-- 10개 페이지 -->
					<c:forEach begin="${replyPageInfo.startPage}" end="${replyPageInfo.endPage}"
						step="1" varStatus="status">
						<c:if test="${status.current == boardPageInfo.currentPage}">
							<li class="page-item active"><button class="page-link"
									disabled>${status.current}</button></li>
						</c:if>
						<c:if test="${status.current != replyPageInfo.currentPage}">
							<li class="page-item">
								<button class="page-link"
									onclick="movePage('${path}/member/my-board-reply?no=${loginMember.no}&page=${status.current}')">
									${status.current}</button>
							</li>
						</c:if>
					</c:forEach>
					<!-- 다음 페이지 -->
					<li class="page-item">
						<button class="page-link"
							onclick="movePage('${path}/member/my-board-reply?no=${loginMember.no}&page=${replyPageInfo.nextPage}')">
							<i class="fa fa-angle-right"></i>
						</button>
					</li>
				</ul>
			</nav>
      </section>
    </div>
  </section>
  
  <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
  
  <script type="text/javascript">
		function movePage(pageUrl) {
			var searchValue = document.getElementById("searchValue"); // 갤럭시
			var searchTypes = document.getElementsByName("searchType"); // title
			var typeValue = document.getElementById("typeValue"); // 갤럭시
			var typeTypes = document.getElementsByName("typeType"); // title
			var searchType = 'title';
			var typeType = 'type';

			if (searchValue.value.length > 0) {
				for (var i = 0; i < searchTypes.length; i++) {
					if (searchTypes[i].checked == true) {
						searchType = searchTypes[i].value;
					}
				}
				pageUrl = pageUrl + '&searchType=' + searchType
						+ '&searchValue=' + searchValue.value + '&typeType='
						+ typeType + '&typeValue' + typeValue;
			}
			location.href = encodeURI(pageUrl);
		}
	</script>