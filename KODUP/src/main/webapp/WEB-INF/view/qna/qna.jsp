<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="css/qna.css" rel="stylesheet">
<!-- JS -->
<script defer src="js/qna.js"></script>
<script defer src="js/common_board.js"></script>
<title>qna/qna.jsp</title>
</head>
<body>
	<!-- CONTENT -->
	<div class="container" style="padding: 0;">
		<!-- BOARDTYPE -->
		<div class="row">
			<div class="col-md-12" style="padding-left: 10px; padding-right: 10px;">
				<div class="list-group">
					<label class="list-group-item list-group-item-action" id="index_board_boardtype">
						Q&A
						<img id="index_boardtype_background" src="images/index_boardtype_qna.png">
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
							<input type="button" class="btn btnQnaInsert" value="&#xf304; 작성하기" style="font-family: FontAwesome; float: left;">
						</c:when>
						<c:otherwise>
							<input type="button" style="visibility: hidden;" class="btn btnQnaInsert" value="&#xf304; 작성하기" style="font-family: FontAwesome; float: left;">
						</c:otherwise>
					</c:choose>
					<!-- HORSEHEAD -->
					<input type="radio" onclick="runQna('기술')" class="btn-check" name="horsehead_radio" id="horsehead_radio1" ${cbpVo.horsehead eq '기술' ? 'checked' : '' }>
					<label for="horsehead_radio1">기술</label>
					<input type="radio" onclick="runQna('커리어')" class="btn-check" name="horsehead_radio" id="horsehead_radio2" ${cbpVo.horsehead eq '커리어' ? 'checked' : '' }>
					<label for="horsehead_radio2">커리어</label>
					<input type="radio" onclick="runQna('기타')" class="btn-check" name="horsehead_radio" id="horsehead_radio3" ${cbpVo.horsehead eq '기타' ? 'checked' : '' }>
					<label for="horsehead_radio3">기타</label>
					<input type="radio" onclick="runQna('')" class="btn-check" name="horsehead_radio" id="horsehead_radio4"  ${cbpVo.horsehead eq '' ? 'checked' : '' }>
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
					<input type="search" name="findStr" value="${cbpVo.findStr }" class="inputSearch" placeholder="QnA 내에서 검색" autocomplete="off">
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
			<input type="hidden" name="sno" value="${cbpVo.sno }">
			<input type="hidden" name="sort" value="${cbpVo.sort }">
			<input type="hidden" name="boardtype" value="${cbpVo.boardtype }">
			<input type="hidden" name="horsehead" value="${cbpVo.horsehead }">
			<input type="hidden" name="hashtag" value="${cbpVo.hashtag }">
			<input type="hidden" name="qna_pixel_reward" value="${cbpVo.qna_pixel_reward }">
			<input type="hidden" name="nowPage" value="${cbpVo.nowPage }">
			<input type="hidden" name="id" value="${sessionScope.sessionId }">
		</form>

		<!-- LIST -->
		<ul class="list-group list-group-flush" style="margin-bottom: 40px;">
			<li class="list-group-item" style="padding: 0; margin-top: -10px; color: #555; font-size: 0.9rem;">
				<div style="float: right;">
					<span>${cbpVo.nowPage }/${cbpVo.totPage }</span>
				</div>
			</li>
			<c:forEach items="${listQna }" var="listQna">
				<li class="list-group-item" style="padding: 10px 0 10px 0;">
					<a href="javascript:void(0);" onclick="runTopWriterProfile('${listQna.nickname }')" class="text-decoration-none">
						<img id="index_profile" src="upload/${listQna.profile_img }">
						<span id="index_nickname">${listQna.nickname }</span>
					</a>
					<span id="index_time">· ${listQna.nal }</span>
					<div style="float: right;">
						<!-- VIEW CHECK -->
						<c:choose>
							<c:when test="${listQna.viewStatus == 0 }">
								<i class="fas fa-circle-check" style="color: #555; font-size: 0.9rem;"></i>
							</c:when>
							<c:otherwise>
								<i class="fas fa-circle-check" style="color: #bb2649; font-size: 0.9rem;"></i>
							</c:otherwise>
						</c:choose>
					</div>
					<br/>
					<a href="#" onclick="qna_view(${listQna.sno })" class="text-decoration-none">
						<span id="index_subject">
							<c:choose>
								<c:when test="${listQna.board_delete == 0 }">
									${listQna.subject }
								</c:when>
								<c:when test="${listQna.board_delete == 1 }">
									작성자가 삭제한 글입니다.
								</c:when>
								<c:otherwise>
									관리자가 삭제한 글입니다.
								</c:otherwise>
							</c:choose>
						</span>
					</a>
					<br/>
					<div style="float: left;">
						<!-- QNA PIXEL REWARD -->
						<c:choose>
							<c:when test="${listQna.qna_status == 0 }">
								<label id="qna_pixel_reward">${listQna.qna_pixel_reward }</label>
							</c:when>
							<c:otherwise>
								<label id="qna_pixel_reward" style="text-decoration: line-through; border: 1px solid rgb(0, 144, 249)">${listQna.qna_pixel_reward }</label>
							</c:otherwise>
						</c:choose>
						<!-- HORSEHEAD -->
						<label id="board_horsehead">${listQna.horsehead }</label>
						<!-- HASHTAG -->
						<c:forTokens items="${listQna.hashtag }" var="hashtag" delims="#">
							<a href="#" onclick="runHashtag('${hashtag }')" class="board_list_hashtag">#${hashtag }</a>
						</c:forTokens>
					</div>
					<!-- VIEW & THUMB & REPL -->
					<div style="float: right; cursor: default;">
						<img id="index_viewcount" src="images/index_viewcount.png">
						<span id="index_viewcount_sum">${listQna.viewcount }</span>
						<img id="index_updown" src="images/index_updown.png">
						<span id="index_updown_sum">${listQna.thumb }</span>
						<img id="index_repl" src="images/index_repl.png">
						<span id="index_repl_sum">${listQna.countRepl }</span>
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