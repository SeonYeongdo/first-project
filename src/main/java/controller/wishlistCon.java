package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.wishlistDAO;
import model.wishlistVO;

@WebServlet("/wishlistCon")
public class wishlistCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("euc-kr");
		String userName = request.getParameter("userName");
		try {
			int storeId = Integer.parseInt(request.getParameter("storeId"));
			wishlistVO vo = new wishlistVO(userName, storeId);
			wishlistDAO dao = new wishlistDAO();
			int cnt = dao.storeWishlist(vo);
			if (cnt > 0) {
				response.getWriter().write("success");
			} else {
				System.out.println("���ø���Ʈ ���� �� ���� �߻�(���ø���Ʈ �ߺ�)");
				response.getWriter().write("error");
			}
		} catch (NumberFormatException ex) {
			System.out.println("storeId�� �����ϴ�");
			response.getWriter().write("nostoreid");
		} catch (Exception ex) {
			System.out.println("���ø���Ʈ ���� �� ���� �߻�");
			response.getWriter().write("error");
		}
		response.getWriter().close();
	}

}
