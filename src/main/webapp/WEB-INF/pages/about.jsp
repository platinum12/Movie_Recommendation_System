<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author"      content="Sergey Pozhilov (GetTemplate.com)">
	
	<title>Albatross - Movie Recommendation System</title>

<link rel="shortcut icon"
	href="<c:url value="/assets/images/gt_favicon.png"/>">

<link rel="stylesheet" media="screen"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
<link rel="stylesheet"
	href="<c:url value="/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/font-awesome.min.css"/>">

<!-- Custom styles for our template -->
<link rel="stylesheet"
	href="<c:url value="/assets/css/bootstrap-theme.css"/>" media="screen">
<link rel="stylesheet" href="<c:url value="/assets/css/main.css"/>">
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="assets/js/html5shiv.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->
</head>

<body>
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom" >
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
				<a class="navbar-brand" href="."><img src="<c:url value="/assets/images/logo.jpg"/>" alt="Progressus HTML5 template" width="50px"></a>
				<h1 class="widget-title" style="font-weight:bold;color:white;margin-top:5px;margin-left:59px">Albatross</h1>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li><a href=".">Home</a></li>
					<li class="active"><a href="#">About Us</a></li>
					
					<!-- Show Mypage if logged In -->
					<c:if test="${not empty isLoggedIn}">
						<li><a href="./app/genre">MyPage</a></li>
			    	</c:if>

					<!-- If not logged-in, show the login link -->
					<c:if test="${empty isLoggedIn}">
						<li><a class="btn" href="./login">SIGN IN / SIGN UP</a></li>
					</c:if>

					<!-- If logged-in, show logout button and include its form and javascript -->
					<c:if test="${not empty isLoggedIn}">
						<li><a class="btn" href="javascript:formSubmit()">LOGOUT</a></li>
					</c:if>
					<c:if test="${not empty isLoggedIn}">
						<c:url value="/j_spring_security_logout" var="logoutUrl" />
						<form action="${logoutUrl}" method="post" id="logoutForm">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
						<script>
							function formSubmit() {
								document.getElementById("logoutForm").submit();
							}
						</script>
					</c:if>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div> 
	<!-- /.navbar -->

	<header id="head" class="secondary"></header>

	<!-- container -->
	<div class="container">

		<ol class="breadcrumb">
			<li><a href="index.html">Home</a></li>
			<li class="active">About Us</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-sm-8 maincontent">
				<h3>Team: Data Scientists</h3>
				<p><img src="<c:url value="/assets/images/team.jpg"/>" alt="" class="img-rounded pull-right" width="800" height:"300" > 
				</p>
				
			</article>
			<!-- /Article -->
			
			<!-- Sidebar -->
			<aside class="col-sm-4 sidebar sidebar-right">

				<div class="widget">
					<h4>Members</h4>
					<ul class="list-unstyled list-spaces">
						<li><a href="#">Akshar Rranka</a><br><span class="small text-muted">Semester 3, MS Computer Engineering, Fall 2013.</span></li>
						<li><a href="#">Aneesha Punreddy</a><br><span class="small text-muted">Semester 1, MS Software Engineering, Fall 2014.</span></li>
						<li><a href="#">Huzefa Siyamwala</a><br><span class="small text-muted">Semester 3, MS Computer Engineering, Fall 2013.</span></li>
						<li><a href="#">Richa Lakhe</a><br><span class="small text-muted">Semester 2, MS Computer Engineering, Spring 2014.</span></li>
						</ul>
				</div>

			</aside>
			<!-- /Sidebar -->

		</div>
	</div>	<!-- /container -->
	

	<footer id="footer" class="top-space">

		<div class="footer1">
			<div class="container">
				<div class="row">
					
						<div class="col-md-3 widget">
						<h3 class="widget-title">Contact</h3>
						<div class="widget-body">
							<p>+1 408-629-0000<br>
								<a href="mailto:#">datascientists@gmail.com</a><br>
								<br>
								1 Washington Sq, San Jose, CA
								95192
							</p>	
						</div>
					</div>

					<div class="col-md-3 widget">
						<h3 class="widget-title">Follow Us</h3>
						<div class="widget-body">
							<p class="follow-me-icons">
								<a href=""><i class="fa fa-twitter fa-2"></i></a>
								<a href=""><i class="fa fa-facebook fa-2"></i></a>
							</p>	
						</div>
					</div>

				</div> <!-- /row of widgets -->
			</div>
		</div>

		<div class="footer2">
			<div class="container">
				<div class="row">
					
					<!-- <div class="col-md-6 widget">
						<div class="widget-body">
							<p class="simplenav">
								<a href="./">Home</a> | 
								<a href="#">About</a> |
								<b><a href="signin.html">Sign in/Sign up</a></b> |
							</p>
						</div>
					</div>  -->

					

				</div> <!-- /row of widgets -->
			</div>
		</div>
	</footer>	
		




	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
		<script src="<c:url value="/assets/js/headroom.min.js"/>"></script>
	<script src="<c:url value="/assets/js/jQuery.headroom.min.js"/>"></script>
	<script src="<c:url value="/assets/js/template.js"/>"></script>
</html>