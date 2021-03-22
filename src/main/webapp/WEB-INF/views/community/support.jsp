<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
		  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		  <title>
		    Odga.com
		  </title>
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
            <link rel="stylesheet" href="assets/css/test.css">
   </head>
<style>
.swal-button--확인하기:not([disabled]):hover {
    background-color: #ff5235;
}
.swal-button--확인하기{
	background-color: #ff3d1c;
}
.swal-button--확인하기:hover{
	background-color: #ff5235;
}
.swal-button--홈으로 {
 color:#555;
 background-color:#efefef
}
.swal-button--홈으로:not([disabled]):hover {
 background-color:#e8e8e8
}
.swal-button--홈으로:active {
 background-color:#d7d7d7
}
.swal-button--홈으로:focus {
 box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(116,136,150,.29)
}
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
        <div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center pt-50">
                            <h2>문의하기</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Hero End -->
		<br/><br/><br/><br/><br/><br/>
        <!-- Listing caption start-->
		<div class="whole-wrap">
			<div class="container box_1170">
					<h3 style="font-size:40px;" class="mb-40"> 고객님들에게</h3>
					<div class="row">
						<div class="col-md-3 mt-40">
                                <img src="assets/img/elements/support.jpg" alt="" class="img-fluid">
						</div>
						<div class="col-md-9 mt-sm-10">
                        <p1 class="mb-30"> 안녕하세요. ODGA의 관리자입니다. </p>
                        <p1 class="mb-30"> 국내의 아름다운 여행지를 최대한 쉽게 접하고 느낄 수 있도록 최선을 다해서 사이트를 만들고 관리하고 있습니다. </p>
                        <p1 class="mb-0"> 고객여러분들의 이용에 있어서 저희 사이트의 개선이 필요한 부분이 있거나 이외의 문의사항을 보내주시면  </p>
                        <p1 class="mb-40"> 감사히 활용하며 개선하도록 노력하겠습니다. </p>
                        <p1 style="font-size:30px;" class="mb-30"> 감사합니다. </p>
						</div>
					</div>
				</div>
        <div class="listing-caption section-padding">
            <div class="container">
                
                <!-- Contact From -->
                <!-- From -->
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <h3 class="mb-40">문의사항 보내기</h3>
                        <!-- Form -->
                        <form name="supportFrm"id="supportFrm" class="form-contact contact_form mb-80" action="support.do" method="post">
                            <div class="row">
                            	 <div class="col-sm-7">
                                    <div class="form-group">
                                        <input type="hidden" class="form-control error" name="m_id" value='${LOGINUSER.m_id}' readonly />
                                        <input type="hidden" class="form-control error" name="goPage" value='' readonly />
                                    </div>
                                </div>
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <input class="form-control error" name="s_subject" placeholder = '제목 입력'>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control w-100 error" name="s_content" id="message" cols="30" rows="9" placeholder = '문의내용 입력'" placeholder="문의내용 입력"></textarea>
                                    </div>
                                </div>
                            </div>
							<div class="row justify-content-center">
								<div class="col-lg-15">
									<p style="font-size:13px;" class="mb-0"> ※ 문의주신사항의 답변은 영업일기준 2~3일정도 소요될 수 있습니다. </p>
								</div>
							</div>
                            <div class="form-group mt-3">
                                <button type="button" id="submitBtn" class="button button-contactForm boxed-btn">문의하기</button>
                            </div>
                        </form>
                    </div>
                </div>
			</div>
		</div>

    </main>
   		<!-- Footer Start-->
		footer>
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
										<li><a href="https://github.com/DobbyisFree1">박종범</a></li>
										<li><a href="https://github.com/yumgit23">허유민</a></li>
										<li><a href="https://github.com/dragongit94">이민용</a></li>
										<li><a href="https://github.com/suadeomgit">권성환</a></li>
										<li><a href="https://github.com/lzhxxn">이지훈</a></li>
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
			                                 </c:otherwise>
			                            </c:choose>
										<li><a href="listing.do">국내여행지</a></li>
										<li><a onclick="goPlanner()">나의 여행 만들기</a></li>
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
								}
							});				
				}
			});  
}
document.getElementById('submitBtn').onclick = function(){	
	swal({
		text: "문의사항이 성공적으로 접수 되었습니다.",
		buttons:{"확인하기":"확인하기","홈으로":"홈으로"},
		}).then((value) => {
			if(value=="확인하기"){
				document.supportFrm.goPage.value="mypage";
				document.supportFrm.submit();
			}else if(value=="홈으로"){
				document.supportFrm.goPage.value="index";
				document.supportFrm.submit();
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