
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>ALT</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">


	<link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,700,800" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">
	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="css/flexslider.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	

	</head>
	<body>
		
	<div class="fh5co-loader"></div>
	
	<div id="page">
	<nav class="fh5co-nav" role="navigation">
		<div class="top-menu">
			<div class="container">
				<div class="row">
					<div class="col-xs-2">
                                            <!-- Website title -->
						<div id="fh5co-logo"><a href="indexx.html">ALT<span>.</span></a></div>
					</div>
					<div class="col-xs-10 text-right menu-1">
						<ul>
							<!-- Dropdown menu -->
							<li class="has-dropdown">
								<a href="indexx.html.html">My Account</a>
								<ul class="dropdown">
									<li><a href=".html">Order New Test</a></li>
									<li><a href=".html">View Results</a></li>
                                                                        <li><a href=".html">View Previous Orders</a></li>
								</ul>
							</li>
							<li class="btn-cta"><a href="Logout.html"><span>Log out</span></a></li>
                                                        <li class="btn-cta"><a href="Logout.html"><span>Contact a member of staff</span></a></li>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</nav>
            <div id="header-section" class="header-section">
                <center><h1 style="font-size:28px;"  class="heading-section">Your Result</h1></center>
                
                                    		<%
		String oid = request.getParameter("oid");
           
	
               try{

             //using the jdbc driver
             Class.forName("com.mysql.jdbc.Driver");
             //Create the connection with fyp database
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alt", "root", "Laura6531*");
          Statement stmt = con.createStatement();
          //Select the data from the database where the user id is equal to the session id
          ResultSet rs = stmt.executeQuery("select * from result where oid='"+oid+"'");
          rs.next();
          //Retrieve the detaails from the results set for the applicable variable 
          String comment = rs.getString("comment");


          %>
          <!--Display the details -->
          
	<img src="getImage.jsp?oid=<%=oid%>" align=middle height="500px" width="700px"/>
        <p> <%out.print(comment);%></p>
           
           <%
         }catch(Exception e){
          out.println(e);
         }
     
          
       
        %>
            </div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- countTo -->
	<script src="js/jquery.countTo.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

	</body>
</html>


