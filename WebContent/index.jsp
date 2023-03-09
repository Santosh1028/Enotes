<%@page import="com.enotes.db.DatabaseDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.enotes.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page..</title>
<%@include file="all_components/all_css.jsp"%>

<style type="text/css">
.back-img {
	background: url("img/bg.jfif");
	width: 100%;
	height: 80vh;
	background-size: cover;
}
</style>

</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	
	<%
	Connection con=DatabaseDB.geConnection();
	System.out.println(con);
	
	%>
	<div class="container-fluid back-img">
		<div class="container text-center">
			<h1 class="text-white">
				<i class="fa fa-book" aria-hidden="true"></i> ENotes- Save Your
				Notes..
			</h1>

			<a href="login.jsp" class="btn btn-light"><i
				class="fa fa-sign-in" aria-hidden="true"></i> Login</a> <a
				href="register.jsp" class="btn btn-light"><i
				class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
		</div>
	</div>

	<%@include file="all_components/footer.jsp"%>
</body>
</html>