<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://use.fontawesome.com/ec453aebd2.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
  	<script src="resources/js/SearchBarForm.js"></script>
  	
<title>Central Institute Library</title>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="margin-top:1px">
  <a class="navbar-brand" href="#"><i class="fa fa-book" aria-hidden="true"></i> Central Institute Library <i class="fa fa-user" aria-hidden="true"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ml-5 mr-3">
        <a class="nav-link" href="main.jsp">Home<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item mr-3">
        <a class="nav-link" href="About.jsp">About</a>
      </li>
       <li class="nav-item mr-3">
        <a class="nav-link" href="Services.jsp">Services</a>
      </li>
       <li class="nav-item mr-3">
        <a class="nav-link" href="Eresources.jsp">E-Resources</a>
      </li>
            <li class="nav-item mr-3">
        <a class="nav-link" href="Facts.jsp">Facts and Figures</a>
      </li>
      <li class="nav-item active dropdown mr-3">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Others
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="LoginPage.jsp">Admin Log in</a>
          <a class="dropdown-item" href="LoginPage.jsp">Student Log in</a>
          <a class="dropdown-item" href="StudentSignupPage.jsp">Student Sign Up</a>
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="searchForm" method="post">
      <input class="form-control mr-sm-2" type="search" name="searchItem" id="searchBar" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<section class="container">
<div class="row my-1">

<div class="col-md-6 col-lg-6">
<div class="mx-auto">
<form:form action="adminLogin" modelAttribute="theAdmin" method="post" class="mx-auto bg-light py-2" style="width:310px ; border-style: solid;border-radius: 6px;">
<h2 class="text-center">Admin Login</h2>
<hr class="w-50">
<div class="text-center ">
	<svg class="icon">
		<use xlink:href="resources/images/iconAdminLogin.svg#unauthorized-person" />
	</svg>	
<!-- 	<i class="fa fa-user-circle-o fa-5x" aria-hidden="true"></i>	-->
</div>

		<div class="modal-body" style="font-weight: bold">
		          
		          <c:if test="${adminLoginError != null}">
					<div class="alert alert-danger">
						Invalid credentials!
					</div>
				  </c:if>
				  <div class="form-group">
				    <label>Username</label>
				    <div class="input-group">
				        <div class="input-group-prepend">
				          <span class="input-group-text"><i class="fa fa-user" aria-hidden="true"></i></span>
				        </div>
				        <input name="username" type="text" class="form-control" placeholder="Enter username" required>
			        </div>
				  </div>
				  <div class="form-group">
				    <label>Password</label>
				    <div class="input-group">
				        <div class="input-group-prepend">
				          <span class="input-group-text"><i class="fa fa-lock" aria-hidden="true"></i></span>
				        </div>
				        <input name="password" type="password" class="form-control" placeholder="Enter password" required>
			        </div>
				  </div>
				  
		      </div>
		      <div>
		        <button type="submit" class="btn btn-primary mb-3" style="margin-left:15px; width:275px">Login</button>
		      </div>

</form:form>
</div>
</div>

<div class="col-md-6 col-lg-6">
<div class="mx-auto">
<form:form action="studentLogin" modelAttribute="theStudent" method="post" class="mx-auto bg-light py-2" style="width:310px ; border-style: solid;border-radius: 6px;">
<h2 class="text-center">Student Login</h2>
<hr class="w-50">
<div class="text-center ">
	<svg class="icon" style="width:100%">
		<use xlink:href="resources/images/iconStudentLogin.svg#people" />
	</svg>
<!-- <i class="fa fa-user-circle fa-5x" aria-hidden="true"></i> -->	
</div>

		<div class="modal-body" style="font-weight: bold">
		          
		          <c:if test="${studentLoginError != null}">
					<div class="alert alert-danger">
						Invalid credentials!
					</div>
				  </c:if>
				  <div class="form-group">
				    <label>Username</label>
				    <div class="input-group">
				        <div class="input-group-prepend">
				          <span class="input-group-text"><i class="fa fa-user" aria-hidden="true"></i></span>
				        </div>
				        <input name="username" type="text" class="form-control" placeholder="Enter username" required>
			        </div>
				  </div>
				  <div class="form-group">
				    <label>Password</label>
				    <div class="input-group">
				        <div class="input-group-prepend">
				          <span class="input-group-text"><i class="fa fa-lock" aria-hidden="true"></i></span>
				        </div>
				        <input name="password" type="password" class="form-control" placeholder="Enter password" required>
			        </div>
				  </div>
				  
		      </div>
		      <div>
		        <button type="submit" class="btn btn-primary mb-3" style="margin-left:15px; width:275px">Login</button>
		      </div>
	
</form:form>
</div>
</div>

</div>
</section>
		
						<!-- Contact Modal -->
<div class="modal fade" id="contactModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Contacts</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <span class="font-weight-bold">Call Us At:</span> +91 9862457328
        <br>
        <span class="font-weight-bold">Mail Us At:</span> CentralInstituteLibrary@gmail.com
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



<section id="footer">
		<div class="container">
			<div class="row text-center text-xs-center text-sm-left text-md-left">
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>Home</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="About.jsp"><i class="fa fa-angle-double-right"></i>Book Collection</a></li>
						<li><a href="#"><i class="fa fa-angle-double-right"></i>Institute Bulletin</a></li>
						<li><a href="Eresources.jsp"><i class="fa fa-angle-double-right"></i>E-Resources</a></li>
						<li><a href="" data-toggle="modal" data-target="#contactModal"><i class="fa fa-angle-double-right"></i>Contact</a></li>
						
					</ul>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>Quick links</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="#"><i class="fa fa-angle-double-right"></i>Admin Login</a></li>
						<li><a href="#"><i class="fa fa-angle-double-right"></i>Student Login</a></li>
						<li><a href="StudentSignupPage.jsp"><i class="fa fa-angle-double-right"></i>Student Sign Up</a></li>			
					</ul>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>About Us</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="KnowLibrary.jsp"><i class="fa fa-angle-double-right"></i>Know Your Library</a></li>
						<li><a href="#"><i class="fa fa-angle-double-right"></i>Library Brochure</a></li>
						<li><a href="#"><i class="fa fa-angle-double-right"></i>Library Staff</a></li>
						<li><a href="#"><i class="fa fa-angle-double-right"></i>FAQs</a></li>
						
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
					<ul class="list-unstyled list-inline social text-center">
						<li class="list-inline-item"><a href="https://www.facebook.com" target="_blank"><i class="fa fa-facebook"></i></a></li>
						<li class="list-inline-item"><a href="https://twitter.com/login" target="_blank"><i class="fa fa-twitter"></i></a></li>
						<li class="list-inline-item"><a href="https://www.instagram.com/?hl=en" target="_blank"><i class="fa fa-instagram"></i></a></li>
						<li class="list-inline-item"><a href="https://aboutme.google.com/u/0/?referer=gplus" target="_blank"><i class="fa fa-google-plus"></i></a></li>
						<li class="list-inline-item"><a href="https://www.google.com/intl/en-GB/gmail/about/" target="_blank"><i class="fa fa-envelope"></i></a></li>
					</ul>
				</div>
			</div>	
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
					<p>THIS WEBPAGE IS DEVELOPED BY THE VALAC COMMUNITY.</p>
					<p class="h6">&copy All right Reversed.</p>
				</div>
				</hr>
			</div>	
		</div>
	</section>
	
<style type="text/css">
	section {
    padding: 60px 0;
}

section .section-title {
    text-align: center;
    color: #007b5e;
    margin-bottom: 50px;
    text-transform: uppercase;
}
#footer {
    background: #007b5e !important;
}
#footer h5{
	padding-left: 10px;
    border-left: 3px solid #eeeeee;
    padding-bottom: 6px;
    margin-bottom: 20px;
    color:#ffffff;
}
#footer a {
    color: #ffffff;
    text-decoration: none !important;
    background-color: transparent;
    -webkit-text-decoration-skip: objects;
}
#footer ul.social li{
	padding: 3px 0;
}
#footer ul.social li a i {
    margin-right: 5px;
	font-size:25px;
	-webkit-transition: .5s all ease;
	-moz-transition: .5s all ease;
	transition: .5s all ease;
}
#footer ul.social li:hover a i {
	font-size:30px;
	margin-top:-10px;
}
#footer ul.social li a,
#footer ul.quick-links li a{
	color:#ffffff;
}
#footer ul.social li a:hover{
	color:#eeeeee;
}
#footer ul.quick-links li{
	padding: 3px 0;
	-webkit-transition: .5s all ease;
	-moz-transition: .5s all ease;
	transition: .5s all ease;
}
#footer ul.quick-links li:hover{
	padding: 3px 0;
	margin-left:5px;
	font-weight:700;
}
#footer ul.quick-links li a i{
	margin-right: 5px;
}
#footer ul.quick-links li:hover a i {
    font-weight: 700;
}

@media (max-width:767px){
	#footer h5 {
    padding-left: 0;
    border-left: transparent;
    padding-bottom: 0px;
    margin-bottom: 10px;
}

.carousel-inner img {
      width: 100%;
      height: 100%;
  }
}

</style>

</body>
</html>