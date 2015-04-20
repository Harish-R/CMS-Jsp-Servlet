<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="cms.util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    Connection con = DBConnection.connect();
    String pid1 = request.getParameter("id");
    System.out.println(pid1);
    int pid = Integer.parseInt(pid1);
    System.out.println(pid);
    System.out.println("ID = " + pid);
    String query = "SELECT * FROM posts WHERE pid = ?";
    try {
        System.out.println("Inside Try");
        PreparedStatement ps = con.prepareStatement(query);
        System.out.println("ps created");
        ps.setInt(1, pid);
        System.out.println("pid set");
        ResultSet rs = ps.executeQuery();
        System.out.println("Got result set");
        if(rs.next()) {
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
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
    	<!-- Social Icons CSS -->
    	<link href="css/style-social.css" rel="stylesheet">
	</head>
	<body>
		<!-- Wrapper container -->
		<div class="container-fluid" id="wrapper">
			<!-- Header -->
			<div class="container-fluid" id="header">
				<div class="container">
					<div class="page-header">
						<h1>Simple CMS</h1></small>
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
				        	<input type="submit" class="btn btn-default" />
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
                                                    <%
                                                        String content = rs.getString("content");
                                                        String title = rs.getString("title");
                                                        Timestamp timestamp = rs.getTimestamp("time");
                                                        java.util.Date date = timestamp;
                                                        SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM YYYY");
                                                        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
                                                        System.out.println("Time Done");
                                                        
                                                        /* String username1 = session.getAttribute("username").toString();
                                                        String query1 = "SELECT * FROM users WHERE username = ?";
                                                        PreparedStatement ps1 = con.prepareStatement(query1);
                                                        ps1.setString(1, username1);
                                                        ResultSet rs1 = ps1.executeQuery();
                                                        int uid = rs.getInt("uid"); */

                                                        
                                                    %>
                                                    <div class="post-body">
                                                        <div class="post-header">
                                                                <h3><strong><%= title %></strong></h3>
                                                                <p>Posted on <%= dateFormat.format(date) %> at <%= timeFormat.format(date) %></p>
                                                        </div>
                                                        <div class="post-body">
                                                                <img class="img-responsive" src="http://blog.karachicorner.com/wp-content/uploads/2012/07/timeline-covers/fb-cover-image-2.jpg">
                                                                <br>
                                                                <br>
                                                                <p>
                                                                    <%= content %>
                                                                </p>
                                                        </div>
                                                        <div class="well">
                                                            <h5>Leave a Comment:</h5>
                                                            <form role="form" id="comment-form">
                                                                <div class="form-group">
                                                                    <textarea rows="1" class="form-control" id="comment-content"></textarea>
                                                                </div>
                                                                <input type="hidden" id="pid" name="pid" value="<%= pid1 %>"/>
                                                                <%-- <input type="hidden" value="uid" value="<%= uid %>"/> --%>
                                                                <input type="submit" value="Add Comment" class="btn btn-default" id="addComment">
                                                            </form>
                                                        </div>
                                                        <div class="comments">
                                                            <%
                                                                String name = "";
                                                                String query1 = "SELECT * FROM comments WHERE pid = ?";
                                                                PreparedStatement ps1 = con.prepareStatement(query1);
                                                                ps1.setInt(1, pid);
                                                                ResultSet rs1 = ps1.executeQuery();
                                                                while(rs1.next()) {
                                                                    int uid = rs1.getInt("uid");
                                                                    String query2 = "SELECT * FROM users WHERE uid = ?";
                                                                    PreparedStatement ps2 = con.prepareStatement(query2);
                                                                    ps2.setInt(1, uid);
                                                                    ResultSet rs2 = ps2.executeQuery();
                                                                    if(rs2.next()) {
                                                                        name = rs2.getString("username");
                                                                    }
                                                                    Timestamp time = rs1.getTimestamp("time");
                                                                    date = time;
                                                                    
                                                            %>
                                                            
                                                            <div class="comment">
                                                                <div class="media">
                                                                    <a href="#" class="pull-left">
                                                                        <img alt="" src="http://placehold.it/64x64" class="media-object">
                                                                    </a>
                                                                    <div class="media-body">
                                                                        <h5 class="media-heading"><b><%= name %>  <%= dateFormat.format(date) %> <%= timeFormat.format(date) %></b></h5>
                                                                        <p class="media-text">Cras sit amet nibh libero, in gravida nulla. </p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                            <%
                                                            
                                                                }
                                                            %>
                                                            
                                                        </div>
                                                        <div class="post-tail">

                                                        </div>
                                                        <br>
                                                        <br>
                                                    </div>
						</div>
						<div class="col-md-3 col-sm-3 side-bar">
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
                                                            %>>Don't have an account?<a href="register.jsp">Register</a></p>
							</div>
							<div class="well">
								<div class="recent-posts">
									<h5><strong>Recent Posts</strong></h5>
									<% %>
									
									
								</div>
							</div>
							<div class="well">
								
								<div class="featured-posts">
									<h5><strong>Featured Posts</strong></h5>
									<% %>
									
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
							      <img class="" src="images/social/32-facebook.png" alt="" style="height:20px; width: 20px;">
							    </a>
							  </div>
							  <div class="media-body">
							  	Facebook
							  </div>
							</div>
							<div class="media" style="margin-top:5px;">
							  <div class="media-left">
							    <a href="https://twitter.com">
							      <img class="" src="images/social/32-twitter.png" alt="" style="height:20px; width: 20px;">
							    </a>
							  </div>
							  <div class="media-body">
							  	Twitter
							  </div>
							</div>
							<div class="media" style="margin-top:5px;">
							  <div class="media-left">
							    <a href="https://plus.google.com">
							      <img class="" src="images/social/32-googleplus.png" alt="" style="height:20px; width: 20px;">
							    </a>
							  </div>
							  <div class="media-body">
							  	Google Plus
							  </div>
							</div>
							<div class="media" style="margin-top:5px;">
							  <div class="media-left">
							    <a href="https://youtube.com">
							      <img class="" src="images/social/32-youtube.png" alt="" style="height:20px; width: 20px;">
							    </a>
							  </div>
							  <div class="media-body">
							  	Youtube
							  </div>
							</div>
							<div class="media" style="margin-top:5px;">
							  <div class="media-left">
							    <a href="https://yahoo.com">
							      <img class="" src="images/social/32-yahoo.png" alt="" style="height:20px; width: 20px;">
							    </a>
							  </div>
							  <div class="media-body">
							  	Yahoo!
							  </div>
							</div>
							<div class="media" style="margin-top:5px;">
							  <div class="media-left">
							    <a href="https://instagram.com">
							      <img class="" src="images/social/32-instagram.png" alt="" style="height:20px; width: 20px;">
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
                <%
                               }
                                   } catch(Exception e) {
                                       e.printStackTrace();
                                   }
                %>
            
            <!-- jQuery Version 1.11.1 -->
	    <script src="js/jquery.min.js"></script>
	
	    <!-- Bootstrap Core JavaScript -->
	    <script src="js/bootstrap.min.js"></script>
            
            <script>
                $(document).ready(function() {
                    $('#addComment').click(function() {
                        
                        event.preventDefault();
                        
                        var commentContent = $('#comment-content').val();
                        var pid = $('#pid').val();
                        
                        var formData = {
                            "pid": pid,
                            "commentContent": commentContent
                        }
                        
                        $.ajax({
                            type: 'POST',
                            //url: 'localhost:8070/SimpleCMS/comments.php',
                            url: 'CommentController',
                            data: formData,
                            success: function(data) { 
                                var newComment = $('.comment:first').clone();
                                newComment.find('.media-heading b').html(data);
                                newComment.find('.media-text').html(commentContent);
                                $('.comment:first').prepend(newComment);
                            }
                        });
                        
                    });
                });
            </script>
</body>
</html>