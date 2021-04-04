<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
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
  <link href="../assets/css/profile.css" rel="stylesheet">
  <link href="../assets/css/myplan.css" rel="stylesheet">
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
  <link href="../assets/css/pointColor.css" rel="stylesheet" />
  
  <link rel="stylesheet" media="all" href="assets/css/list.css" />
  <link rel="stylesheet" href="assets/css/detail.css" />  
</head>
<style>
.swal-button--확인:not([disabled]):hover{background-color:#ff5235}.swal-button--확인{background-color:#ff3d1c}.swal-button--확인:hover{background-color:#ff5235}.swal-button--삭제:not([disabled]):hover{background-color:#ff5235}.swal-button--삭제{background-color:#ff3d1c}.swal-button--삭제:hover{background-color:#ff5235}.swal-button--cancel{color:#555!important;background-color:#efefef}.swal-button--cancel:not([disabled]):hover{background-color:#e8e8e8}.swal-button--cancel:active{background-color:#d7d7d7}.swal-button--cancel:focus{box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(116,136,150,.29)}.swal-button--홈으로{background-color:#efefef;color:#555!important}.swal-button--홈으로:not([disabled]):hover{background-color:#e8e8e8}.swal-button--홈으로:active{background-color:#d7d7d7 color:#666161}.swal-button--홈으로:focus{box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(116,136,150,.29)}.swal-button--로그인{background-color:#ff3d1c}.swal-button--로그인:not([disabled]):hover{background-color:#ff5235}.swal-button--로그인:active{background-color:#ff5235}
.nav-link{cursor:pointer}
</style>
<body class="dark-edition">
  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="black" data-image="../assets/img/gallery/1.png">
      <div class="logo"><a href="index.do" class="simple-text logo-normal">
         <img src="assets/img/logo/logo_b.png" alt="" style="max-width: 170px;">
        </a></div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="member.do" >
              <i class="material-icons">person</i>
              <p>내 정보</p>
            </a>
          </li>
          <li class="nav-item active" >
            <a class="nav-link" name="goPlan" onclick="goOthers(name)">
              <i class="material-icons">edit_location_alt</i>
              <p>나의 플래너</p>
            </a>
          </li>
          <li class="nav-item">
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
      <div class="box" style="overflow-y:auto;">
      <c:set value="${planDetail.planer}" var="planer" />
	  <c:set value="${planDetail.s_planer}" var="s_planer" />
	  <c:set value="${planDetail.touritems}" var="touritems" />
	  
	  		<div class="col-lg-12">
				<div class="count mb-35" style="text-align: center; margin-top:20px;">
					<h1 style="font-size: 350%;">${planer.p_title}</h1>
					<div class="buttons" style="margin-left:80%;">
						<button class="fill" style="border-radius: 10px;"onclick="update()">수정</button>
						<button class="fill" style="border-radius: 10px;"onclick="removeCheck(${planer.p_id},${planer.m_id})">삭제</button>
					</div>
				</div>
			</div>
			<div class="grid">
				<c:if test="${!empty s_planer}">
                   		<c:set var="i" value="0"/>
                   		<c:set var="k" value="1"/>	                			                       		                      			
                      	<c:forEach items="${s_planer}" var="s_planer" varStatus="status">
                      			<c:set value="${s_planer.sp_day}" var="spDay"/>  
                      			<c:if test="${i ne spDay}">
                     						<c:set var="i" value="${i+1}"/>                     							
                     						<c:if test="${k ne i}">
	                     						</div>
	                     						<c:set var="k" value="${k+1}"/>
                     						</c:if>
                     						<h2 style="margin-bottom: 22px;color: snow; margin-top: 3%; display: inline-block;margin-left: 3%;font: italic bold 2.5em/1em Georgia, serif;">Day - ${i}</h2>                     							                       						
                       				        <div class="grid-wrap" style="display:flex; max-height: 327px;">                          				        
                       			</c:if>       				                     			                        			
                      			<c:if test="${i eq spDay}" >                     			
                       			<c:forEach items="${touritems}" var="detail">	                       			
                       				<c:set value="${s_planer.contentid}" var="spCon"/>
                       				<c:set value="${detail.contentid}" var="detailCon"/>
                       				<c:if test="${detailCon eq spCon}" >                       					
									  	<!-- demo 1-->
										  <a class="list-block" href="listing_details.do?contentid=${detailCon}" style="box-shadow: 4px 4px 20px black;">
										    <figure style="margin: 0 auto;object-fit: cover; height: 100%;">
										    	<c:if test="${!empty detail.firstimage}">
										      		<img src="${detail.firstimage}" style="object-fit: cover;height: 100%;" alt="" />
										      	</c:if>
										      	<c:if test="${empty detail.firstimage}">
			                       					<img src="resources/upload/insteadimg.png" style="object-fit: cover;height: 100%;" alt="" />
			                       				</c:if>
										      <figcaption>
										        <h2>#${k} ${detail.title}</h2>
										        <p>여행지 주소 : ${detail.addr1}.</p>
										      </figcaption>
										    </figure>
										  </a>
                       				</c:if>
								</c:forEach>
								</c:if>	
								<c:if test="${status.last}">
									</div>
								</c:if>
						</c:forEach>
				</c:if>
			</div>
      </div>       
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
  <script>
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
				}else if(name=="goDetail"){
					location.href ="plan_detail.do?m_id=${plan.m_id}&p_id=${plan.p_id}";
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
  function removeCheck(p_id,m_id){
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
									location.href="delPlan?p_id="+p_id+"&m_id="+m_id;
								}
							});				
				}
			});
	  
  }
  function update(){
	  location.href="updateplan?p_id=${planer.p_id}&m_id=${planer.m_id}";
  }
  </script>
</body>
</html>