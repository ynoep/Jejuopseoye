<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="관광지" name="title" />
</jsp:include>

<c:set var="searchType" value="${param.searchType}" />
<c:if test="${empty searchType}">
	<c:set var="searchType" value="${'title'}"/>
</c:if>

<c:set var="value" value="${param.option}"/>
<c:if test="${value eq 'C1'}">
	<c:set var="subject" value="관광지" />
</c:if>
<c:if test="${value eq 'C3'}">
	<c:set var="subject" value="숙박" />
</c:if>
<c:if test="${value eq 'C4'}">
	<c:set var="subject" value="음식점" />
</c:if>
<c:if test="${value eq 'C5'}">
	<c:set var="subject" value="축제/행사" />
</c:if>


<section class="hero-web d-flex align-items-end dark-overlay bg-cover"
	style="background-image: url(${path}/resources/img/photo/attraction_${value}.png); background-size: 100% 100%;">
	<div class="container h-100">
		<div
			class="w-100 text-start position-absolute bottom-0 start-18 overlay-content">
			<div class="row">
				<div class="col-xl-11">
					<h1 class="display-3 font-weight-bold text-shadow"
						style="color: white;">
						${subject}
						</h1>
					<p class="text-lg text-shadow" style="color: white;">환상적이고 신비로운
						섬, 제주로 놀러오세요!!!</p>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="py-5">
	<div class="container">
		<div class="row mb-5">
			<div class="col-xl-6 mx-auto">
				<form action="${path}/board/content/attraction" method="get">
					<div class="input-group">
						<input type="hidden" name="searchType" value="title">
						<input type="hidden" name="option" value="${value}">
						<input type="hidden" id="optionValue" value="${value}">
						<input style="border-radius: 8px 0 0 8px/8px 0 0 8px"
							class="form-control text-lg" type="text"
							value="${param.searchValue}" id="searchValue" name="searchValue"
							placeholder="검색어 입력...">
						<button class="btn btn-primary text-xl" type="submit">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
		<!-- venue item-->
		<div class="row">
			<!-- venue item-->
			<c:if test="${empty list}">
				<h3>조회된 글이 없습니다.</h3>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="content" items="${list}">
				<c:set var="i" value="${i+1}" />
					<div class="col-sm-6 col-xl-4 mb-5 hover-animate"
						data-marker-id="59c0c8e33b1527bfe2abaf92">
						<div class="card h-100 border-0 shadow">
							<div class="card-img-top overflow-hidden dark-overlay bg-cover"
								style="background-image: url(${content.thumbnailpath}); min-height: 200px;">
								<a class="tile-link"
									href="${path}/board/content/board-detail?no=${content.no}"></a>
							</div>
							<div class="card-body">
								<h3 class="text-black text-shadow mt-4">
									<c:choose>
										<c:when test="${fn:length(content.title) gt 15}">
											<c:out value="${fn:substring(content.title, 0, 14)}...">
											</c:out>
										</c:when>
										<c:otherwise>
											<c:out value="${content.title}">
											</c:out>
										</c:otherwise>
									</c:choose>
								</h3>
								<p class="text-lg text-muted mb-1">
									<a href="${path}/board/content/board-detail?no=${content.no}"
										class="text-dark"> <c:choose>
											<c:when test="${fn:length(content.introduction) gt 22}">
												<c:out
													value="${fn:substring(content.introduction, 0, 21)}...">
												</c:out>
											</c:when>
											<c:otherwise>
												<c:out value="${content.introduction}">
												</c:out>
											</c:otherwise>
										</c:choose>
									</a>
								</p>
								<p class="text-base text-end mb-0">
									<button class="btn btn-primary" id="likebtn${i}"
										onclick="onClickLike${i}('likebtn${i}')">좋아요</button>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<!-- Pagination -->
		<div class="row mb-3">
			<nav aria-label="Page navigation example">
				<!-- 이전 페이지 -->
				<ul
					class="pagination pagination-template d-flex justify-content-center">
					<li class="page-item">
						<button class="page-link"
							onclick="movePage('${path}/board/content/attraction?option=${value}&page=${pageInfo.prevPage}')">
							<i class="fa fa-angle-left"></i>
						</button>
					</li>

					<!-- 10개 페이지 -->
					<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}"
						step="1" varStatus="status">
						<c:if test="${status.current == pageInfo.currentPage}">
							<li class="page-item active"><button class="page-link"
									disabled>${status.current}</button></li>
						</c:if>
						<c:if test="${status.current != pageInfo.currentPage}">
							<li class="page-item">
								<button class="page-link"
									onclick="movePage('${path}/board/content/attraction?option=${value}&page=${status.current}')">
									${status.current}</button>
							</li>
						</c:if>
					</c:forEach>
					<!-- 다음 페이지 -->
					<li class="page-item">
						<button class="page-link"
							onclick="movePage('${path}/board/content/attraction?page=${pageInfo.nextPage}&option=${value}')">
							<i class="fa fa-angle-right"></i>
						</button>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script type="text/javascript">
	function movePage(pageUrl){
		var searchValue = document.getElementById("searchValue"); // 갤럭시
		var searchTypes = document.getElementsByName("searchType"); // title
		var optionValue = document.getElementById("optionValue"); // 갤럭시
		var optionTypes = document.getElementsByName("optionType"); // title
		var searchType = 'title';
		var optionType = 'option';
		if(searchValue.value.length > 0){
			for(var i = 0; i <searchTypes.length; i++){
				if(searchTypes[i].checked == true){
					searchType = searchTypes[i].value;
				}
			}
			pageUrl = pageUrl + '&searchType=' + searchType + '&searchValue=' + searchValue.value; 
		}
		location.href = encodeURI(pageUrl);
	}
</script>

<script type="text/javascript">
        let likeboolean1 = false;
        let likeboolean2 = false;
        let likeboolean3 = false;
        let likeboolean4 = false;
        let likeboolean5 = false;
        let likeboolean6 = false;
        let likeboolean7 = false;
        let likeboolean8 = false;
        let likeboolean9 = false;
        

        function onClickLike1(id) {
            likeboolean1 = !likeboolean1;
            if (likeboolean1 === true) {
                document.getElementById(id).style.backgroundColor='#0055ff';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            } else {
                document.getElementById(id).style.backgroundColor='#ff9228';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            }


        }
        function onClickLike2(id) {
            likeboolean2 = !likeboolean2;
            if (likeboolean2 === true) {
                document.getElementById(id).style.backgroundColor='#0055ff';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            } else {
                document.getElementById(id).style.backgroundColor='#ff9228';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            }


        }
        function onClickLike3(id) {
            likeboolean3 = !likeboolean3;
            if (likeboolean3 === true) {
                document.getElementById(id).style.backgroundColor='#0055ff';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            } else {
                document.getElementById(id).style.backgroundColor='#ff9228';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            }


        }
        function onClickLike4(id) {
            likeboolean4 = !likeboolean4;
            if (likeboolean4 === true) {
                document.getElementById(id).style.backgroundColor='#0055ff';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            } else {
                document.getElementById(id).style.backgroundColor='#ff9228';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            }


        }
        function onClickLike5(id) {
            likeboolean5 = !likeboolean5;
            if (likeboolean5 === true) {
                document.getElementById(id).style.backgroundColor='#0055ff';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            } else {
                document.getElementById(id).style.backgroundColor='#ff9228';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            }


        }
        function onClickLike6(id) {
            likeboolean6 = !likeboolean6;
            if (likeboolean6 === true) {
                document.getElementById(id).style.backgroundColor='#0055ff';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            } else {
                document.getElementById(id).style.backgroundColor='#ff9228';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            }


        }
        function onClickLike7(id) {
            likeboolean7 = !likeboolean7;
            if (likeboolean7 === true) {
                document.getElementById(id).style.backgroundColor='#0055ff';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            } else {
                document.getElementById(id).style.backgroundColor='#ff9228';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            }


        }
        function onClickLike8(id) {
            likeboolean8 = !likeboolean8;
            if (likeboolean8 === true) {
                document.getElementById(id).style.backgroundColor='#0055ff';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            } else {
                document.getElementById(id).style.backgroundColor='#ff9228';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            }


        }
        function onClickLike9(id) {
            likeboolean9 = !likeboolean9;
            if (likeboolean9 === true) {
                document.getElementById(id).style.backgroundColor='#0055ff';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            } else {
                document.getElementById(id).style.backgroundColor='#ff9228';
                // 여기에 AJAX로 DB 업데이트하는 코드 있어야함!!
            }


        }
        
    </script>
