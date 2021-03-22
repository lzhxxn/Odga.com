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
			<!-- <link rel="manifest" href="site.webmanifest"> -->
			<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

			<!-- CSS here -->
			<link rel="stylesheet" href="assets/css/select.css">
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
			<!-- <link rel="stylesheet" href="assets/css/testa2.css"> -->
			<link rel="stylesheet" href="assets/css/planner.css">
			
			<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
			<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
		</head>

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
									<div class="col-xl-2 col-lg-2 col-md-1">
										<div class="logo">
											<a href="index.html"><img src="assets/img/logo/logo_b.png" alt=""></a>
										</div>
									</div>
									<div class="col-xl-10 col-lg-10 col-md-8">
										<!-- Main-menu -->
										<div class="main-menu f-right d-none d-lg-block">
											<nav>
												<ul id="navigation">
													<li><a href="listing.html">국내여행지</a></li>
													<li><a href="#">커뮤니티</a>
														<ul class="submenu">
															<li><a href="review.html">여행후기</a></li>
															<li><a href="support.html">문의하기</a></li>
														</ul>
													</li>
													<li><a href="use.html">이용방법</a></li>
													<li><a href="https://www.agoda.com/">호텔예약</a></li>
													<li class="add-list"><a href="listing_details.html"><i
																class="ti-plus"></i>나의 여행 만들기</a></li>
													<li class="login"><a href="login.html">
															<i class="ti-user"></i>로그인 / 회원가입</a>
													</li>
												</ul>
											</nav>
										</div>
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
				<div class="listing-area pt-120 pb-120">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<!-- Job Category Listing start -->
								<div class="row" style="margin-left: 5px">

								<!-- Select job items start -->
									<!-- <div class="col-1">
										<div class="select-job-items1">
											<select name="select1" id="select1" onchange ="change1step(value)">changeSelArea()
												<option value="">지역 선택</option>
												<option value="1">서울</option>
												<option value="2">인천</option>
												<option value="3">대전</option>
												<option value="4">대구</option>
												<option value="5">광주</option>
												<option value="6">부산</option>
												<option value="7">울산</option>
												<option value="8">세종특별자치시</option>
												<option value="31">경기도</option>
												<option value="32">강원도</option>
												<option value="33">충청북도</option>
												<option value="34">충청남도</option>
												<option value="35">경상북도</option>
												<option value="36">경상남도</option>
												<option value="37">전라북도</option>
												<option value="38">전라남도</option>
												<option value="39">전라남도</option>
											</select>
										</div>
									</div>
									<div class="col-1">
										<div class="select-job-items1">
											<select name="select2" id="select2">
												<option>지역 선택</option>
											</select>
										</div>
									</div> -->
									<div class="col-1" >
										<label for="fname">여행 제목:</label>
									</div>
									<div class="col-1" >	
										<input type="text" value="여행 제목"/>	
									</div>
									<div class="col-1">
										<select name="test1" class="nice-select">
											<option value="" selected="selected">인원</option>
											<option value="1">1명</option>
											<option value="2">2명</option>
											<option value="3">3명</option>
										</select>
									</div>
									<div class="col-2">
										<select name="test1" class="nice-select">
											<option value="1" selected="selected">혼자만의 여행</option>
											<option value="2">커플</option>
											<option value="3">가족</option>
											<option value="4">우정여행</option>
										</select>
									</div>
									<!-- <div class="selectbox"> -->
									<div class="col-3">
									  <form name="form">								  	
										  <select name="area"  id="areacode" class="nice-select" onchange="changes(value)">
										    <option value="">지역 선택</option>
										    <c:forEach items="${list.list}" var="area">
											    <option value="${area.areacode}">${area.area}</option>
										    </c:forEach>
										  </select>			  
										  <select name="sigungu" class="nice-select" id="sigunguCode">
										    <option>세부 지역</option>
										  </select>
									
									  </form>
									</div>


									<div class="col-2" style="float:right;margin-left:0px;margin-right:0px;">
										<a href="#" class="btn list-btn"
											style="width:200px;float:right; padding: 23px 20px;margin-right:15px;">저
											장</a>
									</div>
								</div>
								<!-- Job Category Listing End -->
							</div>
						</div>
					</div>
					<div class="row" style="margin-right:5px;margin-left:5px;margin-top:10px">
						<!-- Left content -->
						<div class="col-1">
							<div class="row" style="margin-top: 15px;">
								<div class="col-12">
									<div class="small-section-tittle2 mb-45" style="margin-bottom: 15px;">
										<h5>DAY</h5>
									</div>
								</div>
							</div>
							<!-- Job Category Listing start -->
							<div class="category-listing mb-50">
								<!-- single one -->
								<div class="single-listing">
									<div class="select-job-items2">
										<select name="select5">
											<option value="">기간 선택</option>
											<option value="">무박</option>
											<option value="">1박2일</option>
											<option value="">2박3일</option>
											<option value="">3박4일</option>
											<option value="">4일 이상</option>
										</select>
									</div>
								</div>

								<!-- <div class="single-listing">
									Range Slider End
									<a href="#" class="btn list-btn mt-20">검색!</a>
									<a href="#" class="btn list-btn mt-20">Reset</a>
								</div> -->
							</div>
							<!-- Job Category Listing End -->
						</div>
						<div class="col-3">
							<div class="row" style="margin-top: 15px;">
								<div class="col-12">
									<div class="small-section-tittle2 mb-45" style="margin-bottom: 15px;">
										<h5>여행 일정을 선택하세요</h5>
									</div>
								</div>
							</div>
							<!-- Job Category Listing start -->
							<div class="category-listing mb-50">
								<!-- single one -->
								<div class="single-listing">
									<!-- input -->
									<div class="input-form">
										<input type="text" id="name" placeholder="검색하실 도시를 입력해주세요" x-webkit-speech
											autocomplete="off" name="writer" />
									</div>
									<!-- Select job items start -->
									<div class="select-job-items1">
										<select title="지역선택" name="areacode">
											<option value selected="selected">지역선택</option>
											<option value="1">서울</option>
											<option value="2">인천</option>
											<option value="3">대전</option>
										</select>
									</div>
									<div class="select-job-items1">
										<select title="관광타입" name="contenttypeid" id="contenttypeid">
											<option value selected="selected">타입선택</option>
											<option value="12">관광지</option>
											<option value="14">문화시설</option>
											<option value="32">숙박</option>
											<option value="39">음식</option>
										</select>
									</div>
									<div class="select-job-items2">
										<div class="card" id="card">
										</div>
									</div>
									<!--  Select job items End-->
									<!-- select-Categories start -->


								</div>

								<div class="single-listing">
									<!-- Range Slider End -->
									<a href="#" class="btn list-btn mt-20" id="search">검색!</a>
									<a href="#" class="btn list-btn mt-20">Reset</a>
								</div>
							</div>
							<!-- Job Category Listing End -->
						</div>

						<!-- Right content -->
						<div class="col-8">

							<p style="float:left;margin-top:0px;height:3%;">
								<input type="checkbox" id="chkTraffic" onclick="setOverlayMapTypeId()" /> 교통정보 보기
								<input type="checkbox" id="chkBicycle" onclick="setOverlayMapTypeId()" /> 자전거도로 정보 보기
							</p>
							<div class="map_wrap" style="width:100%;height:800px;float:bottom;">
								<div id="map"
									style="width:100%;height:90%;float:bottom;margin-right:0px;position:relative;overflow:hidden;">
								</div>

								<!-- <div id="menu_wrap" class="bg_white">
									<div class="option">
										<div>
											<form onsubmit="searchPlaces(); return false;">
												키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15">
												<button type="submit">검색하기</button>
											</form>
										</div>
									</div>
									<hr>
									<ul id="placesList"></ul>
									<div id="pagination"></div>
								</div> -->
							</div>
							<div id="map" style="width:100%;height:90%;float:bottom;margin-right:0px;"></div>
							<script type="text/javascript"
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8831cbdd7d745d3f8c6d9e1fec81ecca&libraries=services"></script>
							<script>
								var markers = [];
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
									mapOption = {
										center: new kakao.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표
										level: 4, // 지도의 확대 레벨
										mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
									};
								// 지도를 생성한다 
								var map = new kakao.maps.Map(mapContainer, mapOption);

								/* // 장소 검색 객체를 생성합니다
								var ps = new kakao.maps.services.Places();

								// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

								 // 키워드로 장소를 검색합니다
								searchPlaces();

								// 키워드 검색을 요청하는 함수입니다
								function searchPlaces() {

									var keyword = document.getElementById('keyword').value;

									if (!keyword.replace(/^\s+|\s+$/g, '')) {
										alert('키워드를 입력해주세요!');
										return false;
									}

									// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
									ps.keywordSearch(keyword, placesSearchCB);
								} 

								// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
								function placesSearchCB(data, status, pagination) {
									if (status === kakao.maps.services.Status.OK) {

										// 정상적으로 검색이 완료됐으면
										// 검색 목록과 마커를 표출합니다
										displayPlaces(data);

										// 페이지 번호를 표출합니다
										displayPagination(pagination);

									} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

										alert('검색 결과가 존재하지 않습니다.');
										return;

									} else if (status === kakao.maps.services.Status.ERROR) {

										alert('검색 결과 중 오류가 발생했습니다.');
										return;

									}
								}

								// 검색 결과 목록과 마커를 표출하는 함수입니다
								function displayPlaces(places) {

									var listEl = document.getElementById('placesList'),
										menuEl = document.getElementById('menu_wrap'),
										fragment = document.createDocumentFragment(),
										bounds = new kakao.maps.LatLngBounds(),
										listStr = '';

									// 검색 결과 목록에 추가된 항목들을 제거합니다
									removeAllChildNods(listEl);

									// 지도에 표시되고 있는 마커를 제거합니다
									removeMarker();

									for (var i = 0; i < places.length; i++) {

										// 마커를 생성하고 지도에 표시합니다
										var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
											marker = addMarker(placePosition, i),
											itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

										// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
										// LatLngBounds 객체에 좌표를 추가합니다
										bounds.extend(placePosition);

										// 마커와 검색결과 항목에 mouseover 했을때
										// 해당 장소에 인포윈도우에 장소명을 표시합니다
										// mouseout 했을 때는 인포윈도우를 닫습니다
										(function (marker, title) {
											kakao.maps.event.addListener(marker, 'mouseover', function () {
												displayInfowindow(marker, title);
											});

											kakao.maps.event.addListener(marker, 'mouseout', function () {
												infowindow.close();
											});

											itemEl.onmouseover = function () {
												displayInfowindow(marker, title);
											};

											itemEl.onmouseout = function () {
												infowindow.close();
											};
										})(marker, places[i].place_name);

										fragment.appendChild(itemEl);
									}

									// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
									listEl.appendChild(fragment);
									menuEl.scrollTop = 0;

									// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
									map.setBounds(bounds);
								}

								// 검색결과 항목을 Element로 반환하는 함수입니다
								function getListItem(index, places) {

									var el = document.createElement('li'),
										itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' +
											'<div class="info">' +
											'   <h5>' + places.place_name + '</h5>';

									if (places.road_address_name) {
										itemStr += '    <span>' + places.road_address_name + '</span>' +
											'   <span class="jibun gray">' + places.address_name + '</span>';
									} else {
										itemStr += '    <span>' + places.address_name + '</span>';
									}

									itemStr += '  <span class="tel">' + places.phone + '</span>' +
										'</div>';

									el.innerHTML = itemStr;
									el.className = 'item';

									return el;
								}

								// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
								function addMarker(position, idx, title) {
									var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
										imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
										imgOptions = {
											spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
											spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
											offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
										},
										markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
										marker = new kakao.maps.Marker({
											position: position, // 마커의 위치
											image: markerImage
										});

									marker.setMap(map); // 지도 위에 마커를 표출합니다
									markers.push(marker);  // 배열에 생성된 마커를 추가합니다

									return marker;
								}

								// 지도 위에 표시되고 있는 마커를 모두 제거합니다
								function removeMarker() {
									for (var i = 0; i < markers.length; i++) {
										markers[i].setMap(null);
									}
									markers = [];
								}

								// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
								function displayPagination(pagination) {
									var paginationEl = document.getElementById('pagination'),
										fragment = document.createDocumentFragment(),
										i;

									// 기존에 추가된 페이지번호를 삭제합니다
									while (paginationEl.hasChildNodes()) {
										paginationEl.removeChild(paginationEl.lastChild);
									}

									for (i = 1; i <= pagination.last; i++) {
										var el = document.createElement('a');
										el.href = "#";
										el.innerHTML = i;

										if (i === pagination.current) {
											el.className = 'on';
										} else {
											el.onclick = (function (i) {
												return function () {
													pagination.gotoPage(i);
												}
											})(i);
										}

										fragment.appendChild(el);
									}
									paginationEl.appendChild(fragment);
								}

								// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
								// 인포윈도우에 장소명을 표시합니다
								function displayInfowindow(marker, title) {
									var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

									infowindow.setContent(content);
									infowindow.open(map, marker);
								}

								// 검색결과 목록의 자식 Element를 제거하는 함수입니다
								function removeAllChildNods(el) {
									while (el.hasChildNodes()) {
										el.removeChild(el.lastChild);
									}
								} 

								// 지도 타입 변경 컨트롤을 생성한다
								var mapTypeControl = new kakao.maps.MapTypeControl();
								// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
								map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
								// 지도에 확대 축소 컨트롤을 생성한다
								var zoomControl = new kakao.maps.ZoomControl();
								// 지도의 우측에 확대 축소 컨트롤을 추가한다
								map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


								// 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
								kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
								  console.log('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
								});
							    
								// 지도에 마커를 생성하고 표시한다
								var marker = new kakao.maps.Marker({
								  position: new kakao.maps.LatLng(37.56682, 126.97865), // 마커의 좌표
								  draggable: true, // 마커를 드래그 가능하도록 설정한다
								  map: map // 마커를 표시할 지도 객체
								});
								// 지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
								kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
								  // 클릭한 위치에 마커를 표시합니다 
								  addMarker(mouseEvent.latLng);
				
								});
				
				
								// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
								var markers = [];
				
								// 마커 하나를 지도위에 표시합니다 
								addMarker(new kakao.maps.LatLng(33.450701, 126.570667));
				
								// 마커를 생성하고 지도위에 표시하는 함수입니다
								function addMarker(position) {
				
								  // 마커를 생성합니다
								  var marker = new kakao.maps.Marker({
									position: position
								  });
				
								  // 마커가 지도 위에 표시되도록 설정합니다
								  marker.setMap(map);
				
								  // 생성된 마커를 배열에 추가합니다
								  markers.push(marker);
								} 

								  //해당 마커 정보
								 var content = '<div class="wrap">' +
								   '    <div class="info">' +
								   '        <div class="title">' +
								   '            카카오 스페이스닷원' +
								   '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' +
								   '        </div>' +
								   '        <div class="body">' +
								   '            <div class="img">' +
								   '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
								   '           </div>' +
								   '            <div class="desc">' +
								   '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' +
								   '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' +
								   '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' +
								   '            </div>' +
								   '        </div>' +
								   '    </div>' +
								   '</div>';
								 // 마커 위에 커스텀오버레이를 표시합니다
								 // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
								 var overlay = new kakao.maps.CustomOverlay({
								   content: content,
								   map: map,
								   position: marker.getPosition()
								 });
				 
								 // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
								 kakao.maps.event.addListener(marker, 'click', function () {
								   overlay.setMap(map);
								 });
				 
								 // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
								 function closeOverlay() {
								   overlay.setMap(null);
								 } 


								//실시간 교통정보랑 자전거
								var mapTypes = {
									traffic: kakao.maps.MapTypeId.TRAFFIC,
									bicycle: kakao.maps.MapTypeId.BICYCLE
								};

								// 체크 박스를 선택하면 호출되는 함수입니다
								function setOverlayMapTypeId() {
									var chkTraffic = document.getElementById('chkTraffic'),
										chkBicycle = document.getElementById('chkBicycle');


									// 지도 타입을 제거합니다
									for (var type in mapTypes) {
										map.removeOverlayMapTypeId(mapTypes[type]);
									}

									// 교통정보 체크박스가 체크되어있으면 지도에 교통정보 지도타입을 추가합니다
									if (chkTraffic.checked) {
										map.addOverlayMapTypeId(mapTypes.traffic);
									}

									// 자전거도로정보 체크박스가 체크되어있으면 지도에 자전거도로정보 지도타입을 추가합니다
									if (chkBicycle.checked) {
										map.addOverlayMapTypeId(mapTypes.bicycle);
									}

								}   */
							</script>
						</div>
					</div>
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
												<a href="index.html"><img src="assets/img/logo/logo_b.png" alt=""></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-xl-2 col-lg-2 col-md-4 col-sm-6">
									<div class="single-footer-caption mb-50">
										<div class="footer-tittle">
											<h4>관리자정보</h4>
											<ul>
												<li><a href="#">이지훈</a></li>
												<li><a href="#">허유민</a></li>
												<li><a href="#">박종범</a></li>
												<li><a href="#">이민용</a></li>
												<li><a href="#">권성환</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
									<div class="single-footer-caption mb-50">
										<div class="footer-tittle">
											<h4>고객센터</h4>
											<ul>
												<li><a href="#">문의하기</a></li>
												<li><a href="#">이용약관</a></li>
												<li><a href="#">개인정보 처리방침</a></li>
												<li><a href="#">회사주소</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
									<div class="single-footer-caption mb-50">
										<div class="footer-tittle">
											<h4>Download App</h4>
											<ul>
												<li class="app-log"><a href="#"><img
															src="assets/img/gallery/app-logo.png" alt=""></a></li>
												<li><a href="#"><img src="assets/img/gallery/app-logo2.png" alt=""></a>
												</li>
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
											<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
											Copyright &copy;
											<script>
												document
													.write(new Date().getFullYear());
											</script>
											Copyright©Odga.com Organization, All rights reserved.
											<i class="fa fa-heart" aria-hidden="true"></i><a href="https://odga.com"
												target="_blank">Odga.com</a>
											<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
										</p>
									</div>
								</div>
								<div class="col-xl-3 col-lg-4">
									<!-- Footer Social -->
									<div class="footer-social f-right">
										<a href="#"><i class="fab fa-facebook-f"></i></a> <a href="#"><i
												class="fab fa-twitter"></i></a> <a href="#"><i
												class="fas fa-globe"></i></a> <a href="#"><i
												class="fab fa-instagram"></i></a>
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

<script type="text/javascript">
function changes(fr) {
	var li = new Array();
	var li2 = new Array();
	var latitude = 0;
	var longitude = 0;
	
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
		
    }
    </c:forEach>
  // 셀렉트안의 리스트를 기본값으로 한다..
	for(i=0; i<form.sigungu.length; i++) {
	  form.sigungu.options[0] = null;
	}
	  //포문을 이용하여 두번째(test2)셀렉트 박스에 값을 뿌려줍니당)
	for(i=0;i < num.length;i++) {
	  document.form.sigungu.options[i] = new Option(num[i],vnum[i]);
	}
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
		level: 4, // 지도의 확대 레벨
		mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
	};
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption);
}

</script>
<script type="text/javascript">
$(function(){
	 
	 $(document).ready(function() {
			 
            // ID를 alpreah_input로 가지는 곳에서 키를 누를 경우
            $("#name").keydown(function(key) {
                //키의 코드가 13번일 경우 (13번은 엔터키)
                if (key.keyCode == 13) {
                	var areaindex = $("#areacode option:selected").attr('value');
                	var typeindex = $("#contenttypeid option:selected").attr('value');
                	var sigunguIndex = $("#sigunguCode option:selected").attr('value');
                	var matchNum = 0; 
       			 	var nomatchNum = 0;
                	//alert("start");
		             $.ajax({
		                    type: 'get',
		                    url: 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=6f%2B9GV1OSBV%2BRfUgfgMGJdFxW6rxP%2F5pUN8ZCITBNd94TjMATfCcpyLoRWl3X8ad9ojV9B%2BSLxgndmvE23wVBQ%3D%3D&contentTypeId='+typeindex+'&areaCode='+areaindex+'&sigunguCode='+sigunguIndex+'&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=1000&pageNo=', // 읽어올 문서
		    			    dataType: "xml",
		                    data: { addr1 : $("#name").val()},
		                    success: function(xml) {
		                    	 
		                    	 var html= "";
		                    	 var str = "";
		                    	 var result = 0;
		                    	 var firstimage = "";
		                    	 //alert($("#name").val());
		                    	// alert(areaindex);
		                    	 //alert(typeindex);
		                    	 $(xml).find('item').each(function(){
		                    		 str = $(this).find("addr1").text();
		                    		 firstiamge = $(this).find("firstimage").text();
		                    		 imgSize= firstiamge.length;
		                    		 if(str.indexOf($("#name").val())!=-1){
		                    			 //alert(str.indexOf($("#name").val()));
			                    		 html += "<h5><a class='link_a' href='testGet.do?contentid="+$(this).find("contentid").text()+"'>"+$(this).find("title").text()+"</a></h5>";
			                    		 html += "<h5>"+$(this).find("addr1").text()+"</h5>";
			                    		 if(imgSize>0){ html += "<div style='margin-bottom:5px'><img class='pic' src='"+$(this).find("firstimage").text()+"'/></div>";	
			                    		 }else{ html += "<div><img class='pic' src='https://st4.depositphotos.com/17828278/24401/v/600/depositphotos_244011872-stock-illustration-image-vector-symbol-missing-available.jpg'/></div>";}
			                    		 //alert($(this).find("addr1").text());		
			                    		 //result = str.indexOf($("#name").val());
		                    	 		 //alert(result);
			                    		 matchNum++;
			                    		// alert(matchNum);
		                    		 }else{
		                    			// alert(str);
		                    			 if(nomatchNum<1){		                    				 
		                    			 	html += "<div id=header>검색결과 없음</div>";
		                    			 	nomatchNum++;		                    				
		                    			 }
		                    		 }
		                    	 });
		                    	 $("#card").html(html);	
		                    	 //alert(matchNum);
					             if(matchNum>=1){
				              		 var x = document.getElementById("header");
				       				 if (x.style.display === "none") {
				       					    x.style.display = "block";
				       			 	 }else {
				       			 	    x.style.display = "none";
				       			  }
				              	}  
		                    	 
		                    }		
		                   
		             });
		             
                }
                
            });
            
    });
});
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
			<!--<script src="./assets/js/jquery.nice-select.min.js"></script> -->
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
			<!-- <script src="//work6.kr/plugin/plugin_link/19"></script> -->

		</body>

		</html>