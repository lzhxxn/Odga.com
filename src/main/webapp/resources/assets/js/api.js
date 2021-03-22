/**
 * 종백쿤이 한것
 */
$(function(){
	 
	 $(document).ready(function() {
			 
            // ID를 alpreah_input로 가지는 곳에서 키를 누를 경우
            $("#name").keydown(function(key) {
                //키의 코드가 13번일 경우 (13번은 엔터키)
                if (key.keyCode == 13) {
                	var areaindex = $("#areacode option:selected").attr('value');
                	var typeindex = $("#contenttypeid option:selected").attr('value');
                	var matchNum = 0; 
       			 	var nomatchNum = 0;
                	//alert("start");
		             $.ajax({
		                    type: 'get',
		                    url: 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=6f%2B9GV1OSBV%2BRfUgfgMGJdFxW6rxP%2F5pUN8ZCITBNd94TjMATfCcpyLoRWl3X8ad9ojV9B%2BSLxgndmvE23wVBQ%3D%3D&contentTypeId='+typeindex+'&areaCode='+areaindex+'&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=1000&pageNo=', // 읽어올 문서
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
