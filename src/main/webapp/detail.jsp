<%@page import="model.hasgtagDAO"%>
<%@page import="model.hashtagVO"%>
<%@page import="model.reviewDAO"%>
<%@page import="model.reviewVO"%>
<%@page import="model.menuVO"%>
<%@page import="model.menuDAO"%>
<%@page import="model.storeVO"%>
<%@page import="model.storeDAO"%>
<%@page import="model.userVO"%>
<%@page import="java.util.ArrayList"%>
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
    
    <style>
   	 	
        #map{
            width:450px; height:450px; min-height:500px;

        }
        #reviewBtn, #reviewBtn2{
        	display: inline-block;
    	background-color: #f48840;
    	color: #fff;
    	font-size: 20px;
    	font-weight: 600;
    	padding: 12px 20px;
    	text-transform: uppercase;
    	transition: all .3s;
    	border: none;
    	outline: none;
    	margin-bottom : 10px
        }
        
        .reviewH4 {
        	margin-left : 70px;
        	
        }
        .hashtag {
        	font-size: 12px;
    		font-weight: 500;
    		color: #aaa;
    		display: inline-block;
    		border: 2px solid #eee;
    		border-bottom : 2px solid #eee;
    		padding: 3px 6px;
    		transition: all .3s;
        }
        #likebtn{
        	background-color: #f48840;
    		color: #fff;
    		font-size: 14px;
    		
    		padding: 6px 10px;
    		
    		transition: all .3s;
    		border: none;
    		outline: none;
    		
        }
        #btnCnt{
        	color:  #f48840;
        	padding-left : 5px;
        	padding-top : 5px;
        	font-size: 20px;
        }
       .blog-posts .comments ul li{
        	padding-bottom : 5px;
        }
    </style>
<!--

TemplateMo 551 Stand Blog

https://templatemo.com/tm-551-stand-blog

--><script src="assets/js/jquery-3.6.0.min.js"></script>
    <script src="assets/js/wishlist.js" charset="UTF-8"></script>
	<script>
		function needLogin(){
			alert("로그인 후 이용가능합니다.")
		}
	</script>
	
	
  </head>

  <body>
  <%
  request.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("euc-kr");
	String store_name = request.getParameter("name");	
  userVO vo = (userVO)session.getAttribute("vo_session");
  if (vo != null) {
	  %>
	  <script type="text/javascript">
	  isLogined = true;
	 </script>
	  <% 
  }
  
  storeDAO dao = new storeDAO();
  storeVO detailvo = dao.detailInfo(store_name);
  
  
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

    <section class="call-to-action">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="main-content">
              <div class="row">
                <div class="col-lg-8">
                  <span>이곳 어때?</span>
                  <h4><%=store_name %></h4>
                  <input type="hidden" id = "userId" value="<% if (vo != null) {%><%=vo.getUser_id()%><% } %>"/>
                  <input type="hidden" id = "storeId" value="<% if (detailvo != null) { %><%=detailvo.getId()%><% } %>"/>
                  <input type="hidden" id = "storeName" value="<% if (detailvo != null) { %><%=detailvo.getName()%><% } %>"/>
                </div>
                  
                		<div class="col-lg-4">
              			    <div class="main-button">
                 			   <button type="submit" id="form-submit" class="main-button" onclick="wishlist()">가고싶은곳</button>
                
             		
               
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>


    <section class="blog-posts grid-system">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div class="all-blog-posts">
              <div class="row">
                <div class="col-lg-12">
                  <div class="blog-post">
                    <div class="blog-thumb">
                     <!--  <img src="assets/images/blog-post-02.jpg" alt=""> --> 
                      
                    </div>
                    <div class="down-content">
                      <span></span>
                      <a href="post-details.jsp">
                      <h4> <ul class="post-info">
                        <li><%=detailvo.getType()%></li>
                         <li><%=detailvo.getTime()%></li>
                        <li><%=detailvo.getAddr()%></li>
                        
                      </ul></h4></a>
                     
	<% menuDAO menudao = new menuDAO();
       ArrayList<menuVO> menuList = menudao.printMenu(detailvo.getId()); 
       
       for (int i = 0; i< menuList.size(); i++){%>
    	   
    	   <p><%=menuList.get(i).getMenuName() %> : <%=menuList.get(i).getPrice() %></p>
      <%}%>
       
       

                      <div class="post-options">
                        <div class="row">
                          <div class="col-6">
                            <ul class="post-tags">
                             
                            </ul>
                          </div>
                          <div class="col-6">
                            <ul class="post-share">
                              <li><i class="fa fa-share-alt"></i></li>
                              <li><a href="#">SHARE URL</a></li>
                              <li><a href="#"> </a></li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-12">
                  <div class="sidebar-item comments">
                    <div class="sidebar-heading">
                      
                      <%if (vo==null){ %>                     
                      	<button id="reviewBtn" onclick="needLogin()">리뷰 쓰기</button>
                      <%} else { %>
                     	 <a href = "review.jsp?storeId=<%=detailvo.getId()%>&storeName=<%=detailvo.getName()%>"><button id="reviewBtn2" onclick="needLogin">리뷰 쓰기</button></a>
                      <%} %>                       
                       <%reviewDAO rvdao = new reviewDAO();
                      ArrayList<reviewVO> reviewList = rvdao.print(detailvo.getId());%> 
                      <h2><%=reviewList.size() %> comments</h2>
                    </div>
                    <div class="content">
                      <ul>
                    
                      <%for (int i=0; i<reviewList.size(); i++) { %>
                       
                      <input type="hidden" id="r_user_id" value="<%if(vo!=null){ %><%=vo.getUser_id()%><%} %>"/>
                      <input type="hidden" id="reviewNum" value="<%if(reviewList!=null){ %><%=reviewList.get(i).getReview_num()%><%} %>"/>
                    	   <li>
                          <div class="author-thumb">
                            <img src="<%=reviewList.get(i).getReview_picture()%>" alt="">
                          </div>
                          <div class="right-content">
                            <h4 class="reviewH4"><%=reviewList.get(i).getUser_id()%><span><%=reviewList.get(i).getRegist_dt()%></span>
                            <%if (vo==null){ %>
                            	<div align="right"><button id="likebtn" onclick="needLogin()">공감</button><label id ="btnCnt">+<%=reviewList.get(i).getReviw_like() %></label></div></h4>
                            <%} else {%>
                            
                            	<div align="right"><button id="likebtn" onclick="like(<%=reviewList.get(i).getReview_num()%>)">공감</button><label id ="btnCnt">+<%=reviewList.get(i).getReviw_like() %></label></div></h4>
                            	
                            <%} %>
                            <span>
                            	<ul class="rate">
                            	<%for(int j=0; j< reviewList.get(i).getReview_score(); j++) {%>
                            		<li><i class="fa fa-star" ></i></li><%}%>
                            	</ul>
                            </span>
                                                        
                            <p><%=reviewList.get(i).getReview_content() %></p>
                            <%
                            hasgtagDAO hsdao = new hasgtagDAO();
                            hashtagVO hsvo = hsdao.print(reviewList.get(i).getReview_num());  %>
                            <div>
                            	<ul>
                            		<%if (hsvo != null){ %>
                            		<li class="hashtag">#<%=hsvo.getMood() %></li>
                            		<li class="hashtag">#<%=hsvo.getWith_who() %></li>
                            		<li class="hashtag">#<%=hsvo.getFacil() %>  </li>
                            		<li></li>
                            		
                            		<%} %>
                            		
                            	</ul>
                            </div>
                          </div>
                        </li>
                        
                     <% } %>
                       
                        
                      </ul>
                    </div>
                  </div>
                </div>
       
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="sidebar">
              <div class="row">
                <div class="col-lg-12">
                  
                    <div id="map" margin="0px"></div>
                    <div class="col-lg-12">
                  <div class="sidebar-item tags">
                    <div class="sidebar-heading">
                      <h2></h2>
                    </div>
                    <div class="content">
                      <ul>
                       
                      </ul>
                    </div>
                  </div>
                </div>
                  
                </div>
                
                
              </div>
            </div>
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
 
	
        		   
    </script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a61309d4bb479f1b231b6b8f84698bf&libraries=services"></script>
    <script>

    //var storeId = $("#storeId").val();

   // $.post("mapSearch", storeId, function(data){
        //if(data){
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(<%=detailvo.getLat()%>,<%=detailvo.getLng()%>), // 지도의 중심좌표
                level: 2 // 지도의 확대 레벨	
            };
            
            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
            
            // 마커가 표시될 위치입니다 
            var markerPosition  = new kakao.maps.LatLng(<%=detailvo.getLat()%>,<%=detailvo.getLng()%>); 
            
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            
            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);
            
            // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
            // marker.setMap(null);    
       // }
   // });


    

    
    </script>
    
    
    

  </body>
</html>
