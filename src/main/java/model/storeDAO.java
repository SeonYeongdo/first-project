package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class storeDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	storeVO vo = null;
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

	public ArrayList<storeVO> search(String search) {

		ArrayList<storeVO> arr = new ArrayList<storeVO>();
		try {

			conn();

			String check = "'%" + search + "%'";
			
			// sql문 작성
			String sql = "select * from TB_STORE where STORE_NAME like " + check +
						"or STORE_ADDR like" + check + "or STORE_TYPE like" + check;

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String cell = rs.getString(3);
				String type = rs.getString(4);
				String time = rs.getString(5);
				String addr = rs.getString(6);
				String picture = rs.getString(8);
				String lat = rs.getString(9);
				String lng = rs.getString(10);
				
								
				
				vo = new storeVO(id, name, cell, type, time, addr, picture,lat,lng);
				arr.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return arr;
	}
	
	public ArrayList<storeVO> htSearch(String sendType) {

		ArrayList<storeVO> arr = new ArrayList<storeVO>();
		try {

			conn();

		
			
			// sql문 작성
			String sql = "SELECT * FROM TB_STORE"
					+ "    WHERE TB_STORE.STORE_ID IN ("
					+ "        SELECT TB_REVIEW.STORE_ID FROM TB_REVIEW"
					+ "            WHERE TB_REVIEW.REVIEW_NUM IN ("
					+ "                SELECT TB_HASHTAG.REVIEW_NUM FROM TB_HASHTAG WHERE MOOD = ?))";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, sendType);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String cell = rs.getString(3);
				String type = rs.getString(4);
				String time = rs.getString(5);
				String addr = rs.getString(6);
				String picture = rs.getString(8);
				String lat = rs.getString(9);
				String lng = rs.getString(10);
				
								
				
				vo = new storeVO(id, name, cell, type, time, addr, picture,lat,lng);
				arr.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return arr;
	}
	
	public storeVO detailInfo(String storeName) {
	
		try {
			conn();
			
			// sql문 작성
			String sql = "select * from TB_STORE where STORE_NAME = ?";

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, storeName);
			rs = psmt.executeQuery();

			if (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String cell = rs.getString(3);
				String type = rs.getString(4);
				String time = rs.getString(5);
				String addr = rs.getString(6);
				String picture = rs.getString(8);
				String lat = rs.getString(9);
				String lng = rs.getString(10);
				
								
				System.out.println(lat + lng);
				vo = new storeVO(id, name, cell, type, time, addr, picture,lat,lng);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return vo;
	}
}
