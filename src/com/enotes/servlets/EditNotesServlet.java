package com.enotes.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enotes.dao.NoteDao;
import com.enotes.db.DatabaseDB;

@WebServlet("/EditNotesServlet")
public class EditNotesServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Integer note_id = Integer.parseInt(req.getParameter("note_id"));
			String title = req.getParameter("title");
			String content = req.getParameter("content");

			NoteDao noteDao = new NoteDao(DatabaseDB.geConnection());
			boolean update = noteDao.updateNote(note_id, title, content);

			HttpSession httpSession = req.getSession();
			if (update) {
//				System.out.println("Note updated successfully...");
				httpSession.setAttribute("update-msg", "Note updated successfully...");
				resp.sendRedirect("edit_notes.jsp");
			} else {
//				System.out.println("Something Went Wrong...");
				httpSession.setAttribute("update-error", "Note updated successfully...");
				resp.sendRedirect("edit_notes.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
