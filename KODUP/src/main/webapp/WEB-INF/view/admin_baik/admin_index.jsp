<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
 <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

</head>
<body>
<!-- 상단 네비바 -->
<nav class="navbar bg-body-tertiary text-white" style="background-color:#2d3644 !important">
  <div class="container-fluid text-white">
    <span class="navbar-brand mb-0 h1 text-white">KODUP</span>
  </div>
</nav>

<!-- 사이드바 -->
<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">Menu</span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li class="nav-item">
                        <a href="#" class="nav-link align-middle px-0 text-white">
                            <ion-icon name="desktop-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                            <span class="ms-1 d-none d-sm-inline">Home</span>
                        </a>
                    </li>
                     <li>
                        <a href="#" class="nav-link px-0 align-middle text-white" >
                        <ion-icon name="documents-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                            <span class="ms-1 d-none d-sm-inline">통합 게시물 관리</span></a>
                    </li>
                    <li>	
                        <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle text-white">
                           <ion-icon name="person-circle-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                               <span class="ms-1 d-none d-sm-inline">회원 관리</span> </a>
                        <ul class="collapse nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0 text-white"> <span class="d-none d-sm-inline">- 회원 리스트</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0 text-white"> <span class="d-none d-sm-inline">- 회원 정지 관리</span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle text-white">
                            <ion-icon name="checkmark-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                             <span class="ms-1 d-none d-sm-inline">인증 관리</span></a>
                        <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0 text-white"> <span class="d-none d-sm-inline">- 기업 인증</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0 text-white"> <span class="d-none d-sm-inline">- 멘토 인증</span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#submenu3" data-bs-toggle="collapse" class="nav-link px-0 align-middle text-white">
                           <ion-icon name="cash-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                             <span class="ms-1 d-none d-sm-inline">픽셀 관리</span></a>
                            <ul class="collapse nav flex-column ms-1" id="submenu3" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0 text-white"> <span class="d-none d-sm-inline">- 환전 승인</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0 text-white"> <span class="d-none d-sm-inline">- 환율</span></a>
                            </li>
                        </ul>
                    </li>
                     <li>
                        <a href="#submenu4" data-bs-toggle="collapse" class="nav-link px-0 align-middle text-white">
                            <ion-icon name="bar-chart-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                             <span class="ms-1 d-none d-sm-inline">통계</span> </a>
                            <ul class="collapse nav flex-column ms-1" id="submenu4" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0 text-white"> <span class="d-none d-sm-inline">- 게시판 통계</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0 text-white"> <span class="d-none d-sm-inline">- 회원 통계</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0 text-white"> <span class="d-none d-sm-inline">- 이용 통계</span></a>
                            </li>
                        </ul>
                    </li>
                   
                </ul>
                <hr>
                <div class="dropdown pb-4">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none " id="logout"  aria-expanded="false">
                        <span class="d-none d-sm-inline mx-1">LOG OUT</span>
                    </a>
                  
                </div>
            </div>
        </div>
        
        <div class="col py-3" id="baik_admin_main">
            Content area...
        </div>
    </div>
</div>

<!-- 하단 네비바 -->
<nav class="navbar bg-body-tertiary" style="background-color:#2d3644 !important">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1"> </span>
  </div>
</nav>
</body>
</html>