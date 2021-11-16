<%@page import="model.userVO"%>
<%@page import="model.storeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.storeDAO"%>
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
<!--
TemplateMo 564 Plot Listing

https://templatemo.com/tm-564-plot-listing

-->
  <style>
  	#store_picture {
  		width: 350px;
  		height: 350px;
  		object-fit : cover;
  	}
  	.modal_wrap{
      display: none;
      width: 500px;
      height: 500px;
      position: absolute;
      top:50%;
      left: 50%;
      margin: -250px 0 0 -250px;
      background:#eee;
      z-index: 2;
      }

      .black_bg{
          display: none;
          position: absolute;
          content: "";
          width: 100%;
          height: 100%;
          background-color:rgba(0, 0,0, 0.5);
          top:0;
          left: 0;
          z-index: 1;
      }
      .modal_close{
          width: 26px;
          height: 26px;
          position: absolute;
          top: -30px;
          right: 0;
      }
      .modal_close> a{
          display: block;
          width: 100%;
          height: 100%;
          background:url(https://img.icons8.com/metro/26/000000/close-window.png);
          text-indent: -9999px;
      }

      #modal_filter{
        padding-top: 10px;
        padding-left: 30px;
        padding-right: 30px
      }

      legend{
          background-color:orange;
          color:aliceblue;
          font-weight: bolder;
      }
      .forCenter{
        text-align: center;
        margin: 40px 0 ;
      }
      .forMargin{
        margin:  0 10px;
      }
      .forpadding{
        padding-top: 20px;
      }
      #modal_btn, .filter_btn{
        align: center;
        /* display: inline-flex; */
        background-color: orange;
        color: #fff;
        font-size: 20px;
        font-weight: 600;
        border: none;
        outline: none;
        width: 100px;
        border-radius: 10px;
        float: right;
      }
      #onlyfilter{
        padding-right: 100px;
        margin-top: 50px;
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
              <li><a href="listing.jsp">추천리스트</a></li>
              <li><a href="gotgan.jsp">곳간</a></li>
               
              <%if (vo==null){%> 
              <li><div class="main-white-button"><a href="loginForm.jsp"><i class="fa fa-plus"></i> 로그인/회원가입</a></div></li> 
              <%} else {  %>
                <li><a href="contact.jsp">마이페이지</a></li>
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
  <div id="modal_section"> 
    <!--필터 기능 만들기-->
    <div id = "onlyfilter">
      <input type='button' id="modal_btn" value="필터">
    
        <div class="black_bg"></div>
        <div class="modal_wrap" style="z-index:99!important">
            <div class="modal_close"><a href="#">close</a></div>
            <div>
                <form id="modal_filter">
                <div class="forCenter" >
                  <div class="forGroup">
                      <legend>구별</legend>      
                      <div id="guDiv" class="forpadding">         
                        <input class="forMargin" type="checkbox" id="select1"><label id ="label_select1" for="select1">광산구</label>
                        <input class="forMargin" type="checkbox" id="select2"><label id ="label_select2" for="select2">서구</label>
                        <input class="forMargin" type="checkbox" id="select3"><label id ="label_select3" for="select3">동구</label>
                        <input class="forMargin" type="checkbox" id="select4"><label id ="label_select4" for="select4">북구</label>
                        <input class="forMargin" type="checkbox" id="select5"><label id ="label_select5" for="select5">남구</label>
                      </div> 
                  </div>
                </div>

                <div class="forCenter" >
                  <div class="forGroup">
                    <legend>1인당 가격</legend>
                    <div id="priceDiv" class="forpadding">                
                      <input class="forMargin" type="checkbox" id="select6"><label id ="label_select6" for="select6">0~1만원</label>
                      <input class="forMargin" type="checkbox" id="select7"><label id ="label_select7" for="select7">1만원대</label>
                      <input class="forMargin" type="checkbox" id="select8"><label id ="label_select8" for="select8">2만원대</label>
                      <input class="forMargin" type="checkbox" id="select9"><label id ="label_select9" for="select9">3만원이상</label>
                    </div>        
                  </div>
                </div>

                <div class="forCenter" >
                  <div class="forGroup">
                    <legend>음식종류</legend>
                    <div id="typeDiv" class="forpadding"> 
                      <input class="forMargin" type="checkbox" id="select10"><label id ="label_select10" for="select10">한식</label>
                      <input class="forMargin" type="checkbox" id="select11"><label id ="label_select11" for="select11">일식</label>
                      <input class="forMargin" type="checkbox" id="select12"><label id ="label_select12" for="select12">중식</label>
                      <input class="forMargin" type="checkbox" id="select13"><label id ="label_select13" for="select13">양식</label>
                      <input class="forMargin" type="checkbox" id="select14"><label id ="label_select14" for="select14">카페</label>
                      </div>
                  </div>
                </div>
                
                
                
                <div class="forCenter" >
                  <input type="button" value="적용" class="filter_btn" id="btnFilter">
                </div>
                </form>
                
            </div>
        
          <!--필터모달기능-->
        <script>
            window.onload = function() {
        
            function onClick() {
                document.querySelector('.modal_wrap').style.display ='block';
                document.querySelector('.black_bg').style.display ='block';
            }   
            function offClick() {
                document.querySelector('.modal_wrap').style.display ='none';
                document.querySelector('.black_bg').style.display ='none';
            }
        
            document.getElementById('modal_btn').addEventListener('click', onClick);
            document.querySelector('.modal_close').addEventListener('click', offClick);
        
          };
        </script>
        </div>
    </div>
  </div>  
   <%
	request.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("euc-kr");
	String search = request.getParameter("address");	
	storeDAO dao = new storeDAO();
    ArrayList<storeVO> arr = dao.search(search);
  %>
  <div class="recent-listing">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="section-heading">
          	<%if (arr.size() == 0){%>
          		<h2>"<%=search %>"에 대한 검색 결과가 없습니다.</h2>
          	<%} else {%>   	
            	<h2>이곳 어때?</h2>
            	<h6>customize</h6>
            	<%} %>
            
          </div>
        </div>
   <!-- ==================================================================================== -->
        <div class="col-lg-12">
          <div class="owl-carousel owl-listing">
            <div class="item">
              <div class="storeList" class="row">
     <!-- ==================================================================================== -->
 
  <% 
  
  for (int i=0; i<arr.size(); i++){%>
                <div class="col-lg-12">
                  <div class="listing-item">
                    <div class="left-image">
                      <a href="#"><img src="<%=arr.get(i).getPicture() %>" id="store_picture" alt=""></a>
                    </div>
                    <div class="right-content align-self-center">
                     
                      <a href="detail.jsp?name=<%=arr.get(i).getName() %>" id = "goDetail"><h4 class="test0"><%=arr.get(i).getName() %></h4></a>                                                                
                      <h6><%=arr.get(i).getType() %></h6>
                
                      <ul class="rate">
                        <li><i class="fa fa-star"></i></li>
                        <li><i class="fa fa-star"></i></li>
                        <li><i class="fa fa-star-half"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                        <li>(18) Reviews</li>
                      </ul>
                      <span class="price"><div class="icon"><img src="assets/images/listing-icon-01.png" alt=""></div>  <%=arr.get(i).getAddr() %></span>
                      <span class="details">영업시간 : <em><%=arr.get(i).getTime() %></em></span>
                      <ul class="info">
                        
                      </ul>
                      <div class="main-white-button">
                      	
                        <a href="detail.jsp?name=<%=arr.get(i).getName() %>" ><i class="fa fa-eye"></i>상세정보 보기</a>
                      </div>
                    </div>
                  </div>
                </div>
     <% }%>
    <!-- ==================================================================================== -->
 

              
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

 				<script type="text/javascript">
                	$("#btnFilter").click(function() {
                		
                		var gup = "", pricep = "", typep = "";
                		
                		$("#guDiv").find("input").each(function (index, input) {
                			if ($(this).is(":checked")) {
                				gup  += $("#label_" + $(this).attr("id")).text() + ",";
                			}
                		});
                		gup = gup.substring(0, gup.length - 1);
                		$("#priceDiv").find("input").each(function (index, input) {
                			if ($(this).is(":checked")) {
                				pricep += $("#label_" + $(this).attr("id")).text().substring(0, 1) + ",";
                			}
                		});
                		pricep = pricep.substring(0, pricep.length - 1);
                		$("#typeDiv").find("input").each(function (index, input) {
                			if ($(this).is(":checked")) {
                				typep += $("#label_" + $(this).attr("id")).text() + ",";
                			}
                		});
                		typep = typep.substring(0, typep.length - 1);
                		
                		var param = {
                			'gu' : gup,
                			'price' : pricep,
                			'type' : typep
                		};
                		$.ajax({
                			type: "post",
                			data: param,
                			url: "filterCon",
                			success: function(data) {
               					$(".storeList .col-lg-12").remove();
                				var stores = data.split("|");
                				$.each(stores, function(i, v) {
                					if(v == "") return false;
                					var contents = v.split(",");
                					var name = contents[0];
                					var type = contents[1];
                					var addr = contents[2];
                					var time = contents[3];
                					var picture = contents[4];
                					
	                				var s = "";
									s += '<div class="col-lg-12">'
										s += '<div class="listing-item">'
											s += '<div class="left-image">'
												s += '<a href="#"><img src="' + picture + '" id="store_picture" alt=""></a>'
											s += '</div>'
											s += '<div class="right-content align-self-center">'
												s += '<a href="detail.jsp?name=' + name + '" id = "goDetail"><h4 class="test0">' + name + '</h4></a>' 
												s += '<h6>' + type + '</h6>'
												s += '<ul class="rate">'
													s += '<li><i class="fa fa-star"></i></li>'
													s += '<li><i class="fa fa-star"></i></li>'
													s += '<li><i class="fa fa-star-half"></i></li>'
													s += '<li><i class="fa fa-star-o"></i></li>'
													s += '<li><i class="fa fa-star-o"></i></li>'
													s += '<li>(18) Reviews</li>'
												s += '</ul>'
												s += '<span class="price"><div class="icon"><img src="assets/images/listing-icon-01.png" alt=""></div>' + addr + '</span>'
												s += '<span class="details">영업시간 : <em>' + time + '</em></span>'
												s += '<ul class="info">'
												s += '</ul>'
												s += '<div class="main-white-button">'
													s += '<a href="detail.jsp?name=' + name + '" ><i class="fa fa-eye"></i>상세정보 보기</a>'
												s += '</div>'
											s += '</div>'
										s += '</div>'
									s += '</div>';
                					console.log(s);
                					$(".storeList").append(s);
                				});
                				document.querySelector('.modal_wrap').style.display ='none';
                                document.querySelector('.black_bg').style.display ='none';
                			},
                			error: function() {
                				alert("실패");
                			}
                		});
                		
                	});
                </script>

  <!-- Scripts -->
  
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/animation.js"></script>
  <script src="assets/js/imagesloaded.js"></script>
  <script src="assets/js/custom.js"></script>
  
 

</body>

</html>
