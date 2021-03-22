<%@ page contentType="text/html; charset=utf-8" import="odga.bt.domain.Review" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html class="no-js" lang="zxx">
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
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Odga.com</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <!-- CSS here -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
</head>
<style>
.nice-select{
	width: 100%;
	margin-bottom: 2%;
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
                                 <li class="login" style="width: 75%;padding: 1%;text-align: center;float:left;">                          
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
	 										<li style="float: right;width: 25%;">   
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
                            <h2>여행후기</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Hero End -->
        <!--================Blog Area =================-->
        <section class="blog_area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="blog_right_sidebar">
                            <aside class="single_sidebar_widget search_widget">
                                <div class="select-job-items1">
                                <form name="S" method="post" action="search">
                                    <select name="searchOption" id="searchOption">
                                    	<option value="all">전체에서 찾기</option>
                                        <option value="b_subject">제목으로 찾기</option>
                                        <option value="b_writer">아이디로 찾기</option>
                                        <option value="b_content">내용으로 찾기</option>
                                    </select>	               
	                                    <div class="form-group">
	                                        <div class="input-group mb-3">
	                                            <input type="text" class="form-control"  id="keyword" name="keyword" placeholder='검색어를 입력하세요..'
	                                                onfocus="this.placeholder = ''"
	                                                onblur="this.placeholder = '검색어를 입력하세요..'">
	                                            <div class="input-group-append">
	                                                <button class="btns" id="searchOk1" type="button"><i class="ti-search"></i></button>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
	                                        type="submit">검 색</button>
	                                </form>
                                </div>
                            </aside>
                            <aside class="single_sidebar_widget search_widget">
						<a onclick="goWrite()" class="genric-btn danger w-100 mb-10" style="line-height: 50px">새 글 쓰기</a>
							</aside>
		                     <aside class="single_sidebar_widget post_category_widget">
		                        <h4 class="widget_title">카테고리</h4>
		                        <ul class="list cat-list">
		                           <li>
		                              <a href="catgo?catgo=가족여행" class="d-flex">
		                                 <p>가족여행</p>
		                                 &nbsp;
		                                 <p style="letter-spacing: 2px;">(${reviewSidebar.family})</p>
		                              </a>
		                           </li>
		                           <li>
		                              <a href="catgo?catgo=혼자여행" class="d-flex">
		                                 <p>혼자여행</p>
		                                 &nbsp;
		                                 <p style="letter-spacing: 2px;">(${reviewSidebar.alone})</p>
		                              </a>
		                           </li>
		                           <li>
		                              <a href="catgo?catgo=커플여행" class="d-flex">
		                                 <p>커플여행</p>
		                                 &nbsp;
		                                 <p style="letter-spacing: 2px;">(${reviewSidebar.couple})</p>
		                              </a>
		                           </li>
		                           <li>
		                              <a href="catgo?catgo=우정여행" class="d-flex">
		                                 <p>우정여행</p>
		                                 &nbsp;
		                                 <p style="letter-spacing: 2px;">(${reviewSidebar.friend})</p>
		                              </a>
		                           </li>
		                           <li>
		                              <a href="catgo?catgo=패키지여행" class="d-flex">
		                                 <p>패키지여행</p>
		                                 &nbsp;
		                                 <p style="letter-spacing: 2px;">(${reviewSidebar.pack})</p>
		                              </a>
		                           </li>
		                        </ul>
		                     </aside>
		                     <aside class="single_sidebar_widget popular_post_widget">
		                        <h3 class="widget_title">최근 후기</h3>
		                        <c:forEach items="${reviewSidebar.recently}" end="4" var="recently">
		                        <div class="media post_item" style="width: auto; height: auto; overflow: hidden">
	 		                       <!-- <img src="assets/img/blog/single_blog_6.png" alt="post"> -->
		                           <div style="width: 80px; height: 80px;">
                                     <a id="review" onclick="goReviewDetail(${recently.b_id})" style ="cursor: pointer;">
                                        <img src="resources/upload/${recently.b_img}" style="width: 80px; height: 80px;" alt="post">
                                     </a>
	                                 </div>
	                                  <div class="media-body" style="width: 79%;">
	                                    <a id="review" onclick="goReviewDetail(${recently.b_id})" style ="cursor: pointer;">
	                                       <h3 style="text-overflow: ellipsis;overflow: hidden;box-sizing: border-box;width: 100%;white-space: nowrap;">${recently.b_subject}</h3>
	                                    </a>
                                    <p>${recently.b_rdate}</p>
                                 </div>
		                        </div>
		                        </c:forEach>
		                     </aside>
                        </div>
                    </div>
                    <div class="col-lg-8 mb-5 mb-lg-0">
                        <div class="blog_left_sidebar">
							<c:if test="${fn:length(review)==0 && (reviewSearch.count == 0 || reviewCatgo.count==0)}">
							     <div class="blog_details"><h2>게시글이 없습니다.</h2></div>
							</c:if>						
							<c:forEach items="${reviewlistResult.list}" var="review">
	                            <article class="blog_item">
	                            <a id="review" onclick="goReviewDetail(${review.b_id})" style ="cursor: pointer;">
	                                <div class="blog_item_img">
	                                    <img class="card-img rounded-0" src="resources/upload/${review.b_img}" style="max-height:500px;width:100%;" alt="">
	                                    <a class="blog_item_date">
	                                        <h3>${review.b_rdate}</h3>
	                                    </a>
	                                </div>
	                                <div class="blog_details">
	                                    <a class="d-inline-block" id="review" onclick="goReviewDetail(${review.b_id})" style ="cursor: pointer;">
	                                        <h2>${review.b_subject}</h2>
	                                    </a>
	                                    <p>${review.b_catgo}</p>
	                                    <ul class="blog-info-link">
	                                        <li><i class="fa fa-user"></i> ${review.b_writer}</li>
                                        	<li><i class="fa fa-comments"></i> ${review.b_reply}개</li>
	                                        <li><i class="fa fa-heart"></i> ${review.b_like}개</li>
	                                    </ul>
	                                </div>
	                                </a>
	                            </article>
							</c:forEach>
							<!-- 검색리스트 -->
							<c:choose>
								<c:when test="${reviewSearch.count == 0}">
								    <div class="blog_details"><h2>검색 결과가  없습니다.</h2></div>
								</c:when>
								<c:when test="${reviewSearch.count >= 1}">
									 <div class="blog_details"><h2>${reviewSearch.count}개의 검색 결과가 있습니다.</h2></div>									   
									<c:forEach items="${reviewSearch.list}" var="search">
			                            <article class="blog_item">
			                            <a onclick="goReviewDetail(${search.b_id})" style ="cursor: pointer;">
			                                <div class="blog_item_img">
			                                    <img class="card-img rounded-0" src="resources/upload/${search.b_img}" style="max-height:500px;width:100%;" alt="">
			                                    <a class="blog_item_date">
			                                        <h3>${search.b_rdate}</h3>
			                                    </a>
			                                </div>			
			                                <div class="blog_details">
			                                    <a class="d-inline-block" onclick="goReviewDetail(${search.b_id})" style ="cursor: pointer;">
			                                        <h2>${search.b_subject}</h2>
			                                    </a>
			                                    <p>${search.b_catgo}</p>
			                                    <ul class="blog-info-link">
			                                        <li><i class="fa fa-user"></i> ${search.b_writer}</li>
		                                        	<li><i class="fa fa-comments"></i> ${review.b_reply}개</li>
			                                        <li><i class="fa fa-heart"></i> ${search.b_like}개</li>
			                                    </ul>
			                                </div>
			                                </a>
			                            </article>
									</c:forEach>
								</c:when>
							</c:choose>
							<!--카테고리리스트 -->
							<c:choose>
								<c:when test="${reviewCatgo.count == 0}">
								    <div class="blog_details"><h2>해당 결과가  없습니다.</h2></div>
								</c:when>
								<c:when test="${reviewCatgo.count >=1}">
									 <div class="blog_details"><h2>${reviewCatgo.count}개의 후기가 있습니다.</h2></div>									   
									<c:forEach items="${reviewCatgo.list}" var="cat">
			                            <article class="blog_item">
			                            <a onclick="goReviewDetail(${cat.b_id})" style ="cursor: pointer;">
			                                <div class="blog_item_img">
			                                    <img class="card-img rounded-0" src="resources/upload/${cat.b_img}" style="max-height:500px;width:100%;" alt="">
			                                    <a class="blog_item_date">
			                                        <h3>${cat.b_rdate}</h3>
			                                    </a>
			                                </div>			
			                                <div class="blog_details">
			                                    <a class="d-inline-block" onclick="goReviewDetail(${cat.b_id})" style ="cursor: pointer;">
			                                        <h2>${cat.b_subject}</h2>
			                                    </a>
			                                    <p>${cat.b_catgo}</p>
			                                    <ul class="blog-info-link">
			                                        <li><i class="fa fa-user"></i> ${cat.b_writer}</li>
		                                        	<li><i class="fa fa-comments"></i> ${review.b_reply}개</li>
			                                        <li><i class="fa fa-heart"></i> ${cat.b_like}개</li>
			                                    </ul>
			                                </div>
			                                </a>
			                            </article>
									</c:forEach>
								</c:when>
							</c:choose>
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
                                     <c:when test="${reviewSearch.keyword != null}">
                                       <c:choose>
                                              <c:when test="${reviewlistResult.cp eq 1}">
                                                <li class="page-item disabled" style="display:none">
                                                 <a class="page-link" style="display:none" href="review.do?cp=${reviewlistResult.prevPage}&keyword=${keyword}&catgo=${catgo}"><span class="ti-angle-left" style="display:none"></span></a>
                                                 </li>
                                              </c:when>
                                             <c:otherwise>
                                           <li class="page-item" style="display:none">
                                           <a class="page-link" style="display:none" href="review.do?cp=${reviewlistResult.prevPage}&keyword=${keyword}&catgo=${catgo}"><span class="ti-angle-left" style="display:none"></span></a>
                                           </li>
                                        </c:otherwise>
                                        </c:choose>
                                     </c:when>
                                  <c:otherwise>
                                        <c:choose>
                                              <c:when test="${reviewlistResult.cp eq 1}">
                                                <li class="page-item disabled">
                                                 <a class="page-link" href="review.do?cp=${reviewlistResult.prevPage}"><span class="ti-angle-left"></span></a>
                                                 </li>
                                              </c:when>
                                             <c:otherwise>
                                           <li class="page-item">
                                           <a class="page-link" href="review.do?cp=${reviewlistResult.prevPage}"><span class="ti-angle-left"></span></a>
                                           </li>
                                        </c:otherwise>
                                        </c:choose>
                                  </c:otherwise>
                                  </c:choose>
                                    <!-- 이전 페이지 END -->       
                                           
                                  <c:choose>
                                     <c:when test="${reviewSearch.keyword != null}">
                                              <c:forEach begin="${reviewlistResult.cp}" end="${reviewlistResult.ps}" var="i">
                                                 <li class="page-item active" style="display:none"><a class="page-link" style="display:none" href="review.do?cp=${i}&keyword=${keyword}&searchOption=${searchOption}">
                                                  <c:choose>
                                              <c:when test="${i==reviewlistResult.cp}">
                                                 <span style="color:red;font-weight:bold; display:none">${i}</span>
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
                                              <c:forEach begin="${reviewlistResult.startPage}" end="${reviewlistResult.endPage}" var="i">
                                                 <li class="page-item active"><a class="page-link" href="review.do?cp=${i}">
                                                  <c:choose>
                                              <c:when test="${i==reviewlistResult.cp}">
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
                                           <c:when test="${reviewSearch.keyword != null}">
                                                   <li class="page-item" style="display:none" ><a class="page-link" style="display:none" href="review.do?cp=${reviewlistResult.nextPage}&keyword=${keyword}&catgo=${catgo}">
                                                   <span class="ti-angle-right" style="display:none"></span></a></li>
                                                </c:when>
                                             <c:otherwise>
                                                 <c:choose>
                                                    <c:when test="${reviewlistResult.cp eq reviewlistResult.endPage}">
                                                    <li class="page-item disabled"><a class="page-link" href="review.do?cp=${reviewlistResult.nextPage}">
                                                    <span class="ti-angle-right"></span></a></li>
                                                    </c:when>
                                                 <c:otherwise>
                                                    <li class="page-item"><a class="page-link" href="review.do?cp=${reviewlistResult.nextPage}">
                                                    <span class="ti-angle-right"></span></a></li>
                                                 </c:otherwise>
                                                 </c:choose>
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
                    </div>
                </div>
            </div>
        </section>
    </main>
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
										<li><a href="https://github.com/yumgit23">허유민</a></li>
										<li><a href="https://github.com/suadeomgit">권성환</a></li>
										<li><a href="https://github.com/DobbyisFree1">박종범</a></li>
										<li><a href="https://github.com/dragongit94">이민용</a></li>
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
										<li><a href="use.do">이용방법</a>
										<li><a onclick="goPlanner()">나의 여행 만들기</a></li>
										<li><a onclick="goSupport()">문의하기</a></li>
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
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>
    	<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="https://ajax.googlepis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<!-- JS here -->
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
function goWrite(){
	if(${empty LOGINUSER}){
			salert();
	}else{
		location.href = "write";
	}
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
function goReviewDetail(b_id){
	if(${empty LOGINUSER}){
		salert();
	}else{
		location.href = "review_details.do?b_id="+b_id+"&m_id=${LOGINUSER.m_id}";
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
	
		<!-- All JS Custom Plugins Link Here here -->
        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
		<!-- Jquery, Popper, Bootstrap -->

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
		
		<!-- Nice-select, sticky -->
        <script src="./assets/js/jquery.nice-select.min.js"></script>
		<script src="./assets/js/jquery.sticky.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>

        <!-- contact js -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>
        
        <script language="javascript">
	       function f(select){
	           //var el = document.getElementById("psId");
	           var ps = select.value;
	           //alert("ps : " + ps);
	           location.href="review.do?ps="+ps;
	       }
    	</script>
    	
    	
    	
        
</body>
</html>