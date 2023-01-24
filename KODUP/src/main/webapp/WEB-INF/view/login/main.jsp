<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login/main.jsp</title>
</head>
<body>
	<!-- CONTENT -->
	<div class="container" style="padding: 0;">
		<div class="row">
			<!-- QNA5 -->
			<div class="col-md-6" style="padding-left: 10px; padding-right: 10px;">
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action btnMainQna" id="index_main_boardtype" style="cursor: pointer;">
						Q&A
						<img id="index_boardtype_background" src="images/index_boardtype_qna.png">
					</a>
				</div>
				<!-- LIST -->
				<ul class="list-group list-group-flush" style="margin-bottom: 40px;">
					<c:forEach items="${qna5 }" var="qna5">
						<li class="list-group-item" style="padding: 10px 0 10px 0;">
							<a href="javascript:void(0);" onclick="runTopWriterProfile('${qna5.nickname }')" class="text-decoration-none">
								<img id="index_profile" src="upload/${qna5.profile_img }">
								<span id="index_nickname">${qna5.nickname }</span>
							</a>
							<span id="index_time">· ${qna5.nal }</span>
							<div style="float: right;">
								<img id="index_updown" src="images/index_updown.png">
								<span id="index_updown_sum" style="vertical-align: top;">${qna5.thumb }</span>
								<img id="index_repl" src="images/index_repl.png">
								<span id="index_repl_sum" style="vertical-align: top;">${qna5.countRepl }</span>
							</div>
							<br/>
							<a href="#" class="text-decoration-none">
								<span id="index_subject" onclick="quick('${qna5.sno}', '${qna5.boardtype }')">
									<c:choose>
										<c:when test="${fn:length(qna5.subject) gt 26}">
											<c:out value="${fn:substring(qna5.subject, 0, 25)}..."></c:out>
										</c:when>
										<c:otherwise>
											<c:out value="${qna5.subject}"></c:out>
										</c:otherwise>
									</c:choose>
								</span>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- FREETALKING5 -->
			<div class="col-md-6" style="padding-left: 10px; padding-right: 10px;">
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action btnMainFreetalking" id="index_main_boardtype" style="cursor: pointer;">
						커뮤니티
						<img id="index_boardtype_background" src="images/index_boardtype_freetalking.png">
					</a>
				</div>
				<!-- LIST -->
				<ul class="list-group list-group-flush" style="margin-bottom: 40px;">
					<c:forEach items="${freetalking5 }" var="freetalking5">
						<li class="list-group-item" style="padding: 10px 0 10px 0;">
							<a href="javascript:void(0);" onclick="runTopWriterProfile('${freetalking5.nickname }')" class="text-decoration-none">
								<img id="index_profile" src="upload/${freetalking5.profile_img }">
								<span id="index_nickname">${freetalking5.nickname }</span>
							</a>
							<span id="index_time">· ${freetalking5.nal }</span>
							<div style="float: right;">
								<img id="index_updown" src="images/index_updown.png">
								<span id="index_updown_sum" style="vertical-align: top;">${freetalking5.thumb }</span>
								<img id="index_repl" src="images/index_repl.png">
								<span id="index_repl_sum" style="vertical-align: top;">${freetalking5.countRepl }</span>
							</div>
							<br/>
							<a href="#" class="text-decoration-none">
								<span id="index_subject" onclick="quickFreetalking('${freetalking5.sno}', '${freetalking5.boardtype }')">
									<c:choose>
										<c:when test="${fn:length(freetalking5.subject) gt 26}">
											<c:out value="${fn:substring(freetalking5.subject, 0, 25)}..."></c:out>
										</c:when>
										<c:otherwise>
											<c:out value="${freetalking5.subject}"></c:out>
										</c:otherwise>
									</c:choose>
								</span>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- WEEKLYBEST5 -->
			<div class="col-md-6" style="padding-left: 10px; padding-right: 10px;">
				<div class="list-group">
					<label class="list-group-item list-group-item-action" id="index_main_boardtype">
						WEEKLY BEST
						<img id="index_boardtype_background" src="images/index_boardtype_weeklybest.png">
					</label>
				</div>
				<!-- LIST -->
				<ul class="list-group list-group-flush" style="margin-bottom: 40px;">
					<c:forEach items="${weeklyBest5 }" var="weeklyBest5">
						<li class="list-group-item" style="padding: 10px 0 10px 0;">
							<a href="javascript:void(0);" onclick="runTopWriterProfile('${weeklyBest5.nickname }')" class="text-decoration-none">
								<img id="index_profile" src="upload/${weeklyBest5.profile_img }">
								<span id="index_nickname">${weeklyBest5.nickname }</span>
							</a>
							<span id="index_time">· ${weeklyBest5.nal }</span>
							<div style="float: right;">
								<img id="index_updown" src="images/index_updown.png">
								<span id="index_updown_sum" style="vertical-align: top;">${weeklyBest5.thumb }</span>
								<img id="index_repl" src="images/index_repl.png">
								<span id="index_repl_sum" style="vertical-align: top;">${weeklyBest5.countRepl }</span>
							</div>
							<br/>
							<a href="#" class="text-decoration-none">
								<span id="index_subject">
									<c:choose>
										<c:when test="${fn:length(weeklyBest5.subject) gt 26}">
											<c:out value="${fn:substring(weeklyBest5.subject, 0, 25)}..."></c:out>
										</c:when>
										<c:otherwise>
											<c:out value="${weeklyBest5.subject}"></c:out>
										</c:otherwise>
									</c:choose>
								</span>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- EDITOR5 -->
			<div class="col-md-6" style="padding-left: 10px; padding-right: 10px;">
				<div class="list-group">
					<label class="list-group-item list-group-item-action" id="index_main_boardtype">
						EDITOR'S CHOICE
						<img id="index_boardtype_background" src="images/index_boardtype_editors.png">
					</label>
				</div>
				<!-- LIST -->
				<ul class="list-group list-group-flush" style="margin-bottom: 40px;">
					<c:forEach items="${editor5 }" var="editor5">
						<li class="list-group-item" style="padding: 10px 0 10px 0;">
							<a href="javascript:void(0);" onclick="runTopWriterProfile('${editor5.nickname }')" class="text-decoration-none">
								<img id="index_profile" src="upload/${editor5.profile_img }">
								<span id="index_nickname">${editor5.nickname }</span>
							</a>
							<span id="index_time">· ${editor5.nal }</span>
							<div style="float: right;">
								<img id="index_updown" src="images/index_updown.png">
								<span id="index_updown_sum" style="vertical-align: top;">${editor5.thumb }</span>
								<img id="index_repl" src="images/index_repl.png">
								<span id="index_repl_sum" style="vertical-align: top;">${editor5.countRepl }</span>
							</div>
							<br/>
							<a href="#" class="text-decoration-none">
								<span id="index_subject">
									<c:choose>
										<c:when test="${fn:length(editor5.subject) gt 26}">
											<c:out value="${fn:substring(editor5.subject, 0, 25)}..."></c:out>
										</c:when>
										<c:otherwise>
											<c:out value="${editor5.subject}"></c:out>
										</c:otherwise>
									</c:choose>
								</span>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- INFOSHARE5 -->
			<div class="col-md-6" style="padding-left: 10px; padding-right: 10px;">
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action btnMainInfoshare" id="index_main_boardtype" style="cursor: pointer;">
						정보공유
						<img id="index_boardtype_background" src="images/index_boardtype_infoshare.png">
					</a>
				</div>
				<!-- LIST -->
				<ul class="list-group list-group-flush" style="margin-bottom: 40px;">
					<c:forEach items="${infoshare5 }" var="infoshare5">
						<li class="list-group-item" style="padding: 10px 0 10px 0;">
							<a href="javascript:void(0);" onclick="runTopWriterProfile('${infoshare5.nickname }')" class="text-decoration-none">
								<img id="index_profile" src="upload/${infoshare5.profile_img }">
								<span id="index_nickname">${infoshare5.nickname }</span>
							</a>
							<span id="index_time">· ${infoshare5.nal }</span>
							<div style="float: right;">
								<img id="index_updown" src="images/index_updown.png">
								<span id="index_updown_sum" style="vertical-align: top;">${infoshare5.thumb }</span>
								<img id="index_repl" src="images/index_repl.png">
								<span id="index_repl_sum" style="vertical-align: top;">${infoshare5.countRepl }</span>
							</div>
							<br/>
							<a href="#" class="text-decoration-none">
								<span id="index_subject" onclick="quickInfoshare('${infoshare5.sno}', '${infoshare5.boardtype }')">
									<c:choose>
										<c:when test="${fn:length(infoshare5.subject) gt 26}">
											<c:out value="${fn:substring(infoshare5.subject, 0, 25)}..."></c:out>
										</c:when>
										<c:otherwise>
											<c:out value="${infoshare5.subject}"></c:out>
										</c:otherwise>
									</c:choose>
								</span>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- NOTIFICATION5 -->
			<div class="col-md-6" style="padding-left: 10px; padding-right: 10px;">
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action btnMainNotification" id="index_main_boardtype" style="cursor: pointer;">
						공지사항
						<img id="index_boardtype_background" src="images/index_boardtype_notification.png">
					</a>
				</div>
				<!-- LIST -->
				<ul class="list-group list-group-flush" style="margin-bottom: 40px;">
					<c:forEach items="${notification5 }" var="notification5">
						<li class="list-group-item" style="padding: 10px 0 10px 0;">
							<a href="javascript:void(0);" onclick="runTopWriterProfile('${notification5.nickname }')" class="text-decoration-none">
								<img id="index_profile" src="upload/${notification5.profile_img }">
								<span id="index_nickname">${notification5.nickname }</span>
							</a>
							<span id="index_time">· ${notification5.nal }</span>
							<div style="float: right;">
								<img id="index_updown" src="images/index_updown.png">
								<span id="index_updown_sum" style="vertical-align: top;">${notification5.thumb }</span>
								<img id="index_repl" src="images/index_repl.png">
								<span id="index_repl_sum" style="vertical-align: top;">${notification5.countRepl }</span>
							</div>
							<br/>
							<a href="#" class="text-decoration-none">
								<span id="index_subject" onclick="quickNotification('${notification5.sno}', '${notification5.boardtype }')">
									<c:choose>
										<c:when test="${fn:length(notification5.subject) gt 26}">
											<c:out value="${fn:substring(notification5.subject, 0, 25)}..."></c:out>
										</c:when>
										<c:otherwise>
											<c:out value="${notification5.subject}"></c:out>
										</c:otherwise>
									</c:choose>
								</span>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>