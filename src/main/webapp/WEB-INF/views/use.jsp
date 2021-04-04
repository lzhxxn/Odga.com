<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
            <link rel="stylesheet" href="assets/css/card.css">
            <link rel="stylesheet" href="assets/css/tutorial.css">
   </head>
<style>
.swal-button--확인 {background-color:#ff3d1c}.swal-button--확인:not([disabled]):hover {background-color:#ff5235}.swal-button--확인:active {background-color:#ff5235}
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
                                                            <a onclick="logout()" style="padding: inherit;font-size: 100%; margin-top: 7%;cursor:pointer;"><i class="ti-user"></i>${LOGINUSER.m_name}님 로그아웃</a>                                                             										          
                                                          <!--   <li style="width: 100%;padding: 0%;float: left;text-align: center;"><a href="member.do" style="padding: inherit;font-size: 80%;"><i class="ti-user"></i> 마이페이지</a></li> -->
                                                         </c:when>                                           
                                                         <c:otherwise>
                                                             <a onclick="logout()" style="padding: inherit;font-size: 100%; margin-top: 7%;cursor:pointer;"><i class="ti-user"></i>관리자님 로그아웃</a>
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
                            <h2>이용 방법</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Hero End -->
        <!--
        <!-- Categories Area Start -->
        <div class="categories-area section-padding30">
            <div class="container2">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Section Tittle -->
                        <div class="section-tittle text-center mb-80">
                            <span>ODGA</span>
                            <h2>여행 동선을 쉽게 확인하기</h2>
                        </div>
                    </div>
                </div>
                
		        <!-- Services Area Start -->
		        <ul class="card-list">
					<li class="card">
	                  <a class="card-image" onclick="goListing()" target="_blank" style="background-image: assets/img/use/p1.jpg;" data-image-full="assets/img/use/p1.jpg">
	                     <img src="assets/img/use/p1.jpg" alt="Psychopomp" />
	                  </a>
	                  <a class="card-description" onclick="goListing()" target="_blank">
	                     <hh2>1. 지역 찾기</hh2>
	                     <p>리스트에서 여행지를 찾아서 선택 해보세요.</p>
	                  </a>
	               </li>
					
					<li class="card">
						<a class="card-image" onclick="goPlanner()" style="background-image: assets/img/use/p3.jpg;cursor: pointer;" data-image-full="assets/img/use/p3.jpg">
							<img src="assets/img/use/p3.jpg" alt="The Beautiful Game"/>
						</a>
						<a class="card-description" onclick="goPlanner()" style="cursor: pointer;" target="_blank">
							<hh2>2. 플래너 작성</hh2>
							<p>플래너를 통해 일정을 계획해보세요.</p>
						</a>
					</li>
					
					<li class="card">
						<a class="card-image" onclick="goMypage()" target="_blank" style="background-image: assets/img/use/p2.jpg;cursor: pointer;" data-image-full="assets/img/use/p2.jpg">
							<img src="assets/img/use/p2.jpg" alt="let's go" style="height: 357px;"/>
						</a>
						<a class="card-description" onclick="goMypage()" style="cursor: pointer;" target="_blank">
							<hh2>3. 마이페이지에서 확인</hh2>
							<p>작성한 플래너를 확인 해보세요.</p>
						</a>
					</li> 
					
					<li class="card">
						<a class="card-image" href="https://www.skyscanner.co.kr/" target="_blank" style="background-image: assets/img/use/p4.jpg;" data-image-full="assets/img/use/p4.jpg">
							<img src="assets/img/use/p4.jpg" alt="Jane Doe" />
						</a>
						<a class="card-description" href="" target="_blank">
							<hh2>4. 여행하기</hh2>
							<p>일정이 정해지셨다면 떠나보세요!</p>
						</a>
					</li>
				</ul>
		        <!-- Services Area End -->
		        <!-- Popular Locations Start -->
		         <div style="display:flex;justify-content:center; margin: 15;">	 
		        	 <div class="container1" >
				  <div class="image-viewer">
				    <div class="main-image">
				      <img src="assets/img/use/1.jpg" style="min-height: 113%;max-width: 88%;border: 0.4rem solid #010e21;"/>
				    </div>
				    </div>
				  </div>
				  <div class="detail">
				    <h1 class="detail-name">Step1 여행지찾기🔎</h1>
				    <p class="detail-short-description"> 
				     여행지 리스트에서 검색을 통해 알아보세요.
				    </p>
				  </div>
				</div>
				<div style="display:flex;justify-content:center; margin: 15;">	 
		        	 <div class="container1" >
				  <div class="image-viewer">
				    <div class="main-image">
				      <img src="assets/img/use/2.jpg" style="min-height: 113%;max-width: 88%;border: 0.4rem solid #010e21;"/>
				    </div>
				    </div>
				  </div>
				  <div class="detail">
				    <h1 class="detail-name">Step2 일정만들기📃</h1>
				    <p class="detail-short-description"> 
				      가고싶은 장소 또는 관심있는 장소 이신가요? 일정에 담아 계획을 세워보세요.
				    </p>
				  </div>
				</div>
				<div style="display:flex;justify-content:center; margin: 15;">	 
		        	 <div class="container1" >
				  <div class="image-viewer">
				    <div class="main-image">
				      <img src="assets/img/use/3.jpg" style="min-height: 113%;max-width: 88%;border: 0.4rem solid #010e21;"/>
				    </div>
				    </div>
				  </div>
				  <div class="detail">
				    <h1 class="detail-name">Step3 플래너 작성✏</h1>
				    <p class="detail-short-description"> 
				       일정에 담은 장소들을 지도에서 확인해보세요 인근의 맛집 명소들을 한눈에 확인 할 수 있습니다.
				    </p>
				  </div>
				</div> 
				<div style="display:flex;justify-content:center; margin: 15;">	 
		        	 <div class="container1" >
				  <div class="image-viewer">
				    <div class="main-image">
				      <img src="assets/img/use/4.jpg" style="border: 0.4rem solid #010e21;max-height:  90%;min-width: 100%;"/>
				    </div>
				    </div>
				  </div>
				  <div class="detail" style="padding-top: 4.6%;padding-left: 2%;">
				    <h1 class="detail-name">Step4 여행하기✈</h1>
				    <p class="detail-short-description"> 
				      완성된 일정을 친구들과 공유해보세요! 길찾기와 메모만 잘 활용해도 여행 준비 끝!
				    </p>
				  </div>
				</div>
			</div>
		</div>
		
		        <!-- Popular Locations End -->

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
                                 <a href="index.html"><img src="assets/img/logo/logo_b.png" alt="" style="max-width: 170px;"></a>
                               </div>
                              </div>
						 </div>
						</div>
					<div class="col-xl-2 col-lg-2 col-md-4 col-sm-6">
						<div class="single-footer-caption mb-50">
							<div class="footer-tittle">
								<h4>Administrator</h4>
								<ul>
									<li><a href="https://github.com/dragongit94">이민용</a></li>
									<li><a href="https://github.com/yumgit23">허유민</a></li>
									<li><a href="https://github.com/suadeomgit">권성환</a></li>
									<li><a href="https://github.com/lzhxxn">이지훈</a></li>
									<li><a href="https://github.com/DobbyisFree1">박종범</a></li>
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
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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
function goListing(){
    location.href = "listing.do";
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
        <script>
	     // wait for the entire page to finish loading
	     window.addEventListener('load', function() {
	     	
	     	// setTimeout to simulate the delay from a real page load
	     	setTimeout(lazyLoad, 1000);
	     	
	     });
		// 4카드
	     function lazyLoad() {
	     	var card_images = document.querySelectorAll('.card-image');
	     	
	     	// loop over each card image
	     	card_images.forEach(function(card_image) {
	     		var image_url = card_image.getAttribute('data-image-full');
	     		var content_image = card_image.querySelector('img');
	     		
	     		// change the src of the content image to load the new high res photo
	     		content_image.src = image_url;
	     		
	     		// listen for load event when the new photo is finished loading
	     		content_image.addEventListener('load', function() {
	     			// swap out the visible background image with the new fully downloaded photo
	     			card_image.style.backgroundImage = 'url(' + image_url + ')';
	     			// add a class to remove the blur filter to smoothly transition the image change
	     			card_image.className = card_image.className + ' is-loaded';
	     		});
	     		
	     	});
	     	
	     }
	     //튜토리얼
	     class ImageViewer {
	    	  constructor(selector) {
	    	    this.selector = selector;
	    	    $(this.secondaryImages).click(() => this.setMainImage(event));
	    	    $(this.mainImage).click(() => this.showLightbox(event));
	    	    $(this.lightboxClose).click(() => this.hideLightbox(event));
	    	  }
	    	  
	    	  get secondaryImageSelector() {
	    	    return '.secondary-image';
	    	  }
	    	  
	    	  get mainImageSelector() {
	    	    return '.main-image';
	    	  }
	    	  
	    	  get lightboxImageSelector() {
	    	    return '.lightbox';
	    	  }
	    	  
	    	  get lightboxClose() {
	    	    return '.lightbox-controls-close';
	    	  }
	    	  
	    	  get secondaryImages() {
	    	    var secondaryImages = $(this.selector).find(this.secondaryImageSelector).find('img')
	    	    return secondaryImages;
	    	  }
	    	  
	    	  get mainImage() {
	    	    var mainImage = $(this.selector).find(this.mainImageSelector);
	    	    return mainImage;
	    	  }
	    	  
	    	  get lightboxImage() {
	    	    var lightboxImage = $(this.lightboxImageSelector);
	    	    return lightboxImage;
	    	  }
	    	  
	    	  setLightboxImage(event){
	    	    var src = this.getEventSrc(event);
	    	    this.setSrc(this.lightboxImage, src);
	    	  }
	    	  
	    	  setMainImage(event){
	    	    var src = this.getEventSrc(event);
	    	    this.setSrc(this.mainImage, src);
	    	  }
	    	  
	    	  getSrc(node){
	    	    var image = $(node).find('img');
	    	  }
	    	  
	    	  setSrc(node, src){
	    	    var image = $(node).find('img')[0];
	    	    image.src = src;
	    	  }
	    	  
	    	  getEventSrc(event){
	    	    return event.target.src;
	    	  }
	    	  
	    	  showLightbox(event){
	    	    this.setLightboxImage(event);
	    	    $(this.lightboxImageSelector).addClass('show');
	    	  }
	    	  
	    	  hideLightbox(){
	    	    $(this.lightboxImageSelector).removeClass('show');
	    	  }
	    	}

	    	new ImageViewer('.image-viewer');
        </script>

    </body>
</html>