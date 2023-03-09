<%@page import="com.enotes.pojo.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
	<a class="navbar-brand" href="index.jsp"><i
		class="fa fa-graduation-cap" aria-hidden="true"></i> ENotes</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
					class="fa fa-home" aria-hidden="true"></i> Home <span
					class="sr-only">(current)</span> </a></li>
			<li class="nav-item active"><a class="nav-link" href="add_notes.jsp"><i
					class="fa fa-plus-circle" aria-hidden="true"></i> Add Notes</a></li>
			<li class="nav-item active"><a class="nav-link" href="show_notes.jsp"><i
					class="fa fa-list" aria-hidden="true"></i> Show Notes</a></li>

		</ul>

		<%
		User loggedUser = (User) session.getAttribute("logged-user");

		if (loggedUser != null) {
		%>
		<a class="btn btn-light my-2 my-sm-0 mr-2" type="submit" href=""
			data-toggle="modal" data-target="#exampleModal"><i
			class="fa fa-user-plus" aria-hidden="true"></i> <%=loggedUser.getName()%></a>
		<a class="btn btn-light my-2 my-sm-0" type="submit"
			href="LogoutServlet"><i class="fa fa-sign-in" aria-hidden="true"></i>
			Logout</a>



		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">User Details..</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<div class="container text-center">
							<i class="fa fa-user fa-3x"></i>
							<h5></h5>

							<table class="table">
								<tbody>

									<tr>
										<th>User ID</th>
										<td><%=loggedUser.getId()%></td>
									</tr>
									<tr>
										<th>User Name</th>
										<td><%=loggedUser.getName()%></td>
									</tr>

									<tr>
										<th>User Email</th>
										<td><%=loggedUser.getEmail()%></td>
									</tr>
								</tbody>
							</table>
						</div>



					</div>
					<div class="modal-footer text-center">
						<button type="button" class="btn btn-success" data-dismiss="modal">Close</button>

					</div>
				</div>
			</div>
		</div>

		<%
		}

		else {
		%>
		<a class="btn btn-light my-2 my-sm-0 mr-2" type="submit"
			href="login.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i>
			Login</a> <a class="btn btn-light my-2 my-sm-0" type="submit"
			href="register.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i>
			Register</a>
		<%
		}
		%>
	</div>

</nav>