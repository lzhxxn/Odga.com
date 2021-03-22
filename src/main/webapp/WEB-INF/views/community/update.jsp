<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html class="no-js" lang="zxx">
<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <title>Odga.com </title>
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
.swal-button--확인 {
 background-color:#ff3d1c
}
.swal-button--확인:not([disabled]):hover {
 background-color:#ff5235
}
.swal-button--확인:active {
 background-color:#ff5235
}
.form-select .nice-select{
   padding-left: 18px;
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
                        <h2>여행후기</h2>
                  </div>
                  </div>
               </div>
         </div>
      </div>
      <!--Hero End -->
      <!-- Start Sample Area -->
      
            <div class="section-top-border">
               <div class="row justify-content-center">
                  <div class="col-lg-10 col-md-8" align="center">
                     <h3 class="mb-30">후기수정</h3>
                     <form action="update.do" method="post" enctype="multipart/form-data" name="reviewFrm">
                        <div>
                           <input type="hidden" name="m_id" value='${LOGINUSER.m_id}' readonly />
                        </div>
                        <div class="mt-10 mb-20">
                           <input type="text" name="b_writer" value='${LOGINUSER.m_name}' class="single-input" style="width:782px;" readonly />
                        </div>
                        <div>
                           <input type="hidden" name="b_id" value='${review.b_id}' readonly />
                        </div>
                        <div class="mt-10 mb-20">
                           <input name="b_subject" type="text" placeholder="글제목 (최대 50자)"
                           onfocus="this.placeholder = ''" onblur="this.placeholder = 글제목 (최대 50자)'" required
                           class="single-input" style="width:782px;" value="${ review.b_subject }" maxlength="50">
                        </div>                  
                        <div class="input-group-icon mt-10 mb-20" style="width:782px;" >
                           <div class="form-select" id="default-select" >
                              <select name="b_catgo" style="display: none;padding-left: 21px;" >
                                 <c:choose>
                                    <c:when test="${ review.b_catgo == '가족여행' }">
                                       <option value="기타">여행 테마를 골라주세요</option>
                                       <option value="가족여행" selected="selected">가족여행</option>
                                       <option value="혼자여행">혼자여행</option>
                                       <option value="커플여행">커플여행</option>
                                       <option value="우정여행">우정여행</option>
                                       <option value="패키지여행">패키지여행</option>
                                    </c:when>
                                    <c:when test="${ review.b_catgo == '혼자여행' }">
                                       <option value="기타">여행 테마를 골라주세요</option>
                                       <option value="가족여행">가족여행</option>
                                       <option value="혼자여행" selected="selected">혼자여행</option>
                                       <option value="커플여행">커플여행</option>
                                       <option value="우정여행">우정여행</option>
                                       <option value="패키지여행">패키지여행</option>
                                    </c:when>
                                    <c:when test="${ review.b_catgo == '커플여행' }">
                                       <option value="기타">여행 테마를 골라주세요</option>
                                       <option value="가족여행">가족여행</option>
                                       <option value="혼자여행">혼자여행</option>
                                       <option value="커플여행" selected="selected">커플여행</option>
                                       <option value="우정여행">우정여행</option>
                                       <option value="패키지여행">패키지여행</option>
                                    </c:when>
                                    <c:when test="${ review.b_catgo == '우정여행' }">
                                       <option value="기타">여행 테마를 골라주세요</option>
                                       <option value="가족여행">가족여행</option>
                                       <option value="혼자여행">혼자여행</option>
                                       <option value="커플여행">커플여행</option>
                                       <option value="우정여행" selected="selected">우정여행</option>
                                       <option value="패키지여행">패키지여행</option>
                                    </c:when>
                                    <c:when test="${ review.b_catgo == '패키지여행' }">
                                       <option value="기타">여행 테마를 골라주세요</option>
                                       <option value="가족여행">가족여행</option>
                                       <option value="혼자여행">혼자여행</option>
                                       <option value="커플여행">커플여행</option>
                                       <option value="우정여행">우정여행</option>
                                       <option value="패키지여행" selected="selected">패키지여행</option>
                                    </c:when>
                                    <c:otherwise>
                                       <option value="기타">여행 테마를 골라주세요</option>
                                       <option value="가족여행">가족여행</option>
                                       <option value="혼자여행">혼자여행</option>
                                       <option value="커플여행">커플여행</option>
                                       <option value="우정여행">우정여행</option>
                                       <option value="패키지여행">패키지여행</option>
                                    </c:otherwise>
                                 </c:choose>
                              </select>
                           </div>
                        </div>   
                        <div class="mt-10 mb-20" style="width: 782px;">
                           <label for="mainfile" class="genric-btn default" style="width:21%;">메인이미지 선택</label><input id="mainfile" name="file" type="file" class="genric-btn default" style="width:78%;text-align:left;" accept=".jpg,.jpeg,.png" ><br> <!-- Choose File -->
                        </div>   
                        <div class="justify-content-center" style="width:782px;">
                           <textarea name="b_content" id="ir1" rows="20" style="width: 780px;">${ review.b_content }</textarea>
                        </div>
                        <div class="form-group mt-3">
                           <div>
                                      <input type="button" id="submitBtn" class="btn btn-sm btn-primary" value="저장" >
                                   </div>
                               </div>
                     </form>
                  </div>
               </div>
            </div>
      <!-- End Align Area -->
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
                              <li><a href="https://github.com/suadeomgit">권성환</a></li>
                              <li><a href="https://github.com/lzhxxn">이지훈</a></li>
                              <li><a href="https://github.com/yumgit23">허유민</a></li>
                              <li><a href="https://github.com/DobbyisFree1">박종범</a></li>
                              <li><a href="https://github.com/dragongit94">이민용</a></li>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
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
      text: "여행 후기를 저장하시겠습니까 ?",
      buttons:{"확인":true},
      }).then((value) => {
         if(value){
            document.reviewFrm.submit();
         }
      });
}
</script>
<!-- JS here -->   
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
      
      <script type="text/javascript" src="./se2/js/HuskyEZCreator.js" charset="utf-8"></script>
      
      <script type="text/javascript">
         $(document).ready(function(){
            var oEditors = [];
            nhn.husky.EZCreator.createInIFrame({
                oAppRef: oEditors,
                elPlaceHolder: "ir1",
                sSkinURI: "/se2/SmartEditor2Skin.html",
                fCreator: "createSEditor2"
            });
            
            $(".btn").on("click", function() {
               oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
               var value = document.getElementById("ir1").value;
               console.log(value);
            });            
         });
         // 필수값 Check 
         function validation(){ 
            var contents = $.trim(oEditors[0].getContents()); 
            if(contents === '<p>&bnsp;</p>' || contents === ''){ // 기본적으로 아무것도 입력하지 않아도 값이 입력되어 있음. 
               alert("내용을 입력하세요."); 
               oEditors.getById['ir1'].exec('FOCUS');
               return false; 
            } 
            return true; 
         }

      </script>
      
      <script type="text/javascript">   
      function get_query(){
          var url = document.location.href;
          var qs = url.substring(url.indexOf('?') + 1).split('&');
          for(var i = 0, result = {}; i < qs.length; i++){
              qs[i] = qs[i].split('=');
              result[qs[i][0]] = decodeURIComponent(qs[i][1]);
          }
          return result;
      }
      </script>      
</body>
</html>