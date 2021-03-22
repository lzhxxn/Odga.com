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
		<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
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
.swal-button--확인 {
 background-color:#ff3d1c
}
.swal-button--확인:not([disabled]):hover {
 background-color:#ff5235
}
.swal-button--확인:active {
 background-color:#ff5235
}
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
                                                   <c:when test="${empty LOGINUSER}">
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
                                                            <a onclick="logout()" style="padding: inherit;font-size: 100%; margin-top: 7%;"><i class="ti-user"></i>${LOGINUSER.m_name}님 로그아웃</a>                                                             										          
                                                          <!--   <li style="width: 100%;padding: 0%;float: left;text-align: center;"><a href="member.do" style="padding: inherit;font-size: 80%;"><i class="ti-user"></i> 마이페이지</a></li> -->
                                                         </c:when>                                           
                                                         <c:otherwise>
                                                             <a onclick="logout()" style="padding: inherit;font-size: 100%; margin-top: 7%;"><i class="ti-user"></i>관리자님 로그아웃</a>
                                                           <!--  <li style="width: 100%;padding: 0%;float: left;text-align: center;"><a href="dashboard.do" style="padding: inherit;font-size: 80%;"><i class="ti-user"></i> 관리자페이지</a></li> -->
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
        <!-- Hero Start-->
        <div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center" style="background-image: url(assets/img/myPlanImg/12.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center pt-50">
                            <h2>${ListVo.touritems.title}</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Hero End -->
        <!-- Listing caption start-->
        <div class="listing-caption section-padding">
            <div class="container">
                <div class="row justify-content-center">
                    <!-- Map -->
                    <div class="col-lg-6">
                        <h3 class="mb-30">위치</h3>
                        <div class="d-none d-sm-block mb-30 pb-4">
                            <div id="map" style="height: 480px; position: relative; overflow: hidden;"></div>
                            <script>
                                function initMap() {
                                    var latlng = {
                                        lat: ${ListVo.touritems.mapy},
                                        lng: ${ListVo.touritems.mapx}
                                    };
                                    var grayStyles = [{
                                            featureType: "all",
                                            stylers: [{
                                                    saturation: -90
                                                },
                                                {
                                                    lightness: 50
                                                }
                                            ] 
                                        },
                                        {
                                            elementType: 'labels.text.fill',
                                            stylers: [{
                                                color: '#ccdee9'
                                            }]
                                        }
                                    ];
                                    var map = new google.maps.Map(document.getElementById('map'), {
                                        center: {
                                        	 lat: ${ListVo.touritems.mapy},
                                             lng: ${ListVo.touritems.mapx}
                                        },
                                        zoom: 15,
                                        styles: grayStyles,
                                        scrollwheel: false
                                    });
                                    var marker =  new google.maps.Marker({
                                        position: latlng,
                                        map: map,
                                      });
                                }
                            </script>
                            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB5mja2EvWlVggl_asHhoL8FzB9f9O0I6k&amp;callback=initMap">
                            </script>
                        </div>
                    </div>
                    <!--End Map -->
                    <div class="col-lg-6">
                        <h3 class="mb-20">설명</h3></br>
                        <h4 class="mb-30"><strong>${ListVo.touritems.title}</strong></h4>
                        <p class="mb-10"><strong>주 소 : </strong>${ListVo.touritems.addr1} ${ListVo.touritems.addr2}</p>
                        <p class="mb-10"><strong>우편번호 : </strong>${ListVo.touritems.zipcode}</p>
                        <p class="mb-10"><strong>전화번호 : </strong>☎ ${ListVo.touritems.tel}</p>
                        <p class="mb-10"><strong>조회수 : </strong>${ListVo.touritems.readcount}</p>
                    </div>
                </div>
                <!-- listing Details Sta-->
                <div class="listing-details-area section-padding" style="padding-top:5px;">
                    <div class="container">
                       <h3 class="mb-30">근처 추천 장소</h3>
                        <div class="row">
                        
                      <c:set var="k" value="1"/>
                      <c:forEach items="${ListVo.listResult.list}" var="touritems">
                       <c:if test="${ListVo.touritems.areacode eq touritems.areacode}">
                        <c:if test="${k ne 4}">
                         <c:set var="k" value="${k+1}"/>
                          <div class="col-lg-4 col-md-6">
                            <div class="single-listing mb-30">
                              <div class="list-img">
                                <a href="listing_details.do?contentid=${touritems.contentid}"><img src="${touritems.firstimage}" alt="" ></a></div>
                                  <div class="list-caption">
                                    <span><a href="listing_details.do?contentid=${touritems.contentid}">더보기</a></span>
                                     <h3><a href="listing_details.do?contentid=${touritems.contentid}">${touritems.title}</a></h3>
                                     <p>${touritems.addr1}</p>
                                     <div class="list-footer">
                                            <ul>
                                                <li></li>
                                                <li>${touritems.tel}</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:if>
                            </c:if>
                       </c:forEach>
                        </div>
                    </div>
                </div>
                <!-- listing Details End -->
            </div>
        </div>
        <!-- Listing caption End-->
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
										<li><a href="https://github.com/DobbyisFree1">박종범</a></li>
										<li><a href="https://github.com/dragongit94">이민용</a></li>
										<li><a href="https://github.com/yumgit23">허유민</a></li>
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
			                                    <li><a href="join.do">회원가입</a></li>
			                                    <li><a href="login.do">로그인</a></li>
			                                 </c:when>
			                                 <c:otherwise>
			                                    <li><a href="logout.do">로그아웃</a></li>
			                                 </c:otherwise>
			                            </c:choose>
			                            <li><a href="use.do">이용방법</a>
										<li><a onclick="goPlanner()" style ="cursor: pointer;">나의 여행 만들기</a></li>
										<li><a href="review.do">여행후기</a></li>
										<li><a onclick="goSupport()" style ="cursor: pointer;">문의하기</a></li>
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
										<li><span class="la la-headphones"></span>+ 81 02 707 1480</li>
										<li><span class="la la-envelope-o"></span>odgacom@naver.com</li>
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
    <div id="back-top" >
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
        
    </body>
</html>