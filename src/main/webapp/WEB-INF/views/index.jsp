<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Odga.com</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
   href="assets/img/favicon.ico">
<!-- CSS here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/slicknav.css">
<link rel="stylesheet" href="assets/css/flaticon.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/style.css">
</head>
<style>
.swal-button--확인{background-color:#ff3d1c}.swal-button--확인:not([disabled]):hover{background-color:#ff5235}.swal-button--확인:active{background-color:#ff5235}
.visit-caption::-webkit-scrollbar{width:10px}.visit-caption::-webkit-scrollbar-thumb{background-color:#6799c5;border-radius:10px;background-clip:padding-box;border:2px solid transparent}.visit-caption::-webkit-scrollbar-track{background-color:#e4e4e4;border-radius:10px;box-shadow:inset 0 0 3px white}.icon-scroll,.icon-scroll:before{position:absolute;left:50%}.icon-scroll:before{content:'';width:7px;height:13px;background:#6799c5;margin-left:-4px;top:8px;border-radius:4px;animation-duration:1.5s;animation-iteration-count:infinite;animation-name:scroll}@media(max-width:575px){.icon-scroll{display:none}.peoples-visit .single-visit.left-img::before{display:none}.peoples-visit .visit-caption2{display:none}.peoples-visit .visit-caption3{display:content}}@media(min-width:576px){.icon-scroll{width:40px;height:70px;margin-left:-2%;margin-top:-255px;box-shadow:inset 0 0 0 2px #6799c5;border-radius:25px}.best-review{padding-block:2rem;background:white;border-radius:20px;left:3.3%;padding-left:2%;width:112%}.peoples-visit .single-visit.left-img::before{left:-3.2%}.peoples-visit .visit-caption2{OVERFLOW-Y:auto;width:500px;height:750px;background:rgba(255,255,255);padding:unset;scrollbar-width:thin;scrollbar-color:#6799c5 #e4e4e4}.visit-caption3{display:none}}@media(min-width:768px){.icon-scroll{width:40px;height:70px;margin-left:-2%;margin-top:-270px;box-shadow:inset 0 0 0 2px #6799c5;border-radius:25px}.best-review{padding-block:2rem;background:white;border-radius:20px;left:4.1%;padding-left:2%;width:112%}.peoples-visit .single-visit.left-img::before{left:-5.5%}.peoples-visit .visit-caption2{OVERFLOW-Y:auto;width:750px;height:750px;background:rgba(255,255,255);padding:unset;scrollbar-width:thin;scrollbar-color:#6799c5 #e4e4e4}.visit-caption3{display:none}}@media(min-width:992px){.icon-scroll{width:40px;height:70px;margin-left:-2%;margin-top:-300px;box-shadow:inset 0 0 0 2px #6799c5;border-radius:25px}.best-review{padding-block:7rem;background:white;border-radius:20px;left:24%;padding-left:5%}.peoples-visit .visit-caption2{OVERFLOW-Y:auto;width:750px;height:750px;background:rgba(255,255,255);padding:unset;scrollbar-width:thin;scrollbar-color:#6799c5 #e4e4e4}.visit-caption3{display:none}}@media(min-width:1200px){.icon-scroll{width:40px;height:70px;margin-left:-2%;margin-top:-340px;box-shadow:inset 0 0 0 2px #6799c5;border-radius:25px}.best-review{padding-block:7rem;background:white;border-radius:20px;left:50%;padding-left:5%}.peoples-visit .visit-caption2{OVERFLOW-Y:auto;width:750px;height:750px;background:rgba(255,255,255);padding:unset;scrollbar-width:thin;scrollbar-color:#6799c5 #e4e4e4}.visit-caption3{display:none}}@media only screen and (min-width:768px) and (max-width:991px){.peoples-visit .single-visit.left-img::before{display:contents}}@media only screen and (min-width:576px) and (max-width:767px){.peoples-visit .single-visit.left-img::before{display:contents}}@keyframes scroll{0%{opacity:1}100%{opacity:0;transform:translateY(46px)}}*{box-sizing:border-box}body{margin:0}section{display:flex;justify-content:space-between;padding:5%}section div{background-color:#ff9800;width:23%;height:300px}.sa{opacity:0;transition:all .5s ease}.sa-down{transform:translate(0,-100px)}.sa.show{opacity:1;transform:none}.peoples-visit .single-visit.left-img::before{border-radius:20px;width:111%}.peoples-visit .visit-caption span{margin-bottom:inherit}.peoples-visit .visit-caption p{margin-bottom:inherit}
</style>
<body>
   <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/loder1_d.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
   <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
       <div class="header-area header-transparent">
            <div class="main-header">
               <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div style="width: 10%;min-width: 9rem;">
                                <a href="index.do"><img src="assets/img/logo/logo_b.png" alt="" style="max-width: 100%;"></a>
                            </div>
                            <!-- Main-menu -->
                              <div style="width: 84%;" class="main-menu f-right d-none d-lg-block" align="right">
                               <nav>
                           <ul id="navigation" style="width: 100%;float: left;">
                              <ul style="float: left;width: 80%;">
                                    <li><a href="listing.do">국내여행지</a></li>
                                    <li><a href="review.do">커뮤니티</a>
                                       <ul class="submenu" style="text-align: left;">
                                          <li><a href="review.do">여행후기</a></li>
                                          <li><a onclick="goSupport()" style ="cursor: pointer;">문의하기</a></li>
                                       </ul>
                                    </li>
                                    <li><a href="use.do">이용방법</a></li>
                                    <li><a href="https://www.agoda.com/">호텔예약</a></li>
                                    <c:if test="${LOGINUSER.m_verify eq 0}">
                                       <li><a href="member.do">마이페이지</a></li>
                                    </c:if>           
                                    <c:if test="${not empty sessionId}">
                                       <li><a href="member.do">마이페이지</a></li>
                                    </c:if>                           
                                    <c:if test="${LOGINUSER.m_verify eq 9}">
                                       <li><a href="dashboard.do">관리자페이지</a></li>
                                    </c:if>
                                    <li class="add-list" style="display: inline flow-root list-item;">
                                       <a onclick="goPlanner()" style ="cursor: pointer;"><i class="ti-plus"></i>나의 여행 만들기</a>
                                    </li>
                              </ul>
                              <ul style="float: left;width: 20%;padding-top: 23px;" align="left">   
                                 <li class="login img-wrapper" style="width: 75%;padding: 1%;text-align: center;float:left;">                          
                                             <c:choose>
                                                   <c:when test="${empty LOGINUSER and empty sessionId}">
                                                      <a href="login.do" style="padding: inherit;font-size: 80%;">
                                                         <div style="float: left;font-size: 200%;margin-top: 7px;margin-left: 45px;">
                                                            <i class="ti-user"></i>
                                                         </div>
                                                         <div style="width: 39%;float: left;margin-top: -22px;">
                                                            </br>로그인</br>&</br>회원가입
                                                         </div>
                                                      </a>
                                                   </c:when>
                                                   <c:otherwise>
                                                      <c:choose>
                                                         <c:when test="${LOGINUSER.m_verify eq 0}">
                                                            <a onclick="logout()" style="padding: inherit;font-size: 100%; margin-top: 7%;cursor:pointer;"><i class="ti-user"></i>${LOGINUSER.m_name}님 로그아웃</a>                                                                                                     
                                                         </c:when>  
                                                         <c:when test="${sessionId != null}">
                                                            <a onclick="logout()" style="padding: inherit;font-size: 100%; margin-top: 7%;cursor:pointer;"><i class="ti-user"></i>${sessionId} 님 로그아웃</a>
                                                         </c:when>                                         
                                                         <c:otherwise>
                                                             <a onclick="logout()" style="padding: inherit;font-size: 100%; margin-top: 7%;cursor:pointer;"><i class="ti-user"></i>관리자님 로그아웃</a>
                                                         </c:otherwise>
                                                       </c:choose>
                                                   </c:otherwise>
                                             </c:choose>
                                          </li>
                                          <c:if test="${not empty LOGINUSER}">
                                  <li class="img-wrapper" style="float: right;width: 25%;">   
                                             <div class="main-menu f-right d-none d-lg-block"><img class="img-fluid" onclick="goMypage()" src="assets/img/profile/${LOGINUSER.m_fname}" alt="" style="cursor: pointer;min-height:60px;width: 60px;border-radius: 50%;max-width: 100%;border: 3px solid white;">
                                             </div>
                                          </li> 
                                          </c:if>
                                          <c:if test="${not empty sessionId}">
                                  <li class="img-wrapper" style="float: right;width: 25%;">   
                                             <div class="main-menu f-right d-none d-lg-block"><img class="img-fluid" onclick="goMypage()" src="${sessionPi}" alt="" style="cursor: pointer;min-height:60px;width: 60px;border-radius: 50%;max-width: 100%;border: 3px solid white;">
                                             </div>
                                          </li> 
                                          </c:if>                             
                                      </ul>
                                 </ul>
                              </nav>
                           </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
   <main>
   <!-- Hero Area Start-->
   <div class="slider-area">
      <div class="single-slider slider-height d-flex align-items-center" style="background-color: rgba(0, 0, 150, 0.15);">
         <div class="container">
            <div class="row justify-content-center">
               <div class="col-xl-8 col-lg-9">
      <!-- Hero Caption -->
      <div class="hero__caption">
         <span style="font: italic bold 2em/1em Georgia, serif;">Plan your trip </span>
         <h1 style="font-size:40px">오디가에서 여행을 시작하세요!</h1>
      </div>
         <!--Hero Area 검색  -->
            <form action="listing.do" class="search-box">
               <div class="input-form">
                  <input type="text" placeholder="여행지를 찾아보세요." name="keyword" required="required" />
               </div>
               <div class="select-form">
               <div class="select-job-items1">
                                 <select name="catgo">
                                     <option value="title">관광지</option>
                                     <option value="addr1">주소</option>               
                                 </select>
                                </div>
               </div>
               <div class="search-form">
                  <button type="submit">검 색</button>
               </div>
            </form>
                    <div style="text-align: center;width: 60%;">
                       <div style="border: 4px solid rgba(255, 255, 255, 0.14);border-radius: 50px;margin-left: 33%;background: rgba(55, 78, 132, 0.37);padding-inline:2%;margin-top: 5%;float: left;width: 100%;">
                          <div style="width: 15%;float:left;">
                             <div id=iconImg ></div>   
                          </div>
                          <div style="width: 85%;float: left;margin-top: 0.7rem;">
                             <div class="ctype" style="float: left; width: 27%; font-weight: bold; font-family: sans-serif;  font-size: 1em; text-align: center;color: white;"></div>
                             <div class="clowtemp" style="float: inherit; width: 18%; font-weight: bold;color: #2E9AFE;text-align: center;"></div>
                             <div style="color: white; margin-right:3px; margin-left:3px;width: 2%;float: inherit;">/</div>
                             <div class="chightemp" style="float: inherit; width: 18%; font-weight: bold;color: #FA5858;text-align: center;"></div>
                             
                          <div class="cityName" style="float: left; width: 28%; color: white;  font-weight: bold; font-size: 1em; font-family: monospace; text-align:center;"></div></div>
                        </div>
                     </div>
            </div>
         </div>
      </div>
   </div>
</div>
      <!--Hero Area End-->
      
      <!-- Popular Locations Start -->
      <div class="popular-location section-padding30">
         <div class="container">
            <div class="row">
               <div class="col-lg-12">
                  <!-- Section Tittle -->
                  <div class="section-tittle text-center mb-80">
                     <span>Most visited places</span>
                     <h2>주요 관광 도시</h2>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-lg-4 col-md-6 col-sm-6">
                  <div class="single-location mb-30">
                     <div class="location-img">
                        <img src="assets/img/gallery/location1.png" alt="">
                     </div>
                     <div class="location-details">
                        <p>서울</p>
                        <a href="listing.do?keyword=서울&catgo=addr1" class="location-btn">2982 <i class="ti-plus"></i>
                           장소
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-md-6 col-sm-6">
                  <div class="single-location mb-30">
                     <div class="location-img">
                        <img src="assets/img/gallery/location2.png" alt="">
                     </div>
                     <div class="location-details">
                        <p>부산</p>
                        <a href="listing.do?keyword=부산&catgo=addr1" class="location-btn">775 <i class="ti-plus"></i>
                           장소
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-md-6 col-sm-6">
                  <div class="single-location mb-30">
                     <div class="location-img">
                        <img src="assets/img/gallery/location3.png" alt="">
                     </div>
                     <div class="location-details">
                        <p>제주도</p>
                        <a href="listing.do?keyword=제주&catgo=addr1" class="location-btn">1026 <i class="ti-plus"></i>
                           장소
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-md-6 col-sm-6">
                  <div class="single-location mb-30">
                     <div class="location-img">
                        <img src="assets/img/gallery/location4.png" alt="">
                     </div>
                     <div class="location-details">
                        <p>강릉</p>
                        <a href="listing.do?keyword=강릉&catgo=addr1" class="location-btn">377 <i class="ti-plus"></i>
                           장소
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-md-6 col-sm-6">
                  <div class="single-location mb-30">
                     <div class="location-img">
                        <img src="assets/img/gallery/location5.png" alt="">
                     </div>
                     <div class="location-details">
                        <p>속초</p>
                        <a href="listing.do?keyword=속초&catgo=addr1" class="location-btn">165 <i class="ti-plus"></i>
                           장소
                        </a>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 col-md-6 col-sm-6">
                  <div class="single-location mb-30">
                     <div class="location-img">
                        <img src="assets/img/gallery/location6.png" alt="">
                     </div>
                     <div class="location-details">
                        <p>대구</p>
                        <a href="listing.do?keyword=대구&catgo=addr1" class="location-btn">648  <i class="ti-plus"></i>
                           장소
                        </a>
                     </div>
                  </div>
               </div>
            </div>
            <!-- More Btn -->
            <div class="row justify-content-center">
               <div class="room-btn pt-20">
                  <a href="listing.do" class="btn view-btn1">여행지 모두 보기</a>
               </div>
            </div>
         </div>
      </div>
      <!-- Popular Locations End -->
      
      <!-- Services Area Start -->
      <div class="services-area pt-150 pb-150 section-bg"
         data-background="assets/img/gallery/backsample1.png">
         <div class="container">
            <div class="row">
               <div class="col-lg-12">
                  <!-- Section Tittle -->
                  <div class="section-tittle section-tittle2 text-center mb-80">
                     <span>Easy to plan</span>
                     <h2>누구나 쉽게 일정을 계획할 수 있습니다.</h2>
                  </div>
               </div>
            </div>
            <div class="row justify-content-between">
                  <div class="col-lg-3 col-md-6">
                     <div class="single-services text-center mb-50">
                        <div class="services-icon">
                           <span class="flaticon-list"></span>
                        </div>
                        <div class="services-cap">
                           <h5>
                              <a href="#">24,007개 여행지를 한 눈에!</a>
                           </h5>
                           <p>여행지를 편리하게 검색해보세요.</p>
                        </div>
                        <!-- Shpape -->
                        <img class="shape1 d-none d-lg-block"
                           src="assets/img/icon/serices1.png" alt="">
                     </div>
                  </div>
                  <div class="col-lg-3 col-md-6">
                     <div class="single-services text-center mb-50">
                        <div class="services-icon">
                           <span class="flaticon-problem"></span>
                        </div>
                        <div class="services-cap">
                           <h5>
                              <a href="#">여행일정 최적화!</a>
                           </h5>
                           <p>동선을 확인한 후 클릭만으로 일정 최적화해보세요.</p>
                        </div>
                        <img class="shape2 d-none d-lg-block"
                           src="assets/img/icon/serices2.png" alt="">
                     </div>
                  </div>
                  <div class="col-lg-3 col-md-6">
                     <div class="single-services text-center mb-50">
                        <div class="services-icon">
                           <span class="flaticon-respect"></span>
                        </div>
                        <div class="services-cap">
                           <h5>
                              <a href="#">마이페이지에서 여행일정관리!</a>
                           </h5>
                           <p>자신만의 플래너를 관리하세요.</p> 
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      <!-- Services Area End -->
      <!-- Categories Area Start -->
      <div class="categories-area section-padding">
         <div class="container" align="center">
            <div style="width: 100%;" class="row" align="center">
               <div class="peoples-visit" style="width: 100%;">
                  <div class="visit-caption" style="padding: inherit;background: none;">
                     <span style="font-size: 3rem;width: 100%;text-align: center;padding-block: 10%;">Best Reviews</span>
                  </div>
                 </div>
            </div>
         </div>      
         <div class="icon-scroll">
         </div>
         <!-- peoples-visit Start -->
         <div class="container">
            <div class="row">
               <div style="width: 100%;" class="visit-caption3" align="center">
                    <a href="login.do" style="color: crimson;text-align: center;width: 100%;">로그인 후 여행후기 확인하러 가기</a>
               </div>
               <div class="peoples-visit dining-padding-top">
                  <!-- Single Left img -->
                  <c:forEach items="${review}" var="review">
                     <div class="single-visit left-img" >
                        <div class="container">
                           <div class="row justify-content-end">
                              <div class="col-lg-12 sa sa-down best-review" data-sa-margin="700">
                                 <div class="visit-caption2" 
                                 style="scrollbar-width:thin;scrollbar-color: #6799c5 #e4e4e4">
                                    <h3 style="text-align: center;">${review.b_subject}</h3>
                                    <p>${review.b_content}</p>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </c:forEach>
               </div>
            </div>
         </div>
      </div>
   </main>
   
      <!-- Footer Start-->
      <footer>
      <div class="footer-area">
         <div class="container">
            <div class="footer-top footer-padding">
               <div class="row justify-content-between">
                  <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6">
                     <div class="single-footer-caption mb-50">
                        <div class="col-xl-2 col-lg-2 col-md-1">
                        <!-- Logo -->
                                <div class="logo">
                                  <a href="index.do"><img src="assets/img/logo/logo_b.png" alt="" style="max-width: 170px;"></a>
                                </div>
                               </div>
                      </div>
                     </div>
                  <div class="col-xl-2 col-lg-2 col-md-4 col-sm-6">
                     <div class="single-footer-caption mb-50">
                        <div class="footer-tittle">
                           <h4>Administrator</h4>
                           <ul>
                              <li><a href="https://github.com/lzhxxn">이지훈</a></li>
                              <li><a href="https://github.com/yumgit23">허유민</a></li>
                              <li><a href="https://github.com/DobbyisFree1">박종범</a></li>
                              <li><a href="https://github.com/dragongit94">이민용</a></li>
                              <li><a href="https://github.com/suadeomgit">권성환</a></li>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                     <div class="single-footer-caption mb-50">
                        <div class="footer-tittle">
                           <h4>Quick Links</h4>
                           <ul>
                              <c:choose>
                                          <c:when test="${ empty LOGINUSER }">
                                             <li><a href="login.do">로그인 & 회원가입</a></li>
                                          </c:when>
                                          <c:otherwise>
                                             <li><a href="logout.do">로그아웃</a></li>
                                             <li><a onclick="goMypage()" style="cursor:pointer;">마이페이지</a></li>
                                          </c:otherwise>
                                     </c:choose>
                              <li><a href="listing.do">국내여행지</a></li>
                              <li><a href="use.do">이용방법</a>
                              <li><a onclick="goPlanner()" style="cursor:pointer;">나의 여행 만들기</a></li>
                              <li><a onclick="goSupport()" style="cursor:pointer;">문의하기</a></li>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                     <div class="single-footer-caption mb-50">
                        <div class="footer-tittle">
                           <h4>Contact with Us</h4>
                           <ul>
                              <li><span class="la la-home"></span> 서울 마포구 백범로 23 3층</li>
                              <li><span class="la la-headphones"></span> + 81 02 707 1480</li>
                              <li><span class="la la-envelope-o"></span> odgacom@naver.com</li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="footer-bottom">
               <div class="row d-flex justify-content-between align-items-center">
                  <div class="col-xl-9 col-lg-8">
                     <div class="footer-copy-right">
                        <p>
                           &copy; Copyright 
                           <script>
                              document
                                    .write(new Date().getFullYear());
                           </script>
                           <b>Odga.com</b> Made with
                           <i class="fa fa-heart" aria-hidden="true"></i>
                           <a href="https://github.com/lzhxxn" target="_blank">JH</a>
                           <a href="https://github.com/dragongit94" target="_blank">MY</a>
                           <a href="https://github.com/yumgit23" target="_blank">YM</a>
                           <a href="https://github.com/DobbyisFree1" target="_blank">JB</a>
                           <a href="https://github.com/suadeomgit" target="_blank">SH</a>
                        </p>
                     </div>
                  </div>
                  <div class="col-xl-3 col-lg-4">
                     <!-- Footer Social -->
                     <div class="footer-social f-right">
                        <a href="https://www.instagram.com/odga__com"><i class="fas fa-globe"></i></a> 
                        <a href="https://www.instagram.com/odga__com"><i class="fab fa-instagram"></i></a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      </footer>
      <!-- Footer End-->
   
   <!-- Scroll Up -->
   <div id="back-top">
      <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
   </div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function salert(){
   swal({
      text: "로그인 후 이용 가능합니다.",
      buttons:{"확인":true,cancel:"취소"},
      }).then((value) => {
         if(value){
            location.href = "login.do";
         }
      });
}
function goPlanner(){
   if(${empty LOGINUSER}){
         salert();
   }else{
      location.href = "planner?m_id=${LOGINUSER.m_id}";
   }
}
function goSupport(){
   if(${empty LOGINUSER}){
      salert();
   }else{
      location.href = "support.do?m_id=${LOGINUSER.m_id}";
   }
}
function goMypage(){
   if(${LOGINUSER.m_verify eq 9}){
      location.href = "dashboard.do?m_id=${LOGINUSER.m_id}";
   }else{
      location.href = "member.do?m_id=${LOGINUSER.m_id}";
   }
}
function logout(){
    swal({
        text: "로그아웃 하시겠습니까 ?",
        buttons:{"확인":true,cancel:"취소"},
        }).then((value) => {
           if(value){
               swal({
                    text: "로그아웃 되었습니다.",
                    buttons:{"확인":true},
                    }).then((value) => {
                       if(value){
                          location.href="logout.do";
                       }else{
                          location.href="logout.do";
                       }
                    });            
           }
        });  
}
</script>

   <!-- JS here -->
   <!-- All JS Custom Plugins Link Here here -->
   <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
   <!-- Jquery, Popper, Bootstrap -->
   <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
   <script src="./assets/js/popper.min.js"></script>
   <script src="./assets/js/bootstrap.min.js"></script>
   <!-- Jquery Mobile Menu -->
   <script src="./assets/js/jquery.slicknav.min.js"></script>

   <!-- Jquery Slick , Owl-Carousel Plugins -->
   <script src="./assets/js/owl.carousel.min.js"></script>
   <script src="./assets/js/slick.min.js"></script>
   <!-- One Page, Animated-HeadLin -->
   <script src="./assets/js/wow.min.js"></script>
   <script src="./assets/js/animated.headline.js"></script>
   <script src="./assets/js/jquery.magnific-popup.js"></script>

   <!-- Nice-select, sticky -->
   <script src="./assets/js/jquery.nice-select.min.js"></script>
   <script src="./assets/js/jquery.sticky.js"></script>

   <!-- contact js -->
   <script src="./assets/js/contact.js"></script>
   <script src="./assets/js/jquery.form.js"></script>
   <script src="./assets/js/jquery.validate.min.js"></script>
   <script src="./assets/js/mail-script.js"></script>
   <script src="./assets/js/jquery.ajaxchimp.min.js"></script>

   <!-- Jquery Plugins, main Jquery -->
   <script src="./assets/js/plugins.js"></script>
   <script src="./assets/js/main.js"></script>
   
   <script type = "text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
   <script>
      if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {              
             var lat = position.coords.latitude; // 위도
             var lon = position.coords.longitude; // 경도
             getWeather(lat,lon);
             
            });
      } else {           
          alert("현재 위치를 가져올 수 없습니다.");
      }
      function getWeather(lat,lon) {
         var url = 'https://api.openweathermap.org/data/2.5/find?lat='+lat+'&lon='+lon+'&cnt=1&APPID=f8b8761c25df03a84389bdbb6a97a6c5&units=metric';
          fetch(url)
          .then(function(response){ 
            return response.json();
          }).then(function(data){
             var $minTemp = data.list[0].main.temp_min;
            var $maxTemp = data.list[0].main.temp_max;
            var $humidity = data.list[0].main.humidity;
            var $type = data.list[0].weather[0].description;
            var $sky = data.list[0].weather[0].main;
            var $icon = data.list[0].weather[0].icon;
            var $probability = data.list[0].clouds.all;
            var $cityName = data.list[0].name;
            $('.clowtemp').append($minTemp + "°C");
            $('.chightemp').append($maxTemp + "°C");
            $('.chumidity').append($humidity + "%");
            $('.csky').append($sky);            
            $('.cprobability').append($probability + "%");   
            $('.cityName').append($cityName);
            
            var iconImg = document.getElementById('iconImg');
            iconImg.innerHTML= "<img src='http://openweathermap.org/img/w/"+$icon+".png' style='float: inline-end; margin-top:0.5%;'>";
            if($type == "Clouds" || $type == "overcast clouds" || $type == "broken clouds")
               $type = "흐림";
            else if($type == "few clouds")
               $type = "약간 흐림";
            else if($type == "scattered clouds")
               $type = "개임";
            else if($type == "haze" || $type == "mist")
               $type = "안개";
            else if($type == "Rain" || $type == "shower rain" || $type == "light rain")
               $type = "비";
            else if($type == "thunderstorm")
               $type = "번개";
            else if($type == "snow")
               $type = "눈";
            else if($type == "clear sky")
               $type = "맑음";
            else if($type == "sand")
                $type = "황사";
            $('.ctype').append($type);
          })
      }      
   </script>
 <script>
 //베스트리뷰 (best Review)
    // Scroll Animation (sa, Scroll Animation)
       const saDefaultMargin = 300;
       let saTriggerMargin = 0;
       let saTriggerHeight = 0;
       const saElementList = document.querySelectorAll('.sa');
   
       const saFunc = function() {
         for (const element of saElementList) {
           if (!element.classList.contains('show')) {
             if (element.dataset.saMargin) {
               saTriggerMargin = parseInt(element.dataset.saMargin);
             } else {
               saTriggerMargin = saDefaultMargin;
             }
   
             if (element.dataset.saTrigger) {
               saTriggerHeight = document.querySelector(element.dataset.saTrigger).getBoundingClientRect().top + saTriggerMargin;
             } else {
               saTriggerHeight = element.getBoundingClientRect().top + saTriggerMargin;
             }
   
             if (window.innerHeight > saTriggerHeight) {
               element.classList.add('show');
             }
           }
         }
       }
   
       window.addEventListener('load', saFunc);
       window.addEventListener('scroll', saFunc);
    </script>

</body>
</html>