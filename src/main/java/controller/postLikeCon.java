package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.postDAO;
import model.reviewDAO;


@WebServlet("/postLikeCon")
public class postLikeCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/plain");
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("euc-kr");
		String p_user_id = request.getParameter("p_user_id");
		try {
			int postNum = Integer.parseInt(request.getParameter("postNum"));
			postDAO dao = new postDAO();
			int cnt = dao.postLike(postNum, p_user_id);
			if (cnt > 0) {
				response.getWriter().write("success");
			} else {
				System.out.println("����Ʈ ���ƿ� ������ �����߻�");
				response.getWriter().write("error");
			}
		} catch (NumberFormatException ex) {
			System.out.println("storeId�� �����ϴ�");
			response.getWriter().write("nostoreid");
		} catch (Exception ex) {
			System.out.println("���� ����");
			response.getWriter().write("error");
		}
		response.getWriter().close();
	}

}

