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
  <link href="../assets/css/material-dashboard.css?v=2.1.0" rel="stylesheet" />
  <link href="../assets/css/profile.css" rel="stylesheet">
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
  <link href="../assets/css/pointColor.css" rel="stylesheet" />
</head>
<style>
.dark-edition .btn.btn-primary{color:#fff;background-color:#d1302e;border-color:#e53f3c;box-shadow:0 2px 2px 0 #4a1f2f,0 3px 1px -2px rgba(145,63,158,0.2),0 1px 5px 0 rgba(145,63,158,0.12)}.dark-edition .btn.btn-primary:hover{color:#fff;background-color:#e53f3c;border-color:#cd2d2b;box-shadow:0 2px 2px 0 #4a1f2f,0 3px 1px -2px rgba(145,63,158,0.2),0 1px 5px 0 rgba(145,63,158,0.12)}.swal-button--홈으로{color:#555;background-color:#efefef}.swal-button--홈으로:not([disabled]):hover{background-color:#e8e8e8}.swal-button--홈으로:active{background-color:#d7d7d7}.swal-button--홈으로:focus{box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(116,136,150,.29)}.swal-button--로그인{background-color:#ff3d1c}.swal-button--로그인:not([disabled]):hover{background-color:#ff5235}.swal-button--로그인:active{background-color:#ff5235}.swal-button--확인{background-color:#ff3d1c}.swal-button--확인:not([disabled]):hover{background-color:#ff5235}.swal-button--확인:active{background-color:#ff5235}
.nav-link{cursor: pointer;}
</style>
<body class="dark-edition">
  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="black" data-image="../assets/img/gallery/1.png">
       <div class="logo"><a href="index.do" class="simple-text logo-normal">
          <img src="assets/img/logo/logo_b.png" alt="" style="max-width: 170px;">
        </a></div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item ">
            <a class="nav-link" href="./dashboard.do">
              <i class="material-icons">dashboard</i>
              <p>대시보드</p>
            </a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="./admin_info.do">
              <i class="material-icons">person</i>
              <p>관리자 정보</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="./memberList.do">
              <i class="material-icons">groups</i>
              <p>회원 리스트</p>
            </a>
          </li>
          <li class="nav-item ">
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
    </div>
    <div class="main-panel">
      <!-- Navbar -->
       <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top " id="navigation-example">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand" href="javascript:void(0)"><i class="material-icons">person</i>  관리자 정보</a>
          </div>
         </div>
        </nav>  
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-11">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title">프로필 수정하기</h4>
                  <p class="card-category">당신의 프로필을 완성시켜보세요!</p>
                </div>
                <div class="card-body">
                  <form action="member.do" name="memberF" method="post" enctype="multipart/form-data" style="margin: 50px 150px 0 150px;">
              	 <div class="avatar-wrapper">
					<img class="profile-pic" src="assets/img/profile/${LOGINUSER.m_fname}" />
					<div class="upload-button">
						<i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
					</div>
					<input class="file-upload" type="file" name="file" accept="jpg , png, gif"/>
				 </div>
                    <div class="row">
                      <div class="col-md-3">
                        <div class="form-group">
                          <label class="bmd-label-floating">이름</label>
                          <input type="text" name="m_name" value="${LOGINUSER.m_name}" class="form-control">
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">이메일주소</label>
                          <input type="text" class="form-control" id="email" name="m_email" value="${LOGINUSER.m_email}">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">기존 비밀번호</label>
                          <input type="password" name="m_pwd" id="m_pwd" class="form-control">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">새로운 비밀번호</label>
                          <input type="password" name="m_newpwd" id="m_newpwd" class="form-control">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">전화번호</label>
                          <input type="text" name="m_phone" value="${LOGINUSER.m_phone}" class="form-control">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">생년월일</label>
                          <input type="text" name="m_birth" value="${LOGINUSER.m_birth}" class="form-control">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label>자기소개</label>
                          <div class="form-group">
                            <label class="bmd-label-floating">${LOGINUSER.m_about} </label>
                            <textarea class="form-control" name="m_about" rows="5"></textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                    <button type="button" id="submitBtn" class="btn btn-primary pull-right" >수정하기</button>
                    <div class="clearfix"></div>
                  </form>
                </div>
              </div>
            </div>
          </div>
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
	$(document).ready(function(){
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
			}
	});
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
 <script>
 function salert(text){
     swal({
       text: text,
       buttons:{"확인":true},
       });
}

 document.getElementById('submitBtn').onclick = function(){
	   var l = document.memberF; 
	   if(l.m_newpwd.value != null){
		   if (l.m_pwd.value == "") {
		       salert("기존의 비밀번호를 입력해주세요.");
		       l.m_pwd.focus();
		       return false;
		   }else{
		      $.ajax({ 
		        type: "POST",  
		        url: "pwdValid.jy",  
		        data: {m_email : $("#email").val(),
		           m_pwd : $("#m_pwd").val()},
		        dataType:"json",
		        success: function(data){
		             if(data==1){
		            	 swal({
		                     text: "수정 사항을 저장하시겠습니까 ?",
		                     buttons:{"확인":true,cancel:"취소"},
		                     }).then((value) => {
		                        if(value){
		                       	 swal({
		                                text: "수정 사항이 저장되었습니다.",
		                                buttons:{"확인":true},
		                                }).then((value) => {
		                                   if(value){
		                                   	document.memberF.submit();
		                                   }
		                                }); 
		                        }
		                     });                  
		             }else{
		                swal({
		                         text: "기존 비밀번호와 일치하지 않습니다.",
		                         buttons:{"확인":true},
		                         }).then((value) => {
		                            if(value){
		                               l.m_pwd.focus();
		                            }
		                         });     
		             }                  
		          }
		       
		       });
		   }
	 }else{
	       swal({
	          text: "수정 사항을 저장하시겠습니까 ?",
	          buttons:{"확인":true,cancel:"취소"},
	          }).then((value) => {
	             if(value){
	            	 swal({
	                     text: "수정 사항이 저장되었습니다.",
	                     buttons:{"확인":true},
	                     }).then((value) => {
	                        if(value){
	                        	document.memberF.submit();
	                        }
	                     }); 
	             }
	          });                  
	 }
	}
 $(document).ready(function() {
	 	
     var readURL = function(input) {
         if (input.files && input.files[0]) {
             var reader = new FileReader();

             reader.onload = function (e) {
                 $('.profile-pic').attr('src', e.target.result);
             }
     
             reader.readAsDataURL(input.files[0]);
         }
     }
    
     $(".file-upload").on('change', function(){
         readURL(this);
     });
     
     $(".upload-button").on('click', function() {
        $(".file-upload").click();
     });
 });
 </script>
</body>

</html>