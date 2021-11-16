<%@page import="model.reviewVO"%>
<%@page import="model.reviewDAO"%>
<%@page import="model.userDAO"%>
<%@page import="model.wishlistVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.wishlistDAO"%>
<%@page import="model.userVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>#광광곳곳</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-plot-listing.css">
    <link rel="stylesheet" href="assets/css/animated.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <script src="assets/js/wishlist.js" charset="UTF-8"></script>
    
<!--

TemplateMo 564 Plot Listing

https://templatemo.com/tm-564-plot-listing

-->

</head>

<body>
<%
userVO vo = (userVO)session.getAttribute("vo_session");
%>
  <!-- ***** Preloader Start ***** -->
  <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div>
  <!-- ***** Preloader End ***** -->

  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <nav class="main-nav">
            <!-- ***** Logo Start ***** -->
            <a href="index.jsp" class="logo">
            </a>
            <!-- ***** Logo End ***** -->
            <!-- ***** Menu Start ***** -->
            <ul class="nav">
              <li><a href="index.jsp">홈</a></li>
              <li><a href="listing.jsp">추천리스트</a></li>
              <li><a href="gotgan.jsp">곳간</a></li>
              <%if (vo==null){%> 
              <li><div class="main-white-button"><a href="loginForm.jsp"><i class="fa fa-plus"></i> 로그인/회원가입</a></div></li> 
              <%} else {  %>
                <li><a href="mypage.jsp">마이페이지</a></li>
               <li><a href="logoutCon">로그아웃</a></li>
                
              <%} %>
            </ul>        
            <a class='menu-trigger'>
                <span>Menu</span>
            </a>
            <!-- ***** Menu End ***** -->
          </nav>
        </div>
      </div>
    </div>
  </header>

  <style>
    body{
  padding: 0;
  margin: 0;
}
div{
  box-sizing: border-box;
}

/* alert badge */
.circle{
  display: inline-block;
  width: 5px;
  height: 5px;
  border-radius: 2.5px;
  background-color: #ff0000;
  position: absolute;
  top: -5px;
  left: 110%;
}

/* 녹색 텍스트 */
.green{
  color: #24855b;
}

.wrap{
  background-color: #F8F8F8;  
}
/* 녹색배경 */
.greenContainer{  
  height: 132px;
  background-color: #24855b;    
  
  display: flex;
  align-items: flex-end;
  padding: 16px;
}

.greenContainer .name{
   font-size: 35px;
  font-weight: bold;
  color: #ffffff;
} 
.greenContainer .modify{
  margin-left: auto;
}

/* 가고 싶은 곳 , 작성한 리뷰, 적립금 박스 */
.summaryContainer{
  background-color: white;  
  display: flex;  
  padding: 21px 16px;  
  height: 90px;
  margin-bottom: 10px;
}
/* 가고 싶은 곳 , 작성한 리뷰 , 적립금 */
.summaryContainer .item{
  flex-grow: 1
}
/* 녹색 숫자 */
.summaryContainer .number{
  font-size: 29px;
  font-weight: bold;
  color: #24855b;
}
/* 텍스트 */
.summaryContainer .item > div:nth-child(2){
  font-size: 20px;
}



/*탭*/
.List {
     min-width: 100%;
     max-width: 800px;
     padding: 10px;    
     border-radius: 7px;;        
     background: #ffffff;}

 section {
     display: none;
     padding: 20px 0 0;
     border-top: 1px solid #ddd;
    
     }
     

 input {
       display: none;}

 label {
     display: inline-block;
     padding: 15px 25px;
     font-weight: 600;
     color: #bbb;
     border: 1px solid transparent;}

 label:hover {
     color: #2e9cdf;
     cursor: pointer;}

 /*input 클릭시, label 스타일*/
 input:checked + label {
       color: #555;
       border: 1px solid #ddd;
       border-top: 2px solid #2e9cdf;
       border-bottom: 1px solid #ffffff;}

 #tab1:checked ~ #content1,
 #tab2:checked ~ #content2,
 #tab3:checked ~ #content3,
 #tab4:checked ~ #content4 {
     display: block;}




/*  */
.listContainer .item:hover{
/*   background-color: #f8f8f8; */
}
.infoContainer .item:hover{
/*   background-color: #f8f8f8; */
}

#wlist {
	display : inline;
}
#wishtable{
	width: 100%;
	text-align: center;
	font-size: 20px;
	
}
#delbtn{
	background-color: #24855b;
    		color: #fff;
    		font-size: 17px;
    		
    		padding: 4px 7px;
    		
    		transition: all .3s;
    		border: none;
    		outline: none;
}
  </style>
  <!-- ***** Header Area End ***** -->

<%
 
  wishlistDAO wdao = new wishlistDAO();
  ArrayList<wishlistVO> wArr = wdao.forMypage(vo.getUser_id()); %>
  <div class="page-heading">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
          <div class="top-text header-text">
            <h6></h6>
            <h2>MyPage</h2>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="wrap">
    <div class="greenContainer">
      <div>
        <div class="grade"></div>
        <div class="name"><%=vo.getUser_name() %></div>
      </div>    
      <div class="modify">i</div>    
    </div>
    <div class="summaryContainer">
      <div class="item">
          <div class="number"><%=wArr.size() %></div>
          <div>가고 싶은 곳</div>
        </div>
        <% reviewDAO rvdao = new reviewDAO();
        ArrayList<reviewVO> rvvo = rvdao.reviewCount(vo.getUser_id());
        %>
        <div class="item">
          <div class="number"><%=rvvo.size() %></div>
          <div>작성한 리뷰</div>
        </div>
        
        <div class="item">
          <div class="number"><%=vo.getUser_mileage() %></div>
          <div>적립금</div>
        </div>
    </div>  
 

   
  
    </div>
  </div>

  <!--탭-->
  <div class="List" style="text-align:left">
 
    <input id="tab1" type="radio" name="tabs" checked> 
    <label for="tab1">가고 싶은 곳</label>
 
    <input id="tab2" type="radio" name="tabs">
    <label for="tab2">최근 본 곳</label>
 
 
    <section id="content1" style="margin-bottom:20px;">
        <table align="center" border = "1px" id="wishtable">
       <%
       String stn = null;
       for (int i =0; i<wArr.size(); i++) {
        	stn = wdao.printWishlist(wArr.get(i).getStoreID());%>
      		<tr>
      		<td><a href="detail.jsp?name=<%=stn%>" ><%=stn %></a></td>
      		<input type="hidden" id = "userId2" value="<% if (vo != null) {%><%=vo.getUser_id()%><% } %>"/>
       		<input type="hidden" id = "storeId2" value="<% if (wArr != null) { %><%=wArr.get(i).getStoreID()%><% } %>"/>
      		<td><button onclick="delWishlist()" id="delbtn">삭제</button></td> 
       		</tr>
       <%} %>
       
      </table>
    </section>
 
    <section id="content2" style="margin-bottom:20px;">
  
  		탭2 내용     
       
    </section>



    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <div class="about">
              <div class="logo">
                <img src="assets/images/black-logo.png" alt="Plot Listing">
              </div>
              <p>해시태그로 믿을만한 광주곳곳 맛집을 소개해주는 곳</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="helpful-links">
              <h4>Helpful Links</h4>
              <div class="row">
                <div class="col-lg-6 col-sm-6">
                  <ul>
                    <li><a href="#">Categories</a></li>
                    <li><a href="#">Reviews</a></li>
                    <li><a href="#">Listing</a></li>
                    <li><a href="#">Contact Us</a></li>
                  </ul>
                </div>
                <div class="col-lg-6">
                  <ul>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Awards</a></li>
                    <li><a href="#">Useful Sites</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="contact-us">
              <h4>Contact Us</h4>
              <p>Gwang Team</p>
              <div class="row">
                <div class="col-lg-6">
                  <a href="#">010-0000-0000</a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-12">
            <div class="sub-footer">
              <p>Copyright © 2021 Plot Listing Co., Ltd. All Rights Reserved.
              <br>
        Design: <a rel="nofollow" href="https://templatemo.com" title="CSS Templates">TemplateMo</a></p>
            </div>
          </div>
        </div>
      </div>
    </footer>


  <!-- Scripts -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/animation.js"></script>
  <script src="assets/js/imagesloaded.js"></script>
  <script src="assets/js/custom.js"></script>

</body>

</html>
