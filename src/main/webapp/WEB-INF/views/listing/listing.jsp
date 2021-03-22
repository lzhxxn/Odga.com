<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <link rel="stylesheet" href="assets/css/price_rangs.css">
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
}</style>
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
    <!-- Preloader End -->
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
                              <ul style="float: left;width: 20%; align=left;padding-top: 2%;">   
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
	 										<li class="img-wrapper" style="float: right;width: 25%;animation: 300ms ease-in-out 0s normal none 1 running fadeIn;">   
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
        <div class="hero-area3 hero-overly2 d-flex align-items-center" style="background-image: url(assets/img/myPlanImg/12.jpg);">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-9">
                        <div class="hero-cap text-center pt-50 pb-20">
                            <h2>국내여행지</h2>
                        </div>
                        
                        <!--Hero Area 검색  -->
                        <form action="listing.do" class="search-box search-box2">
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
                            <!-- Search box -->
                            <div class="search-form">
                                <button type="submit">Search</button>
                            </div>
                        </form>	
                    </div>
                </div>
            </div>
        </div>
        <!--Hero Area 검색 -->
        
        <!-- listing Area Start -->
        <div class="listing-area pt-120 pb-120">
            <div class="container">
                <div class="row">
                
                    <!-- Left content -->
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="row">
                            <div class="col-12">
                                    <div class="small-section-tittle2 mb-45">
                                    <h4>검색하기</h4>
                                </div>
                            </div>
                        </div> 
                        <!--  Filtering start -->
                        <div class="category-listing mb-50">
                            <!-- single one -->
                            <div class="single-listing">
                                <!-- input -->
                                <form action="listing.do">
                                <div class="input-form">
                                    <input type="text" placeholder="여행지를 찾아보세요." name="keyword" required="required" />
                                </div>           
                                <!-- 관광지검색 Filtering  -->
                                <div class="select-job-items1">
 									 <select name="catgo">
                                        <option value="title">관광지</option>
                                        <option value="addr1">주소</option>					
                                    </select>
                                </div>
                            </div>
                            <div class="single-listing">
                                 <button class="btn list-btn mt-20" type="submit">검 색</button>
                            </div>
                          </form>
                        </div>
                        <!-- 관광지검색 Filtering End -->
                    </div>
                     <!-- 국내 관광지 리스트 Form -->
                    <div class="col-xl-8 col-lg-8 col-md-6">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="count mb-35">
                                <c:choose>
                                   <c:when test="${!empty listResult}">
                                   <c:if test="${keyword != null}">
                                   <span> '${keyword}' 에 대한  총 ${listResult.totalCount} 개의 검색결과</span>
                                   </c:if>
                                   <c:if test="${keyword == null}">
                                   <span> 총 ${listResult.totalCount} 개의 관광지</span>
                                   </c:if>
                                   </c:when>    
                                   <c:otherwise>
                                      <span style="margin-left:240px;font-size:18px;margin-bottom:50px"> 제공되는 주변 관광지가 없습니다.</span>
                                   </c:otherwise>
                                </c:choose>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 국내 관광지 리스트  시작 -->
                        <!-- 국내 관광지 리스트  시작 -->
                        <div class="listing-details-area">
                            <div class="container">
                                <div class="row">
                                <c:forEach items="${listResult.list}" var="touritems">
                                    <div class="col-lg-6">
                                        <div class="single-listing mb-30">
                                     <c:choose>
                                       <c:when test="${touritems.firstimage eq (null)}">
                                         <div class="list-img"><a href="listing_details.do?contentid=${touritems.contentid}"><img src="assets/img/insteadimg.png" alt="" ></a></div>
                                         </c:when>
                                        <c:otherwise>
                                       <div class="list-img"><a href="listing_details.do?contentid=${touritems.contentid}"><img src="${touritems.firstimage}" alt="" ></a></div>
                                      </c:otherwise>
                                    </c:choose>
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
                        </c:forEach>
                     </div>
                     </div>
                   </div>
                 <!-- 국내 관광지리스트 끝 -->
                 <!-- listing Details End -->
<!--Pagination Start  -->
<div class="pagination-area pt-70 text-center">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="single-wrap d-flex justify-content-center">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-start">
                        
                <!-- 이전 페이지 START-->   
                <c:choose>
 					<c:when test="${keyword!=null}">
						<c:choose>
	                      <c:when test="${listResult.cp eq 1}">
	                        <li class="page-item disabled">
	                         <a class="page-link" href="listing.do?cp=${listResult.prevPage}&keyword=${keyword}&catgo=${catgo}"><span class="ti-angle-left"></span></a>
	                         </li>
	                      </c:when>
	                     <c:otherwise>
	 						<li class="page-item">
	 						<a class="page-link" href="listing.do?cp=${listResult.prevPage}&keyword=${keyword}&catgo=${catgo}"><span class="ti-angle-left"></span></a>
	 						</li>
	 					</c:otherwise>
	 					</c:choose>
	 				</c:when>
	 			<c:otherwise>
	 					<c:choose>
	                      <c:when test="${listResult.cp eq 1}">
	                        <li class="page-item disabled">
	                         <a class="page-link" href="listing.do?cp=${listResult.prevPage}"><span class="ti-angle-left"></span></a>
	                         </li>
	                      </c:when>
	                     <c:otherwise>
	 						<li class="page-item">
	 						<a class="page-link" href="listing.do?cp=${listResult.prevPage}"><span class="ti-angle-left"></span></a>
	 						</li>
	 					</c:otherwise>
	 					</c:choose>
	 			</c:otherwise>
	 			</c:choose>
	 			<!-- 이전 페이지 END --> 	
	 			
 			<c:choose>
 				<c:when test="${keyword!=null}">
                      <c:forEach begin="${listResult.startPage}" end="${listResult.endPage}" var="i">
                         <li class="page-item active"><a class="page-link" href="listing.do?cp=${i}&keyword=${keyword}&catgo=${catgo}">
                          <c:choose>
		   			    <c:when test="${i==listResult.cp}">
		                	<span style="color:red;font-weight:bold">${i}</span>
		                </c:when>
		                <c:otherwise>
		                    ${i}
		                </c:otherwise>
						</c:choose>            
                        </a>
                        </li>
                      </c:forEach>
                </c:when>
            <c:otherwise>
            		    <c:forEach begin="${listResult.startPage}" end="${listResult.endPage}" var="i">
                         <li class="page-item active"><a class="page-link" href="listing.do?cp=${i}">
                          <c:choose>
		   			    <c:when test="${i==listResult.cp}">
		                	<span style="color:red;font-weight:bold">${i}</span>
		                </c:when>
		                <c:otherwise>
		                    ${i}
		                </c:otherwise>
						</c:choose>            
                        </a>
                        </li>
                      </c:forEach>
            </c:otherwise>
            </c:choose>
                        
                        <!-- 다음 페이지 START -->
                        <c:choose>
 						<c:when test="${keyword!=null}">
	                        <li class="page-item"><a class="page-link" href="listing.do?cp=${listResult.nextPage}&keyword=${keyword}&catgo=${catgo}">
	                        <span class="ti-angle-right"></span></a></li>
                        </c:when>
                        <c:otherwise>
	                         <li class="page-item"><a class="page-link" href="listing.do?cp=${listResult.nextPage}">
	                         <span class="ti-angle-right"></span></a></li>
                        </c:otherwise>
                        </c:choose>
                         <!-- 다음 페이지 END -->
                        
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>        
<!--Pagination End  -->
         </div>      
<!-- listing-area Area End -->
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
										<li><a href="https://github.com/yumgit23">허유민</a></li>
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
			                                 </c:otherwise>
			                            </c:choose>
			                            <li><a href="use.do">이용방법</a>
										<li><a onclick="goPlanner()">나의 여행 만들기</a></li>
										<li><a href="review.do">커뮤니티</a>
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
        <script src="./assets/js/price-range.js"></script>
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

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="//work6.kr/plugin/plugin_link/19"></script>
        
    </body>
</html>