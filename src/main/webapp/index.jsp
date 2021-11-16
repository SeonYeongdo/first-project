
<%@page import="model.storeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.storeDAO"%>
<%@ page import="model.userVO"%>
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
<!--

TemplateMo 564 Plot Listing

https://templatemo.com/tm-564-plot-listing

-->
  <style>
    #flex{
      display: flex;

    }

    .search1{
      flex-grow: 19;

    }

    .search2{
      flex-grow: 1;

    }

  	#store_picture {
  		width: 350px;
  		height: 350px;
  		object-fit : cover;
  	}
 

  </style>


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
              <li><a href="listing.jsp?type=modern">추천리스트</a></li>
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

  <div class="main-banner">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="top-text header-text">
            <h6>Trust us, Follow us</h6>
            <h2>나만의 광주맛집을 찾아주는 곳, 광광곳곳!</h2>
          </div>
        </div>
        <div class="col-lg-12">
          <form id="search-form" name="gs" method="submit" role="search" action="search.jsp">
            <div class="row" id = "flex">
              
              <div class="col-lg-3 align-self-center search1">
                  <fieldset>
                      <input type="address" name="address" class="searchText" placeholder="Enter a location" autocomplete="on" required>
                  </fieldset>
              </div>
             
              <div class="col-lg-3 search2">                        
                  <fieldset>
                      <button class="main-button"><i class="fa fa-search" ></i> Search Now</button>
                  </fieldset>
            
              </div>
            </div>
          </form>
        </div>
        <div class="col-lg-10 offset-lg-1">
          <ul class="categories">
            <li><a href="listing.jsp?type=modern"><span class="icon"><img src="assets/images/search-icon-01.png" alt="Modern"></span> Modern</a></li>
            <li><a href="listing.jsp?type=classic"><span class="icon"><img src="assets/images/search-icon-01.png" alt="Classic"></span> Classic</a></li>
            <li><a href="listing.jsp?type=vintage"><span class="icon"><img src="assets/images/search-icon-01.png" alt="Vintage"></span> Vintage</a></li>
            <li><a href="listing.jsp?type=retro"><span class="icon"><img src="assets/images/search-icon-01.png" alt="Retro"></span> Retro</a></li>
            <!-- 아이콘을 클릭하면 해당 페이지로 연결 -->
          </ul>
        </div>
      </div>
    </div>
  </div>
  <%
  String input = "카페";
  storeDAO dao = new storeDAO();
  ArrayList<storeVO> arr = new ArrayList<storeVO>();
  if (vo!=null){
	  if (vo.getUser_prefer().equals("modern")){  
	  	input = "모던";
	  }else if (vo.getUser_prefer().equals("classic")) {
		  input = "클래식";
	  }else if (vo.getUser_prefer().equals("retro")) {
		  input = "레트로";
	  }else if (vo.getUser_prefer().equals("vintage")) {
		  input = "빈티지";
	  }
	  arr = dao.htSearch(input);
  } else {
 
  	arr = dao.search(input);
  } %>
  <div class="recent-listing">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="section-heading">
           <%if (vo==null){ %>
            <h2>이곳 어때?</h2>
            <%} else { %>
            	<h2><%=vo.getUser_name()%>님의 '<%=input %>' 취향에 적합한 곳곳 입니다.</h2>
            <%} %>
            	<h6>customize</h6>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="owl-carousel owl-listing">
            <div class="item">
              <div class="row">
              <% for (int i =0; i <arr.size(); i++) { %>
                
               
                <div class="col-lg-12">
                  <div class="listing-item">
                    <div class="left-image">
                      <a href="detail.jsp?name=<%=arr.get(i).getName()%>"><img src="<%=arr.get(i).getPicture() %>" id="store_picture" alt=""></a>
                    </div>
                    <div class="right-content align-self-center">
                      <a href="detail.jsp?name=<%=arr.get(i).getName()%>"><h4><%=arr.get(i).getName() %></h4></a>
                      <h6><%=arr.get(i).getType() %></h6>
                      <ul class="rate">
                        <li><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                        <li>(18) Reviews</li>
                      </ul>
                      <span class="price"><div class="icon"><img src="assets/images/listing-icon-01.png" alt=""></div><%=arr.get(i).getAddr() %></span>
                      <span class="details">영업시간 : <em><%=arr.get(i).getTime() %></em></span>
                      
                      <div class="main-white-button">
                        <a href="detail.jsp?name=<%=arr.get(i).getName()%>"><i class="fa fa-eye"></i>자세히보기</a>
                      </div>
                    </div>
                  </div>
                </div>
                 <%}%>
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="popular-categories">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="section-heading">
            <h2>광주곳곳</h2>
          
            	<h6>yogiorangge</h6>
            
          </div>
        </div>
        <div class="col-lg-12">
          <div class="naccs">
            <div class="grid">
              <div class="row">
                <div class="col-lg-3">
                  <div class="menu">
                    <div class="first-thumb active">
                      <div class="thumb">
                        <span class="icon"><img src="assets/images/search-icon-01.png" alt=""></span>
                        광산구
                      </div>
                    </div>
                    <div>
                      <div class="thumb">                 
                        <span class="icon"><img src="assets/images/search-icon-01.png" alt=""></span>
                        서구
                      </div>
                    </div>
                    <div>
                      <div class="thumb">                 
                        <span class="icon"><img src="assets/images/search-icon-01.png" alt=""></span>
                        북구
                      </div>
                    </div>
                    <div>
                      <div class="thumb">                 
                        <span class="icon"><img src="assets/images/search-icon-01.png" alt=""></span>
                        동구
                      </div>
                    </div>
                    <div class="last-thumb">
                      <div class="thumb">                 
                        <span class="icon"><img src="assets/images/search-icon-01.png" alt=""></span>
                        남구
                      </div>
                    </div>
                  </div>
                </div> 
                <div class="col-lg-9 align-self-center">
                  <ul class="nacc">
                    <li class="active">
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-5 align-self-center">
                              <div class="left-text">
                                <h4> </h4>
                                <p> </p>
                                <div class="main-white-button"><a href="search.jsp?address=광산구"><i class="fa fa-eye"></i>광산구 곳곳</a></div>
                              </div>
                            </div>
                            <div class="col-lg-7 align-self-center">
                              <div class="right-image">
                                <img src="assets/images/gu/gwangsan.JPG" alt="">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-5 align-self-center">
                              <div class="left-text">
                                <h4> </h4>
                                <p> </p>
                                <div class="main-white-button"><a href="search.jsp?address=서구"><i class="fa fa-eye"></i>서구 곳곳</a></div>
                              </div>
                            </div>
                            <div class="col-lg-7 align-self-center">
                              <div class="right-image">
                                <img src="assets/images/gu/seo.JPG" alt="Foods on the table">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-5 align-self-center">
                              <div class="left-text">
                                <h4> </h4>
                                <p> </p>
                                <div class="main-white-button"><a href="search.jsp?address=북구"><i class="fa fa-eye"></i>북구 곳곳</a></div>
                              </div>
                            </div>
                            <div class="col-lg-7 align-self-center">
                              <div class="right-image">
                                <img src="assets/images/gu/buk.JPG" alt="cars in the city">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-5 align-self-center">
                              <div class="left-text">
                                <h4> </h4>
                                <p> </p>
                                <div class="main-white-button"><a href="search.jsp?address=동구"><i class="fa fa-eye"></i>동구 곳곳</a></div>
                              </div>
                            </div>
                            <div class="col-lg-7 align-self-center">
                              <div class="right-image">
                                <img src="assets/images/gu/dong.JPG" alt="Shopping Girl">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-5 align-self-center">
                              <div class="left-text">
                                <h4> </h4>
                                <p> </p>
                                <div class="main-white-button"><a rel="nofollow" href="search.jsp?address=남구"><i class="fa fa-eye"></i>남구 곳곳</a></div>
                              </div>
                            </div>
                            <div class="col-lg-7 align-self-center">
                              <div class="right-image">
                                <img src="assets/images/gu/nam.JPG" alt="Traveling Beach">
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
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
              <img src="assets/images/black-logo.png" alt="Plot Listing">
            </div>
            <p>If you consider that <a rel="nofollow" href="https://templatemo.com/tm-564-plot-listing" target="_parent">Plot Listing template</a> is useful for your website, please <a rel="nofollow" href="https://www.paypal.me/templatemo" target="_blank">support us</a> a little via PayPal.</p>
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
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/animation.js"></script>
  <script src="assets/js/imagesloaded.js"></script>
  <script src="assets/js/custom.js"></script>

</body>

</html>
