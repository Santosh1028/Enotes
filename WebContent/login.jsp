<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page.</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4 mt-1">

				<div class="card">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h3 class="text-center">Login Here</h3>

						<%
						String loginFail = (String) session.getAttribute("login-failed");

						if (loginFail != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=loginFail%></div>

						<%
						session.removeAttribute("login-failed");
						}
						%>


					</div>


					<%
					String withOutLogin = (String) session.getAttribute("login-error");

					if (withOutLogin != null) {
					%>

					<div class="alert alert-danger text-center" role="alert"><%=withOutLogin%></div>
					<%
					session.removeAttribute("login-error");
					}
					%>
					
					<%
					String logoutMsg = (String) session.getAttribute("logout-msg");

					if (logoutMsg != null) {
					%>

					<div class="alert alert-success text-center" role="alert"><%=logoutMsg%></div>
					<%
					session.removeAttribute("logout-msg");
					}
					%>

					<div class="card-body">
						<form action="LoginServlet" method="post">

							<div class="form-group">
								<label for="email">Email address</label> <input type="email"
									class="form-control" id="email" name="email"
									aria-describedby="emailHelp" placeholder="Enter Email Address">

							</div>
							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="password" name="password"
									placeholder="Password">
							</div>

							<div class="container text-center">
								<button type="submit"
									class="btn btn-primary badge-pill btn-block">Login</button>
								<button type="submit"
									class="btn btn-warning badge-pill btn-block">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_components/footer.jsp"%>

</body>
</html>