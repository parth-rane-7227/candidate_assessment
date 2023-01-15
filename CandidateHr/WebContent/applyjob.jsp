<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@  page import="java.sql.*" %>
 <%@  page import="com.candidate.*" %>
 <%@  page import="com.candidate.values" %>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<head>
<title>Registration Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Visitors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link rel="stylesheet" href="css/bootstrap.min.css" >
<!-- //bootstrap-css -->
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/style-responsive.css" rel="stylesheet"/>
<!-- font CSS -->
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<!-- font-awesome icons -->
<link rel="stylesheet" href="css/font.css" type="text/css"/>
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<script src="js/jquery2.0.3.min.js"></script>
</head>
<body>
<section id="container">
<!--header start-->
<header class="header fixed-top clearfix">
<!--logo start-->
<div class="brand">

    <a href="index.html" class="logo">
        <!-- VISITORS -->
    </a>
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div>
</div>
<!--logo end-->
<%
                                      int jid=Integer.parseInt(request.getParameter("jid")); 
                                      values.setJid(jid);
                                    		 
                                    		 
                                    Connection con =DbConnection.connect();
                                	PreparedStatement pstmt=con.prepareStatement("select * from job where jid=?");
                                	pstmt.setInt(1,jid);
                        			ResultSet rs=pstmt.executeQuery();
                                    
                                    %>

</div>
<div class="top-nav clearfix">
    <!--search & user info start-->
    <ul class="nav pull-right top-menu">
        <li>
            <input type="text" class="form-control search" placeholder=" Search">
        </li>
        <!-- user login dropdown start-->
       <!--  <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <img alt="" src="images/2.png">
                <span class="username">John Doe</span>
                <b class="caret"></b>
            </a>
            <ul class="dropdown-menu extended logout">
                <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
                <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
                <li><a href="login.html"><i class="fa fa-key"></i> Log Out</a></li>
            </ul>
        </li> -->
        <!-- user login dropdown end -->
       
    </ul>
    <!--search & user info end-->
</div>
</header>
<!--header end-->
<!--sidebar start-->
<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <a href="index.html">
                        <i class="fa fa-dashboard"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="candidateviewjob.jsp">
                        <i class="fa fa-user"></i>
                        <span>Candidate</span>
                    </a>
                </li>
                
            </ul>            </div>
        <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
	<div class="form-w3layouts">
        <!-- page start-->
        <!-- page start-->
        
        <div class="row">
            <div class="col-lg-12">
                    <section class="panel">
                       <header class="panel-heading" style="color:purple; font-size:25px">
                            <strong>Registration Details</strong>
                        </header>
                        <div class="panel-body">
                            <div class="position-center">
                                <form role="form" action="applyjob" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Candidate Name</label>
                                    <input type="text" name="cname" class="form-control" id="exampleInputEmail1" required="required" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Email</label>
                                    <input type="email" name="cemail" class="form-control" id="exampleInputPassword1" required="required" placeholder="Password">
                                </div>
                                 <div class="form-group">
                                    <label for="exampleInputPassword1">Set Password</label>
                                    <input type="password" name="cpassword" class="form-control" id="exampleInputPassword1" required="required" placeholder="Password">
                                </div>
                                 <div class="form-group">
                                    <label for="exampleInputPassword1">Date of Birth</label>
                                    <input type="date" name="cdob" class="form-control" id="exampleInputPassword1" required="required" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Candidate Experience</label>
                                    <input type="text" name="cexperience" class="form-control" id="exampleInputPassword1" required="required" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Mobile Number</label>
                                    <input type="text" name="cmbno" class="form-control" id="exampleInputPassword1" required="required" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">City</label>
                                    <input type="text" name="ccity" class="form-control" id="exampleInputPassword1" required="required" placeholder="Password">
                                </div>
                                
                                
                                    <div class="form-group">
                                   <label for="exampleInputPassword1">Upload Your Ressume</label>
                                    <div class="compose-editor">
                                       <textarea class="wysihtml5 form-control" rows="0"></textarea>
                                      <input type="file" class="default" name="cresume">
                                       </div>
                                </div> 
                                 
                                
                                 <div class="form-group">
                                    <label for="exampleInputPassword1">Gender&nbsp;</label>
                                    &nbsp;<input type="radio" value="Male" name="cgender">Male
                                    &nbsp;<input type="radio" value="Female" name="cgender">Female
                                    &nbsp;<input type="radio" value="Other" name="cgender">Other
                                </div>
                                <%-- <div class="form-group">
                                    <label for="exampleInputPassword1">Select Job</label>
                                    <!-- <input class="form-control input-lg m-bot15" type="text" placeholder=".input-lg"> -->
                                    <select class="form-control input-lg m-bot15">
                                    <option>Select Job</option>
                                    <%
                                    Connection con =DbConnection.connect();
                                	PreparedStatement pstmt=con.prepareStatement("select * from job");
                        			ResultSet rs=pstmt.executeQuery();
                                       
                                    %>
                                    <% while(rs.next()) { %>
                                    
                                      
                                <option values="<% rs.getString(2); %>" name="cselectjob"><%= rs.getString(2) %></option>
                                
                                  <% } %> --%>
                                <!-- <option>Option 2</option>
                                <option>Option 3</option> -->
                                
                           
                              <!--   </div> -->
                              
                           <div class="form-group">
                                    <label for="exampleInputPassword1">Select Job&nbsp;</label>
                                   
                                    <% while(rs.next()) {
                                    	
                                    	
                                    %>
                                    <input type="radio" value="<%= rs.getString(2) %>" name="cselectjob"> <%= rs.getString(2) %>
                                    <% } %>
                                    <!-- &nbsp;<input type="radio" value="Female" name="cgender">Female
                                    &nbsp;<input type="radio" value="Other" name="cgender">Other -->
                                </div>
                               <!--  <button type="submit" class="btn btn-info">Submit</button> -->
                                
                                
                                
                                
                                <div class="text-center">
                               
                                <a href="#myModal-2" data-toggle="modal" class="btn btn-danger">
                                    Submit
                                </a>
                                
                            </div>
                                <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal-2" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                        <h4 class="modal-title"><strong>Registration Form Filled Sucessfully</strong></h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-inline" role="form">
                                            <!-- <div class="form-group">
                                                <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                                <input type="email" class="form-control sm-input" id="exampleInputEmail5" placeholder="Enter email">
                                            </div>
                                            <div class="form-group">
                                                <label class="sr-only" for="exampleInputPassword2">Password</label>
                                                <input type="password" class="form-control sm-input" id="exampleInputPassword5" placeholder="Password">
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox"> Remember me
                                                </label>
                                            </div> -->
                                            <button type="submit" class="btn btn-default">Ok</button>
                                        </form>

                                    </div>

                                </div>
                            </div>
                            
                            
                            
                                </form>
                            </form>
                            </div>

                        </div>
                    </section>

            </div>
            

        <!-- page end-->
        </div>
</section>
 <!-- footer -->
		  <div class="footer">
			<div class="wthree-copyright">
			    <p>© 2022 Examination. All rights reserved | Design by Parth Rane</p>
			</div>
		  </div>
  <!-- / footer -->
</section>

<!--main content end-->
</section>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
<script src="js/jquery.scrollTo.js"></script>
</body>
</html>
