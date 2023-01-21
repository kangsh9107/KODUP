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
<title>login/find_hashtag.jsp</title>
</head>
<body>
	<!-- CONTENT -->
	<div class="container" style="padding: 0;">
		<!-- BOARDTYPE -->
		<div class="row">
			<div class="col-md-12" style="padding-left: 10px; padding-right: 10px;">
				<div class="list-group">
					<label class="list-group-item list-group-item-action" id="index_board_boardtype">
						${cbpVo.hashtag }
						<img id="index_boardtype_background" height="80px !important" src="images/index_boardtype_hashtag.png">
					</label>
				</div>
			</div>
		</div>
		
		<!-- FORM -->
		<form name="board_search_form" class="board_search_form" method="post">
			<div class="row">
				<div class="col-md-12" style="padding-left: 10px; padding-right: 10px;">
					<!-- SORT -->
					<select id="sort" name="sort" disabled onchange="changeSort()" class="form-select" aria-label="Default select example">
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
					<input type="button" class="btn btnRefreshHashtag" value="&#xf021;" style="font-family: FontAwesome; float: left; padding: 0; margin-left: -12px;">
					<!-- SEARCH BOX -->
					<button type="button" style="visibility: hidden;" class="btn btnSearch"><i class="fas fa-search"></i></button>
					<input type="search" style="visibility: hidden;" name="findStr" value="${cbpVo.findStr }" class="inputSearch" placeholder="QnA 내에서 검색" autocomplete="off">
					<input type="search" style="visibility: hidden;" class="inputSearchTemp">
					<!-- MOVE -->
					<c:choose>
						<c:when test="${cbpVo.nowPage != cbpVo.totPage }">
							<label style="float: right; padding: 0 0 0 10px;">
								<input type="button" class="btn btnNext" value="&#xf061;" onclick="movePageHashtag(${cbpVo.nowPage + 1 }, '${cbpVo.hashtag }')" style="font-family: FontAwesome; padding: 0; margin-right: -12px;">
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
								<input type="button" class="btn btnPrevious" value="&#xf060;" onclick="movePageHashtag(${cbpVo.nowPage - 1 }, '${cbpVo.hashtag }')" style="font-family: FontAwesome; padding: 0;">
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
		</form>

		<!-- LIST -->
		<ul class="list-group list-group-flush" style="margin-bottom: 40px;">
			<li class="list-group-item" style="padding: 0; margin-top: -10px; color: #555; font-size: 0.9rem;">
				<div style="float: right;">
					<span>${cbpVo.nowPage }/${cbpVo.totPage }</span>
				</div>
			</li>
			<c:forEach items="${listHashtag }" var="listHashtag">
				<li class="list-group-item" style="padding: 10px 0 10px 0;">
					<a href="#" class="text-decoration-none">
						<img id="index_profile" src="upload/${listHashtag.profile_img }">
						<span id="index_nickname">${listHashtag.nickname }</span>
					</a>
					<span id="index_time">· ${listHashtag.nal }</span>
					<div style="float: right;">
						<i class="fas fa-circle-check" style="color: #555; font-size: 0.9rem;"></i>
					</div>
					<br/>
					<a href="#" onclick="qna_view(${listHashtag.sno })" class="text-decoration-none">
						<span id="index_subject">${listHashtag.subject }</span>
					</a>
					<br/>
					<div style="float: left;">
						<!-- HORSEHEAD -->
						<c:choose>
							<c:when test="${listHashtag.boardtype eq 'qna' }">
								<label id="board_horsehead" style="background-color: #f0f6fa; color: rgb(0, 144, 249);">Q&A</label>
							</c:when>
							<c:when test="${listHashtag.boardtype eq 'infoshare' }">
								<label id="board_horsehead" style="background-color: #f0f6fa; color: rgb(0, 144, 249);">정보공유</label>
							</c:when>
							<c:when test="${listHashtag.boardtype eq 'freetalking' }">
								<label id="board_horsehead" style="background-color: #f0f6fa; color: rgb(0, 144, 249);">커뮤니티</label>
							</c:when>
							<c:when test="${listHashtag.boardtype eq 'jobsearch' }">
								<label id="board_horsehead" style="background-color: #f0f6fa; color: rgb(0, 144, 249);">구직</label>
							</c:when>
							<c:otherwise>
								<label id="board_horsehead" style="background-color: #f0f6fa; color: rgb(0, 144, 249);">공지사항</label>
							</c:otherwise>
						</c:choose>
						<label id="board_horsehead">${listHashtag.horsehead }</label>
						<!-- HASHTAG -->
						<c:forTokens items="${listHashtag.hashtag }" var="hashtag" delims="#">
							<a href="#" onclick="runHashtagIndex('${hashtag }')" class="board_list_hashtag">#${hashtag }</a>
						</c:forTokens>
					</div>
					<!-- VIEW & THUMB & REPL -->
					<div style="float: right; cursor: default;">
						<img id="index_viewcount" src="images/index_viewcount.png">
						<span id="index_viewcount_sum">${listHashtag.viewcount }</span>
						<img id="index_updown" src="images/index_updown.png">
						<span id="index_updown_sum">${listHashtag.thumb }</span>
						<img id="index_repl" src="images/index_repl.png">
						<span id="index_repl_sum">${listHashtag.countRepl }</span>
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
							<button type="button" class="btn" id="btnPrevious" style="padding: 0;" onclick="movePageHashtag(${cbpVo.nowPage - 1 }, '${cbpVo.hashtag }')">
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
				<button type="button" class="btn ${cbpVo.nowPage == 1 ? 'btnMove' : ''}" id="btnMove" onclick="movePageHashtag(1, '${cbpVo.hashtag}')">1</button>
				<!-- Page -->
				<c:if test="${cbpVo.nowPage > 4 and cbpVo.totPage != 6 }">
					<a id="btnMoveInput" style="cursor: pointer;" onclick="movePageHashtag(${cbpVo.startPage - 1 }, '${cbpVo.hashtag }')">...</a>
				</c:if>
				<c:choose>
					<c:when test="${cbpVo.totPage < 5}"></c:when>
					<c:when test="${cbpVo.nowPage <= 4 }">
						<c:forEach var="i" begin="${cbpVo.startPage  }" end="${cbpVo.startPage + 4 }">
							<c:if test="${i != 1 }">
			        			<button type="button" class="btn ${cbpVo.nowPage == i ? 'btnMove' : ''}" id="btnMove" onclick="movePageHashtag(${i }, '${cbpVo.hashtag }')">${i }</button>
			        		</c:if>
		        		</c:forEach>
					</c:when>
					<c:when test="${cbpVo.nowPage > cbpVo.totPage - 4 }">
						<c:forEach var="i" begin="${cbpVo.totPage - 4 }" end="${cbpVo.totPage }">
							<c:if test="${i != cbpVo.totPage }">
			        			<button type="button" class="btn ${cbpVo.nowPage == i ? 'btnMove' : ''}" id="btnMove" onclick="movePageHashtag(${i }, '${cbpVo.hashtag }')">${i }</button>
			        		</c:if>
		        		</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="i" begin="${cbpVo.startPage }" end="${cbpVo.endPage }">
			        		<button type="button" class="btn ${cbpVo.nowPage == i ? 'btnMove' : ''}" id="btnMove" onclick="movePageHashtag(${i }, '${cbpVo.hashtag }')">${i }</button>
		        		</c:forEach>
					</c:otherwise>
	        	</c:choose>
    			<c:if test="${cbpVo.nowPage < cbpVo.totPage - 4 and cbpVo.totPage != 6 }">
					<a id="btnMoveInput" style="cursor: pointer;" onclick="movePageHashtag(${cbpVo.endPage + 1 }, '${cbpVo.hashtag }')">...</a>
				</c:if>
    			<c:if test="${cbpVo.nowPage == 7 and cbpVo.totPage == 11 }">
					<a id="btnMoveInput" style="cursor: pointer;" onclick="movePageHashtag(${cbpVo.endPage + 1 }, '${cbpVo.hashtag }')">...</a>
				</c:if>
				<!-- End -->
				<c:if test="${cbpVo.totPage > 5 }">
					<button type="button" class="btn ${cbpVo.nowPage == cbpVo.totPage ? 'btnMove' : ''}" id="btnMove" onclick="movePageHashtagEnd(${cbpVo.totPage }, '${cbpVo.hashtag }')">${cbpVo.totPage }</button>
				</c:if>
				<!-- Next -->
				<div style="float: right; padding: 0 0 0 10px; line-height: 33px;">
					<c:choose>
						<c:when test="${cbpVo.nowPage != cbpVo.totPage }">
							<button type="button" class="btn" id="btnNext" style="padding: 0; margin-right: -12px;" onclick="movePageHashtag(${cbpVo.nowPage + 1 }, '${cbpVo.hashtag }')">
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