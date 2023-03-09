<%@page import="com.enotes.pojo.Note"%>
<%@page import="com.enotes.db.DatabaseDB"%>
<%@page import="com.enotes.dao.NoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User user1 = (User) session.getAttribute("logged-user");

if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please Login First");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Notes</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body>

	<%
	Integer note_id = Integer.parseInt(request.getParameter("note_id"));

	NoteDao noteDao = new NoteDao(DatabaseDB.geConnection());
	Note note = noteDao.getNoteById(note_id);
	%>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid p-0">

		<div class="row">
			<div class="col-md-4 offset-md-4">
				<h2 class="text-center">Update Note Here.</h2>

				<div class="card mb-2">
					<div class="card-body">
						<form action="EditNotesServlet" method="post">

							<input type="hidden" value="<%=note_id%>" name="note_id">

							<div class="form-group">

								<%-- <%
								User user = (User) session.getAttribute("logged-user");

								if (user != null) {
								%>

								<input type="hidden" value="<%=user.getId()%>" name="uid">

								<%
								}
								%> --%>



								<label for="title">Enter Title</label> <input type="text"
									class="form-control" id="title" name="title"
									aria-describedby="emailHelp" placeholder="Enter Title"
									value="<%=note.getTitle()%>" required>
							</div>
							<div class="form-group">
								<label for="description">Enter Description</label>
								<textarea class="form-control" rows="10" cols="" name="content"
									required><%=note.getContent()%></textarea>
							</div>

							<div class="text-center">
								<button type="submit"
									class="btn btn-primary badge-pill btn-block">Update
									Notes</button>
								<button type="reset"
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