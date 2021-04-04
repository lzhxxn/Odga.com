<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
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
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="../assets/demo/demo.css" rel="stylesheet" />
  <link href="../assets/css/pointColor.css" rel="stylesheet" />
</head>
<style>
.swal-button--홈으로{color:#555;background-color:#efefef}.swal-button--홈으로:not([disabled]):hover{background-color:#e8e8e8}.swal-button--홈으로:active{background-color:#d7d7d7}.swal-button--홈으로:focus{box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(116,136,150,.29)}.swal-button--로그인{background-color:#ff3d1c}.swal-button--로그인:not([disabled]):hover{background-color:#ff5235}.swal-button--로그인:active{background-color:#ff5235}.swal-button--확인{background-color:#ff3d1c}.swal-button--확인:not([disabled]):hover{background-color:#ff5235}.swal-button--확인:active{background-color:#ff5235}
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
          <li class="nav-item active">
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
            <a class="navbar-brand" href="javascript:void(0)"><i class="material-icons">dashboard</i>  관리자 대시보드</a>
          </div>        
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-xl-4 col-lg-12">
              <div class="card card-chart">
                <div class="card-header card-header-success">
                  <!-- <div class="ct-chart" id="dailySalesChart"> --><div id="areachart"></div><!-- </div> -->
                </div>
                <div class="card-body">
                  <h4 class="card-title">선호 지역 TOP 3</h4>
                  <p class="card-category">
                    <span class="text-success"> 1위 ${areaC[0].area}. </span> 플래너에 선택된 지역 순위</p>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">access_time</i> 
                    <fmt:parseDate value="${statistic.newPlanner}" var="newP_date" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${newP_date.time / (1000*60*60*24)}" integerOnly="true" var="upP_date"></fmt:parseNumber>
					<fmt:parseDate value="${statistic.today}" var="now" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowDate"></fmt:parseNumber>
                    <c:choose>
	                    <c:when test="${(nowDate - upP_date) == 0}">                  
	                    	updated Today
	                   	</c:when>
	                   	<c:otherwise>
	                    	updated ${nowDate - upP_date} days ago
	                    </c:otherwise>
                    </c:choose>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-4 col-lg-12">
              <div class="card card-chart">
                <div class="card-header card-header-warning">
                 <div id="memberchart"></div>
                </div>
                <div class="card-body">
                  <h4 class="card-title">일자 별 회원가입 수</h4>
                  <p class="card-category"><span class="text-success"><i class="fa fa-long-arrow-up"> </i> ${memberC[0].m_rdate}. </span> 일자 별 가입된 회원의 수</p>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">access_time</i>
                    <fmt:parseDate value="${statistic.newMember}" var="newM_date" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${newM_date.time / (1000*60*60*24)}" integerOnly="true" var="upM_date"></fmt:parseNumber>
                    <c:choose>
	                    <c:when test="${(nowDate - upM_date) == 0}">                  
	                    	updated Today
	                   	</c:when>
	                   	<c:otherwise>
	                    	updated ${nowDate - upM_date} days ago
	                    </c:otherwise>
                    </c:choose>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-4 col-lg-12">
              <div class="card card-chart">
                <div class="card-header card-header-danger">
                  <div id="genderchart"></div>
                </div>
                <div class="card-body">
                  <h4 class="card-title">회원 성비 백분율</h4>
                  <p class="card-category"><span class="text-success"><i class="fa fa-long-arrow-up"></i>
                  <c:choose>
                		<c:when test="${genderC[0].femaleCnt > genderC[1].maleCnt}">
                		 	여성.
                		 </c:when>
                	 	<c:when test="${genderC[0].femaleCnt < genderC[1].maleCnt}">
                	 		남성.
                	 	</c:when>
                	 	<c:otherwise>
                	 		성비 동일.
                	 	</c:otherwise>
                  	 </c:choose>
                  </span> </i>가입된 회원의 성별 비율</p>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">access_time</i>
	                    <c:choose>
		                    <c:when test="${(nowDate - upM_date) == 0}">                  
		                    	updated Today
		                   	</c:when>
		                   	<c:otherwise>
		                    	updated ${nowDate - upM_date} days ago
		                    </c:otherwise>
	                    </c:choose>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-warning card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">content_copy</i>
                  </div>
                  <p class="card-category">게시글 수</p>
                  <h3 class="card-title">  ${statistic.boardCnt}
                    <small>개</small>
                  </h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">access_time</i>
                    <fmt:parseDate value="${statistic.newBoard}" var="newB_date" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${newB_date.time / (1000*60*60*24)}" integerOnly="true" var="upB_date"></fmt:parseNumber>
                    <c:choose>
	                    <c:when test="${(nowDate - upB_date) == 0}">                  
	                    	updated Today
	                   	</c:when>
	                   	<c:otherwise>
	                    	updated ${nowDate - upB_date} days ago
	                    </c:otherwise>
                    </c:choose>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-success card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">store</i>
                  </div>
                  <p class="card-category">관광정보</p>
                  <h3 class="card-title"> ${statistic.tourCnt} 개</h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">access_time</i>	            
		               updated 19 days ago
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-danger card-header-icon">
                  <div class="card-icon">
                    <i class="material-icons">info_outline</i>
                  </div>
                  <p class="card-category">회원 수</p>
                  <h3 class="card-title">${statistic.memberCnt} 명</h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">access_time</i>
	                    <c:choose>
		                    <c:when test="${(nowDate - upM_date) == 0}">                  
		                    	updated Today
		                   	</c:when>
		                   	<c:otherwise>
		                    	updated ${nowDate - upM_date} days ago
		                    </c:otherwise>
	                    </c:choose>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6">
              <div class="card card-stats">
                <div class="card-header card-header-info card-header-icon">
                  <div class="card-icon">                 	
                    <img src="assets/icon/Instagram(3).png" style="padding: 13.5px;" alt="">
                  </div>
                  <p class="card-category">공식 SNS 계정</p>
                  <h3 class="card-title"><a href="https://www.instagram.com/odga__com">Instagram</a></h3>
                </div>
                <div class="card-footer">
                  <div class="stats">
                    <i class="material-icons">update</i> Just Updated
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-6 col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title">관리자 명단</h4>
                  <fmt:formatDate value="${statistic.newAdmin}" var="year" pattern="yyyy"/>
                  <fmt:formatDate value="${statistic.newAdmin}" var="month" pattern="MM"/>
                  <fmt:formatDate value="${statistic.newAdmin}" var="day" pattern="dd"/>
                  <p class="card-category">${year}.${month}.${day} 기준 관리자 명단</p>
                </div>
                <div class="card-body table-responsive" style="height: 503px;">
                  <table class="table table-hover">
                    <thead class="text-warning">
                      <th style="width:15%;">이름</th>
                      <th>이메일</th>
                      <th>전화번호</th>
                      <th>성별</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${admin}" var="admin">
                      <tr>
                        <td>${admin.m_name}</td>
                        <td>${admin.m_email}</td>
                        <td>${admin.m_phone}</td>
                        <td>${admin.m_gender}</td>
                      </tr>
                     </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title">선호 관광지 TOP 1</h4>
                  <p class="card-category">플래너에 가장 많이 등재된 관광지</p>
                </div>
                <div class="card-body table-responsive">
                  <table class="table table-hover">
                    <thead class="text-warning">                   
                      <tr><th>관광지ID</th>
                      <td>${bestItem.contentid}</td></tr>
                      <tr><th>주소</th>
                      <c:choose>
                    	<c:when test="${empty bestItem.addr1}">
                    		<td>주소가 없습니다.</td>
                    	</c:when>
                    	<c:otherwise>
                    		<td>${bestItem.addr1}</td>
                    	</c:otherwise>
                    </c:choose> </tr>                      
                      <tr><th>장소명</th>
                      	<c:choose>
	                    	<c:when test="${empty bestItem.title}">
	                      		<td>장소명이 없습니다.</td>
	                    	</c:when>
	                    	<c:otherwise>
	                      		<td>${bestItem.title}</td></tr>
	                      	</c:otherwise>
                    	</c:choose>                
                      <tr><th>이미지</th><td><img class='pic' src='${bestItem.firstimage}'/></td></tr>
                    </thead>

                  </table>
                </div>
              </div>
            </div><!-- 여기 -->
          </div>
        </div>
      </div>         
     <footer class="footer" >
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
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart1);
  google.charts.setOnLoadCallback(drawChart2);
  google.charts.setOnLoadCallback(drawChart3);

  function drawChart1() { //지역차트
	  
    var data1 = google.visualization.arrayToDataTable([
    	['area', 'count'],
    	['${areaC[0].area}', ${areaC[0].count}],
    	['${areaC[1].area}', ${areaC[1].count}],
    	['${areaC[2].area}', ${areaC[2].count}]
    ]);

    var chart1 = new google.visualization.PieChart(document.getElementById('areachart'));

    chart1.draw(data1, {
    	fontSize: 11,
        curveType : "function"
    });
  }

  function drawChart2() { //회원가입 수 차트
	  
    var data2 = google.visualization.arrayToDataTable([
    	['Date', 'count',{ role: 'style' }],
    	['${memberC[2].m_rdate}', ${memberC[2].count},'#E53F28'],
    	['${memberC[1].m_rdate}', ${memberC[1].count},'#1377E3'],
    	['${memberC[0].m_rdate}', ${memberC[0].count},'#FBA21C']
    ]);

    var chart2 = new google.visualization.ColumnChart(document.getElementById('memberchart'));

    chart2.draw(data2, {
        curveType : "function",
        fontSize: 10,
        legend : 'none',
        bar: {groupWidth: "30%"}
    });
  }
  function drawChart3() { //성비 차트
	  
	    var data3 = google.visualization.arrayToDataTable([
	    	['Gender', 'count',{ role: 'style' }],
	    	['여성', ${genderC[0].femaleCnt},'#FA311E'],
	    	['남성', ${genderC[1].maleCnt},'#0D2567']
	    ]);


	    var chart3 = new google.visualization.PieChart(document.getElementById('genderchart'));

	    chart3.draw(data3, {
	    	fontSize: 12,
	        curveType : "function"
	    });
	  }
</script>
  <script>
    $(document).ready(function() {
      // Javascript method's body can be found in assets/js/demos.js
      md.initDashboardPageCharts();

    });
  </script>
</body>

</html>