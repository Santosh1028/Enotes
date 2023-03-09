package com.enotes.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enotes.dao.UserDao;
import com.enotes.db.DatabaseDB;
import com.enotes.pojo.User;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PrintWriter out=resp.getWriter();
		
		try {

			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPassword(password);

			UserDao userDao = new UserDao(DatabaseDB.geConnection());
			
			boolean f= userDao.addUser(user);
			
			
			HttpSession session=req.getSession();
			
			
			if(f) {
				//out.print("User Registered Successfully...");
				session.setAttribute("reg-success", "User Registered Successfully...");
				resp.sendRedirect("register.jsp");
			}
			else {
				//out.print("Something Went Wrong...");
				session.setAttribute("reg-failed", "Something Went Wrong...");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
