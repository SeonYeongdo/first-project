package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class menuDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	menuVO vo = null;
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
	
	public ArrayList<menuVO> printMenu(int storeID) {

		ArrayList<menuVO> arr = new ArrayList<menuVO>();
		try {

			conn();

			
			// sql문 작성
			String sql = "select * from TB_MENU where STORE_ID =?" ;

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, storeID);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int storeId = rs.getInt(1);
				int menuCd = rs.getInt(2);
				String menuName = rs.getString(3);
				int price = rs.getInt(4);
				
				
				
				vo = new menuVO(storeId, menuCd, menuName, price);
				arr.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return arr;
	}
}
