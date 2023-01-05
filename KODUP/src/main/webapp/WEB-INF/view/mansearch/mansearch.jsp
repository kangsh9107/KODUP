<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mansearch/mansearch.jsp</title>
<link rel='stylesheet' href='css/mansearch.css'>
</head>
<body>
<div class='col-md-8 mansearch_title'>
	<dl>
		<dt>구인게시판</dt>
		<dd>내게 어울리는 채용 공고를 찾는 공간입니다.</dd>
	</dl>
</div>
<span>
	<button type="button" class="btn btn-primary">구인등록</button>
	<input type="text" class="form-control" id="mansearch_findstr">
	<button type="button" class="btn btn-secondary">검색</button>						
</span><br/><br/>

<div class="d-flex flex-column bd-highlight mb-3">
  <div class="p-2 bd-highlight shadow-sm p-3 mb-5 bg-body-tertiary rounded">포지션 | 구인공고제목</div>
  <div class="p-2 bd-highlight shadow-sm p-3 mb-5 bg-body-tertiary rounded">포지션 | 구인공고제목</div>
  <div class="p-2 bd-highlight shadow-sm p-3 mb-5 bg-body-tertiary rounded">포지션 | 구인공고제목</div>
</div>
</body>
</html>