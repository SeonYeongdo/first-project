package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.storeDAO;



@WebServlet("/searchCon")
public class searchCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		
		String search = request.getParameter("search");
		
		storeDAO dao = new storeDAO();
	//	storeVO vo = dao.search(search);
		
	//	session.setAttribute("vo_session", vo);
			
		response.sendRedirect("search1.jsp");
		

		
	}

}
