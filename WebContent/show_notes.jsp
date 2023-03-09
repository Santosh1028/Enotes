<%@page import="com.enotes.pojo.Note"%>
<%@page import="java.util.List"%>
<%@page import="com.enotes.db.DatabaseDB"%>
<%@page import="com.enotes.dao.NoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User user3 = (User) session.getAttribute("logged-user");

if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please Login First");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Notes Page</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body>
	<%@include file="all_components/navbar.jsp"%>

	<%
	String updateMsg = (String) session.getAttribute("update-msg");

	if (updateMsg != null) {
	%>
	<div class="alert alert-secondary" role="alert"><%=updateMsg%></div>
	<%
	session.removeAttribute("update-msg");
	}
	%>

	<div class="container">
		<h2 class="text-center">All Notes</h2>
		<div class="row">
			<div class="col-md-12">
				<%
				if (user3 != null) {

					NoteDao noteDao = new NoteDao(DatabaseDB.geConnection());
					List<Note> list = noteDao.getAllNotesByUserId(user3.getId());

					for (Note note : list) {
				%>
				<div class="card mt-2 mb-2">
					<img alt="" src="img/note.png" class="card-img-top mt-2 mx-auto"
						style="max-width: 100px">

					<div class="card-body p-4">


						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p><%=note.getContent()%></p>

						<p>
							<b class="text-success">Published By: </b><br> <b
								class="text-primary"><%=user3.getName()%></b>
						</p>

						<div class="container text-center mt-2">
							<a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
							<a href="edit_notes.jsp?note_id=<%=note.getId()%>"
								class=" btn btn-primary">Edit</a>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>

			</div>
		</div>
	</div>

	<%@include file="all_components/footer.jsp"%>

</body>
</html>