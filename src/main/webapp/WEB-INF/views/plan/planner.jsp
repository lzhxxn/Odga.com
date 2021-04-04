<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<link rel="stylesheet" href="assets/css/bootstrap_planner.min.css">
			<link rel="stylesheet" href="assets/css/style_planner.css">
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
			<link rel="stylesheet" href="assets/css/planner.css">
		</head>
<style>
.swal-button--확인:not([disabled]):hover{background-color:#ff5235}.swal-button--확인{background-color:#ff3d1c}.swal-button--확인:hover{background-color:#ff5235}.swal-button--확인:active{background-color:#ff5235}.swal-button--확인하기:not([disabled]):hover{background-color:#ff5235}.swal-button--확인하기{background-color:#ff3d1c}.swal-button--확인하기:hover{background-color:#ff5235}.swal-button--홈으로{color:#555;background-color:#efefef}.swal-button--홈으로:not([disabled]):hover{background-color:#e8e8e8}.swal-button--홈으로:active{background-color:#d7d7d7}.swal-button--홈으로:focus{box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(116,136,150,.29)}
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
                              <ul style="float: left;width: 20%;padding-top:1%;" align="left">   
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
				 <div class="hero-area3 hero-overly2 d-flex align-items-center " style="min-height: 103px">

				</div>
				<!--Hero End -->
				<!-- listing Area Start -->
				<div class="listing-area pt-120 pb-120" style="background: #040c26;">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<div class="row" style="margin-left: 5px">
										<c:set value="${list.planer}" var="planer"/>
			                           <c:if test="${!empty planer}">
		                                    <div class="col-3">   
		                                       <input id="p_title" type="text" class="text" placeholder="여행 제목을 작성해주세요.." value="${planer.p_title}"/>   
		                                    </div>
			                            </c:if>
			                                 <c:if test="${empty planer}">
		                                    <div class="col-3">   
		                                       <input id="p_title" type="text" class="text" placeholder="여행 제목을 작성해주세요.."/>   
		                                    </div>
			                          </c:if>
									<div class="col-6 " style="display: flex;">
										<select id="test1" name="test1" class="nice-select top-select" style="margin-left:0;">
											<option value="" selected="selected">인원</option>
											<option value="1인">1인</option>
											<option value="2인">2인</option>
											<option value="3인">3인</option>
											<option value="4인">4인</option>
											<option value="5인 이상">5인 이상</option>                                
										 </select>
										<select id="test2" name="test1" class="nice-select top-select" >
											<option value="혼자만의 여행" selected="selected">혼자만의 여행</option>
											<option value="커플여행">커플여행</option>
											<option value="가족여행">가족여행</option>
											<option value="우정여행">우정여행</option>
											<option value="패키지여행">패키지여행</option>
										 </select>
									  <form name="form" style="display:flex;">								  	
										  <select name="area"  id="areacode" class="nice-select top-select" onchange="changes(value)" style="margin-left:5%;">
										    <option value="">지역 선택</option>
										    <c:forEach items="${list.list}" var="area">
											    <option value="${area.areacode}">${area.area}</option>
										    </c:forEach>
										  </select>		<br/>	  
										  <select name="sigungu" class="nice-select top-select" id="sigunguCode" style="margin-left:5%;">
										    <option value="">세부 지역</option>
										  </select>
									  </form>
									</div>
									<c:set value="${list.thisP_id}" var = "thisP_id"/>
									<div class="col-3" style="padding-right: 1%;">
									  <form method="post" name="fin" action="save.do">
									    <input type="hidden" name="p_id" value="${thisP_id}" />
									  	<input type="hidden" name="title" value="" />
									  	<input type="hidden" name="hSize" value="" />
									  	<input type="hidden" name="concept" value="" />
									  	<input type="hidden" name="goPage" value="" />
									  	<input type="hidden" name="m_id" value="${LOGINUSER.m_id}" />
		                              	<input type="button" onclick="savePlanner();" class="btn list-btn top-btn" value="저장">
		                              </form>
		                              <a onclick="reset()" class="btn list-btn top-btn" style="color: #fff;">초기화</a>		                              
									  <a href="leave?p_id=${thisP_id}" class="btn list-btn top-btn">취소</a>
									</div>
							</div>
						</div>
					</div>
					<div class="row" style="margin-right:5px;margin-left:5px;margin-top:10px">
	               	  <div class="modal fade" id="show-movie-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
					      aria-hidden="true">
					      <div class="modal-dialog modal-lg" role="document">
					        <div class="modal-content">
					          <div class="modal-header">
					            <h5 class="modal-title" id="show-movie-title">Modal title</h5>
					            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					              <span aria-hidden="true">&times;</span>
					            </button>
					          </div>
					          <div class="modal-body" id="show-movie-body">
					            <div class="row">
					              <div class="col-sm-8" id="show-movie-image" >
					              </div>
					              <div class="col-sm-4">
					                <p><em id="show-movie-date"></em></p>
					                <p id="show-movie-zipcode"></p>
					                <p id="show-movie-tel"></p>
					                <p id="overview"></p>
					              </div>
					            </div>
					          </div>
					          <div class="modal-footer">
					            <button type="button" class="btn btn-secondary" style="border-radius: 7%;" data-dismiss="modal">Close</button>
					          </div>
					        </div>
					      </div>
					    </div>
						<!-- Left content -->
						<div class="col-1">
							<div class="row" style="margin-top: 15px;">
								<div class="col-12">
									<div class="small-section-tittle2 mb-45" style="margin-bottom: 15px;">
										<h5 style="margin-left: 15px;color:#fff;">1. DAY</h5>
									</div>
								</div>
							</div>
							<div class="category-listing mb-50" style="padding: 10px 10px 20px;">
								<div class="single-listing">
										<p class="p-date">시작일 : </p>
										<input class="input-date" style="width: 100%;" type="date" id="sdate" value=""/>										
										<p class="p-date">종료일 : </p>
										<input class="input-date" style="width: 100%;" type="date" id="edate" value=""/>									
									<div class="select-job-items1">
									<div style="min-height: 353px;">
										<table id="myTable" class="table" >
										  <thead>
										  </thead>
										  <tbody id="tbody"></tbody>
										</table>
									</div>
									</div>
									<div class="single-listing">
										<button  onclick="dayReset()" class="btn list-btn mt-20" style="font-size: small;">DAY 초기화</button>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-2">
							<div class="row" style="margin-top: 15px;">
								<div class="col-12">
									<div class="small-section-tittle2 mb-45" style="margin-bottom: 15px;">
										<h5 style="margin-left: 15px;color:#fff;">일 정</h5>
									</div>
								</div>
							</div>
							<!-- 선택된 day 리스트 -->
							<div class="category-listing mb-50">
								<div class="single-listing">									
									<div class="select-job-items2">
										<div class="card" name="card2"id="card2" style="min-height: 460px;">
											
										</div>
									</div>
								</div>								
								<div class="single-listing">
									<a onclick="dayDelAll()" class="btn list-btn mt-20" style="margin-top: 6%;">전체  삭제</a>
							</div>	
							</div>
						</div>
						<div class="col-2">
							<div class="row" style="margin-top: 15px;">
								<div class="col-12">
									<div class="small-section-tittle2 mb-45" style="margin-bottom: 15px;">
										<h5 style="margin-left: 15px;color:#fff;">2. 장소를 선택하세요</h5>
									</div>
								</div>
							</div>
							<!-- 관광지 검색 리스트 -->
							<div class="category-listing mb-50">
								<div class="single-listing">
									<div class="input-form">
										<input type="text" id="keyword" placeholder="검색" x-webkit-speech
											autocomplete="off" name="keyword" style="width: 70%;"/>
											<button value="none" onclick="search(value)" class="btn" style="width: 25%;margin-top: 0;border-radius: 7px;">검색</button>									
									</div>
									<div class="select-job-items1">
										<button id="touraBtn" value="A01" onclick="search(value)" class="cat1-btn"><img src="assets/icon/camera.png" title="사진"></button>
										<button id="shoppingBtn" value="A04" onclick="search(value)" class="cat1-btn"><img src="assets/icon/shopping.png" title="쇼핑"></button>
										<button id="foodBtn" value="A05" onclick="search(value)" class="cat1-btn"><img src="assets/icon/food.png" title="맛집"></button>
										<button id="hotelBtn" value="B02" onclick="search(value)" class="cat1-btn"><img src="assets/icon/hotel.png" title="숙소"></button>
										<button id="likeBtn" value="C01" onclick="search(value)" class="cat1-btn"><img src="assets/icon/like.png" title="추천!"></button>
									</div>
									<div id="result">
									</div>
									<div class="select-job-items2">
										<div class="row" id="data-panel" style="box-shadow: 0 1px 2px #aaa; overflow: auto; max-height: 520px; min-height: 405px; margin: 0;">
                              			</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-7">
							<div class="map_wrap map-css">
								<div id="map"
									class="map-css2">
								</div>
							</div>
							<script type="text/javascript"
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8831cbdd7d745d3f8c6d9e1fec81ecca&libraries=services"></script>
							<script>
								var markers = [];
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
									mapOption = {
										center: new kakao.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표
										level: 6, // 지도의 확대 레벨
										mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
									};
								// 지도를 생성한다 
								var map = new kakao.maps.Map(mapContainer, mapOption);

							</script>
						</div>
					</div>
				</div>
			</main>
			<!-- Footer Start-->
			<footer>
		<div class="footer-area">
			<div class="container" style="padding-inline: 18%;">
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

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 동적 셀렉트 박스 -->
<script>

    var checkUnload = true;
    $(window).on("beforeunload", function(){
        if(checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
    });
    
    $(document).ready(function() {
        
        // ID를 alpreah_input로 가지는 곳에서 키를 누를 경우
        $("#keyword").keydown(function(key) {
        	checkNull();
            //키의 코드가 13번일 경우 (13번은 엔터키)
            if (key.keyCode == 13) {
            	if(checkNull()){
              	var keyword = document.getElementById("keyword").value;
                 var searchOption= null;
                 var areaindex = $("#areacode option:selected").attr('value');
                 var typeindex = $("#contenttypeid option:selected").attr('value');
                 var sigunguIndex = $("#sigunguCode option:selected").attr('value');
                 $.ajax({
                     url: "search.json", 
                     type: "GET",
                     data: { searchOption: searchOption, keyword : keyword, areacode : areaindex, 
                           sigungucode: sigunguIndex },
                     success: function(responseData){
                       var html = "";
                     var html1 = "";
                     var list = responseData.lists;
                     var count = responseData.count;
                     if(count>0) html1 += '<p>'+count+' 개의 검색결과가 있습니다.</p>';
                     else{
                          html1 += "<tr>";
                          html1 += "<td colspan='4' align='center'>검색 결과가 없습니다.</td>";
                          html1 += "</tr>";
                     }
                       if(list.length != 0){
                        for(var i=0; i<list.length; i++){
                        	html += '<div style="max-width: 100%;">';
       	                	html += '<div class = "card mb-2">';
	       	                 if((list[i].firstimage)!= null) html += '<img class="card-img-top" src = '+list[i].firstimage+' alt="Card image cap">';  
	                         else html += '<img class="card-img-top" src = "https://st4.depositphotos.com/17828278/24401/v/600/depositphotos_244011872-stock-illustration-image-vector-symbol-missing-available.jpg" >';                           
       	                		html += '<div class = "movie-item-body" style="text-align: center;padding-top: 2%;"><h6 style="margin-bottom: 2%;font-weight: bold;">'+list[i].title+'</h6></div>';
      	                		html += '<!-- "More" button -->';
       	                		html += '<div style="padding: .1rem 0.3rem .1rem 0.3rem;background-color: rgba(0, 0, 0, .03); border-top: 1px solid rgba(0, 0, 0, .125);text-align: right;">';
       	                			html += '<button style="border-radius: 7%;" onclick="markerm('+list[i].mapy+', '+list[i].mapx+', &quot;'+list[i].title+'&quot;, &quot;'+list[i].firstimage+'&quot;, &quot;'+list[i].addr1+
       	                             '&quot;, &quot;'+list[i].zipcode+'&quot;); panTo('+list[i].mapy+', '+list[i].mapx+'); showMovie('+list[i].contentid+')" class = "btn-primary btn-show-movie " data-toggle ="modal" data-target = "#show-movie-modal" data-id = "'+list[i].contentid+'">More</button>';
       	                			html += '<button style="border-radius: 7%;margin-left: 2%;" class="btn-info btn-add-favorite" data-id="'+list[i].contentid+'" onclick="addS_plan('+list[i].contentid+')">+</button>';
       	                		html += '</div> '; 
       	                	html += '</div>  ';
       	                 html += ' </div>';        	                  
       	              }       
       	           }
       	                $("#result").html(html1);
       	             $("#data-panel").html(html);
                     }
                  });
            }else{
            	return false;
            }
           }
        });
    });
</script>
<script type="text/javascript">
function savePlanner(){
	checkUnload = false;
	var sp = document.getElementById('card2').innerText;
	var p_title = $("#p_title").val();
	if(p_title == null || p_title==""){
		sweetAlert("여행 플래너의 제목을 입력해주세요.");
		$("#p_title").focus();
		return false;
	}
	else if(sp==null||sp=="장소를 추가해주세요"||sp==""){
		sweetAlert("여행 플래너에 장소를 추가해주세요.");
		return false;
	}else{
	var p_msize = $("#test1 option:selected").val();
	var p_concept = $("#test2 option:selected").val();
	var title = $("#title").val(); 
	var hsize = $("#hSize").val();
	var concept = $("#concept").val();
	var goPage = null;
	document.fin.title.value = p_title;
	document.fin.hSize.value = p_msize;
	document.fin.concept.value = p_concept;
	swal({
		text: "플래너가 성공적으로 저장되었습니다.",
		buttons:{"확인하기":"확인하기","홈으로":"홈으로"},
		}).then((value) => {
			if(value==="확인하기"){
				document.fin.goPage.value="mypage";
				document.fin.submit();
			}else if(value==="홈으로"){
				document.fin.goPage.value="index";
				document.fin.submit();
			}
		});
	}
}
</script>

<script type="text/javascript">

function changes(fr) {
   var li = new Array();
   var li2 = new Array();
   var num = new Array();
   var vnum = new Array();
   var latitude = 0;
   var longitude = 0;
   var k = 0;

   <c:set var="list" value="${list}"/>
   <c:forEach items="${list.list}" var="area">
    if(fr==${area.areacode}) {
       li.push("세부 지역");
       li2.push("");
       <c:forEach items="${list.list_s}" var="sigungu">
          if(${area.areacode}==${sigungu.areacode}){
             li.push("${sigungu.si_name}");
             li2.push("${sigungu.sigungucode}");
          }
       </c:forEach>
      num = li;
      vnum = li2;

      latitude=${area.latitude};
      longitude=${area.longitude};      
    }else if(fr==""){
       if(k=0){
          li.push("세부 지역");
          li2.push("");
          k++;
          num = li;
         vnum = li2;
       }
       latitude=37.56682;
      longitude=126.97865;     
    }
    </c:forEach>
  // 셀렉트안의 리스트를 기본값으로 한다..
   $('#sigunguCode').empty();
     //포문을 이용하여 두번째(test2)셀렉트 박스에 값을 뿌려줍니당)
   for(var i=0; i<num.length;i++) {
     document.form.sigungu.options[i] = new Option(num[i],vnum[i]);
   }
   
   // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(latitude, longitude);
    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
}

</script>
<script>
var sp_day = 0;
function daydo(value){	
	var p_id = ${thisP_id}; //나중에 받아주기
	sp_day= value;
	  $.ajax({
		   url: "dayselect", 
		   type: "GET",
		   data: { p_id: p_id, sp_day : sp_day },
		   success: function(responseData){
           if(!responseData){
        	   sweetAlert("장소를 추가해주세요.");
				  return false;
			  }
           var html = "";  /* <div style='margin-bottom:5px'> <a class='link_a' href='testGet.do?contentid="+responseData[i].sp_id+"'>*/
           if(responseData.length != 0){
        	   for(var i=0; i<responseData.length; i++){
					  if((responseData[i].firstimage)!= null){ html += "<tbody class='list-tbody'><tr><td style='width: 30%;padding-top: 5%;font-size: smaller;'><img class='pic list-pic' src='"+responseData[i].firstimage+"'/>";	
				  		 }else{ html += "<tbody style='border-bottom: 1px solid #999;'><tr><td  style='width: 40%;padding-top: 5%;font-size: smaller;'><img class='pic list-pic' src='resources/upload/insteadimg.png'/>";}
					  if((responseData[i].title)!= null){ html += ""+responseData[i].title+"</td></tr>";
				  		 }else{ html += "장소명이 없습니다.</td></tr>";}
					  if((responseData[i].addr1)!= null){ html += "<tr style='width: 100%;'><td class='td-list' style='font-size: x-small;'>"+responseData[i].addr1+"</td></tr>";	
				  		 }else{ html += "<tr style='width: 100%;'><td class='td-list' style='font-size: x-small;'>주소가 없습니다.</td></tr>";}	         			  		 
				  		html += "<tr style='align-self:end;'><td class='td-del'><a class='link_a' style='font-size: smaller;margin-right: 10px;' onclick='delS_plan("+responseData[i].s_planner.sp_id+")'>삭 제</a></td></tr><tbody>";
				  }			 
			  }else{
				  html += "<tr>";
				  html += "<td colspan='4' align='center'>장소를 추가해주세요</td>";
				  html += "</tr>";
			  }
			 			  
			  $("#card2").html(html);
		   }
	   });
    }
    
function dayDelAll(){	//일정 전체 삭제
	var p = ${thisP_id}; 
	var sp = sp_day;
	  $.ajax({
		   url: "dayDeleteAll", 
		   type: "GET",
		   data: { p_id: p, sp_day : sp },
		   success: function(responseData){
			   daydo(sp);
		   }
	   });
    }
    
  function rowAdd() {
	  trCnt = $('#myTable tr').length+1;
    if(trCnt < 11){
    	var innerHtml= '<tr><td style="text-align: center;"><button class="bttn list-bttn" id="daybtn'+trCnt+'" value="'+trCnt+'" onclick="daydo(value)">DAY '+trCnt+'</button></td></tr>';
    	$('#myTable > tbody:last').append(innerHtml);
    }else{
    	sweetAlert("최대 10일까지만 가능합니다.");
    	return false;
    }   
  }
  function dayDelete() {
		 var trCnt = $('#myTable tr').length;
	    if(trCnt > 0){
	    	$('#myTable > tbody:last > tr ').remove();
	    }else{
	    	return false;
	    }
	}
  function dayReset() {
		 var trCnt = $('#myTable tr').length;
	    if(trCnt > 0){
	    	$('#myTable > tbody:last > tr ').remove();
	    	document.getElementById("sdate").value = null;
	    	document.getElementById("edate").value = null;
	    	sdate=null;
	    	edate=null;
	    	$('#sdate').focus();
	    }else{
	    	return false;
	    }
	  }
  
  //일수 계산해서 day 생성 
  var sdate;
  var edate;
  var currTime = 24*60*60*1000;
  var diff;
  var day;
  $("#sdate").on("propertychange change keyup paste input", function() {
	  	dayDelete();
	    var currentSdate = $(this).val();
	    if(currentSdate == sdate) {
	        return;
	    }	 
	    sdate = new Date(currentSdate);
	    
	    diff  = edate - sdate;
		day = (parseInt(diff/currTime))+1;
		for(var i=1; i<=day; i++){
      	  rowAdd();
        }
	});
  $("#edate").on("propertychange change keyup paste input", function() {
	  	dayDelete();
	    var currentEdate = $(this).val();
	    if(currentEdate == edate) {
	        return;
	    }	 
	    edate = new Date(currentEdate);
	    
		diff  = edate - sdate;
		day = (parseInt(diff/currTime))+1;
		for(var i=1; i<=day; i++){
      	  rowAdd();
        }
	});
  
 
  function search(value){
	  if(checkNull()){
	     var keyword = document.getElementById("keyword").value;
	     var searchOption= value;
	     var areaindex = $("#areacode option:selected").attr('value');
	     var typeindex = $("#contenttypeid option:selected").attr('value');
	     var sigunguIndex = $("#sigunguCode option:selected").attr('value');
	     $.ajax({
	         url: "search.json", 
	         type: "GET",
	         data: { searchOption: searchOption, keyword : keyword, areacode : areaindex, 
	               sigungucode: sigunguIndex },
	         success: function(responseData){
	          /*  if(!responseData){
	              alert("검색 결과가 없습니다.");
	              return false;
	           } */
	           var html = "";
	         var html1 = "";
	         var list = responseData.lists;
	         var count = responseData.count;
	         if(count>0) html1 += '<p>'+count+' 개의 검색결과가 있습니다.</p>';
	         else{
	              html1 += "<tr>";
	              html1 += "<td colspan='4' align='center'>검색 결과가 없습니다.</td>";
	              html1 += "</tr>";
	         }
	           if(list.length != 0){
	            for(var i=0; i<list.length; i++){
	            	html += '<div style="max-width: 100%;">';
	               	html += '<div class = "card mb-2">';
		                 if((list[i].firstimage)!= null) html += '<img onclick="markerm('+list[i].mapy+', '+list[i].mapx+', &quot;'+list[i].title+'&quot;, &quot;'+list[i].firstimage+'&quot;, &quot;'+list[i].addr1+
                         '&quot;, &quot;'+list[i].zipcode+'&quot;); panTo('+list[i].mapy+', '+list[i].mapx+');" class="card-img-top" src = '+list[i].firstimage+' alt="Card image cap">';  
	                 else html += '<img class="card-img-top" onclick="markerm('+list[i].mapy+', '+list[i].mapx+', &quot;'+list[i].title+'&quot;, &quot;'+list[i].firstimage+'&quot;, &quot;'+list[i].addr1+
                     '&quot;, &quot;'+list[i].zipcode+'&quot;); panTo('+list[i].mapy+', '+list[i].mapx+');" src = "resources/upload/insteadimg.png" >';                           
	               		html += '<div class = "movie-item-body" style="text-align: center;padding-top: 2%;"><h6 onclick="markerm('+list[i].mapy+', '+list[i].mapx+', &quot;'+list[i].title+'&quot;, &quot;'+list[i].firstimage+'&quot;, &quot;'+list[i].addr1+
                        '&quot;, &quot;'+list[i].zipcode+'&quot;); panTo('+list[i].mapy+', '+list[i].mapx+');" style="margin-bottom: 2%;font-weight: bold;">'+list[i].title+'</h6></div>';
	              		html += '<!-- "More" button -->';
	               		html += '<div style="padding: .1rem 0 .1rem 0.3rem;background-color: rgba(0, 0, 0, .03); border-top: 1px solid rgba(0, 0, 0, .125);text-align: right;margin-right: 3%;">';
	               			html += '<button style="border-radius: 7%;" onclick="markerm('+list[i].mapy+', '+list[i].mapx+', &quot;'+list[i].title+'&quot;, &quot;'+list[i].firstimage+'&quot;, &quot;'+list[i].addr1+
	                            '&quot;, &quot;'+list[i].zipcode+'&quot;); panTo('+list[i].mapy+', '+list[i].mapx+'); showMovie('+list[i].contentid+')" class = "btn-primary btn-show-movie " data-toggle ="modal" data-target = "#show-movie-modal" data-id = "'+list[i].contentid+'">More</button>';
	               			html += '<button style="border-radius: 7%;margin-left: 2%;" class="btn-info btn-add-favorite" data-id="'+list[i].contentid+'" onclick="addS_plan('+list[i].contentid+')">+</button>';
	               		html += '</div> '; 
	               	html += '</div>  ';
	                html += ' </div>'; 
	              }       
	           }
	                $("#result").html(html1);
	           /* $("#card").html(html); */
	  	       $("#data-panel").html(html)
	         }
	      });
		  }else{
			  return false;
		  }
	  }
	 
</script>
<script>	

function showMovie(value) {	
    var contentid = value;
    $.ajax({
 	         url: "getItem.json", 
 	         type: "GET",
 	         data: { contentid: contentid},
 	         success: function(responseData){
 	    
 	        	const modalTitle = document.getElementById("show-movie-title");
	 	        const modalImage = document.getElementById("show-movie-image");
	 	        const modalAddr = document.getElementById("show-movie-date");	 	        
	 	        const modalZipcode = document.getElementById("show-movie-zipcode");
	 	        const modalTel = document.getElementById("show-movie-tel");
 	        	modalTitle.textContent = responseData.title;
 	        	modalImage.innerHTML = '<img src = "'+responseData.firstimage+'" class="img-fluid" style="border: 2px solid black;" alt="Responsive image">';
 	        	if(responseData.addr2 != null)
 	        		modalAddr.textContent = '주소 : '+responseData.addr1+' '+responseData.addr2;
 	        	else modalAddr.textContent = '주소 : '+responseData.addr1;
 	        	modalZipcode.textContent ='우편번호: '+responseData.zipcode;
 	        	if(responseData.tel != null)
 	        		modalTel.textContent ='전화번호: '+responseData.tel;
 	         }
    }); 
    var searchUrl = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=6f%2B9GV1OSBV%2BRfUgfgMGJdFxW6rxP%2F5pUN8ZCITBNd94TjMATfCcpyLoRWl3X8ad9ojV9B%2BSLxgndmvE23wVBQ%3D%3D&contentTypeId=&contentId='+contentid+'&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y'
    /* alert(searchUrl); */
    $.ajax({
        type: 'get',
        url: searchUrl, // 읽어올 문서
        dataType: "xml",
        data: { contentid: value},
        success: function(xml) {
            const modalOverview = document.getElementById("overview");
            $(xml).find('item').each(function(){
               var over = $(this).find("overview").text();
               var overnum = over.split("<br>");
               if(overnum[0]!=null) over=overnum[0];
               if(over != null){
                  if(over.length >= 100){
                     var fetchOver = over.substring(0,100);
                     modalOverview.textContent = 'TMI : '+fetchOver+' ...(생략) ';
                  }else modalOverview.textContent = 'TMI : '+over;                   
                                     
               }    
            });
        }
    }); 
}

</script>
<script>
function checkNull(){
	var sdate = 
		document.getElementById("sdate").value;
	  var edate = document.getElementById("edate").value;
	  sdate = sdate.trim();
	  edate = edate.trim();
	  if(sdate == '' || sdate ==null){
		  sweetAlert("시작일을 입력해주세요");
		  $('#sdate').focus();
        return false;
    }else {
    	if(edate ==''||edate==null){
    		sweetAlert("종료일을 입력해주세요");
  		  	$('#edate').focus();
  		  	return false;
    	}else{
    		if(sp_day==0){
    			sweetAlert("Day 버튼을 클릭하여 Day를 선택해주세요.");
    			return false;
    		}
    	}
    }return true;
}
</script>
<script>
	var marker;
	var overlay;
	var over;
	function setMapitems(latitude, longitude, title, firstimage, addr1, zipcode){
		  marker = new kakao.maps.Marker({
		         map: map, 
		         position: new kakao.maps.LatLng(latitude, longitude)
		     });
		     markers.push(marker);

		     var content = '<div class="wrap" id="over">' + 
		                 '    <div class="info">' + 
		                 '        <div class="title">' + 
		                 '          '+title+'' + 
		                 '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		                 '        </div>' + 
		                 '        <div class="body">' + 
		                 '            <div class="img">' +
		                 '                <img src='+firstimage+'; width="73" height="70">' +
		                 '           </div>' + 
		                 '            <div class="desc">' + 
		                 '                <div class="ellipsis">'+addr1+'</div>' + 
		                 '                <div class="jibun ellipsis">(우) '+zipcode+'</div>' + 
		                 '            </div>' + 
		                 '        </div>' + 
		                 '    </div>' +    
		                 '</div>';
		     
		     
		     overlay = new kakao.maps.CustomOverlay({
		      content: content,
		      map: map,
		      position: marker.getPosition()       
		     });
		     // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		     kakao.maps.event.addListener(marker, 'click', function() {
		    	 closeOverlay();
		         overlay.setMap(map);
		     });
	  }
	
  function markerm(latitude, longitude, title, firstimage, addr1, zipcode) {
      if (marker != null || overlay != null) { 
    	  closeOverlay();
    	  setMapitems(latitude, longitude, title, firstimage, addr1, zipcode);
	  }else{
		  setMapitems(latitude, longitude, title, firstimage, addr1, zipcode);
	  }
  }   
  
  // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
  function closeOverlay() { 
      over = document.getElementById('over');
      if(over != null)over.remove();
      marker.setMap(null);
  }
  function panTo(latitude, longitude) {
      // 이동할 위도 경도 위치를 생성합니다 
      var moveLatLon = new kakao.maps.LatLng(latitude, longitude);
      
      // 지도 중심을 부드럽게 이동시킵니다
      // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
      map.panTo(moveLatLon);            
  }   
  
  function getFormatDate(date){  //날짜 포멧 함수
      var year = date.getFullYear();
      var month = (1 + date.getMonth());
      month = month >= 10 ? month : '0' + month;
      var day = date.getDate();
      day = day >= 10 ? day : '0' + day;
      return year + '-' + month + '-' + day;
  }
  function addS_plan(contentid) {
	  sp_sday = getFormatDate(sdate);
	  sp_eday = getFormatDate(edate);	   
	  var p_id = ${thisP_id};
	    $.ajax({
	        url: "insert_sp",
	        type: "GET",
	        data: {sp_day:sp_day,sp_sday:sp_sday,sp_eday:sp_eday,contentid:contentid, p_id: p_id},
	        success: function(responseData){
	            if(!responseData){
	 				  alert("장소를 추가해주세요.");
	 				  return false;
	 			  }
	            var html = "";
	            if(responseData.length != 0){
	            	for(var i=0; i<responseData.length; i++){
						  if((responseData[i].firstimage)!= null){ html += "<tbody class='list-tbody'><tr><td style='width: 30%;padding-top: 5%;font-size: smaller;'><img class='pic list-pic' src='"+responseData[i].firstimage+"'/>";	
					  		 }else{ html += "<tbody style='border-bottom: 1px solid #999;'><tr><td  style='width: 40%;padding-top: 5%;font-size: smaller;'><img class='pic list-pic' src='resources/upload/insteadimg.png'/>";}
						  if((responseData[i].title)!= null){ html += ""+responseData[i].title+"</td></tr>";
					  		 }else{ html += "장소명이 없습니다.</td></tr>";}
						  if((responseData[i].addr1)!= null){ html += "<tr style='width: 100%;'><td class='td-list' style='font-size: x-small;'>"+responseData[i].addr1+"</td></tr>";	
					  		 }else{ html += "<tr style='width: 100%;'><td class='td-list' style='font-size: x-small;'>주소가 없습니다.</td></tr>";}	         			  		 
					  		html += "<tr style='align-self:end;'><td class='td-del'><a class='link_a' style='font-size: smaller;margin-right: 10px;' onclick='delS_plan("+responseData[i].s_planner.sp_id+")'>삭 제</a></td></tr><tbody>";
					  }				 
	 			  }else{
	 				  html += "<tr>";
	 				  html += "<td colspan='4' align='center'>장소를 추가해주세요</td>";
	 				  html += "</tr>";
	 			  }	 			 
	 			  $("#card2").html(html);
	 		   }
	  	});
	}
  
  function delS_plan(sp_id) {
	  var p_id = ${thisP_id};
	    $.ajax({
	        url: "delete_sp",
	        type: "GET",
	        data: {sp_id:sp_id, sp_day:sp_day, p_id:p_id},
	        success: function(responseData){	        	
	            if(!responseData){
	 				  alert("장소를 추가해주세요.");
	 				  return false;
	 			  }
	            var html = "";
	            if(responseData.length != 0){
	            	for(var i=0; i<responseData.length; i++){
						  if((responseData[i].firstimage)!= null){ html += "<tbody class='list-tbody'><tr><td style='width: 30%;padding-top: 5%;font-size: smaller;'><img class='pic list-pic' src='"+responseData[i].firstimage+"'/>";	
					  		 }else{ html += "<tbody style='border-bottom: 1px solid #999;'><tr><td  style='width: 40%;padding-top: 5%;font-size: smaller;'><img class='pic list-pic' src='resources/upload/insteadimg.png'/>";}
						  if((responseData[i].title)!= null){ html += ""+responseData[i].title+"</td></tr>";
					  		 }else{ html += "장소명이 없습니다.</td></tr>";}
						  if((responseData[i].addr1)!= null){ html += "<tr style='width: 100%;'><td class='td-list' style='font-size: x-small;'>"+responseData[i].addr1+"</td></tr>";	
					  		 }else{ html += "<tr style='width: 100%;'><td class='td-list' style='font-size: x-small;'>주소가 없습니다.</td></tr>";}	         			  		 
					  		html += "<tr style='align-self:end;'><td class='td-del'><a class='link_a' style='font-size: smaller;margin-right: 10px;' onclick='delS_plan("+responseData[i].s_planner.sp_id+")'>삭 제</a></td></tr><tbody>";
					  }		 
	 			  }else{
	 				  html += "<tr>";
	 				  html += "<td colspan='4' align='center'>장소를 추가해주세요</td>";
	 				  html += "</tr>";
	 			  }	 			 
	 			  $("#card2").html(html);
	 		   }
	  	});
	} 
  
</script>
<script type="text/javascript">
//초기화버튼
function reset(){
	sdate=null;
	edate=null;
	document.getElementById("p_title").value = null;
	document.getElementById("sdate").value = null;
	document.getElementById("edate").value = null;
	document.getElementById("keyword").value = null;
	$("#test1 option:eq(0)").prop("selected", true);
	$("#test2 option:eq(0)").prop("selected", true);
	$("#areacode option:eq(0)").prop("selected", true);
	$("#sigunguCode option:eq(0)").prop("selected", true);
	$('#card2').empty(); 
	$('#card').empty();
	dayDelete();
	dayReset();
	dayDelAll();
}
</script>

<script type="text/javascript">
function goPlanner(){
	if(${empty LOGINUSER}){
		swal({
			text: "로그인 후 이용 가능합니다.",
			buttons:{"확인":true,cancel:"취소"},
			}).then((value) => {
				if(value){
					location.href = "login.do";
				}
			});
		 
	}else{
		location.href = "planner?m_id=${LOGINUSER.m_id}";
	}
}
function goSupport(){
	if(${empty LOGINUSER}){
		swal({
			text: "로그인 후 이용 가능합니다.",
			buttons:{"확인":true,cancel:"취소"},
			}).then((value) => {
				if(value){
					location.href = "login.do";
				}
			});
	}else{
		location.href = "support.do?m_id=${LOGINUSER.m_id}";
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
function sweetAlert(text){
	swal({
		text: text,
		buttons:{"확인":true},
		})
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
			<!-- <script src="./assets/js/price-range.js"></script> -->
			<script src="./assets/js/animated.headline.js"></script>
			<script src="./assets/js/jquery.magnific-popup.js"></script>

			<!-- Nice-select, sticky -->
			<!-- <script src="./assets/js/jquery.nice-select.min.js"></script> -->
			<script src="./assets/js/jquery.sticky.js"></script>

			<!-- contact js -->
			<!-- <script src="./assets/js/contact.js"></script> -->
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