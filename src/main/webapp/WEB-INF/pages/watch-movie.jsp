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
					<li><a href="../about">About</a></li>
					
					<!-- Show Mypage if logged In -->
					<c:if test="${not empty isLoggedIn}">
						<li><a href="../app/genre">MyPage</a></li>
			    	</c:if>
					
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Recommendations<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="../app/genre">By Genre</a></li>
							<li class="active"><a href="../app/suggested-movie">Movies You Might Like</a></li>
							<li><a href="../app/visualizations">User Base Statistics</a></li>
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
			<li class="active">Watching Movie</li>
		</ol>

		<div class="row" style="margin-left:200px">
			
			<h2>You are watching movie "${movie}"</h2>
		<img src="<c:url value="/assets/images/movie-countdown.gif" />" alt="You are watching a movie" height="300" width="600">
			
			
			<!-- Article main content -->
			<!--			<!-- Article main content -->
	<article class="col-md-8 maincontent">
				<header class="page-header">
				<br/>
					<h3 class ="page-title" align="left"><b>You may also like:</b></h3>
				</header>

				<div id="myCarousel" class="carousel slide" >
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
						<li data-target="#myCarousel" data-slide-to="4"></li>
						<li data-target="#myCarousel" data-slide-to="5"></li>
						<li data-target="#myCarousel" data-slide-to="6"></li>
						<li data-target="#myCarousel" data-slide-to="7"></li>
						<li data-target="#myCarousel" data-slide-to="8"></li>
						<li data-target="#myCarousel" data-slide-to="9"></li>
					</ol>
					<!-- Carousel items -->
					
					
		 <script type="text/javascript">
          function clickme(img_id)
        {
        	  /*alert(img_id);*/
         var x = img_id;
        
        	window.location.href="../app/watch-movie?movie-id="+x;
        }
            
            
          
    </script>
					
		<form name = "myForm" id= "myForm" action="../app/watch-movie">
			<div class="carousel-inner" style= "height:400px; width:700px">
                        <div class="active item" style= "height:400px">
                       	<p style="text-align:center"><b>${recoMovies[0].name}</b> 
                        <a href=${recoMovies[0].movieLink}>IMDB Link</a></p>
                        <img src="<c:url value="/assets/images/${recoMovies[0].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${recoMovies[0].id}"  onclick="clickme(this.id);" />
						</div>
                        <div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${recoMovies[1].name}</b> 
                        <a href=${recoMovies[1].movieLink}>IMDB Link</a></p>
                        <img src="<c:url value="/assets/images/${recoMovies[1].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${recoMovies[1].id}"  onclick="clickme(this.id);" />
						</div>
                        <div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${recoMovies[2].name}</b> 
                        <a href=${recoMovies[2].movieLink}>IMDB Link</a></p>
                        <img src="<c:url value="/assets/images/${recoMovies[2].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${recoMovies[2].id}"  onclick="clickme(this.id);" />
						</div>
                        <div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${recoMovies[3].name}</b> 
                        <a href=${recoMovies[3].movieLink}>IMDB Link</a></p>
                         <img src="<c:url value="/assets/images/${recoMovies[3].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${recoMovies[3].id}"  onclick="clickme(this.id);" />
						</div>
                        <div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${recoMovies[4].name}</b> 
                        <a href=${recoMovies[4].movieLink}>IMDB Link</a></p>
                         <img src="<c:url value="/assets/images/${recoMovies[4].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${recoMovies[4].id}"  onclick="clickme(this.id);" />
						</div>
						
						<div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${recoMovies[5].name}</b> 
                        <a href=${recoMovies[5].movieLink}>IMDB Link</a></p>
                         <img src="<c:url value="/assets/images/${recoMovies[5].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${recoMovies[5].id}"  onclick="clickme(this.id);" />
						</div>
						<div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${recoMovies[6].name}</b> 
                        <a href=${recoMovies[6].movieLink}>IMDB Link</a></p>
                         <img src="<c:url value="/assets/images/${recoMovies[6].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${recoMovies[6].id}"  onclick="clickme(this.id);" />
						</div>
						<div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${recoMovies[7].name}</b> 
                        <a href=${recoMovies[7].movieLink}>IMDB Link</a></p>
                         <img src="<c:url value="/assets/images/${recoMovies[7].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${recoMovies[7].id}"  onclick="clickme(this.id);" />
						</div>
						<div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${recoMovies[8].name}</b> 
                        <a href=${recoMovies[8].movieLink}>IMDB Link</a></p>
                         <img src="<c:url value="/assets/images/${recoMovies[8].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${recoMovies[8].id}"  onclick="clickme(this.id);" />
						</div>
						<div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${recoMovies[9].name}</b> 
                        <a href=${recoMovies[9].movieLink}>IMDB Link</a></p>
                         <img src="<c:url value="/assets/images/${recoMovies[9].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${recoMovies[9].id}"  onclick="clickme(this.id);" />
						</div>
           
			</div>	
		
						
					<!-- Carousel nav -->
					<div class="navigate">
						<strong> <a class="carousel-control left"
							href="#myCarousel" data-slide="prev">&lsaquo;</a> <a
							class="carousel-control right" href="#myCarousel"
							data-slide="next">&rsaquo;</a></strong>
					</div>
				</div>
	</form>
	


			</article>
			<!-- /Article -->
			<!-- /Article -->
		
		
		
		
		
		
		
		
		
			<!-- Button -->
		
		</div>
			<!-- /Button -->

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
								<a href="index.html">Home</a> | 
								<a href="about.html">About Us</a> |
								<a href="sidebar-left.html">By Genre</a> |
								<a href="visualizations.html">User Base Statistics</a> |
								<b><a href="index.html">Logout</a></b>
							</p>
						</div>
					</div> -->

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