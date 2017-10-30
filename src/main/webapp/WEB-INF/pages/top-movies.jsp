<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<style>
ul#menu {
    padding: 0;
}

ul#menu li {
    display: inline;
}

ul#menu li a {
    background-color: black;
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 4px 4px 0 0;
}

ul#menu li a:hover {
    background-color: orange;
}
</style>

<body>
	<h1>${title}</h1>
	<h1>${message}</h1>
	<h2>${projectBy}</h2>
	
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
		<h2>
			Welcome : ${pageContext.request.userPrincipal.name} | <a
				href="javascript:formSubmit()"> Logout</a>
		</h2>
		<h2>Following are the TOP RATED movies from genre "${genre}"</h2>

		<form action="../app/watch-movie">
		<ul id="menu">
			<c:forEach var="movieInfo" items="${movieList}">
				<li><input type="radio" name="movie-id" value="${movieInfo.id}" checked>${movieInfo.name}</li>
			</c:forEach>
			</ul>

			<br>
			<br> <input type="submit" value="WATCH MOVIE">
		</form>
	</c:if>

	<%--
	<h2>Following are the TOP RATED movies from genre "${genre}"</h2>
	<c:forEach var="movieInfo" items="${movieList}">
  		<h2>Id:${movieInfo.id}  ,Name:${movieInfo.name}  ,Genre:${movieInfo.genre}  ,Average Rating:${movieInfo.avgRating}</h2>
	</c:forEach>
	--%>
</sec:authorize>
</body>
</html>