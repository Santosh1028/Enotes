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
import com.enotes.pojo.Note;

@WebServlet("/AddNotesServlet")
public class AddNoteServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int userId = Integer.parseInt(req.getParameter("uid"));
			String title = req.getParameter("title");
			String content = req.getParameter("content");

			NoteDao noteDao = new NoteDao(DatabaseDB.geConnection());
			boolean f= noteDao.addNotes(title, content, userId);
			
			
			HttpSession httpSession=req.getSession();
			
			if(f) {
//				System.out.println("Data Inserted Successfully...");
				httpSession.setAttribute("succees-msg", "Note added Successfully....");
				resp.sendRedirect("show_notes.jsp");
			}
			
			else {
				//System.out.println("Something Went Wrong..");
				httpSession.setAttribute("failed-msg", "Something Went Wrong....");
				resp.sendRedirect("add_notes.jsp");
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

}
