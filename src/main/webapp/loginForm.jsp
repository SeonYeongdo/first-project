<%@ page import="model.userVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>#광광곳곳</title>
 <link rel="stylesheet" href="style.css">

 <style>
          select {
 			width: 280px; 
  			padding: 6px 10px; 
  			font-size: 0.9rem;
  			font-family: inherit; 
  			background: url('./img/icon-arrow-down.svg') no-repeat 95% 50%; 
  			background-size: 15px 15px;
  			border: 1px solid #333;
  			background-color: #fff;
  			text-decoration-color: #999;
  			border-radius: 0; 
  			-webkit-appearance: none; /* 네이티브 외형 감추기 */
  			-moz-appearance: none;
  			appearance: none;
  			outline: none;
  			margin : 10px;
			}
			div.wrap {
 		    height: 100%;
		    width: 100%;
		    background-image: url(img/banner-bg.jpg);
		    background-position: center;
		    background-size: cover;
		    position: absolute;
}


select:focus {
  border-color: #0094e1;
}
.idcheck, #sp {
	
  
   font-family: Arial, sans-serif;
	
	font-size: 12px;
}




.idcheck {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display : block;
    margin : auto;
    max-width: 180px;
    text-decoration: none;
    background: linear-gradient(to right, #ff105f, #ffad06);
    padding: 6px 35px;
     border-radius: 30px;
     border : 0;
}
#prefercheck{
	margin-top:10px;
	padding-top :10px
}
#prefer{
	margin_top:20px;
	padding-top :20px;
	color: gray;
	font-size: 14px;
}





        </style>

</head>
<body>

 <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">LOG IN</button>
                    <button type="button" class="togglebtn" onclick="register()">REGISTER</button>
                </div>
                
                <form id="login" action="loginCon" class="input-group" method="post">
                    <input type="text" class="input-field" name='id' placeholder="아이디 입력" required>
                    <input type="password" class="input-field" name='pw' placeholder="비밀번호 입력" required>
                    
                    <button class="submit">Login</button>
                </form>
                
                <form id="register" action="joinCon" class="input-group" method="post">
                    <input type="text" class="input-field" id="input_id" name="id" placeholder="id 입력" required>
                  	<ul id="sp" align="center"></ul>
                  	<input type="button" class="idcheck" value="ID중복체크" onclick="idCheck()" display="button">
                    <input type="password" class="input-field" name="pwd" placeholder="Enter Password" required>
                    <input type="text" class="input-field" name="name" placeholder="이름 입력" required>
                    <input type="text" class="input-field" name="addr" placeholder="주소 입력" required>
                    <p id="prefer">선호도 조사 </p>
                    <select name="prefer" class="checkbox" id="prefercheck">
                    	<option value = "modern">모던</option>
                    	<option value = "classic">클래식</option>
                    	<option value = "vintage">빈티지</option>
                    	<option value = "retro">레트로</option>
                    </select>
                   
                    <br>
                    <button class="submit">REGISTER</button>
                </form>
            </div>
        </div>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/jquery/jquery.scrollex.min.js"></script>
        <script src="vendor/jquery/jquery.scrolly.min.js"></script>
			
			
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
            function idCheck(){
				var input = document.getElementById("input_id");
				if (input.value=="") {
					sp.innerHTML = "입력한 값이 없습니다."
					return;
				}
				//innerText, innerHTML, value (input)
				//alert(input.value);
				$.ajax({
					//데이터 전송방식(get/post)
					type : "post",
					//전송할 데이터
					data : {"id" : input.value},
					//데이터를 전송할 서버페이지
					url : "idCheckCon",
					//응답데이터 타입
					dataType : "text",
					success : function(data){
						//alert(data);
						var sp = document.getElementById("sp");
						
						if (data == "true"){
							sp.innerHTML = "이미 가입된 이메일 입니다."
						}else {
							sp.innerHTML = "사용 가능한 이메일 입니다."
						}
					},
					error : function(){
						alert("실패");
					}
					
				});
			}
		
           
			
		
		
        </script>
        
</body>
</html>