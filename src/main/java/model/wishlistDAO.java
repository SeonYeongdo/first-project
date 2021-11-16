package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

public class wishlistDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	storeVO vo = null;
	wishlistVO wvo = null;
	int cnt = 0;
	
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
// ==========================================================================================
	
	
	public int storeWishlist(wishlistVO vo) {
		try {
			conn();
			// sql문 작성
			String sql = "insert into TB_WISHLIST VALUES(?,?,SYSDATE)" ;
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUserID());
			psmt.setInt(2, vo.getStoreID());
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	
	public ArrayList<wishlistVO> forMypage(String userId) {

		ArrayList<wishlistVO> arr = new ArrayList<wishlistVO>();
		try {

			conn();

			
			// sql문 작성
			String sql = "select * from tb_wishlist where user_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userId);
			rs = psmt.executeQuery();

			while (rs.next()) {
				
				String user_id = rs.getString(1);
				int storeId = rs.getInt(2);
				String date = rs.getString(3);
				
				
								
				
				wvo = new wishlistVO(user_id, storeId, date);
				arr.add(wvo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return arr;
	}
	
	public String printWishlist(int storeId) {

		String store = null;
		try {

			conn();

			
			// sql문 작성
			String sql = "select * from tb_store where store_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, storeId);
			rs = psmt.executeQuery();

			if (rs.next()) {
				
				String storeName = rs.getString(2);
				
				store=storeName;					
				
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return store;
	}
	
	public int delete(int storeId, String user_id) {

		String store = null;
		try {

			conn();

			
			// sql문 작성
			String sql = "delete from tb_wishlist where user_id = ? and store_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			psmt.setInt(2, storeId);
			cnt = psmt.executeUpdate();

			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return cnt;
	}
}
	

