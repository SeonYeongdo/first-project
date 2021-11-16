package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.postDAO;
import model.postVO;
import model.userVO;

@WebServlet("/postRegister")
public class postRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/plain");
		request.setCharacterEncoding("utf-8");

		@SuppressWarnings("deprecation")
		String path = request.getRealPath("File");
		System.out.println("절대 경로 : " + path);

		userVO vo = (userVO) request.getSession().getAttribute("vo_session");
		if (vo == null) {
			response.sendRedirect("gotgan.jsp");
			return;
		}
		int size = 1024 * 1024 * 10;
		try {
			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
			String userId = vo.getUser_id();


			String postTitle = new String(multi.getParameter("title_article").getBytes(), "euc-kr");
			String postContent = new String(multi.getParameter("content_article").getBytes(), "euc-kr");
			String filepath = "./File/" + multi.getFilesystemName("photos");

			System.out.println(postTitle);

			postVO postvo = new postVO();
			postvo.setUser_id(userId);
			postvo.setPost_title(postTitle);
			postvo.setPost_content(postContent);
			postvo.setPost_picture(filepath);
			postDAO postdao = new postDAO();
			postdao.registPost(postvo);
			
			response.sendRedirect("gotgan.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
