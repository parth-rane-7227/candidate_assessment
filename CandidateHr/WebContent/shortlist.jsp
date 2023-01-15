<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page import="java.sql.*" %>
<%@page import="com.candidate.DbConnection"%>
<%@page import="com.candidate.values"%>
<!DOCTYPE html>
<head>
<title>View Shortlist Candidates</title>
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
<link rel="stylesheet" href="css/morris.css" type="text/css"/>
<!-- calendar -->
<link rel="stylesheet" href="css/monthly.css">
<!-- //calendar -->
<!-- //font-awesome icons -->
<script src="js/jquery2.0.3.min.js"></script>
<script src="js/raphael-min.js"></script>
<script src="js/morris.js"></script>
</head>
<body>
<section id="container">
<!--header start-->
<header class="header fixed-top clearfix">
<!--logo start-->
<div class="brand">
    <a href="index.html" class="logo">
        
    </a>
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div>
</div>
<!--logo end-->

<div class="top-nav clearfix">
    <!--search & user info start-->
    <ul class="nav pull-right top-menu">
        <li>
            <input type="text" class="form-control search" placeholder=" Search">
        </li>
        <!-- user login dropdown start-->
        <!-- <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <img alt="" src="images/2.png">
                <span class="username">John Doe</span>
               
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
                    <a class="active" href="index.html">
                        <i class="fa fa-dashboard"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                
                 <li>
                    <a class="active" href="addjob.html">
                       <!--  <i class="fa fa-user"></i> -->
                        <span>Add Job</span>
                    </a>
                </li> 
                </li>
                <li class="sub-menu">
                    <a href="viewjob.jsp">
                     <!--   <i class="fa fa-user"></i> -->
                        <span>View Job</span>
                    </a>
                   
                </li>
                 <li class="sub-menu">
                    <a href="viewshortlist.jsp">
                      <!--  <i class="fa fa-user"></i> -->
                        <span>View Shortlisted Candidates</span>
                    </a>
                   
                </li>                                           
            </ul>            </div>
        <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
<section id="main-content">
	<section class="wrapper">
		<div class="table-agile-info">
 <div class="panel panel-default">
    <div class="panel-heading">
    <header class="panel-heading" style="color:purple; font-size:25px">
                            <strong>Shortlist Candidates</strong>
    </div>
    <div>
    <%
    boolean O=false,C=false,E=false,A=false,N=false;
	int jid=Integer.parseInt(request.getParameter("jid"));
	Connection con = DbConnection.connect();
	PreparedStatement psmt = con.prepareStatement("select * from job where jid=?");
	psmt.setInt(1,jid);
	ResultSet rs = psmt.executeQuery();
	rs.next();
	//int exp=rs.getInt(6);
	if(rs.getString(6).contains("Openness")){
		O=true;
	}
	if(rs.getString(6).contains("Conscientiousness")){
		C=true;
	}
	if(rs.getString(6).contains("Extroversion")){
		E=true;
	}
	if(rs.getString(6).contains("Agreeableness")){
		A=true;
	}
	if(rs.getString(6).contains("Neuroticism")){
		N=true;
	}
	String query = "select * from result where jid="+jid;
	if(O){
		query+=" and o>=7";
	}
	if(C){
		query+=" and c>=7";
	}
	if(E){
		query+=" and e>=7";
	}
	if(A){
		query+=" and a>=7";
	}
	if(N){
		query+=" and n>=7";
	}
	
	PreparedStatement psmt2 = con.prepareStatement(query);
	ResultSet rs2 = psmt2.executeQuery();
	PreparedStatement psmt3 = con.prepareStatement("select * from candidatedetails where cid=?");
	
    %>
      <table class="table" ui-jq="footable" ui-options='{
        "paging": {
          "enabled": true
        },
        "filtering": {
          "enabled": true
        },
        "sorting": {
          "enabled": true
        }}'>
        <thead>
          <tr>
            <th data-breakpoints="xs">ID</th>
            <th>Name</Title></th>
            <th>Email</th>
            <th>O</th>
            <th data-breakpoints="xs">C</th>
           
            <th data-breakpoints="xs">E</th>
            <th data-breakpoints="xs">A</th>
             <th data-breakpoints="xs">N</th>
             <th data-breakpoints="xs">Send Email</th>
          </tr>
        </thead>
        <tbody>
         <%while(rs2.next()){ %>
          <tr data-expanded="true">
            <td><%=rs2.getInt(2) %></</td>
            <%
            	psmt3.setInt(1,rs2.getInt(2));
            	ResultSet rs3 = psmt3.executeQuery();
            	rs3.next();
            %>
            <td><%=rs3.getString(3) %></</td>
            <td><%=rs3.getString(4) %></td>
            <td><%=rs2.getString(3) %></td>  
            <td><%=rs2.getString(4) %></td>
            <td><%=rs2.getString(5) %></td> 
            <td><%=rs2.getString(6) %></td>
            <td><%=rs2.getString(7) %></td>
            <td><a>Click Here</a></td>  
          </tr>    
        </tbody>
        	<%}%>
      </table>
    </div>
  </div>
</div>
</section>
 <!-- footer -->
 <center>
		  <div class="footer">
			<div class="wthree-copyright">
			    <p>© 2022 Examination. All rights reserved | Design by Parth Rane</p>
			</div>
		  </div>
		  </center>
  <!-- / footer -->
</section>	
</section>
 <!-- footer -->
		  <!-- <div class="footer">
			<div class="wthree-copyright">
			  <p>© 2017 Visitors. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
			</div>
		  </div> -->
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
<!-- morris JavaScript -->	
<script>
	$(document).ready(function() {
		//BOX BUTTON SHOW AND CLOSE
	   jQuery('.small-graph-box').hover(function() {
		  jQuery(this).find('.box-button').fadeIn('fast');
	   }, function() {
		  jQuery(this).find('.box-button').fadeOut('fast');
	   });
	   jQuery('.small-graph-box .box-close').click(function() {
		  jQuery(this).closest('.small-graph-box').fadeOut(200);
		  return false;
	   });
	   
	    //CHARTS
	    function gd(year, day, month) {
			return new Date(year, month - 1, day).getTime();
		}
		
		graphArea2 = Morris.Area({
			element: 'hero-area',
			padding: 10,
        behaveLikeLine: true,
        gridEnabled: false,
        gridLineColor: '#dddddd',
        axes: true,
        resize: true,
        smooth:true,
        pointSize: 0,
        lineWidth: 0,
        fillOpacity:0.85,
			data: [
				{period: '2015 Q1', iphone: 2668, ipad: null, itouch: 2649},
				{period: '2015 Q2', iphone: 15780, ipad: 13799, itouch: 12051},
				{period: '2015 Q3', iphone: 12920, ipad: 10975, itouch: 9910},
				{period: '2015 Q4', iphone: 8770, ipad: 6600, itouch: 6695},
				{period: '2016 Q1', iphone: 10820, ipad: 10924, itouch: 12300},
				{period: '2016 Q2', iphone: 9680, ipad: 9010, itouch: 7891},
				{period: '2016 Q3', iphone: 4830, ipad: 3805, itouch: 1598},
				{period: '2016 Q4', iphone: 15083, ipad: 8977, itouch: 5185},
				{period: '2017 Q1', iphone: 10697, ipad: 4470, itouch: 2038},
			
			],
			lineColors:['#eb6f6f','#926383','#eb6f6f'],
			xkey: 'period',
            redraw: true,
            ykeys: ['iphone', 'ipad', 'itouch'],
            labels: ['All Visitors', 'Returning Visitors', 'Unique Visitors'],
			pointSize: 2,
			hideHover: 'auto',
			resize: true
		});
		
	   
	});
	</script>
<!-- calendar -->
	<script type="text/javascript" src="js/monthly.js"></script>
	<script type="text/javascript">
		$(window).load( function() {

			$('#mycalendar').monthly({
				mode: 'event',
				
			});

			$('#mycalendar2').monthly({
				mode: 'picker',
				target: '#mytarget',
				setWidth: '250px',
				startHidden: true,
				showTrigger: '#mytarget',
				stylePast: true,
				disablePast: true
			});

		switch(window.location.protocol) {
		case 'http:':
		case 'https:':
		// running on a server, should be good.
		break;
		case 'file:':
		alert('Just a heads-up, events will not work when run locally.');
		}

		});
	</script>
	<!-- //calendar -->
</body>
</html>