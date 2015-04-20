<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	    
	    <!-- Bootstrap Core CSS -->
	    <link href="css/bootstrap.min.css" rel="stylesheet">
    	<!-- Bootstrap Core JS -->
    	<script src="js/bootstrap.min.js"></script>
    	<!-- Local Custom CSS -->
    	<link href="css/style.css" rel="stylesheet">
		<title>CMS</title>
	</head>
	<body>
		<!-- Wrapper container -->
		<div class="container-fluid" id="wrapper">
			<!-- Header -->
			<div class="container-fluid" id="header">
				<div class="container">
					<div class="page-header">
						<h1>Simple CMS</h1>
					</div>
				</div>
			</div>
			<!-- End: Header-->
			<!-- Main navigation bar -->
			<nav class="navbar navbar-inverse" role="navigation" id="main-nav">
				<div class="container">
					<div class="navbar-header">
		               	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		                    <span class="sr-only">Toggle navigation</span>
		                    <span class="icon-bar"></span>
		                    <span class="icon-bar"></span>
		                    <span class="icon-bar"></span>
		                </button>
		            </div>
		            <div class="collapse navbar-collapse" id="">
		                <ul class="nav navbar-nav"	>
		                    <li>
		                        <a href="#">HOME</a>
		                    </li>
		                    <li>
		                        <a href="#">TOPIC1</a>
		                    </li>
		                    <li>
		                        <a href="#">TOPIC2</a>
		                    </li>
		                    <li>
		                    	<a href="#">TOPIC3</a>
		                    </li>
		                    <li>
		                    	<a href="#">ABOUT</a>
		                    </li>
		                </ul>
			            <form class="navbar-form navbar-right" role="search" method="POST" action="#">
				        	<div class="form-group">
				          		<input type="text" class="form-control" placeholder="Search">
				        	</div>
				        	<button type="submit" class="btn btn-default">
				        		<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				        	</button>
				      	</form>
					</div>
				</div>
			</nav>
			<!-- End: Main navbar -->
			<!-- Content -->
			<div class="container-fluid" id="content">
				<div class="container content-inner">
					<div class="row">
						<div class="col-md-9 col-sm-9" class="main-content">
							You have successfully registered your account!
							<br>
							Please login through the login form.
						</div>
						<div class="col-md-3 col-sm-3" class="side-bar">
							<div class="">
								<%
                                                                if(session.getAttribute("username") != null) {
                                                            %>
                                                                <p>Welcome <br> Logged in as <%= session.getAttribute("username") %></p>
                                                                <br>
                                                                <a href="dashboard.jsp">Dashboard</a>
                                                                <form action="logout" method="GET">
                                                                        <input type="submit" value="Logout" />
                                                                </form>
                                                            <%
                                                                }
                                                                else {
                                                                    if(session.getAttribute("errorMessage") != null) {
                                                            %>
                                                                <p>Wrong username or password. Try again!</p>
                                                            <%
                                                                }
                                                            %>
                                                                <form action="login" method="POST">
                                                                        <div class="form-group">
                                                                                <label for="username">Username: </label><br>
                                                                                <input type="text" id="username" name="username" class="form-control"/>
                                                                        </div>
                                                                        <div class="form-group">
                                                                                <label for="password">Password: </label><br>
                                                                                <input type="password" id="password" name="password" class="form-control"/>
                                                                        </div>
                                                                        <div>
                                                                                <input type="submit" name="submit" id="submit" value="Log In" class="btn btn-default" />
                                                                        </div>
                                                                </form>
                                                                   
                                                                <p>Don't have an account ? <a href="register.jsp"> Register! </a> </p>
                                                            <%
								}
                                                            %>
							</div>
							<div class="">
								<div class="recent-posts well">
									<h5><strong>Recent Posts</strong></h5>
									
								</div>
							</div>
							<div class="">
								
								<div class="featured-posts well">
									<h5><strong>Featured Posts</strong></h5>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End: Content -->
			<!-- Footer --> 
			<div class="container-fluid footer">
				<div class="container">
					<div class="row footer-content">
						<div class="col-md-4 category">
							<div class="media" style="margin-top:7px;">
							  <div class="media-body">
							  	<a href="#">Home</a>
							  </div>
							</div>
							<div class="media" style="margin-top:7px;">
							  <div class="media-body">
							  	<a href="#">Topic 1</a>
							  </div>
							</div>
							<div class="media" style="margin-top:7px;">
							  <div class="media-body">
							  	<a href="#">Topic 2</a>
							  </div>
							</div>
							<div class="media" style="margin-top:7px;">
							  <div class="media-body">
							  	<a href="">Topic 3</a>
							  </div>
							</div><div class="media" style="margin-top:7px;">
							  <div class="media-body">
							  	<a href="#">About</a>
							  </div>
							</div>
						</div>
						<div class="col-md-4 social">
							<div class="media" style="margin-top:5px;">
							  <div class="media-left">
							    <a href="https://facebook.com">
							      <img class="" src="images/32-facebook.png" alt="" style="height:20px; width: 20px;">
							    </a>
							  </div>
							  <div class="media-body">
							  	Facebook
							  </div>
							</div>
							<div class="media" style="margin-top:5px;">
							  <div class="media-left">
							    <a href="https://twitter.com">
							      <img class="" src="images/32-twitter.png" alt="" style="height:20px; width: 20px;">
							    </a>
							  </div>
							  <div class="media-body">
							  	Twitter
							  </div>
							</div>
							<div class="media" style="margin-top:5px;">
							  <div class="media-left">
							    <a href="https://plus.google.com">
							      <img class="" src="images/32-googleplus.png" alt="" style="height:20px; width: 20px;">
							    </a>
							  </div>
							  <div class="media-body">
							  	Google Plus
							  </div>
							</div>
							<div class="media" style="margin-top:5px;">
							  <div class="media-left">
							    <a href="https://youtube.com">
							      <img class="" src="images/32-youtube.png" alt="" style="height:20px; width: 20px;">
							    </a>
							  </div>
							  <div class="media-body">
							  	Youtube
							  </div>
							</div>
							<div class="media" style="margin-top:5px;">
							  <div class="media-left">
							    <a href="https://yahoo.com">
							      <img class="" src="images/32-yahoo.png" alt="" style="height:20px; width: 20px;">
							    </a>
							  </div>
							  <div class="media-body">
							  	Yahoo!
							  </div>
							</div>
							<div class="media" style="margin-top:5px;">
							  <div class="media-left">
							    <a href="https://instagram.com">
							      <img class="" src="images/32-instagram.png" alt="" style="height:20px; width: 20px;">
							    </a>
							  </div>
							  <div class="media-body">
							  	Instagram
							  </div>
							</div>
							
						</div>
						<div class="col-md-4">
							Simple CMS <br>
							Copyright 2015 <br>
							Harish R <br>
						</div>
					</div>
				</div>
			</div>
			<!-- End: Footer -->
		</div>
		<!-- End: Wrapper container -->
		<!-- jQuery Version 1.11.1 -->
	    <script src="js/jquery.min.js"></script>
	
	    <!-- Bootstrap Core JavaScript -->
	    <script src="js/bootstrap.min.js"></script>	
	</body>
</html>