<%@page import="java.util.ArrayList"%>
<%@page import="model.postVO"%>
<%@page import="model.postDAO"%>
<%@page import="model.userVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&display=swap" rel="stylesheet">

    <title>#광광곳곳</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/templatemo-plot-listing.css">
    <link rel="stylesheet" href="assets/css/animated.css">
    <link rel="stylesheet" href="assets/css/blog.css">
<!--

TemplateMo 551 Stand Blog

https://templatemo.com/tm-551-stand-blog

-->
<style>
#postPicture{
		width: 400px;
  		height: 400px;
  		object-fit : cover;
}
#postlikebtn{
	background-color: #f48840;
    		color: #fff;
    		font-size: 14px;
    		
    		padding: 6px 10px;
    		
    		transition: all .3s;
    		border: none;
    		outline: none;
    		
}
#likecnt {
	color:  #f48840;
        	padding-left : 5px;
        	padding-top : 5px;
        	font-size: 20px;
}
</style>
	<script src="assets/js/jquery-3.6.0.min.js"></script>
    <script src="assets/js/wishlist.js" charset="UTF-8"></script>
    <script>
		function needLogin(){
			alert("로그인 후 이용가능합니다.")
		}
	</script>
  </head>

  <body>
<%
userVO vo = (userVO)session.getAttribute("vo_session");
%>
    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
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
                <li><a href="listing.jsp" class="active">추천리스트</a></li>
                <li><a href="gotgan.jsp" >곳간</a></li>
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

    <!-- Page Content -->
    <!-- Banner Starts Here -->
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
    
    <!-- Banner Ends Here -->
    <!--배경색을 바꿔야하는데 어떻게 해야하는지........-->
    <section class="call-to-action" >
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="main-content">
              <div class="row">
                <div class="col-lg-8">
                  <span>맛집을 간직하여 두는 곳,</span>
                  <h4>#광광곳곳 곳간</h4>
                </div>
                <div class="col-lg-4">
                  <div class="main-button">
                    <a href="gotgan_post.jsp"><button type="submit" id="form-submit" class="main-button">Write</button></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
<%
request.setCharacterEncoding("utf-8");

postDAO postdao = new postDAO();
  postVO postvo = new postVO();
  ArrayList<postVO> postList =  postdao.print();          		  
%>

    <section class="blog-posts grid-system">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div class="all-blog-posts">
              <div class="row">
              <%for (int i=0; i<postList.size(); i++){ %>
            	<input type="hidden" id="postNum" value="<%if(postList!=null){ %><%=postList.get(i).getPost_num()%><%}%>">
            	<input type="hidden" id="p_user_id" value="<%if(vo!=null){ %><%=vo.getUser_id()%><%}%>">
                <div class="col-lg-6">
                  <div class="blog-post">
                    <div class="blog-thumb">
                      <img src="<%=postList.get(i).getPost_picture() %>" id="postPicture" alt="">
                    </div>
                    <div class="down-content">
                      <span><%=postList.get(i).getUser_id() %></span>
                      <a href="post-details.jsp"><h4><%=postList.get(i).getPost_title() %></h4></a>
                      <%if (vo==null){ %>
                      <div align="right"><button  id="postlikebtn"align="right" onclick="needLogin()">좋아요</button><label id="likecnt">+<%=postList.get(i).getPost_like() %></label></div>
                      <%}else{ %>
                      <div align="right"><button id="postlikebtn" align="right" onclick="postlike(<%=postList.get(i).getPost_num()%>)">좋아요</button><label id="likecnt">+<%=postList.get(i).getPost_like() %></label></div>
                      <%} %>
                      <ul class="post-info">
                        <li><a ><%=postList.get(i).getRegist_dt() %></a></li>
                        
                      </ul>
                      <p><%=postList.get(i).getPost_content() %></p>
                      <div class="post-options">
                        <div class="row" >
                          <div class="col-lg-12">
                            <ul class="post-tags">
                              
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <%} %>
       <!-- ====================================================================== -->
             
               
             
               
               
             
              </div>
            </div>
          </div>
         
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
    


    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Additional Scripts -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.js"></script>
    <script src="assets/js/slick.js"></script>
    <script src="assets/js/isotope.js"></script>
    <script src="assets/js/accordions.js"></script>

    <script language = "text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>

  </body>
</html>