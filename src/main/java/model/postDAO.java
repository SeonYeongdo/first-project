package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class postDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	
	int cnt = 0;
	int cnt2 = 0;
	public void conn() {
		try {

			// jdbd 라이브러리 동적로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// DB에 로그인할 주소, ID, PW 지정
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "cgi_4_3";
			String dbpw = "smhrd3";

			// Connection 객체 생성
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {

				rs.close();
			}
			if (psmt != null) {

				psmt.close();
			}
			if (conn != null) {

				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
public int registPost(postVO vo) {

		
		try {

			conn();

			
			// sql문 작성
		
			String sql = "insert into tb_post (post_num, user_id, post_title, regist_dt, post_content, post_picture, post_like, post_view)"
					+ "values(POST_SEQ.NEXTVAL,?,?,sysdate,?,?,0,0)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, vo.getUser_id());
			psmt.setString(2, vo.getPost_title());
			psmt.setString(3, vo.getPost_content());
			psmt.setString(4, vo.getPost_picture());
			cnt = psmt.executeUpdate();
			
			if (cnt == 0) {
				System.out.println("곳간 쿼리문 실행오류");
			} else {
				System.out.println("곳간 쿼리 성공");
			}
			
			sql = "update tb_user set user_mileage = user_mileage + 100 where user_id=?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, vo.getUser_id());
			cnt2 = psmt.executeUpdate();
			
			if (cnt2 == 0) {
				System.out.println("적립금 적립 실패");
			} else {
				System.out.println("적립금 적립 성공");
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;
	}

public ArrayList<postVO> print() {

	ArrayList<postVO> arr = new ArrayList<postVO>();
	try {

		conn();

		
		
		// sql문 작성
		String sql = "select * from TB_POST order by post_num desc";

		psmt = conn.prepareStatement(sql);
		
		rs = psmt.executeQuery();

		while (rs.next()) {
			int post_num = rs.getInt(1);
			String user_id = rs.getString(2);
			String post_title = rs.getString(3);
			String regist_dt = rs.getString(4);
			int post_like = rs.getInt(5);
			String post_content = rs.getString(6);
			String picture = rs.getString(7);
			int view = rs.getInt(8);
			
			postVO vo = new postVO();
			vo.setPost_num(post_num);
			vo.setUser_id(user_id);
			vo.setPost_title(post_title);
			vo.setRegist_dt(regist_dt);
			vo.setPost_like(post_like);
			vo.setPost_content(post_content);
			vo.setPost_picture(picture);
			vo.setPost_view(view);
			
			arr.add(vo);
		}

	} catch (Exception e) {
		e.printStackTrace();
	} finally {

		close();
	}
	return arr;
}

public int postLike(int postNum, String p_user_id) {

	
	try {

		conn();

		
		// sql문 작성
		String sql = "INSERT INTO TB_POST_LIKE VALUES(?,?)";

		psmt = conn.prepareStatement(sql);

		psmt.setInt(1, postNum);
		psmt.setString(2, p_user_id);
		
		cnt = psmt.executeUpdate();
		
		
		if (cnt > 0){ 
			
			cnt = 0; 
					
			sql = "UPDATE TB_POST SET POST_LIKE = POST_LIKE + 1 WHERE POST_NUM = ?";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, postNum);
			
			cnt = psmt.executeUpdate();
			
			
			if (cnt == 0) {
				System.out.println("포스트 좋아요 쿼리문 실행오류");
			} else {
				System.out.println("포스트 좋아요 쿼리 성공");
			}
			
		} else {
			System.out.println("포스트 좋아요 버튼 중복");
			
			
			
		}
		
		
		

	
	} catch (Exception e) {
		e.printStackTrace();
	} finally {

		close();
	}
	return cnt;
}
}
