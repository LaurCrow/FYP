<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<!--received bootstrap from www.freehtml5.com -->
<!-- imports the java statement -->
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
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
                                                        <li class="btn-cta"><a href="Logout.html"><span>Account Details</span></a></li>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</nav>
            <div id="header-section" class="header-section">
                <center><h1 style="font-size:28px;"  class="heading-section">Your Order Summary</h1></center>
           

                                     <%
        //YouTube Tutorial https://www.youtube.com/watch?v=wK2nWOAh9eY&t=188s
         try{
            //If the session id is null, do not create session
              String session_id =null;
        HttpSession session1=request.getSession(false); 
        //if the session id is not null, the session id is the attriute name
        if(session1!=null){  
        session_id=(String)session1.getAttribute("name");  
       
        }
             //using the jdbc driver
             Class.forName("com.mysql.jdbc.Driver");
             //Create the connection with fyp database
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alt", "root", "Laura6531*");
          Statement stmt = con.createStatement();
          //Select the data from the database where the user id is equal to the session id
          ResultSet rs = stmt.executeQuery("select * from register where uid='"+session_id+"'");
          rs.next();
          //Retrieve the detaails from the results set for the applicable variable 
          String uid = rs.getString("uid");
          String email = rs.getString("email");
          String address = rs.getString("address");
          %>
          <!--Display the details -->
 
           <form action="register_1.jsp" method="post">
    
          <h1>Chemical testing of water quality</h1>
           <h1>Will be sent to <%out.print(email);%></h1>
           <h1>And posted to <%out.print(address);%></h1>
           <h1>On Approx date</h1
           

        <input style="height:30px" size="25" type="text" name ="TestType" value ="Chemical"/>
							
        <input  style="height:30px" size="25" type="text" name ="uid" value ="<%out.print(uid);%>" />
							
	<input align="middle" type="submit" value ="Place Order" />
     
       
                       </form>

           <%
         }catch(Exception e){
          out.println(e);
         }
     
          
       
        %>
				</div>
			
				
				</div>
			</div>
		</div>  
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

