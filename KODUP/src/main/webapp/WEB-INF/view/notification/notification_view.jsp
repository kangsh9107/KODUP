<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notification/notification_view.jsp</title>
</head>
<style>
#notification_view #notification_view_doc {
   min-height: 300px;
   background: #eee;
}
#notification_view {
	font-size: 0.875rem;
	font-family: Pretendard,ui-sans-serif,system-ui,-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,Noto Sans,sans-serif,Apple Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color Emoji;
	font-weight: 600;
	color: #111827;
}
</style>
<body>
<script>
/***** 조성호 *****/
/***** SUMMERNOTE *****/
$(document).ready(function () {
   $('.summernote').summernote({
      placeholder: '댓글을 입력해주세요.',
      height: 100,
      maxHeight: 100,
      popover: { //footer 밑 쓸모 없는 메뉴 삭제
         image: [],
         link: [],
         air: []
      }
   });
});
</script>
<form id="notification_view">
   <!-- boardtype + / + horsehead -->
   <div id="notification_view_horsehead">
      <span>공지사항</span>
      
   </div>
   
   <!-- 글제목 -->
   <div id="notification_view_subject">
      <div class="col" style="min-height: 45px; text-align:left;">
         <span style="font-size:2rem; ">
            회원 이용 제한 안내
         </span>
      </div>
   </div>
   
   
   
   <!-- 작성자프로필사진+닉네임 -->
   <div id="notification_view_profile">
      <span id="notification_view_profile_profileimage" > <!-- span태그사용 : 이미지사진+닉네임 한줄로 붙이기위해 span이 inline요소라서 -->
         <img id="notification_view_profile_profileimage_file" src="images/로고1.png" style="width:30px; height:30px;">
      </span>
      <span id="index_profile">
         <span>KODUP</span>
      </span>
   </div>
   <!-- 조회수,작성시간 css왼쪽 기준으로 오른쪽에 붙게 빼자 -->
   <div id="notification_view_nalandhit" style="text-align:right; ">
      <span>53분전</span>
      <span>조회수 : 2531</span>
   </div>   
   
   
   <!-- 글내용 -->
   <div id="notification_view_doc" style="min-height: 400px; background: #DFDFDF;">
      kodup 운영자입니다. 
      <br/>
      <br/>kodup은 내부 논의를 거쳐서 다른 회원에게 불쾌감을 주는 행동을 한 회원은 kodup 이용을 제한시키기로 결정하였습니다.
      <br/>
      <br/>
      <br/>그야말로 회원들이 보기 원하지 않는 글을 지속적으로 올리는 경우 등에 해당됩니다. 
      <br/>
      <br/>표현의 자유를 살리는 것도 중요하다고 생각합니다만, kodup 회원들 전체를 위해 본 제재 조치가 필요하다고 판단했습니다.
      <br/>
      <br/>
      <br/>
      <br/>
      <br/>향후 회원들의 목소리를 많이 수렴하여 보다 섬세한 운영 방침을 마련하겠습니다.
      <br/>
      <br/>감사합니다. 
   </div>
   
   <!-- 해시태그 -->
   <div id="notification_view_hashtag" style=" background: #DFDFDF; font-size:20px; ">
      <a href="#" style="text-decoration : none; color:#bb2649;">#회원관리</a>
      <a href="#" style="text-decoration : none; color:#bb2649;">#kodup</a>
   </div>
   <!-- (목록,수정,삭제)btnzone -->
   <div style="text-align:right;">
      <input type="button" value="수정" style="visibility : hidden;">
      <input type="button" value="삭제" style="visibility : hidden;">
      <input type="button" value="목록">
   </div>
   
   <hr/>
   
   <!-- 댓글 -->
   <div id="notification_view_repl">
      <!-- 댓글insert부분 -->
      <div>
         <span>
            <img id="notification_view_repl_profile_profileimage_file" src="images/ITtravel.png" style="width:40px; height:40px;">
         </span>
         <span>
            <span>고백좌</span>
         </span>
         <!-- 댓글인서트_내용 서머노트 -->
         <div class="summernote"></div>
         <!-- 댓글인서트_버튼 -->
         <div>
            <input type="button" value="댓글입력" style="float:right;">
         </div>
      </div>
      <br/>
      <!-- 댓글select부분-->
      
      <!-- 댓글1 -->
      <!-- 댓글작성자프로필사진+닉네임+댓글작성시간 -->
      <div id="notification_view_repl_profile">
         <span id="notification_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
            <img id="notification_view_repl_profile_profileimage_file" src="images/angel.png" style="width:20px; height:20px;">
         </span>
         <span id="notification_view_profile_nickname">
            <span>천사</span>
         </span>
         <span id="notification_view_repl_nal">
            <span>34분전</span>
         </span>
      </div>
      <!-- 댓글내용 -->
      <div id="댓글내용" style="min-height: 100px; background: #F1F1F1;">
         <div >
           잘지키도록 하겠습니다.
         </div>
      </div>
      <!-- 댓글(수정,삭제)btnzone -->
      <div style="text-align:right; visibility:hidden;" >               <!-- 내가쓴댓글아니라 hidden cf)visibilty:hidden -->
         <input type="button" value="수정">
         <input type="button" value="삭제">
         <input type="button" value="채택"><!-- 채택버튼은 -->
      </div>
      <!-- 댓글2 -->
      <!-- 댓글작성자프로필사진+닉네임+댓글작성시간 -->
      <div id="notification_view_repl_profile">
         <span id="notification_view_repl_profile_profileimage"><!--댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
            <img id="notification_view_repl_profile_profileimage_file" src="images/devilcookie.png" style="width:20px; height:20px;">
         </span>
         <span id="notification_view_profile_nickname">
            <span>악마</span>
         </span>
         <span id="notification_view_repl_nal">
            <span>38분전</span>
         </span>
      </div>
      <!-- 댓글내용 -->
      <div id="댓글내용" style="min-height: 100px; background: #F1F1F1;">
         <div >
         명심하겠습니다.
         </div>
      </div>
      <!-- 댓글(수정,삭제)btnzone -->
      <div style="text-align:right; visibility:hidden;">                        <!-- 내가쓴댓글아니라 hidden cf)visibilty:hidden -->
         <input type="button" value="수정">
         <input type="button" value="삭제">
         <input type="button" value="채택"><!-- 채택버튼은 -->
      </div>
      <!-- 대댓글 -->
      <div style="margin-left: 50px;">
         <!--  대댓글select -->
         <div>
            <!--대댓글1 작성자프로필사진+닉네임+시간 -->
            <div id="notification_view_repl_inner_profile">
               <span id="notification_view_repl_inner_profile_profileimage"><!--대댓글작성자프로필사진+닉네임+댓글작성시간 한줄로 붙이기위해 inline요소인 span태그사용 -->
                  <img id="notification_view_repl_inner_profile_profileimage_file" src="images/ITtravel.png" style="width:20px; height:20px;">
               </span>
               <span id="notification_view_repl_inner_profile_nickname">
                  <span>고백좌</span>
               </span>   
               <span id="notification_view_repl_inner_nal">
                  <span>42분전</span>
               </span>
            </div>
            <!-- 대댓글 내용 -->
            <div id="대댓글내용" style="min-height: 50px; background: #F1F1F1;">
               <div>
                  저도 명심하겠습니다..
               </div>
            </div>
            <!-- 대댓글(수정,삭제)btnzone 세션아이디와 해당 데이터의 repl_sno와 같은 아이디를 가진사람인경우 활성화-->
            <div style="text-align:right;" >
               <input type="button" value="수정">
               <input type="button" value="삭제">
            </div>
         </div>
         <!-- 대댓글insert -->
         <div>
            <span>
               <img id="notification_view_repl_profile_profileimage_file" src="images/ITtravel.png" style="width:40px; height:40px;">
            </span>
            <span>
               <span>고백좌</span>
            </span>
            <!-- 댓글인서트_내용 서머노트 -->
            <div class="summernote"></div>
            <!-- 대댓글인서트_버튼 -->
            <div style="text-align:right;">
               <input type="button" value="대댓글입력">
            </div>
         </div>
      </div>
   </div>
</form>
</body>
</html>