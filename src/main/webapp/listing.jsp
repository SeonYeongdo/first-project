<%@page import="model.storeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.storeDAO"%>
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
      <script src="assets/js/jquery-3.6.0.min.js"></script>
  <script src="assets/js/listing.js" charset="UTF-8"></script>
  
    <% String type = (String) request.getParameter("type"); 
	if (type != null) {%>
		<script type="text/javascript">
			type = '<%=type%>';
		</script>
	<%} %>
	
	<style>
	#store_picture{
		width: 300px;
  		height: 300px;
  		object-fit : cover;
	}
	</style>

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
              <li><a href="index.jsp" class="active">홈</a></li>
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
  <!-- ***** Header Area End ***** -->

  <div class="page-heading">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
          <div class="top-text header-text">
            <h6>TRUST US, FOLLOW US</h6>
            <h2>나만의 광주맛집을 찾아주는 곳, 광광곳곳!</h2>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="listing-page">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="naccs">
            <div class="grid">
              <div class="row">
                <div class="col-lg-3">
                  <div class="menu">
                    <div id="modern_div" class="first-thumb">
                      <div class="thumb">
                        <span class="icon"><img src="assets/images/search-icon-01.png" alt="Modern"></span>
                        Modern
                      </div>
                    </div>
                    <div id="classic_div">
                      <div class="thumb">                 
                        <span class="icon"><img src="assets/images/search-icon-01.png" alt="Classic"></span>
                        Classic
                      </div>
                    </div>
                    <div id="vintage_div">
                      <div class="thumb">                 
                        <span class="icon"><img src="assets/images/search-icon-01.png" alt="Vintage"></span>
                        Vintage
                      </div>
                    </div>
                    <div id="retro_div" class="last-thumb">
                      <div class="thumb">                 
                        <span class="icon"><img src="assets/images/search-icon-01.png" alt="Retro"></span>
                        Retro
                      </div>
                    </div>
                  </div>
    <%
	String type_modern = "모던";
	String type_classic = "클래식";
	String type_vintage = "빈티지";
	String type_retro = "레트로";
	request.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("euc-kr");
	storeDAO dao = new storeDAO();
    ArrayList<storeVO> arr1 = dao.htSearch(type_modern);
    ArrayList<storeVO> arr2 = dao.htSearch(type_classic);
    ArrayList<storeVO> arr3 = dao.htSearch(type_vintage);
    ArrayList<storeVO> arr4 = dao.htSearch(type_retro);
	%>
                </div> 
                <div class="col-lg-9">
                  <ul class="nacc">
                  <!-- first category listing of items -->
                    <li class="active">
                      <div>
                      <% 
  						for (int i=0; i<arr1.size(); i++){%>
             			 <div class="col-lg-12">
                          <div class="owl-carousel owl-listing">
                            <div class="item">
                              <div class="row">
                                <div class="col-lg-12">
                                  <div class="listing-item">
                                    <div class="left-image">
                                      <a href="#"><img src="<%=arr1.get(i).getPicture() %>" id="store_picture" alt=""></a>
                                      <div class="hover-content">
                                        <div class="main-white-button">
                                          <a href="detail.jsp?name=<%=arr1.get(i).getName()%>"><i class="fa fa-eye"></i>상세정보</a>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="right-content align-self-center">
                                      <a href="#"><h4><%=arr1.get(i).getName() %></h4></a>
                                      <h6><%=arr1.get(i).getType() %></h6>
                                      <span class="price"><div class="icon"><img src="assets/images/listing-icon-01.png" alt=""></div> <%=arr1.get(i).getAddr() %></span>
                                      <span class="details">영업시간 <em><%=arr1.get(i).getTime() %></em></span>
                                     
                                    </div>
                                  </div>
                                </div>
                                <%} %>
                      </div>
                    </li>
   <!--====================================================모던======================================================== -->                 
                    <!-- second category listing of items -->
                    <li>
                      <div>
                        <% 
  						for (int i=0; i<arr2.size(); i++){%>
             			 <div class="col-lg-12">
                          <div class="owl-carousel owl-listing">
                            <div class="item">
                              <div class="row">
                                <div class="col-lg-12">
                                  <div class="listing-item">
                                    <div class="left-image">
                                      <a href="#"><img src="<%=arr2.get(i).getPicture() %>" id="store_picture" alt=""></a>
                                      <div class="hover-content">
                                        <div class="main-white-button">
                                          <a href="detail.jsp?name=<%=arr2.get(i).getName()%>"><i class="fa fa-eye"></i>상세정보</a>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="right-content align-self-center">
                                      <a href="#"><h4><%=arr2.get(i).getName() %></h4></a>
                                      <h6><%=arr2.get(i).getType() %></h6>
                                      <span class="price"><div class="icon"><img src="assets/images/listing-icon-01.png" alt=""></div> <%=arr2.get(i).getAddr() %></span>
                                      <span class="details">영업시간 <em><%=arr2.get(i).getTime() %></em></span>
                                     
                                    </div>
                                  </div>
                                </div>
                                <%} %>
                      </div>
                    </li>
  <!-- ==================================================클래식========================================================== -->                  
                    <!-- third category first page -->
                    <li>
                      <div>
                       <% 
  						for (int i=0; i<arr3.size(); i++){%>
             			 <div class="col-lg-12">
                          <div class="owl-carousel owl-listing">
                            <div class="item">
                              <div class="row">
                                <div class="col-lg-12">
                                  <div class="listing-item">
                                    <div class="left-image">
                                      <a href="#"><img src="<%=arr3.get(i).getPicture() %>" id="store_picture" alt=""></a>
                                      <div class="hover-content">
                                        <div class="main-white-button">
                                          <a href="detail.jsp?name=<%=arr3.get(i).getName()%>"><i class="fa fa-eye"></i>상세정보</a>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="right-content align-self-center">
                                      <a href="#"><h4><%=arr3.get(i).getName() %></h4></a>
                                      <h6><%=arr3.get(i).getType() %></h6>
                                      <span class="price"><div class="icon"><img src="assets/images/listing-icon-01.png" alt=""></div> <%=arr3.get(i).getAddr() %></span>
                                      <span class="details">영업시간 <em><%=arr3.get(i).getTime() %></em></span>
                                     
                                    </div>
                                  </div>
                                </div>
                                <%} %>
                      </div>
                    </li>
                    
                    <!-- 4th category 1st page -->
                    <li>
                      <div>
                        <% 
  						for (int i=0; i<arr4.size(); i++){%>
             			 <div class="col-lg-12">
                          <div class="owl-carousel owl-listing">
                            <div class="item">
                              <div class="row">
                                <div class="col-lg-12">
                                  <div class="listing-item">
                                    <div class="left-image">
                                      <a href="#"><img src="<%=arr4.get(i).getPicture() %>" id="store_picture" alt=""></a>
                                      <div class="hover-content">
                                        <div class="main-white-button">
                                          <a href="detail.jsp?name=<%=arr4.get(i).getName()%>"><i class="fa fa-eye"></i>상세정보</a>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="right-content align-self-center">
                                      <a href="#"><h4><%=arr4.get(i).getName() %></h4></a>
                                      <h6><%=arr4.get(i).getType() %></h6>
                                      <span class="price"><div class="icon"><img src="assets/images/listing-icon-01.png" alt=""></div> <%=arr4.get(i).getAddr() %></span>
                                      <span class="details">영업시간 <em><%=arr4.get(i).getTime() %></em></span>
                                     
                                    </div>
                                  </div>
                                </div>
                                <%} %>
                      </div>
                    </li>
     <!--  ===================================== -->
                    
                  </ul>
                  
                </div>          
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <div class="about">
            <div class="logo">
              <img src="assets/images/black-logo.png" alt="">
            </div>
            <p>Lorem ipsum dolor sit amet, consectetur adicingi elit, sed do eiusmod tempor incididunt ut et dolore magna aliqua.</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="helpful-links">
            <h4>Helpful Links</h4>
            <div class="row">
              <div class="col-lg-6">
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
            <p>27th Street of New Town, Digital Villa</p>
            <div class="row">
              <div class="col-lg-6">
                <a href="#">010-020-0340</a>
              </div>
              <div class="col-lg-6">
                <a href="#">090-080-0760</a>
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
  <!-- <script src="vendor/jquery/jquery.min.js"></script> -->
  
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/animation.js"></script>
  <script src="assets/js/imagesloaded.js"></script>
  <script src="assets/js/custom.js"></script>
  


</body>

</html>