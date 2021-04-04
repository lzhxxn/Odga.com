<%@page contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.ico">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Odga.com
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="../assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
  <link href="../assets/css/pointColor.css" rel="stylesheet" />
  <link rel="stylesheet" href="assets/css/styleReview.css">
</head>

<style>
.listing_th{font-weight: bold;border-bottom: 2px solid;width: 112.2%;display: inline-block;padding-bottom: 1%;}.listing_td{padding-top: 2%;}
.swal-button--홈으로{color:#555;background-color:#efefef}.swal-button--홈으로:not([disabled]):hover{background-color:#e8e8e8}.swal-button--홈으로:active{background-color:#d7d7d7}.swal-button--홈으로:focus{box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(116,136,150,.29)}.swal-button--로그인{background-color:#ff3d1c}.swal-button--로그인:not([disabled]):hover{background-color:#ff5235}.swal-button--로그인:active{background-color:#ff5235}.swal-button--확인{background-color:#ff3d1c}.swal-button--확인:not([disabled]):hover{background-color:#ff5235}.swal-button--확인:active{background-color:#ff5235}
.nav-link{cursor:pointer}
</style>
<body class="dark-edition">
  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="black" data-image="../assets/img/gallery/1.png">
     <div class="logo"><a href="index.do" class="simple-text logo-normal">
          <img src="assets/img/logo/logo_b.png" alt="" style="max-width: 170px;">
        </a></div>
        <c:choose>
	        <c:when test="${LOGINUSER.m_verify eq 9}">
		      <div class="sidebar-wrapper">
		        <ul class="nav">
		          <li class="nav-item">
		            <a class="nav-link" href="./dashboard.do">
		              <i class="material-icons">dashboard</i>
		              <p>대시보드</p>
		            </a>
		          </li>
		          <li class="nav-item ">
		            <a class="nav-link" href="./admin_info.do">
		              <i class="material-icons">person</i>
		              <p>관리자 정보</p>
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="./memberList.do">
		              <i class="material-icons">groups</i>
		              <p>회원 리스트</p>
		            </a>
		          </li>
		          <li class="nav-item active">
		            <a class="nav-link" href="./support_list.do">
		              <i class="material-icons">content_paste</i>
		              <p>문의글 리스트</p>
		            </a>
		          </li>
		          <li class="nav-item ">
		            <a class="nav-link" onclick="logout()">
		            <i class="material-icons">power_settings_new</i>             
		              <p style="margin-left: 25%;color: #2ff275;;font-weight: bold;">로그아웃</p>
		            </a>
		          </li>
		        </ul>
		      </div>
	      </c:when>
	      <c:otherwise>
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
		          <li class="nav-item ">
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
		          <li class="nav-item active">
		            <a class="nav-link" name="goSupport" onclick="goOthers(name)">
		              <i class="material-icons">content_paste</i>
		              <p>나의 문의내역</p>
		            </a>
		          </li>
		          <li class="nav-item">
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
	      </c:otherwise>
     </c:choose>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " id="navigation-example">
        <div class="container-fluid">
          <div class="navbar-wrapper">
           <a class="navbar-brand" href="javascript:void(0)"><i class="material-icons">content_paste</i>	문의글 상세페이지</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation" data-target="#navigation-example">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          </div>
          </nav>
      <div class="content">
        <div class="container-fluid">
          <div class="card">
           <div class="card-header card-header-primary" style="width:96.3%;">
              <h4 class="card-title">문의사항</h4>
              <p class="card-category">	문의사항 상세 내용
              </p>
            </div>
                <div class="col-md-6">
                  <h4 class="card-title">&nbsp;&nbsp;&nbsp;&nbsp;</h4>
                  <div class="alert alert-info" style="width:200%; background: linear-gradient(60deg, #2B3245, #4c505fde); box-shadow: 0 4px 20px 0px rgb(0 0 0 / 14%), 0 7px 10px -5px rgb(60 60 62);">
                   <span><a class="listing_th" style="font-weight: bold; font-size:1.2em; font-family: Arial;"> 작성일</a> <br><br> 	${support.s_rdate}</span>
                  </div>
                  <div class="alert alert-success" style="width:200%; background: linear-gradient(60deg, #2B3245, #4c505fde); box-shadow: 0 4px 20px 0px rgb(0 0 0 / 14%), 0 7px 10px -5px rgb(60 60 62);">
                   <span><a class="listing_th" style="font-weight: bold; font-size:1.2em; font-family: Arial;"> 글 제목</a><br><br>  ${support.s_subject}</span>
                  </div>
                  <div class="alert alert-warning" style="width:200%; height:300px; background: linear-gradient(60deg, #2B3245, #4c505fde); box-shadow: 0 4px 20px 0px rgb(0 0 0 / 14%), 0 7px 10px -5px rgb(60 60 62);">
                   <span><a class="listing_th" style="font-weight: bold; font-size:1.2em; font-family: Arial;"> 글 내용</a><br><br> ${support.s_content}</span>
                  </div>
                </div>
              </div>
            </div>
            
            <c:if test="${LOGINUSER.m_verify eq 9}">
            <c:choose>
            <c:when test="${support.group_ord eq 0 }">
            <a onclick="goReply(${support.origin_no})">
            <input type="button" class="btn list-btn top-btn" value="답글 작성하기" style="text-align:center; width:98%; background-color: #343e56; margin-left:1%; font-weight: bold; font-size:1.2em;"></a>
            </c:when>
            <c:otherwise>
            <a href="reply.do?origin_no=${support.origin_no}">
            <input type="button" class="btn list-btn top-btn" value="답글 작성하기" style="text-align:center; width:48.3%; background-color: #343e56; margin-left:1%; font-weight: bold; font-size:1.2em;"></a>
            </c:otherwise>
            </c:choose>
            <c:if test="${support.group_ord eq 1}">  
             <a href="support_delete.do?s_id=${support.s_id}">
              <input type="button" class="btn list-btn top-btn" value="답글 삭제하기" style="text-align:center; width:48.3%; background-color: #343e56; margin-left:1%; font-weight: bold; font-size:1.2em;"></a>
            </c:if>
             </c:if>
            <div class="col-md-12">
              <div class="places-buttons">              
       <footer class="footer">
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
 function goReply(origin_no){
	  if(${empty LOGINUSER}){
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
				location.href ="reply.do?origin_no="+origin_no;
			}
	}
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