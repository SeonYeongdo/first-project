package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.wishlistDAO;


@WebServlet("/delWishCon")
public class delWishCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/plain");
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("euc-kr");
		String userName = request.getParameter("userName");
		
		try {
			int storeId = Integer.parseInt(request.getParameter("storeId"));
			wishlistDAO dao = new wishlistDAO();
			int cnt = dao.delete(storeId, userName);
			if (cnt > 0) {
				response.getWriter().write("success");
			} else {
				System.out.println("지우는 중 오류발생");
				response.getWriter().write("error");
			}
		} catch (NumberFormatException ex) {
			System.out.println("storeId가 없습니다");
			response.getWriter().write("nostoreid");
		} catch (Exception ex) {
			System.out.println("예외 에러");
			response.getWriter().write("error");
		}
		response.getWriter().close();
	}

}
