<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User user2 = (User) session.getAttribute("logged-user");

if (user2 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please Login First");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Homepage..</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body>

	<div class="container-fluid p-0">
		<%@include file="all_components/navbar.jsp"%>
		<div class="card text-center py-5">
			<div class="card-body">
				<img alt="" src="img/bg1.png" class="img-fluid mx-auto"
					style="max-width: 300px;">
				<h1>START TAKING YOUR NOTES</h1>
				<a href="add_notes.jsp" class="btn btn-outline-danger">Start
					Here</a>
			</div>
		</div>
	</div>

	<%@include file="all_components/footer.jsp"%>

</body>
</html>