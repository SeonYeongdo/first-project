<%@page import="model.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


  <head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.gstatic.com">
 

    <title>#광광곳곳</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-plot-listing.css">
    <link rel="stylesheet" href="assets/css/animated.css">
    <link rel="stylesheet" href="assets/css/owl.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> 
        
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> 
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script> 
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> 
    
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet"> 
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script> 
    <script src="assets/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
	    var userId = "";
	</script>
  </head>

<body>
	<%
userVO vo = (userVO)session.getAttribute("vo_session");
	if (vo != null) { %>
		<script type="text/javascript">
	       userId = '<%=vo.getUser_id()%>';
		</script>
	<% }
%>
	<!-- ***** Preloader Start ***** -->
	<div id="js-preloader" class="js-preloader">
		<div class="preloader-inner">
			<span class="dot"></span>
			<div class="dots">
				<span></span> <span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->

	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky wow slideInDown"
		data-wow-duration="0.75s" data-wow-delay="0s">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->
						<a href="index.jsp" class="logo"> </a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
							<li><a href="index.jsp">홈</a></li>
							<li><a href="listing.jsp" class="active">추천리스트</a></li>
							<li><a href="gotgan.jsp">곳간</a></li>
							<%if (vo==null){%>
							<li><div class="main-white-button">
									<a href="loginForm.jsp"><i class="fa fa-plus"></i> 로그인/회원가입</a>
								</div></li>
							<%} else {  %>
							<li><a href="contact.jsp">마이페이지</a></li>
							<li><a href="logoutCon">로그아웃</a></li>

							<%} %>
						</ul>
						<a class='menu-trigger'> <span>Menu</span>
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
					<div class="top-text header-text"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="collapse navbar-collapse" id="navbarsExampleDefault">
		<ul class="navbar-nav mr-auto">
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="text" placeholder="Search"
				aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>

	<div style="padding: 30px;"></div>

	<main role="main" class="container">
		<form name="form" id="gotgan_form" method="POST" action="postRegister" enctype="multipart/form-data">
			<input type="text" style="width: 100%;" placeholder="제목" id="title_article" name="title_article"/><br><br>
			<div class="fr"></div>
			<textarea id="txt_contents"  id="txt_contents" name="content_article" class="fs-13"
				placeholder="음식, 서비스, 분위기, 위생상태 등의 방문 경험을 적어주세요."
				style="border: solid 1px #D5D5D5; width: 100%; height: 350px;"></textarea>
			<input id="hid_photo" name="photos" type="file">
		</form>
			<button class="btn btn btn-success" id="submit_btn"
				style="width: 10%; padding: 5px;">제출</button>
	</main>
</body>


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

 


<script type="text/javascript">
	$(document).ready(function () {
		$("#submit_btn").click(function() {
			if (userId == "") {
				alert("로그인을 하세요");
				return;
			}
			if ($.trim($("#txt_contents").val()) == "") {
				alert("내용을 입력하세요");
				return;
			}
			if ($.trim($("#title_article").val()) == "") {
				alert("제목을 입력하세요");
				return;
			}
			$("#gotgan_form").submit();
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