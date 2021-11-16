package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.hasgtagDAO;
import model.hashtagVO;
import model.reviewDAO;
import model.reviewVO;
import model.userVO;

@WebServlet("/reviewRegister")
public class reviewRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/plain");
		request.setCharacterEncoding("utf-8");

		@SuppressWarnings("deprecation")
		String path = request.getRealPath("File");
		System.out.println("절대 경로 : " + path);

		userVO vo = (userVO) request.getSession().getAttribute("vo_session");
		int size = 1024 * 1024 * 10;
		int cnt = 0;
		int cnt2 =0;
		try {
			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
			String userId = vo.getUser_id();
			int storeId = Integer.parseInt(multi.getParameter("storeId"));
			int score = Integer.parseInt(multi.getParameter("score"));
			String checkPurpose = multi.getParameter("checkPurpose");
			String checkMood = multi.getParameter("checkMood");
			String checkFacility = multi.getParameter("checkFacility");
			String content = multi.getParameter("content");
			String filepath = "./File/" + multi.getFilesystemName("photo");

			String storeName = multi.getParameter("storeName");
			
			System.out.println("id : " + userId + ", 가게번호 : "+ storeId + ", 평점 : " + score + ", 방문목적 : " + checkPurpose + ", 분위기 : " + checkMood + ", 시설 : " + checkFacility + ", 리뷰내용 : " + content);
			System.out.println("파일경로 : " + filepath);
			
			reviewVO reviewvo = new reviewVO(userId, storeId, score, content, filepath );
			reviewDAO reviewdao = new reviewDAO();
			cnt = reviewdao.registReview(reviewvo);
			if (cnt > 0) {
				hashtagVO hashtagvo = new hashtagVO(checkMood, checkPurpose, checkFacility);
				hasgtagDAO hashtagdao = new hasgtagDAO();
				cnt2 = hashtagdao.registHash(hashtagvo);
			}
//			if (cnt2 >0 ) {
//				response.sendRedirect("detail.jsp?name=" + storeName);
//			}
//			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
