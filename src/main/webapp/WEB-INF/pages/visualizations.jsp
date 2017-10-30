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
	<script>
        $('.carousel').carousel();
    
    </script>
</head>

<body>

	<sec:authorize access="hasRole('ROLE_ADMIN')">
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

	<c:if test="${pageContext.request.userPrincipal.name != null}">
	<!-- Fixed navbar -->
	<div class="navbar navbar-inverse navbar-fixed-top headroom" >
		<div class="container">
			<div class="navbar-header">
				<!-- Button for smallest screens -->
			<a class="navbar-brand" href="../"><img src="<c:url value="/assets/images/logo.jpg"/>" alt="Progressus HTML5 template" width="50px"></a>
				<h1 class="widget-title" style="font-weight:bold;color:white;margin-top:5px;margin-left:59px">Albatross</h1>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li><a href="../">Home</a></li>
					<li><a href="../about">About Us</a></li>
					
					<!-- Show Mypage if logged In -->
					<c:if test="${not empty isLoggedIn}">
						<li><a href="../app/genre">MyPage</a></li>
			    	</c:if>
					
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Recommendions<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="./genre">By Genre</a></li>
							<li><a href="./suggested-movie">Movies You Might Like</a></li>
							<li><a href="#">User Base Statistics</a></li>
						</ul>
					</li>
					<li><a class="btn" href="javascript:formSubmit()">LOGOUT</a></li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div> 
	<!-- /.navbar -->

	<header id="head" class="secondary"></header>

	<!-- container -->
	<div class="container">

		<ol class="breadcrumb">
			<li><a href="../">Home</a></li>
			<li class="active">User Base Statistics</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-sm-9 maincontent" style="margin-left:180px">
				<header class="page-header">
					<h1 class="page-title">User Base Statistics</h1>
				</header>
				<header class="page-header">
					<h3 class="page-title">Click on previous or next arrows to navigate through the statistical charts.</h3>
				</header>
				 <div id="myCarousel" class="carousel slide">
                      <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
                        <li data-target="#myCarousel" data-slide-to="4"></li>
						<li data-target="#myCarousel" data-slide-to="5"></li>
                      </ol>
  <!-- Carousel items -->
                      <div class="carousel-inner">
                        <div class="active item"><h3> Users vs Ratings</h3><br/><img class="img-responsive" src="<c:url value="/assets/images/Ratings.jpg"/>" alt="" ></div>
                        <div class="item"><h3> Genre vs Number of Movies</h3><br/><img class="img-responsive" src="<c:url value="/assets/images/Genre.jpg"/>"  alt="" ></div>
						<div class="item"><h3> Users vs Occupation</h3><br/><img class="img-responsive" src="<c:url value="/assets/images/Occupation.jpg"/>"  alt="" ></div>
						<div class="item"><h3> Users vs Location</h3><br/><img class="img-responsive" src="<c:url value="/assets/images/Location.jpg"/>"  alt=""  ></div>
						 <div class="item"><h3> Users vs Gender</h3><br/><img class="img-responsive" src="<c:url value="/assets/images/Gender.jpg"/>"  alt="" ></div>
						<div class="item"><h3> Users vs Age Range</h3><br/><img class="img-responsive" src="<c:url value="/assets/images/AgeRange.jpg"/>"  alt="" ></div>
                        </div>
  <!-- Carousel nav -->
                        <div class="navigate">
                     <strong> <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                      <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a></strong>
                        </div>
                    </div>
			</article>  
			<!-- /Article -->
			

		</div>
	</div>	<!-- /container -->
	

	<footer id="footer" class="top-space">

		<div class="footer1">
			<div class="container">
				<div class="row">
					
						<div class="col-md-3 widget">
						<h3 class="widget-title">Contact</h3>
						<div class="widget-body">
							<p>+1 408-629-0098<br>
								<a href="mailto:#">datascientists@gmail.com</a><br>
								<br>
								7th & San Fernando Street, Engineering Building, SJSU, CA
								95112
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
								<a href="#">Home</a> | 
								<a href="about.html">About Us</a> |
								<a href="sidebar-left.html">By Genre</a> |
								<a href="sidebar-right.html">Movies You Might Like</a> |
								<b><a href="index.html">Logout</a></b>
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
	</c:if>
</sec:authorize>
</body>
</html>