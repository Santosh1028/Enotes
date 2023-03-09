package com.enotes.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enotes.dao.NoteDao;
import com.enotes.dao.UserDao;
import com.enotes.db.DatabaseDB;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			Integer note_id = Integer.parseInt(req.getParameter("note_id"));
			// System.out.println(note_id);

			NoteDao noteDao = new NoteDao(DatabaseDB.geConnection());
			boolean b = noteDao.deleteNote(note_id);

			HttpSession httpSession = req.getSession();

			if (b) {
//		    	System.out.println("Note Deleted Successfully...");
				httpSession.setAttribute("deleteMsg", "Note Deleted Successfully...");
				resp.sendRedirect("show_notes.jsp");

			} else {
//		    	System.out.println("Something Went Wrong...");
				httpSession.setAttribute("deleteMsg", "Note Deleted Successfully...");
				resp.sendRedirect("show_notes.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
