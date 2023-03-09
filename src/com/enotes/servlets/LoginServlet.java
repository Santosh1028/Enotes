package com.enotes.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enotes.dao.UserDao;
import com.enotes.db.DatabaseDB;
import com.enotes.pojo.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			User user=new User();
			user.setEmail(email);
			user.setPassword(password);
			
			UserDao userDao=new UserDao(DatabaseDB.geConnection());
			User user2= userDao.login(user);
			
			HttpSession httpSession=request.getSession();
			
			if(user2!=null) {
				httpSession.setAttribute("logged-user", user2);
				response.sendRedirect("home.jsp");
			}
			else {
				httpSession.setAttribute("login-failed", "Invalid Username and Password");
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
