<%@ page contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
   <title>Odga.com</title>
   <!-- Bootstrap Core CSS -->
   <link href="../assets/css/login.css" rel="stylesheet">
   <link href="assets/css/profile2.css" rel="stylesheet">

<style>
.swal-button{background-color:#ff3d1c}.swal-button:not([disabled]):hover{background-color:#ff5235}.swal-button:hover{background-color:#ff5235}.swal-footer{text-align:center}.swal-button:focus{box-shadow:none}
p:hover { color: #8fa1c7; }
</style>
</head>
<!-- Logo -->
 <div style="width: 10%;min-width: 9rem;">
     <a href="index.do"><img src="assets/img/logo/logo_b.png" alt="" style="max-width: 100%;"></a>
 </div>
<!-- 로그인  -->
<p class="tip"></p>
<div class="cont">
  <div class="form sign-in">
   <form id="LoginS" name="loginS"  >    
       <h2>여행시작하기,</h2>
       <input type="hidden" id="RSAModulus" value="${RSAModulus}" /><!-- 서버에서 전달한값 세팅. -->
      <input type="hidden" id="RSAExponent" value="${RSAExponent}" /><!-- 서버에서 전달한값 세팅 -->
       <label>
         <span>이메일</span>
         <input type="text" name="m_email" id="l_email" required="required"/>
       </label>
       <label>
         <span>비밀번호</span>
         <input type="password" name="m_pwd" id="l_pwd" required="required"/>
       </label>
      <a href="findIdPwd">
          <p class="forgot-pass" style="text-decoration-line: underline;">이메일 또는 비밀번호가 기억이 안나시나요?</p>
       </a>
   
       <button type="button" id="ms_login" class="submit" onclick="loginCheck()" >시작 </button><!-- class="submit" onclick="loginCheck()" -->
       <!-- 네이버 로그인 창으로 이동 -->
      <div id="naver_id_login" style="text-align:center"><a href="${url}">
      <img style="max-height: 40px;border-radius: 30px;width: 45%;" width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
      <br>
  </form>
  </div>
  
  <div class="sub-cont">
    <div class="img">
      <div class="img__text m--up">
        <h2>처음 오셨나요?</h2>
        <p></p>
      </div>
      <div class="img__text m--in">
        <h2>가입하기</h2>
        <p></p>
      </div>
      
      <div class="img__btn">
        <span class="m--up">가입하기</span>
        <span class="m--in">로그인 하기</span>
      </div>
    </div>
    
    <!-- 회원가입  -->
    
    <script>

   //아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
    var idCheck = 0;
    var pwdCheck = 0;
    
    //아이디 체크하여 가입버튼 비활성화, 중복확인.
    function checkId() {
             
        //var inputed = $('.m_email').val();
        var inputed = $("#email").val();
      
        $.ajax({
            data : {
                m_email : $("#email").val()
            },
            type : "post",
            url : "checkId.jy",
            success : function(data) {
               
                if(inputed=="" && data=='0') {
                    $(".submit").prop("disabled", true);
                    $(".submit").css("background-color", "#aaaaaa");
                    $("#email").css("background-color", "#FFCECE");
                    idCheck = 0;
                } else if (data == '0') {
                    $("#email").css("background-color", "#B0F6AC").css("color","black");
                    idCheck = 1;
                    if(idCheck==1 && pwdCheck == 1) {
                        $(".submit").prop("disabled", false);
                        $(".submit").css("background-color", "#4CAF50");

                    }
                } else if (data == '1') {
                    $(".submit").prop("disabled", true);
                    $(".submit").css("background-color", "#aaaaaa");
                    $("#email").css("background-color", "#FFCECE").css("color","black");
                    idCheck = 0;
                }else{
                 salert('회원가입 완료');
                }
                              
               console.log(data);
               
            },
            // 밑에 라인 참조 시작
            type : "POST",
            // 밑에 라인 참조 종료
            error : function(error) {
               console.log(error);
               salert("에러");
            }
        });
    }
    
    // 패스워드 확인
    function checkPwd() {
        var inputed = $("#m_pwd").val();
        var reinputed = $("#m_pwdcheck").val();
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
            $(".submit").prop("disabled", false);
            $("#m_pwdcheck").css("background-color", "#FFCECE");
        }
        else if (inputed == reinputed) {
            $("#m_pwdcheck").css("background-color", "#B0F6AC").css("color","black");
            pwdCheck = 1;
            if(idCheck==1 && pwdCheck == 1) {      
            }
        } else if (inputed != reinputed) {
            pwdCheck = 0;
            $("#m_pwdcheck").css("background-color", "#FFCECE").css("color","black");
       }
    }
   
    // email
    function emailAuth(){
       
       if ( confirm("인증 이메일을 발송중입니다.") ) {
          
            $.ajax({
                data : {
                   m_email : $("#email").val()
                },
                type : "post",
                url : "/sign-up",
                success : function(data) {
                   salert("인증코드를 확인하세요.");
                   console.log(data);
                   $("#email_auth_chk").css("display","block");
                },
                error : function(error) {
                   console.log(error);
                   salert("이메일을 입력해주세요.");
                }
            });
          
       } else {
          salert("다시 시도해주세요.");
       }
       
    }

    function emailAuth_key(){
       
        $.ajax({
            data : {
               Authkey : $("#email_AuthKey").val()
            },
            type : "post",
            url : "/emailConfirm",
            success : function(data) {
               if(data=="no"){
                  salert("인증실패");
                  return false;
               }else{
               salert("인증성공하였습니다.");
               console.log(data);
               $("#e_check").val("checkcheck");
               $("#email_auth_chk").css("display","none");
               $("#submitBtn").prop("disabled", false);
               $("#submitBtn").css("background-color", "#4CAF50");
               }
            },
            error : function(error) {
               console.log(error);
               salert("에러");
               salert("이메일인증을 다시하세요");
               $("#email_AuthKey").val("");
            }
        });
    }
    
    </script>
   
   <div class="form sign-up">
    <form action="join.do" name="joinFrm" method="post" id="joinS" enctype="multipart/form-data"  >
    <input type="hidden" name="e_check" id="e_check" value=""/>
      <h2>두근두근 여행,</h2>
      <label>
        <span>이메일</span>
        <input type="text" name="m_email" id="email" oninput="checkId()" required/>
        <input type='button' value='이메일인증'  onclick="emailAuth()">
      </label>
     
      <label>
         <div id="email_auth_chk" style="display:none">
           <input type="text" name="m_email_AuthKey" id="email_AuthKey" />
           <h2><input type='button' value='인증하기' onclick="emailAuth_key()" /></h2>
         </div> 
      </label>     
      
      <label>
        <span>이름</span>
        <input type="text" name="m_name" id="m_name"  required/>
      </label>
      <label>
        <span>비밀번호</span>
        <input type="password" name="m_pwd" id="m_pwd" oninput="checkPwd()" required/>
      </label>
      
      <label>
        <span>비밀번호 확인</span>
        <input type="password" name="m_pwdcheck" id="m_pwdcheck" oninput="checkPwd()" />
      </label>
       
      <label>
        <span>휴대폰번호</span>
        <input type="text" name="m_phone" id="m_phone"  required/>
      </label>
      
      <label>
      <span>생년월일</span>
        <input type="date" name="m_birth" id="m_birth"  required/>
      </label>
      
      <div id="reg_gender" style="display:flex;justify-content:center; margin: 15px;">
         <input type="radio" value="male" id="male" name="m_gender" checked style="width:auto;"/>
         <label for="squaredFour" style="margin:0;width:50px;">남자</label>
         <input type="radio" value="female" id="female" name="m_gender" checked style="width:auto;"/>
         <label for="squaredFour" style="margin:0;width:50px;">여자</label>
      </div>
      <label>
      <span>자기소개</span>
        <input type="text" name="m_about" id="m_about"/>
      </label>
      
      <label>
        <span>프로필사진등록</span>
        <input type="file" name="file" id="m_fname"/>
      </label>
    <div class="row">
      <button type="button" id="submitBtn" class="submit" style="background:#aaaaaa " disabled="" >가입하기</button>
    </div>
    </form>
   </div>
  </div>
</div>
<script src="../assets/js/login.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- RSA 자바스크립트 라이브러리 -->
<script type="text/javascript" src="../js/RSA/jsbn.js"></script>
<script type="text/javascript" src="../js/RSA/rsa.js"></script>
<script type="text/javascript" src="../js/RSA/prng4.js"></script>
<script type="text/javascript" src="../js/RSA/rng.js"></script>

<script type="text/javascript">
function salert(text){
   swal({
     text: text,
     buttons:{true:"확인"},
     });
}
document.getElementById('submitBtn').onclick = function(){
   var l = document.joinFrm; 
   
   if (l.m_email.value == "" || l.m_pwd.value == "") {
       salert("이메일 및 비밀번호를 입력해주세요.");
       l.m_email.focus();
       return false;
   }else if (l.m_email_AuthKey.value == "") {
       salert("이메일 인증을 해주세요.");
       l.m_email_AuthKey.focus();
       return false;
   }else if (l.m_name.value == "") {
       salert("이름을 입력해주세요.");
       l.m_name.focus();
       return false;
   }else if (l.m_phone.value == "") {
       salert("전화번호을 입력해주세요.");
       l.m_phone.focus();
       return false;
   }else if (l.m_birth.value == "") {
       salert("생년월일을 입력해주세요.");
       l.m_birth.focus();
       return false;
   }else{
         swal({
            text: "회원가입이 완료 되었습니다.",
            buttons:{"확인":true},
            }).then((value) => {
               if(value){
                  document.joinFrm.submit();
               }
            });
      }
}
</script>
<script>
$(document).ready(function() {   
    // ID를 alpreah_input로 가지는 곳에서 키를 누를 경우
    $("#l_email").keydown(function(key) {
        //키의 코드가 13번일 경우 (13번은 엔터키)
        if (key.keyCode == 13) {
           $("#ms_login").click();
        }
    });
    $("#l_pwd").keydown(function(key) {
        //키의 코드가 13번일 경우 (13번은 엔터키)
        if (key.keyCode == 13) {
           $("#ms_login").click();
        }
    });
});
</script>
<script>
   
    function loginCheck(){
       
      var l = document.loginS; 
      
      if (l.m_email.value == "" && l.m_pwd.value == "") {
          salert("이메일 및 비밀번호를 입력해주세요.");
          l.m_email.focus();
          return false;
      }
      /* $.ajax({                             // ajax 함수를 실행하는 선언문입니다. jquery에서 가져와
         type : "POST",                   // method 구분입니다. 파라미터는 GET, POST 문자열 구문으로 작성합니다.
            url : "/checkLogin.jy",          // url을 입력합니다. 예를들어, requestMapping=login.do 컨트롤러 연동이 필요할경우 login.do 를 문자열로 작성 
            data : {                        // 모델앤뷰 객체에 담길 data 파라미터입니다. VO 로 담겨서 컨트롤러로 이동된다고 생각하세요
                m_email : $("#l_email").val()
               ,m_pwd   : $("#l_pwd").val()
            },
            success : function(data) {       // ajax가 성공할 경우 해당 구문으로 진입합니다.
               // 로그인 성공
               
               if ( data == "1" ){
                  l.submit();
               } else {
                  salert("이메일 또는 비밀번호를 다시 확인해주세요.");
                  return;
               }
            },
            error : function(error) {        // ajax가 오류날 경우 해당 구문으로 진입합니다.
               
               // 이제 checkLogin.jy 에서 아이디, 비밀번호 검증하고 true false 리턴줘서 처리하면됨
               salert("서비스에러발생");

            }
        }); */
    }
    
</script>
<script>
$(document).ready(function() {   
    // ID를 alpreah_input로 가지는 곳에서 키를 누를 경우
    $("#l_email").keydown(function(key) {
        //키의 코드가 13번일 경우 (13번은 엔터키)
        if (key.keyCode == 13) {
           loginCheck()
        }
    });
    $("#l_pwd").keydown(function(key) {
        //키의 코드가 13번일 경우 (13번은 엔터키)
        if (key.keyCode == 13) {
           loginCheck()
        }
    });
});
</script>
<script>
$("#ms_login").click(function(){
   //사용자 계정정보 암호화전 평문
   var uemail = $("#l_email").val();
   var pwd = $("#l_pwd").val();
   
   //alert(uemail +"##"+ pwd);
   //RSA 암호화 생성
   var rsa = new RSAKey();
   rsa.setPublic($("#RSAModulus").val(), $("#RSAExponent").val());
   
   //사용자 계정정보를 암호화 처리
   uemail = rsa.encrypt(uemail);
   pwd = rsa.encrypt(pwd); 
   //alert(uemail +"##"+ pwd);
   $.ajax({ 
        type: "POST",  
        url: "login.proc",  
        data: {m_email :uemail, m_pwd: pwd},  //사용자 암호화된 계정정보를 서버로 전송
        dataType:"json",
        success: function(msg){    
          
           if(msg.state == "true")
           {
              location.href = "../"; 
           }
           else if(msg.state == "false")
           {
             salert("이메일 또는 비밀번호를 다시 확인해주세요.");
           }
           else
           {
             salert("잘못된 경로로 접근하였습니다. 암호화 인증에 실패하였습니다."); 
           } 
        } 
   });
});
</script>
</html>    

<!-- jQuery-->
        