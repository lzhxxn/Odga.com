<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
  <meta charset="utf-8" />
  <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Odga.com
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link rel="stylesheet" href="assets/css/styleReview.css">
  <link href="../assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
  <link href="../assets/css/pointColor.css" rel="stylesheet" />
</head>
<style>
.swal-button--확인:not([disabled]):hover{background-color:#ff5235}.swal-button--확인{background-color:#ff3d1c}.swal-button--확인:hover{background-color:#ff5235}.swal-button--삭제:not([disabled]):hover{background-color:#ff5235}.swal-button--삭제{background-color:#ff3d1c}.swal-button--삭제:hover{background-color:#ff5235}.swal-button--홈으로{color:#555;background-color:#efefef}.swal-button--홈으로:not([disabled]):hover{background-color:#e8e8e8}.swal-button--홈으로:active{background-color:#d7d7d7}.swal-button--홈으로:focus{box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(116,136,150,.29)}.swal-button--로그인{background-color:#ff3d1c}.swal-button--로그인:not([disabled]):hover{background-color:#ff5235}.swal-button--로그인:active{background-color:#ff5235}
.nav-link{cursor:pointer}
</style>
<body class="dark-edition">
  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="black" data-image="../assets/img/gallery/1.png">
      <div class="logo"><a href="index.do" class="simple-text logo-normal">
     <img src="assets/img/logo/logo_b.png" style="position:relative; max-width: 170px;"></a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="member.do" >
              <i class="material-icons">person</i>
              <p>내 정보</p>
            </a>
          </li>
          <li class="nav-item " >
            <a class="nav-link" name="goPlan" onclick="goOthers(name)">
              <i class="material-icons">edit_location_alt</i>
              <p>나의 플래너</p>
            </a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" name="goReview" onclick="goOthers(name)">
              <i class="material-icons">library_books</i>
              <p>나의 여행후기</p>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" name="goLike" onclick="goOthers(name)">
              <i class="material-icons">favorite</i>
              <p>나의 좋아요</p>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" name="goSupport" onclick="goOthers(name)">
              <i class="material-icons">content_paste</i>
              <p>나의 문의내역</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="leaveM">
              <i class="material-icons">no_accounts</i>
              <p>회원탈퇴</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" onclick="logout()">
            <i class="material-icons">power_settings_new</i>        
              <p style="margin-left: 25%;color: #2ff275;font-weight: bold;">로그아웃</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " id="navigation-example">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="javascript:void(0)"><i class="material-icons">library_books</i>  나의 여행후기</a>
          </div>        
        </div>
      </nav>
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary" style="width:99%;">
                  <h4 class="card-title ">나의 여행후기</h4>
                  <p class="card-category"> 당신의 여행후기를 확인하세요! </p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                          <c:if test="${empty review}">
                      <tr>
                        <td align='center' colspan="5"> 리뷰가 존재하지 않습니다. </td>
                     </tr>
                  </c:if>
                        <c:forEach items="${review}" var="review">
                            <article class="blog_item" style="position:absoulte; width:500px; float: left;">
                                <div class="blog_item_img">
                                     <img src="resources/upload/${ review.b_img }" style="height:350px;width:466px;">
                                   <a class="blog_item_date">
                                        <h3>${review.b_rdate}</h3>
                                    </a>
                                </div>
                                <div class="blog_details" style="height:250px; width:466px; background-color: #FFFFF0;">
                                    <a class="d-inline-block" onclick="goDetail(${review.b_id},${LOGINUSER.m_id})" style="cursor:pointer">
                                        <h2 style="line-height: 1.2; color: #10285d; height: 2.3em; text-align: left; word-wrap: break-word; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">${review.b_subject}</h2>
                                    </a>
                                    <p>${review.b_catgo}</p>
                                    <ul class="blog-info-link">
                                         <li><i class="fa fa-comments"></i> ${review.b_reply} 개</li>
                                        <li><i class="fa fa-heart"></i> ${review.b_like} 개</li>
                              <li><a href="update.do?b_id=${review.b_id}" style="cursor: pointer;">수정</a></li>
                              <li><a onclick="delReview(${review.b_id},${review.m_id})" style="cursor: pointer;">삭제</a></li>
                                    </ul>
                                </div>
                            </article>
                        </c:forEach> 
                    </table>
                  </div>
                </div>
              </div>
            </div> 
           </div>
          </div>
         </div>
            <footer class="footer" style="width: 100%;">
		        <div class="container-fluid">
		          <nav class="float-left">
		            <ul>
		            </ul>
		          </nav>
		          <div class="copyright float-right" id="date">
		            ODGA.com <i class="material-icons">favorite</i>Made by
		            <a href="" target="_blank"></a> 
		            <a href="https://github.com/lzhxxn" target="_blank">JH</a>
		         	<a href="https://github.com/dragongit94" target="_blank">MY</a>
		        	<a href="https://github.com/yumgit23" target="_blank">YM</a>
		         	<a href="https://github.com/DobbyisFree1" target="_blank">JB</a>
		         	<a href="https://github.com/suadeomgit" target="_blank">SH</a>
		          </div>
		        </div>
		      </footer>  
      <script>
        const x = new Date().getFullYear();
        let date = document.getElementById('date');
        date.innerHTML = '&copy; ' + x + date.innerHTML;
      </script>
      </div>
    </div>
  <!--   Core JS Files   -->
  <script src="../assets/js/core/jquery.min.js"></script>
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap-material-design.min.js"></script>
  <script src="https://unpkg.com/default-passive-events"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Place this tag in your head or just before your close body tag. -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chartist JS -->
  <script src="../assets/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="../assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/material-dashboard.js?v=2.1.0"></script>
  <!-- Material Dashboard DEMO methods, don't include it in your project! -->
  <script src="../assets/demo/demo.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script type="text/javascript">
  function goOthers(name){
		if(${LOGINUSER.m_id eq null}){
			swal({
				title: "세션만료 !",
				text: "로그인 후 이용 가능합니다.",
				buttons:{"로그인":"로그인","홈으로":"홈으로"},
				}).then((value) => {
					if(value==="로그인"){
						location.href = "login.do";
					}else if (value==="홈으로"){
						location.href = "index.do";
					}
				});
			}else{
				if(name=="goPlan"){
					location.href = "member_plan.do?m_id=${LOGINUSER.m_id}";
				}else if(name=="goReview"){
					location.href = "member_review.do?m_id=${LOGINUSER.m_id}";
				}else if(name=="goLike"){
					location.href ="myLike.do?m_id=${LOGINUSER.m_id}";
				}else if(name=="goSupport"){
					location.href ="support_mlist.do?m_id=${LOGINUSER.m_id}";
				}else if(name=="goMember"){
					location.href ="member.do";
				}			
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
  function goDetail(b_id,m_id){
	  if(${LOGINUSER.m_id eq null}){
			swal({
				title: "세션만료 !",
				text: "로그인 후 이용 가능합니다.",
				buttons:{"로그인":"로그인","홈으로":"홈으로"},
				}).then((value) => {
					if(value==="로그인"){
						location.href = "login.do";
					}else if (value==="홈으로"){
						location.href = "index.do";
					}
				});
			}else{			
					location.href ="review_details?b_id="+b_id+"&m_id="+m_id;
			}
  }
  function delReview(b_id,m_id){
	  swal({
			text: "해당 글을 삭제 하시겠습니까 ?",
			buttons:{"삭제":true,cancel:"취소"},
			}).then((value) => {
				if(value){
					 swal({
							text: "삭제가 완료 되었습니다.",
							buttons:{"확인":true},
							}).then((value) => {
								if(value){
									location.href="delete.do?b_id="+b_id+"&m_id="+m_id;
								}
							});				
				}
			});
	  
  }
  </script>
</body>

</html>