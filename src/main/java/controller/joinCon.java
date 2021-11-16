package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.userDAO;
import model.userVO;


@WebServlet("/joinCon")
public class joinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("euc-kr");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pwd");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String prefer = request.getParameter("prefer");
		
		userVO dto = new userVO(id, pw, name, addr, prefer);
		
		userDAO dao = new userDAO();
		int cnt = dao.join(dto);
		
		if (cnt > 0) {
			response.sendRedirect("loginForm.jsp");
		} else {
			response.sendRedirect("index.jsp");
		}
	}

}
