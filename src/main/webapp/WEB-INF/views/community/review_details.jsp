<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html class="no-js" lang="zxx">
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
      <link rel="stylesheet" href="assets/css/slick.css">
      <link rel="stylesheet" href="assets/css/nice-select.css">
      <link rel="stylesheet" href="assets/css/style.css">
</head>
<style>
.like{
	color:#dc3545;
}
.swal-button:not([disabled]):hover {
    background-color: #ff3d1c;
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
.nice-select{
	width: 100%;
	margin-bottom: 2%;
}
</style>
<body>
<!--    Preloader Start-->
   <div id="preloader-active">
      <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
               <div class="preloader-circle"></div>
               <div class="preloader-img pere-text">
                  <img src="assets/img/logo/loder1_d.jpg" alt="" >
               </div>
            </div>
      </div>
   </div>
   <!--Preloader Start -->
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
                           <h2>여행 후기</h2>
                     </div>
                  </div>
               </div>
         </div>
      </div>
      <c:set value="${reviewDetail.review}" var="review"/>
      <c:set value="${reviewDetail.reply}" var="reply"/>
      <c:set value="${reviewDetail.countReply}" var="countReply"/>
      <c:set value="${reviewDetail.writerInfo}" var="writerInfo"/>
      <!--Hero End -->
      <!--================Blog Area =================-->
	<div class="whole-wrap">
	<div class="container box_1170">
      <section class="blog_area single-post-area section-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-8 posts-list">
                  <div class="single-post">
                     <div class="feature-img">
                       <img class="img-fluid" src="resources/upload/${review.b_img}" style="width:100%;" alt="">
                     </div>
                     <div class="blog_details">
                        <h2>${ review.b_subject }</h2>
                        <ul class="blog-info-link mt-3 mb-4">
                           <li><i class="fa fa-user"></i>${ review.b_writer }</li>
                           <li><i class="fa fa-comments"></i> ${countReply} 개</li>
                           <li><i class="fa fa-heart" id="like2"> ${ review.b_like }</i>개</li>
                        </ul>
                        <p>${ review.b_content }</p>
                     </div>
                  </div>
                  <div class="navigation-top">
                     <div class="d-sm-flex justify-content-between text-center">
                        <p class="like-info"><span class="align-middle" >
                        <c:choose>
	                        <c:when test="${likeflag==1}">
	                        	<li id="likeBtn" onclick="like(${review.b_id});setColor('likeBtn', '#dc3545')" class="fa fa-heart like" style="font-size:23px;margin-left: -11%;margin-right: -3%;"></li></span>
	                        	<li id="like"style="margin-left: -7%;margin-right: -10%;">${review.b_like} </li>개의 좋아요</p>
	                        </c:when>
	                        <c:otherwise>
	                        	<li id="likeBtn" onclick="like(${review.b_id});setColor('likeBtn', '#10285d')" class="fa fa-heart" style="font-size:23px;margin-left: -11%;margin-right: -3%;"></li></span>
	                        	<li id="like"style="margin-left: -7%;margin-right: -10%;">${review.b_like} </li>개의 좋아요</p>
	                       </c:otherwise>
                       </c:choose>
                        <div class="col-sm-4 text-center my-2 my-sm-0">
                        </div>
                        <ul class="social-icons">                          
                           <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                           <li><a href="#"><i class="fab fa-dribbble"></i></a></li>
                           <li><a href="#"><i class="fab fa-behance"></i></a></li>
                            <li><div class="fb-share-button" data-href="https://developers.facebook.com/docs/plugins/" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http://localhost:8080/review_details?b_id=${review.b_id}&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore"></div></i></a></li>
                        </ul>
                     </div>
                     <div class="navigation-area">
                        <div class="row">
                        <div
                             class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">                              
                              <div class="thumb">
                                 <c:choose>
                                    <c:when test="${ empty getOtherReview.reviewPre }">
                                       <a href="#">
                                    </c:when>
                                    <c:otherwise>
                                       <a href="review_details?b_id=${getOtherReview.reviewPre.b_id}&m_id=${LOGINUSER.m_id}">
                                  </c:otherwise>
                                 </c:choose>                              
                                 <c:choose>
                                    <c:when test="${getOtherReview.reviewPre.b_img == null}">
                                       <img class="img-fluid" src="assets/img/insteadimg.png" alt="" style="width:60px;height:60px;background: white;">
                                    </c:when>
                                    <c:otherwise>
                                       <img class="img-fluid" src="resources/upload/${getOtherReview.reviewPre.b_img}" alt="" style="width:60px;height:60px;">
                                    </c:otherwise>
                                 </c:choose>
                                 </a>
                              </div>
                              <div class="arrow">
                                 <c:choose>
                                    <c:when test="${ empty getOtherReview.reviewPre }">
                                       <a href="#"></a>
                                    </c:when>
                                    <c:otherwise>
                                       <a href="review_details?b_id=${getOtherReview.reviewPre.b_id}&m_id=${LOGINUSER.m_id}"></a>
                                  </c:otherwise>
                                 </c:choose>
                                 <span class="lnr text-white ti-arrow-left"></span>
                              </div>
                              <div class="detials">
                                 <p>이전 글</p>
                                 <c:choose>
                                    <c:when test="${ empty getOtherReview.reviewPre }">
                                       <a href="#">
                                          <h4>이전글이 없습니다.</h4>
                                       </a>
                                    </c:when>
                                    <c:otherwise>
                                       <a href="review_details?b_id=${getOtherReview.reviewPre.b_id}&m_id=${LOGINUSER.m_id}">
                                       <h4>${getOtherReview.reviewPre.b_subject}</h4>
                                    </c:otherwise>
                                 </c:choose>
                              </div>                             
                           </div>
                           <div
                              class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                              <div class="detials">
                                 <p>다음 글</p>
                                 <c:choose>
                                    <c:when test="${ empty getOtherReview.reviewNext }">
                                       <a href="#">
                                          <h4>다음글이 없습니다.</h4>
                                       </a>
                                    </c:when>
                                    <c:otherwise>
                                       <a href="review_details?b_id=${getOtherReview.reviewNext.b_id}&m_id=${LOGINUSER.m_id}">
                                       <h4>${getOtherReview.reviewNext.b_subject}</h4>
                                    </c:otherwise>
                                 </c:choose>
                              </div>
                              <div class="arrow">
                                 <c:choose>
                                    <c:when test="${ empty getOtherReview.reviewNext }">
                                       <a href="#"></a>
                                    </c:when>
                                    <c:otherwise>
                                       <a href="review_details?b_id=${getOtherReview.reviewNext.b_id}&m_id=${LOGINUSER.m_id}"></a>
                                  </c:otherwise>
                                 </c:choose>
                                 <span class="lnr text-white ti-arrow-right"></span>
                              </div>
                              <div class="thumb">
                                 <c:choose>
                                    <c:when test="${ empty getOtherReview.reviewNext }">
                                       <a href="#">
                                    </c:when>
                                    <c:otherwise>
                                       <a href="review_details?b_id=${getOtherReview.reviewNext.b_id}&m_id=${LOGINUSER.m_id}">
                                  </c:otherwise>
                                 </c:choose>                              
                                 <c:choose>
                                    <c:when test="${getOtherReview.reviewNext.b_img == null}">
                                       <img class="img-fluid" src="assets/img/insteadimg.png" alt="" style="width:60px;height:60px;background: white;">
                                    </c:when>
                                    <c:otherwise>
                                       <img class="img-fluid" src="resources/upload/${getOtherReview.reviewNext.b_img}" alt="" style="width:60px;height:60px;">
                                    </c:otherwise>
                                 </c:choose>
                                 </a>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="blog-author">
                     <div class="media align-items-center">
                           <img class="img-fluid" src="assets/img/profile/${writerInfo.m_fname}" alt="">            
                        <div class="media-body">
                           <a href="#">
                              <h4>${writerInfo.m_name}</h4>
                           </a>
                           <c:choose>                           
	                           <c:when test="${writerInfo.m_about==null}">
	                           		<p>안녕하세요 !</p>
	                           </c:when>
	                           <c:otherwise>
	                           		<p>${writerInfo.m_about}</p>
	                           </c:otherwise>
                           </c:choose>                      
                        </div>
                     </div>
                  </div>
                  <div class="comments-area" style="overflow: auto; max-height: 30rem;">
                     <h4>${countReply} 개의 댓글</h4>
                     <c:if test="${empty reply}">
                     	<div class="comment-list">
	                        <div class="single-comment justify-content-between d-flex">
	                           <div class="user justify-content-between d-flex">                              
	                              <div class="desc">
	                                 <p class="comment">
	                                    	댓글이 하나도 없어요.
	                                 </p>                                
	                              </div>
	                           </div>
	                        </div>
	                     </div>
                     </c:if>
                     <c:forEach items="${reply}" var="reply">
	                     <div class="comment-list">
	                        <div class="single-comment justify-content-between d-flex">
	                           <div class="user justify-content-between d-flex">
	                              <div class="thumb">	                                 
				                          <img class="img-fluid" src="assets/img/profile/${reply.re_fname}" alt="" style="height: 100%;">       
	                              </div>
	                              <div class="desc">
	                                 <p class="comment">
	                                    ${reply.re_content}
	                                 </p>
	                                 <div class="d-flex justify-content-between">
	                                    <div class="d-flex align-items-center">
	                                       <h5>
	                                          <a href="#">${reply.re_writer}</a>
	                                       </h5>
	                                       <p class="date">${reply.re_rdate}</p>
	                                    </div>
	                                    <div class="reply-btn">
	                                    <c:if test="${writerInfo.m_id == LOGINUSER.m_id}"> <!-- 세션 m_id받기 -->
	                                       <a href="del_re?re_id=${reply.re_id}&b_id=${review.b_id}" class="btn-reply text-uppercase">삭제</a>
	                                    </c:if>
	                                    </div>
	                                 </div>
	                              </div>
	                           </div>
	                        </div>
	                     </div>
                     </c:forEach>                   
                  </div>
                  <div class="comment-form">
                     <h4>댓글 남기기</h4>
                     <form class="form-contact comment_form" method="post" action="write_re" id="commentForm">
                     <input type="hidden" name="m_id" value="${LOGINUSER.m_id}"/>
                     <input type="hidden" name="b_id" value="${review.b_id}"/>          
                     <input type="hidden" name="re_fname" value="${LOGINUSER.m_fname}"/>
                        <div class="row">
                           <div class="col-12">
                              <div class="form-group">
                                 <textarea class="form-control w-100" name="re_content" id="re_content" cols="30" rows="9"
                                    placeholder="내용을 입력해주세요"></textarea>
                              </div>
                           </div>
                           <div class="col-sm-6">
                              <div class="form-group">
                                 <c:choose>
                                     <c:when test="${ LOGINUSER.m_name != null }">
                                       <input type="text" name="re_writer" value='${LOGINUSER.m_name}' class="form-control" id="re_writer" readonly/>
                                   </c:when>
                                     <c:otherwise>
                                       <input class="form-control" name="re_writer" id="re_writer" type="text" placeholder="로그인을 해주세요" readonly/>
                                   </c:otherwise>
                                 </c:choose>
                              </div>
                           </div>
                        </div>
                        <div class="form-group">
                           <button type="submit" class="button button-contactForm btn_1 boxed-btn">작성하기</button>
                        </div>
                     </form>
                  </div>
               </div>
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
						<a href="write" class="genric-btn danger w-100 mb-10" style="line-height: 50px">새 글 쓰기</a>
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
            </div>
         </div>
      </section>
      <!--================ Blog Area end =================-->
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
										<li><a href="https://github.com/yumgit23">허유민</a></li>
										<li><a href="https://github.com/dragongit94">이민용</a></li>
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
	<script type="text/javascript">
	var clickLike = ${likeflag};
	var m_id =${LOGINUSER.m_id};
		function like(b_id){						
			$.ajax({
				   url: "likeUp", 
				   type: "GET",
				   data: { b_id: b_id,m_id:m_id},
				   success: function(responseData){
		           var html = "";
				   var b_like = responseData;
						  html += " "+b_like+"";           
					  $("#like").empty();
					  $("#like").html(html);
					  $("#like2").empty();
					  $("#like2").html(html);
				   }
			   });
			if(clickLike==0){
				clickLike = 1;
			}else{
				clickLike = 0;
			}
		  }
		 var count=${likeflag};
		function setColor(likeBtn, color){
		    var property = document.getElementById(likeBtn);
 		    if (count == 1){ //깜장
		        property.style.color = "#212529";
		        count=0;        
		    }
		    else if(count == 0){ //빨강
		        property.style.color = "#dc3545";
		        count=1;
		    }
		}
	</script>	
</body>
</html>