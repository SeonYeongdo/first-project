package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.reviewDAO;



@WebServlet("/reviewLikeCon")
public class reviewLikeCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/plain");
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("euc-kr");
		String r_user_id = request.getParameter("r_user_id");
		try {
			int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
			reviewDAO dao = new reviewDAO();
			int cnt = dao.reviewLike(reviewNum,r_user_id);
			if (cnt > 0) {
				response.getWriter().write("success");
			} else {
				System.out.println("공감 쿼리문 오류발생");
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
