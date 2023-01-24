<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="js/mypage_pixel.js"></script>
<meta charset="UTF-8">
<title>mypage_mypixel</title>
</head>
<body>

 
 <div id="mypage_mypixel"> 
    <span class='mypage_subject_text'>나의 픽셀</span>
    <div class='mypage_mypixel_management'><br>
       <div>
         <span class='mypage_mypixel_management_text'>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-diamond" viewBox="0 0 16 16">
            <path d="M7.987 16a1.526 1.526 0 0 1-1.07-.448L.45 9.082a1.531 1.531 0 0 1 0-2.165L6.917.45a1.531 1.531 0 0 1 2.166 0l6.469 6.468A1.526 1.526 0 0 1 16 8.013a1.526 1.526 0 0 1-.448 1.07l-6.47 6.469A1.526 1.526 0 0 1 7.988 16zM7.639 1.17 4.766 4.044 8 7.278l3.234-3.234L8.361 1.17a.51.51 0 0 0-.722 0zM8.722 8l3.234 3.234 2.873-2.873c.2-.2.2-.523 0-.722l-2.873-2.873L8.722 8zM8 8.722l-3.234 3.234 2.873 2.873c.2.2.523.2.722 0l2.873-2.873L8 8.722zM7.278 8 4.044 4.766 1.17 7.639a.511.511 0 0 0 0 .722l2.874 2.873L7.278 8z"/>
            </svg> 픽셀관리
         </span>      
       </div>
       <div>
         <span style='display:inline-block; margin-bottom:10px;'>보유픽셀 </span>
<%--          <input type='text' size='10' class='class_pixel' value='${pixel_have }' readonly><span>픽셀</span> --%>
         ${pixel }
         <c:forEach var="pix" items="${ list }" begin="0" end="0">
            <input type='text' size='10' class='class_pixel' value='${pix.pixel }' readonly><span>픽셀</span>
         </c:forEach> 
         <input type='button' class='btn_mypage_pixel_charge' value='충전'>   
       </div>
       <div>
         <span>환전픽셀</span>
         <form onsubmit='return false' class='pixel_exchange'>
            <input type='hidden' name='id' value='${ sessionId }'>
            <input type='text' size='10' class='class_pixel_want_exchange' 
            name='pixel_want_exchange'><span>픽셀</span>
         </form>
         <input type='button' class='btn_mypage_pixel_exchange_total' value='전체 환전하기'>    
         <input type='button' class='btn_mypage_pixel_exchange' value='환전신청'>       
       </div>
    </div>
    <br>
    <div class='mypage_mypixel_use'><br>
       <div class='mypage_mypixel_use_box1'>
         <span class='mypage_mypixel_use_text'>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-diamond" viewBox="0 0 16 16">
            <path d="M7.987 16a1.526 1.526 0 0 1-1.07-.448L.45 9.082a1.531 1.531 0 0 1 0-2.165L6.917.45a1.531 1.531 0 0 1 2.166 0l6.469 6.468A1.526 1.526 0 0 1 16 8.013a1.526 1.526 0 0 1-.448 1.07l-6.47 6.469A1.526 1.526 0 0 1 7.988 16zM7.639 1.17 4.766 4.044 8 7.278l3.234-3.234L8.361 1.17a.51.51 0 0 0-.722 0zM8.722 8l3.234 3.234 2.873-2.873c.2-.2.2-.523 0-.722l-2.873-2.873L8.722 8zM8 8.722l-3.234 3.234 2.873 2.873c.2.2.523.2.722 0l2.873-2.873L8 8.722zM7.278 8 4.044 4.766 1.17 7.639a.511.511 0 0 0 0 .722l2.874 2.873L7.278 8z"/>
            </svg> 픽셀이력
         </span>          
         <input type='button' class='btn_mypage_pixel_total_list' value='전체'>       
         <input type='button' class='btn_mypage_pixel_charge_list' value='획득'> 
         <input type='button' class='btn_mypage_pixel_exchange_list' value='사용'> 
         <input type='hidden' class='mypixel_hidden_btn' name='pixel_int' value='1'>
       </div>
       <div class='mypage_mypixel_use_box2' style="width:80%;">
          <ul class="list-group list-group-flush" style="width:100%;">
             <li class="list-group-item pixel_box">
                <span class="mypage_mypixel_date">날짜</span> 
                <span class="mypage_mypixel_details">상세내역</span> 
                <span class="mypage_mypixel_pixel">픽셀</span>
             </li>
             <c:forEach var="vo" items="${list}" > 
                <li class="list-group-item">
                   <span class="mypage_mypixel_date">
                     <!-- history_date가 Datetime이라 (시분초)를 제외하고 연월일만 나타내려고 formatDate 사용.     -->               
                      <fmt:formatDate value="${vo.history_date }" pattern="yyyy-MM-dd" />
                   </span> 
                   <!-- 픽셀상세내역 컬러 -->
                   <c:choose>
                      <c:when test="${vo.history_detail eq '픽셀구매'}">
                         <span class="mypage_mypixel_details" style='color:#0055CC;'>${vo.history_detail }</span>
                      </c:when>
                      <c:when test="${vo.history_detail eq '픽셀환전'}">
                         <span class="mypage_mypixel_details" style='color:#bb2649;'>${vo.history_detail }</span> 
                      </c:when>
                      <c:when test="${vo.history_detail eq '출석체크'}">
                         <span class="mypage_mypixel_details" style='color:#0055CC;'>${vo.history_detail }</span> 
                      </c:when>
                      <c:when test="${vo.history_detail eq 'Q&A질문글작성'}">
                         <span class="mypage_mypixel_details" style='color:#bb2649;'>${vo.history_detail }</span> 
                      </c:when>
                      <c:when test="${vo.history_detail eq 'Q&A답변채택'}">
                         <span class="mypage_mypixel_details" style='color:#0055CC;'>${vo.history_detail }</span> 
                      </c:when>
                      
                      <c:when test="${vo.history_detail eq '멘토활동'}">
                         <span class="mypage_mypixel_details" style='color:#0055CC;'>${vo.history_detail }</span> 
                      </c:when>
                      <c:when test="${vo.history_detail eq '멘티상담요청'}">
                         <span class="mypage_mypixel_details" style='color:#bb2649;'>${vo.history_detail }</span> 
                      </c:when>
                      <c:when test="${vo.history_detail eq '프리미엄리뷰 작성'}">
                         <span class="mypage_mypixel_details" style='color:#0055CC;'>${vo.history_detail }</span> 
                      </c:when>
                      <c:when test="${vo.history_detail eq '프리미엄리뷰 열람'}">
                         <span class="mypage_mypixel_details" style='color:#bb2649;'>${vo.history_detail }</span> 
                      </c:when>
                      <c:otherwise> <!-- 환전승인완료 -->
                         <span class="mypage_mypixel_details" style='color:black;'>${vo.history_detail }</span> 
                      </c:otherwise>
                  </c:choose>
                  
                  <!-- 픽셀로그 컬러 -->
                  <c:choose>
                     <c:when test="${vo.history_detail eq '픽셀구매'}">
                        <span class="mypage_mypixel_pixel" style='color:#0055CC;'>${vo.pixel_log }</span>
                     </c:when>
                     <c:when test="${vo.history_detail eq '픽셀환전'}">
                        <span class="mypage_mypixel_pixel" style='color:#bb2649;'>${vo.pixel_log }</span>
                     </c:when>
                     <c:when test="${vo.history_detail eq '출석체크'}">
                        <span class="mypage_mypixel_pixel" style='color:#0055CC;'>${vo.pixel_log }</span>
                     </c:when>
                     <c:when test="${vo.history_detail eq 'Q&A질문글작성'}">
                        <span class="mypage_mypixel_pixel" style='color:#bb2649;'>${vo.pixel_log }</span>
                     </c:when>
                     <c:when test="${vo.history_detail eq 'Q&A답변채택'}">
                        <span class="mypage_mypixel_pixel" style='color:#0055CC;'>${vo.pixel_log }</span>
                     </c:when>
                     <c:when test="${vo.history_detail eq '멘토활동'}">
                        <span class="mypage_mypixel_pixel" style='color:#0055CC;'>${vo.pixel_log }</span>
                     </c:when>
                     <c:when test="${vo.history_detail eq '멘티상담요청'}">
                        <span class="mypage_mypixel_pixel" style='color:#bb2649;'>${vo.pixel_log }</span>
                     </c:when>
                     <c:when test="${vo.history_detail eq '프리미엄리뷰 작성'}">
                        <span class="mypage_mypixel_pixel" style='color:#0055CC;'>${vo.pixel_log }</span>
                     </c:when>
                     <c:when test="${vo.history_detail eq '프리미엄리뷰 열람'}">
                        <span class="mypage_mypixel_pixel" style='color:#bb2649;'>${vo.pixel_log }</span>
                     </c:when>
                     <c:otherwise>
                        <span class="mypage_mypixel_pixel"></span>
                     </c:otherwise>
                  </c:choose>
                  
                  <%-- <c:if test="${vo.history_detail ne '환전승인완료'}">
                      <span class="mypage_mypixel_pixel">${vo.pixel_log }</span>
                   </c:if> --%>
                </li>
                
             </c:forEach>
          </ul>
       </div>
    </div>
  </div>
    
    <div class='mypage_mypixel_page'>
      <form class='frm_search' method='post'>
         <input type='hidden' name='nowPage' value='${pVo.nowPage }'/>
      </form>
    <div class='btnZone'>
      <c:if test="${pVo.startPage>1 }">
         <input type='button' value='맨첨' class='btnFirst' onclick = 'mypageMove(1)'/>
         <input type='button' value='이전' class='btnPrev' 
                   onclick = 'mypageMove(${pVo.startPage-1})'/>
      </c:if>
      
      <c:forEach var='i' begin='${pVo.startPage }' end='${pVo.endPage }'>
         <input type='button' value='${i }' class='btnMove' 
                    onclick = 'mypageMove(${i})'/>
      </c:forEach>
      
      <c:if test="${pVo.totPage>pVo.endPage }">
         <input type='button' value='다음' class='btnNext' 
                   onclick = 'mypageMove(${pVo.endPage+1})'/>
         <input type='button' value='맨끝' class='btnLast' 
                   onclick = 'mypageMove(${pVo.totPage})'/>
      </c:if>
   </div>    
</div>

<form>
   <input type="hidden" name="nowPage" value="${pVo.nowPage }">
</form> 
 
<!--  그리드 구현은 나중에...
<div class="pixel-grid-container container1">
   <div class="pixel-grid-item">100px</div>
   <div class="pixel-grid-item">100px</div>
   <div class="pixel-grid-item">100px</div>
   <div class="pixel-grid-item">100px</div>
   <div class="pixel-grid-item">100px</div>
   <div class="pixel-grid-item">100px</div>
   <div class="pixel-grid-item">100px</div>
   <div class="pixel-grid-item">100px</div>
</div> -->

</body>
</html>