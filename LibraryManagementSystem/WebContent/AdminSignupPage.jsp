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
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<title>Central Institute Library</title>
</head>
<body>

<%
response.setHeader("Cache-Control","no-cache,no-store,must revalidate");
if(session.getAttribute("adminUsername")==null)
{
	response.sendRedirect("main.jsp");
}
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark mt-1">
  <a class="navbar-brand" href="#"><i class="fa fa-book" aria-hidden="true"></i> Central Institute Library <i class="fa fa-user" aria-hidden="true"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
 
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ml-5 mr-3">
        <a class="nav-link" href="AdminPage.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item mr-3">
        <a class="nav-link" href="AdminAbout.jsp">About</a>
      </li>
       <li class="nav-item mr-3">
        <a class="nav-link" href="AdminEresources.jsp">E-Resources</a>
      </li>
      <li class="nav-item dropdown mr-3">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Details
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="bookList"><i class="fa fa-list" aria-hidden="true"></i> Book List</a>    
          <a class="dropdown-item" href="userDetails"><i class="fa fa-user" aria-hidden="true"></i> User Details</a>  
          <a class="dropdown-item" href="individualBookDetails"><i class="fa fa-book" aria-hidden="true"></i> Book Details </a> 
          <a class="dropdown-item" href="bookIssueHistory/1"><i class="fa fa-history" aria-hidden="true"></i> Book Issue History </a> 
          <a class="dropdown-item" href="viewVendor"><i class="fa fa-male" aria-hidden="true"></i> Vendor Details </a>
          <a class="dropdown-item" href="sendReminderMail"><i class="fa fa-envelope" aria-hidden="true"></i> Send Reminder Mail </a>    
        </div>
      </li>
      <li class="nav-item active dropdown mr-3">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Manage Books
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">       
          <a class="dropdown-item" href="issueBook"><i class="fa fa-check-square-o" aria-hidden="true"></i> Issue Book</a>
          <a class="dropdown-item" href="returnBook"><i class="fa fa-backward" aria-hidden="true"></i> Return Book</a>
          <a class="dropdown-item" href="viewAddBook"><i class="fa fa-plus-square" aria-hidden="true"></i> Add Books</a>
          <a class="dropdown-item" href="#"><i class="fa fa-trash" aria-hidden="true"></i> Delete Books</a>
        </div>
      </li>
      <li class="nav-item mr-3 mt-1">
        <form action="logout">
        <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button>
        </form>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<form:form action="adminSignup" modelAttribute="theAdmin" method="post" class="container mx-auto my-5 bg-light py-2" style="width: 800px; border-style: solid;border-radius: 6px;">
<h2 class="text-center">Add New Admin</h2>
<hr class="w-25">
<div class="text-center mb-2">
<i class="fa fa-user-plus fa-5x" aria-hidden="true"></i>
</div>
	<div style="font-weight: bold">
	   <c:if test="${usernameExistsError != null}">
			<div class="alert alert-danger">
				Username already exists! Please enter a unique username.
			</div>
	   </c:if>
		<c:if test="${success != null}">
			<div class="alert alert-success">
				New admin account created successfully!
			</div>
		</c:if>
		<div class="container row">
			 <div class="form-group col-md-6 col-lg-6">
			   <label>First Name</label>
			   <input type="text" name="firstname" class="form-control" placeholder="Enter first name" required value=${firstname}>
			 </div>
			 <div class="form-group col-md-6 col-lg-6">
			   <label>Last Name</label>
			   <input type="text" name="lastname" class="form-control" placeholder="Enter last name" required value=${lastname}>
			 </div>
		</div>
		<div class="container row">
			 <div class="form-group col-md-6 col-lg-6">
			   <label>Username</label>
			   <input name="username" type="text" class="form-control" placeholder="Enter username" required value=${username}>			        
			 </div>
		 <div class="form-group col-md-6 col-lg-6">
		   <label>Password</label>
		   <input name="password" type="password" class="form-control" placeholder="Enter password" required value=${password}>
		 </div>
		</div>
	</div>
	<div style="text-align:center">
	  <button type="submit" class="btn btn-primary mb-3" style=" width:160px">Add Admin</button>
	</div>
</form:form>

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
						<li><a href="bookList"><i class="fa fa-angle-double-right"></i>Book Collection</a></li>
						<li><a href="#"><i class="fa fa-angle-double-right"></i>Institute Bulletin</a></li>
						<li><a href="Eresources.jsp"><i class="fa fa-angle-double-right"></i>E-Resources</a></li>
						<li><a href="" data-toggle="modal" data-target="#contactModal"><i class="fa fa-angle-double-right"></i>Contact</a></li>
						
					</ul>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>Quick links</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="logout"><i class="fa fa-angle-double-right"></i>Logout</a></li>
						<li><a href="#"><i class="fa fa-angle-double-right"></i>Add New Admin</a></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-4">
					<h5>About Us</h5>
					<ul class="list-unstyled quick-links">
						<li><a href="AdminKnowLibrary.jsp"><i class="fa fa-angle-double-right"></i>Know Your Library</a></li>
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
					<p>THIS WEBPAGE IS DEVELOPED BY THE VALAC COMMUNITY</p>
					<p class="h6">&copy All Rights Reversed</p>
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