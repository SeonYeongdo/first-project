package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.userDAO;
import model.userVO;

@WebServlet("/loginCon")
public class loginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		
		userDAO dao = new userDAO();
		userVO vo = dao.login(id, pw);
		
	
		if (vo != null) {
			response.sendRedirect("index.jsp");
			session.setAttribute("vo_session", vo);
		} else {
			response.sendRedirect("loginForm.jsp");
			
		}
		
	}

}
