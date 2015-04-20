<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="cms.util.DBConnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        
    <%
        String username = session.getAttribute("username").toString();
        int uid = 0, pid;
        Connection con = DBConnection.connect();
        String query = "SELECT * FROM users WHERE username = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, username);
        System.out.println("Done with ps setsTRing");
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            System.out.println(rs.getInt("uid"));
            uid = rs.getInt("uid");
        }
        query = "SELECT * FROM posts WHERE uid = ? ORDER BY time DESC";
        ps = con.prepareStatement(query);
        ps.setInt(1, uid);
        rs = ps.executeQuery();
    %>
        
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Bootstrap Admin Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <link href="css/morris.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Dashboard</a>
            </div>
            
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="dashboard.jsp"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                    </li>
                    <li class="">
                        <a href="profile.jsp"><i class="fa fa-fw fa-dashboard"></i> View Profile</a>
                    </li>
                    <li class="">
                        <a href="settings.jsp"><i class="fa fa-fw fa-dashboard"></i> Settings</a>
                    </li>
                    <li class="" style="left:30px;">
                        <form action="logout" method="GET">
                            <input type="submit" name="Logout">
                        </form>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <div class="row" style="height:800px;">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Transactions Panel</h3> 
                                <pre>     <a href="NewPost.jsp">New Post</a></pre>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Title</th>
                                                <th>Date Posted</th>
                                                <th>Time Posted</th>
                                                <th>Options </th>
                                            </tr>
                                        </thead>
                                        <%
                                            String title;
                                            while(rs.next()) {
                                                pid = rs.getInt("pid");
                                                title = rs.getString("title");
                                                Timestamp timestamp = rs.getTimestamp("time");
                                                java.util.Date date = timestamp;
                                                SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM YYYY");
                                                SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
                                        %>
                                        <tbody>
                                            <tr>
                                                <td><%= pid %></td>
                                                <td><%= title %></td>
                                                <td><%= dateFormat.format(date) %></td>
                                                <td><%= timeFormat.format(date) %></td>
                                                <td>
                                                    <a href="editPost.jsp?pid=<%= pid %>">
                                                            Edit
                                                    </a>
                                                    <form action="DeletePost" method="GET">
                                                        <input type="hidden" value="<%= pid %>" name="pid" />
                                                        <button type="submit">Delete</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        <% 
                                            }
                                            con.close();
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="js/morris/raphael.min.js"></script>
    <script src="js/morris/morris.min.js"></script>
    <script src="js/morris/morris-data.js"></script>

</body>

</html>
