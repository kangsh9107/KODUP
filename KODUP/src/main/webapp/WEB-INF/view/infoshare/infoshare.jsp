<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="css/infoshare.css" rel="stylesheet">
<!-- JS -->
<script defer src="js/infoshare.js"></script>
<script defer src="js/common_board.js"></script>
<title>infoshare/infoshare.jsp</title>
</head>
<body>
	<!-- CONTENT -->
	<div class="container" style="padding: 0;">
		<!-- BOARDTYPE -->
		<div class="row">
			<div class="col-md-12" style="padding-left: 10px; padding-right: 10px;">
				<div class="list-group">
					<label class="list-group-item list-group-item-action" id="index_board_boardtype">
						정보공유
						<img id="index_boardtype_background" src="images/index_boardtype_infoshare.png">
					</label>
				</div>
			</div>
		</div>
		
		<!-- FORM -->
		<form name="board_search_form" class="board_search_form" method="post">
			<div class="row">
				<div class="col-md-12" style="padding-left: 10px; padding-right: 10px;">
					<!-- INSERT -->
					<c:choose>
						<c:when test="${sessionScope.sessionId ne null }">
							<input type="button" class="btn btnInfoshareInsert" value="&#xf304; 작성하기" style="font-family: FontAwesome; float: left;">
						</c:when>
						<c:otherwise>
							<input type="button" style="visibility: hidden;" class="btn btnInfoshareInsert" value="&#xf304; 작성하기" style="font-family: FontAwesome; float: left;">
						</c:otherwise>
					</c:choose>
					<!-- HORSEHEAD -->
					<input type="radio" onclick="runQna('팁')" class="btn-check" name="horsehead_radio" id="horsehead_radio1" ${cbpVo.horsehead eq '팁' ? 'checked' : '' }>
					<label for="horsehead_radio1">팁</label>
					<input type="radio" onclick="runQna('리뷰')" class="btn-check" name="horsehead_radio" id="horsehead_radio2" ${cbpVo.horsehead eq '리뷰' ? 'checked' : '' }>
					<label for="horsehead_radio2">리뷰</label>
					<input type="radio" onclick="runQna('기타')" class="btn-check" name="horsehead_radio" id="horsehead_radio3" ${cbpVo.horsehead eq '기타' ? 'checked' : '' }>
					<label for="horsehead_radio3">기타</label>
					<input type="radio" onclick="runQna('')" class="btn-check" name="horsehead_radio" id="horsehead_radio4" ${cbpVo.horsehead eq '' ? 'checked' : '' }>
					<label for="horsehead_radio4">전체</label>
					<!-- SORT -->
					<select id="sort" name="sort" onchange="changeSort()" class="form-select" aria-label="Default select example">
						<option value="1" ${cbpVo.sort == 1 ? 'selected' : '' }>최신순</option>
						<option value="2" ${cbpVo.sort == 2 ? 'selected' : '' }>추천순</option>
						<option value="3" ${cbpVo.sort == 3 ? 'selected' : '' }>댓글순</option>
						<option value="4" ${cbpVo.sort == 4 ? 'selected' : '' }>조회순</option>
					</select>
				</div>
			</div>
			
			<!-- SEARCH -->
			<div class="row-fluid" style="border-top: 1px solid #dee2e6; margin: 25px 0 25px 0;">
				<div class="col-md-12" style="padding: 20px 10px 0 10px;">
					<!-- REFRESH -->
					<input type="button" class="btn btnRefresh" value="&#xf021;" style="font-family: FontAwesome; float: left; padding: 0; margin-left: -12px;">
					<!-- SEARCH BOX -->
					<button type="button" class="btn btnSearch"><i class="fas fa-search"></i></button>
					<input type="search" name="findStr" value="${cbpVo.findStr }" class="inputSearch" placeholder="정보공유 내에서 검색" autocomplete="off">
					<input type="search" class="inputSearchTemp">
					<!-- MOVE -->
					<c:choose>
						<c:when test="${cbpVo.nowPage != cbpVo.totPage }">
							<label style="float: right; padding: 0 0 0 10px;">
								<input type="button" class="btn btnNext" value="&#xf061;" onclick="movePage(${cbpVo.nowPage + 1 })" style="font-family: FontAwesome; padding: 0; margin-right: -12px;">
							</label>
						</c:when>
						<c:otherwise>
							<label style="float: right; padding: 0 0 0 10px; cursor: default; pointer-events: none;">
								<input type="button" class="btn btnNextNone" value="&#xf061;" style="font-family: FontAwesome; padding: 0; margin-right: -12px; color: #aaa;">
							</label>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${cbpVo.nowPage != 1 }">
							<label style="float: right; padding: 0 0 0 10px;">
								<input type="button" class="btn btnPrevious" value="&#xf060;" onclick="movePage(${cbpVo.nowPage - 1 })" style="font-family: FontAwesome; padding: 0;">
							</label>
						</c:when>
						<c:otherwise>
							<label style="float: right; padding: 0 0 0 10px; cursor: default; pointer-events: none;">
								<input type="button" class="btn btnPreviousNone" value="&#xf060;" style="font-family: FontAwesome; padding: 0; color: #aaa;">
							</label>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
			<!-- HIDDEN -->
<<<<<<< HEAD
			<input type="hidden" name="sno" value="${cbpVo.sno }">
			<input type="hidden" name="sort" value="${cbpVo.sort }">
			<input type="hidden" name="boardtype" value="${cbpVo.boardtype }">
			<input type="hidden" name="horsehead" value="${cbpVo.horsehead }">
			<input type="hidden" name="hashtag" value="${cbpVo.hashtag }">
			<input type="hidden" name="nowPage" value="${cbpVo.nowPage }">
			<input type="hidden" name="id" value="${sessionScope.sessionId }">
=======
			<input type="hidden" name="nowPage" value="0">
			<input type="hidden" name="infoshare_sno" value="0">
			<input type="hidden" name="sno" value="0">
>>>>>>> refs/remotes/origin/seongho
		</form>

		<!-- LIST -->
		<ul class="list-group list-group-flush" style="margin-bottom: 40px;">
			<li class="list-group-item" style="padding: 0; margin-top: -10px; color: #555; font-size: 0.9rem;">
				<div style="float: right;">
					<span>${cbpVo.nowPage }/${cbpVo.totPage }</span>
				</div>
			</li>
			<c:forEach items="${listInfoshare }" var="listInfoshare">
				<li class="list-group-item" style="padding: 10px 0 10px 0;">
					<a href="javascript:void(0);" onclick="runTopWriterProfile('${listInfoshare.nickname }')" class="text-decoration-none">
						<img id="index_profile" src="upload/${listInfoshare.profile_img }">
						<span id="index_nickname">${listInfoshare.nickname }</span>
					</a>
					<span id="index_time">· ${listInfoshare.nal }</span>
					<div style="float: right;">
						<!-- VIEW CHECK -->
						<c:choose>
							<c:when test="${listInfoshare.viewStatus == 0 }">
								<i class="fas fa-circle-check" style="color: #555; font-size: 0.9rem;"></i>
							</c:when>
							<c:otherwise>
								<i class="fas fa-circle-check" style="color: #bb2649; font-size: 0.9rem;"></i>
							</c:otherwise>
						</c:choose>
					</div>
					<br/>
<<<<<<< HEAD
					<a href="#" onclick="infoshare_view(${listInfoshare.sno })" class="text-decoration-none">
						<span id="index_subject">
							<c:choose>
								<c:when test="${listInfoshare.board_delete == 0 }">
									${listInfoshare.subject }
								</c:when>
								<c:when test="${listInfoshare.board_delete == 1 }">
									작성자가 삭제한 글입니다.
								</c:when>
								<c:otherwise>
									관리자가 삭제한 글입니다.
								</c:otherwise>
							</c:choose>
						</span>
=======
					<a href="#" onclick="infoshare_view(${listInfoshare.sno})" class="text-decoration-none">
						<span id="index_doc">프로그래밍 언어 별 채용공고 통계</span>
>>>>>>> refs/remotes/origin/seongho
					</a>
					<br/>
					<div style="float: left;">
						<!-- HORSEHEAD -->
						<label id="board_horsehead">${listInfoshare.horsehead }</label>
						<!-- HASHTAG -->
						<c:forTokens items="${listInfoshare.hashtag }" var="hashtag" delims="#">
							<a href="#" onclick="runHashtag('${hashtag }')" class="board_list_hashtag">#${hashtag }</a>
						</c:forTokens>
					</div>
					<!-- VIEW & THUMB & REPL -->
					<div style="float: right; cursor: default;">
						<img id="index_viewcount" src="images/index_viewcount.png">
						<span id="index_viewcount_sum">${listInfoshare.viewcount }</span>
						<img id="index_updown" src="images/index_updown.png">
						<span id="index_updown_sum">${listInfoshare.thumb }</span>
						<img id="index_repl" src="images/index_repl.png">
						<span id="index_repl_sum">${listInfoshare.countRepl }</span>
					</div>
				</li>
			</c:forEach>
		</ul>
		
		<!-- PAGE BUTTON -->
		<div class="row-fluid">
			<div class="col-md-12" id="board_btnZone">
				<!-- Previous -->
				<div style="float: left; padding: 0; line-height: 33px;">
					<c:choose>
						<c:when test="${cbpVo.nowPage > 1 }">
							<button type="button" class="btn" id="btnPrevious" style="padding: 0;" onclick="movePage(${cbpVo.nowPage - 1 })">
								<i class="fas fa-arrow-left" style="color: #555; font-size: 0.9rem;"></i>
								<span id="textPrevious" style="margin-left: 10px; font-size: 0.9rem;">Previous</span>
							</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn" id="btnPreviousNone" style="padding: 0;">
								<i class="fas fa-arrow-left" style="color: #aaa; font-size: 0.9rem;"></i>
								<span id="textPrevious" style="margin-left: 10px; font-size: 0.9rem;">Previous</span>
							</button>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- Start -->
				<button type="button" class="btn ${cbpVo.nowPage == 1 ? 'btnMove' : ''}" id="btnMove" onclick="movePage(1)">1</button>
				<!-- Page -->
				<c:if test="${cbpVo.nowPage > 4 and cbpVo.totPage != 6 }">
					<a id="btnMoveInput" style="cursor: pointer;" onclick="movePage(${cbpVo.startPage - 1 })">...</a>
				</c:if>
				<c:choose>
					<c:when test="${cbpVo.totPage < 5}"></c:when>
					<c:when test="${cbpVo.nowPage <= 4}">
						<c:forEach var="i" begin="${cbpVo.startPage  }" end="${cbpVo.startPage + 4 }">
							<c:if test="${i != 1 }">
			        			<button type="button" class="btn ${cbpVo.nowPage == i ? 'btnMove' : ''}" id="btnMove" onclick="movePage(${i })">${i }</button>
			        		</c:if>
		        		</c:forEach>
					</c:when>
					<c:when test="${cbpVo.nowPage > cbpVo.totPage - 4 }">
						<c:forEach var="i" begin="${cbpVo.totPage - 4 }" end="${cbpVo.totPage }">
							<c:if test="${i != cbpVo.totPage }">
			        			<button type="button" class="btn ${cbpVo.nowPage == i ? 'btnMove' : ''}" id="btnMove" onclick="movePage(${i })">${i }</button>
			        		</c:if>
		        		</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="i" begin="${cbpVo.startPage }" end="${cbpVo.endPage }">
			        		<button type="button" class="btn ${cbpVo.nowPage == i ? 'btnMove' : ''}" id="btnMove" onclick="movePage(${i })">${i }</button>
		        		</c:forEach>
					</c:otherwise>
	        	</c:choose>
    			<c:if test="${cbpVo.nowPage < cbpVo.totPage - 4 and cbpVo.totPage != 6 }">
					<a id="btnMoveInput" style="cursor: pointer;" onclick="movePage(${cbpVo.endPage + 1 })">...</a>
				</c:if>
    			<c:if test="${cbpVo.nowPage == 7 and cbpVo.totPage == 11 }">
					<a id="btnMoveInput" style="cursor: pointer;" onclick="movePage(${cbpVo.endPage + 1 })">...</a>
				</c:if>
				<!-- End -->
				<c:if test="${cbpVo.totPage > 5 }">
					<button type="button" class="btn ${cbpVo.nowPage == cbpVo.totPage ? 'btnMove' : ''}" id="btnMove" onclick="movePageEnd(${cbpVo.totPage })">${cbpVo.totPage }</button>
				</c:if>
				<!-- Next -->
				<div style="float: right; padding: 0 0 0 10px; line-height: 33px;">
					<c:choose>
						<c:when test="${cbpVo.nowPage != cbpVo.totPage }">
							<button type="button" class="btn" id="btnNext" style="padding: 0; margin-right: -12px;" onclick="movePage(${cbpVo.nowPage + 1 })">
								<span id="textNext" style="margin-right: 10px; font-size: 0.9rem;">Next</span>
								<i class="fas fa-arrow-right" style="color: #555; font-size: 0.9rem;"></i>
							</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn" id="btnNextNone" style="padding: 0; margin-right: -12px;">
								<span id="textNext" style="color: #aaa; margin-right: 10px; font-size: 0.9rem;">Next</span>
								<i class="fas fa-arrow-right" style="color: #aaa; font-size: 0.9rem;"></i>
							</button>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- Hidden -->
				<input type="hidden" id="totPage" value="${cbpVo.totPage }">
			</div>
		</div>
	</div>
</body>
</html>