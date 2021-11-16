package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class reviewDAO {

	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	
	int cnt = 0;
	int cnt2 = 0;
	public void conn() {
		try {

			// jdbd ���̺귯�� �����ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// DB�� �α����� �ּ�, ID, PW ����
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "cgi_4_3";
			String dbpw = "smhrd3";

			// Connection ��ü ����
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
	// ================================================
	
	public int registReview(reviewVO vo) {

		
		try {

			conn();

			
			// sql�� �ۼ�
		
			String sql = "insert into tb_review (review_num, user_id, store_id, review_dt, review_score, review_content, review_rcpt_photo)"
					+ "values(REVIEW_SEQ.NEXTVAL,?,?,sysdate,?,?,?)";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, vo.getUser_id());
			psmt.setInt(2, vo.getStore_id());
			psmt.setInt(3, vo.getReview_score());
			psmt.setString(4, vo.getReview_content());
			psmt.setString(5, vo.getReview_picture());
			cnt = psmt.executeUpdate();
			
			
			if (cnt == 0) {
				System.out.println("���� ������ �������");
			} else {
				System.out.println("���� ���� ����");
			}
			
			sql = "update tb_user set user_mileage = user_mileage + 100 where user_id=?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, vo.getUser_id());
			cnt2 = psmt.executeUpdate();
			
			if (cnt2 == 0) {
				System.out.println("������ ���� ����");
			} else {
				System.out.println("������ ���� ����");
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;
	}
	
	public ArrayList<reviewVO> print(int storeId) {

		ArrayList<reviewVO> arr = new ArrayList<reviewVO>();
		try {

			conn();

			
			
			// sql�� �ۼ�
			String sql = "select * from TB_REVIEW where STORE_ID = ? order by review_num desc";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, storeId);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int review_num = rs.getInt(1);
				String user_id = rs.getString(2);
				int store_id = rs.getInt(3);
				String review_dt = rs.getString(4);
				int review_score = rs.getInt(5);
				String content = rs.getString(7);
				String picture = rs.getString(8);
				int like = rs.getInt(6);
				
				reviewVO vo = new reviewVO(review_num, user_id, store_id, review_dt, review_score, content, picture, like);
				arr.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return arr;
	}
	public ArrayList<reviewVO> reviewCount(String userId) {

		ArrayList<reviewVO> arr = new ArrayList<reviewVO>();
		try {

			conn();

			
			
			// sql�� �ۼ�
			String sql = "select * from TB_REVIEW where USER_ID = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userId);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int review_num = rs.getInt(1);
				String user_id = rs.getString(2);
				int store_id = rs.getInt(3);
				String review_dt = rs.getString(4);
				int review_score = rs.getInt(5);
				String content = rs.getString(7);
				String picture = rs.getString(8);
				int like = rs.getInt(11);
				
				reviewVO vo = new reviewVO(review_num, user_id, store_id, review_dt, review_score, content, picture, like);
				arr.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return arr;
	}
public int reviewLike(int reviewNum, String r_user_id) {

		
		try {

			conn();

			
			// sql�� �ۼ�
			String sql = "INSERT INTO TB_REVIEW_LIKE VALUES(?,?)";

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, reviewNum);
			psmt.setString(2, r_user_id);
			
			cnt = psmt.executeUpdate();
			
			
			if (cnt > 0){ 
				
				cnt = 0; 
						
				sql = "UPDATE TB_REVIEW SET REVIEW_LIKE = REVIEW_LIKE + 1 WHERE REVIEW_NUM = ?";

				psmt = conn.prepareStatement(sql);

				psmt.setInt(1, reviewNum);
				
				cnt = psmt.executeUpdate();
				
				
				if (cnt == 0) {
					System.out.println("���� ������ �������");
				} else {
					System.out.println("���� ���� ����");
				}
				
			} else {
				System.out.println("���� ��ư �ߺ�");
				
				
				
			}
			
			
			

		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;
	}
}
