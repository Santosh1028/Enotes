<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page.</title>
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
						<h3 class="text-center">Register Here</h3>

						<%
						String regMsg = (String) session.getAttribute("reg-success");

						if (regMsg != null) {
						%>
						<div class="alert alert-secondary" role="alert"><%=regMsg%><a
								href="login.jsp">Login Here</a>
						</div>

						<%
						session.removeAttribute("reg-success");
						}
						%>

						<%
						String failMsg = (String) session.getAttribute("reg-failed");

						if (failMsg != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=failMsg%></div>

						<%
						session.removeAttribute("reg-failed");
						}
						%>




					</div>

					<div class="card-body">
						<form action="UserServlet" method="post">

							<div class="form-group">
								<label for="name">Full Name</label> <input type="text"
									class="form-control" id="name" name="name"
									aria-describedby="emailHelp" placeholder="Enter Full Name">

							</div>
							<div class="form-group">
								<label for="email">Email address</label> <input type="email"
									class="form-control" id="email" name="email"
									aria-describedby="emailHelp" placeholder="Enter Email Address">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="password"
									name="password" placeholder="Password">
							</div>

							<div class="container text-center">
								<button type="submit"
									class="btn btn-primary badge-pill btn-block">Register</button>
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