<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Sergey Pozhilov (GetTemplate.com)">

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


<!-- security code -->
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
	
	<!-- security code ends -->

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
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Recommendions<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="active"><a href="#">By Genre</a></li>
							<li><a href="../app/suggested-movies">Movies You Might Like</a></li>
							<li><a href="../app/visualizations">User Base Statistics</a></li>
						</ul>
					</li>
					
					<!-- Show Mypage if logged In -->
					<c:if test="${not empty isLoggedIn}">
						<li><a href="#">MyPage</a></li>
			    	</c:if>
					
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
			<li class="active">By Genre</li>
		</ol>

		<div class="row">

			<!-- Sidebar -->
			<aside class="col-md-4 sidebar sidebar-left">
		<form action="../app/genre">
				<div class="row widget">
					<div class="col-xs-12">
						<h4>Select A Genre</h4>
						<br />
						<p>
							<input type="radio" name="genre" value="action" ${genre=='action'?'checked':''}><span
								class="floatLeft" style="margin-right: 50px">Action</span></input> 
							<input
								type="radio" name="genre" value="adventure" ${genre=='adventure'?'checked':''}><span
								class="floatLeft">Adventure</span></input><br>
						</p>
						<p>
							<input type="radio" name="genre" value="animation" ${genre=='animation'?'checked':''}><span
								class="floatLeft" style="margin-right: 27px">Animation</span></input> 
							<input
								type="radio" name="genre" value="childrens" ${genre=='childrens'?'checked':''}><span
								class="floatLeft">Family</span></input></br>
						</p>
						<p>
							<input type="radio" name="genre" value="comedy" ${genre=='comedy'?'checked':''}><span
								class="floatLeft" style="margin-right: 37px">Comedy</span></input> 
							<input
								type="radio" name="genre" value="crime" ${genre=='crime'?'checked':''}><span
								class="floatLeft">Crime</span></input></br>
						</p>
						<p>
							<input type="radio" name="genre" value="documentary" ${genre=='documentary'?'checked':''}><span
								class="floatLeft" style="margin-right: 5px">Documentary</span></input> 
							<input
								type="radio" name="genre" value="drama" ${genre=='drama'?'checked':''}><span
								class="floatLeft">Drama</span></input><br>
						</p>
						<p>
							<input type="radio" name="genre" value="fantasy" ${genre=='fantasy'?'checked':''}><span
								class="floatLeft" style="margin-right: 39px">Fantasy</span></input>
						    <input
								type="radio" name="genre" value="filmNoir" ${genre=='filmNoir'?'checked':''}><span
								class="floatLeft">Biography</span></input></br>
						</p>
						<p>
							<input type="radio" name="genre" value="horror" ${genre=='horror'?'checked':''}><span
								class="floatLeft" style="margin-right: 49px">Horror</span></input>
							 <input
								type="radio" name="genre" value="musical" ${genre=='musical'?'checked':''}><span
								class="floatLeft">Musical</span></input></br>
						</p>
						<p>
							<input type="radio" name="genre" value="mystery" ${genre=='mystery'?'checked':''}><span
								class="floatLeft" style="margin-right: 39px">Mystery</span></input> 
							<input
								type="radio" name="genre" value="romance" ${genre=='romance'?'checked':''}><span
								class="floatLeft">Romance</span></input></br>
						</p>
						<p>
							<input type="radio" name="genre" value="scifi" ${genre=='scifi'?'checked':''}><span
								class="floatLeft" style="margin-right: 52px">Sci-Fi</span></input> 
							<input
								type="radio" name="genre" value="thriller" ${genre=='thriller'?'checked':''}><span
								class="floatLeft">Thriller</span></input></br>
						</p>
						<p>
							<input type="radio" name="genre" value="war" ${genre=='war'?'checked':''}><span
								class="floatLeft" style="margin-right: 62px">War</span></input> 
							<input
								type="radio" name="genre" value="western" ${genre=='western'?'checked':''}><span
								class="floatLeft">Sports</span></input></br>
						</p>
					</div>
				</div>

				<div class="col-lg-4 text-right">
					<input  class="btn btn-action" type="submit" value="Recommend" onclick="showCarouselDiv()"/>
				</div>
				<!--  <script>
					function showCarouselDiv() {
						document.getElementById("myCarousel").style.visibility="visible";
					}
				</script>  -->

	</form> 
	<br/>
	<br/>
	
	<!-- remove later -->
		
	<!-- remove -->	


			</aside>
			<!-- /Sidebar -->

			<!--			<!-- Article main content -->
			<article class="col-md-8 maincontent" >
			<!-- Show the click on recommend message only if user hasn't specified genre -->
			<c:if test="${empty showCarousel}">
			<header class="page-top-header">
					<h3 class="page-title">Click on Recommend button to see your movie list.</h3>
			</header>
			</c:if>
			<!-- Show Carousel only if the showCarousel is not empty -->
            <c:if test="${not empty showCarousel}">
				<header class="page-header" >
					<h4 class ="page-title" align="center">Click on previous or next arrows to
						navigate through the recommended list of movies.<br/><b>Click on Image to watch Movie.</b></h4>
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
        
         var x = img_id;
        
        	window.location.href="../app/watch-movie?movie-id="+x;
        }
            
            
    
    </script>
					
		<form name = "myForm" id= "myForm" action="../app/watch-movie">
			<div class="carousel-inner" style= "height:400px; width:700px">
                        <div class="active item" style= "height:400px">
                       	<p style="text-align:center"><b>${topMovieList[0].name}</b> 
                        <a href=${topMovieList[0].movieLink}>IMDB Link</a></p>
                        <img src="<c:url value="/assets/images/${topMovieList[0].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${topMovieList[0].id}"  onclick="clickme(this.id);" />
						</div>
                        <div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${topMovieList[1].name}</b> 
                        <a href=${topMovieList[1].movieLink}>IMDB Link</a></p>
                        <img src="<c:url value="/assets/images/${topMovieList[1].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${topMovieList[1].id}"  onclick="clickme(this.id);" />
						</div>
                        <div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${topMovieList[2].name}</b> 
                        <a href=${topMovieList[2].movieLink}>IMDB Link</a></p>
                        <img src="<c:url value="/assets/images/${topMovieList[2].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${topMovieList[2].id}"  onclick="clickme(this.id);" />
						</div>
                        <div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${topMovieList[3].name}</b> 
                        <a href=${topMovieList[3].movieLink}>IMDB Link</a></p>
                         <img src="<c:url value="/assets/images/${topMovieList[3].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${topMovieList[3].id}"  onclick="clickme(this.id);" />
						</div>
                        <div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${topMovieList[4].name}</b> 
                        <a href=${topMovieList[4].movieLink}>IMDB Link</a></p>
                         <img src="<c:url value="/assets/images/${topMovieList[4].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${topMovieList[4].id}"  onclick="clickme(this.id);" />
						</div>
                          <div class="item" style= "height:400px">
                         <p style="text-align:center"><b>${topMovieList[5].name}</b> 
                        <a href=${topMovieList[5].movieLink}>IMDB Link</a></p>
                         <img src="<c:url value="/assets/images/${topMovieList[5].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${topMovieList[0].id}"  onclick="clickme(this.id);" />
						</div>
                        <div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${topMovieList[6].name}</b> 
                        <a href=${topMovieList[6].movieLink}>IMDB Link</a></p>
                         <img src="<c:url value="/assets/images/${topMovieList[6].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${topMovieList[0].id}"  onclick="clickme(this.id);" />
						</div>
                          <div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${topMovieList[7].name}</b> 
                        <a href=${topMovieList[7].movieLink}>IMDB Link</a></p>
                         <img src="<c:url value="/assets/images/${topMovieList[7].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${topMovieList[0].id}"  onclick="clickme(this.id);" />
						</div>
                        <div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${topMovieList[8].name}</b> 
                        <a href=${topMovieList[8].movieLink}>IMDB Link</a></p>
                         <img src="<c:url value="/assets/images/${topMovieList[8].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${topMovieList[0].id}"  onclick="clickme(this.id);" />
						</div>
                          <div class="item" style= "height:400px">
                        <p style="text-align:center"><b>${topMovieList[9].name}</b> 
                        <a href=${topMovieList[9].movieLink}>IMDB Link</a></p>
                         <img src="<c:url value="/assets/images/${topMovieList[9].id}.jpg"/>" alt="Progressus HTML5 template" width="34%" height="34%" style="margin-left:auto;margin-right:auto" id="${topMovieList[0].id}"  onclick="clickme(this.id);" />
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
			</c:if>	<!-- Condition to show if Carousel div has to be shown or not. -->
	</form>
	
			</div>			
		</div>


			</article>
			<!-- /Article -->
		</div>
	</div>
	<!-- /container -->


	<footer id="footer" class="top-space">

		<div class="footer1">
			<div class="container">
				<div class="row">

					<div class="col-md-3 widget">
						<h3 class="widget-title">Contact</h3>
						<div class="widget-body">
							<p>
								+1 408-629-0000<br> <a href="mailto:#">datascientists@gmail.com</a><br>
								<br> 1 Washington Sq, San Jose, CA 95192
							</p>
						</div>
					</div>

					<div class="col-md-3 widget">
						<h3 class="widget-title">Follow Us</h3>
						<div class="widget-body">
							<p class="follow-me-icons">
								<a href=""><i class="fa fa-twitter fa-2"></i></a> <a href=""><i
									class="fa fa-facebook fa-2"></i></a>
							</p>
						</div>
					</div>



				</div>
				<!-- /row of widgets -->
			</div>
		</div>

		<div class="footer2">
			<div class="container">
				<div class="row">

					<!-- <div class="col-md-6 widget">
						<div class="widget-body">
							<p class="simplenav">
								<a href="index.html">Home</a> | <a href="about.html">About
									Us</a> | <a href="sidebar-right.html">Movies You Might Like</a> | <a
									href="visualizations.html">User Base Statistics</a> | <b><a
									href="index.html">Logout</a></b>
							</p>
						</div>
					</div> -->
				</div>
				<!-- /row of widgets -->
			</div>
		</div>
	</footer>





	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="<c:url value="/assets/js/headroom.min.js"/>"></script>
	<script src="<c:url value="/assets/js/jQuery.headroom.min.js"/>"></script>
	<script src="<c:url value="/assets/js/template.js"/>"></script>
	
</c:if>
</sec:authorize>
</body>
</html>

