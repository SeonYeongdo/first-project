package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class filterDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

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
	// ================================================

	public ArrayList<storeVO> search(filterVO vo) {
		ArrayList<storeVO> arr = new ArrayList<storeVO>();
		try {

			conn();

			List<String> gu = vo.getGu();
			List<Integer> lowPrice = vo.getLowPrice();
			List<Integer> highPrice = vo.getHighPrice();
			List<String> foodType = vo.getFoodType();

			// sql문 작성
			String sql = "SELECT DISTINCT "
						+ "A.STORE_ID"
						+ ",A.STORE_NAME"
						+ ",A.STORE_CELL"
						+ ",A.STORE_TYPE"
						+ ",A.STORE_OPER_TIME"
						+ ",A.STORE_ADDR"
						+ ",A.STORE_PAGE_VIEW"
						+ ",A.STORE_PICTURE"
						+ ",A.STORE_LAT"
						+ ",A.STORE_LNG "
					+ "FROM TB_STORE A, TB_MENU B              		 "
					+ "WHERE 0=0                                     "
					+ "    AND A.STORE_ID = B.STORE_ID (+)              ";

			if (gu.size() > 0) {
				sql += "    AND (                                        ";
				for (int i = 0; i < gu.size(); i++) {
					String guString = gu.get(i);
					if (i == 0) {
						sql += "        A.STORE_ADDR LIKE '%" + guString + "%'               ";
					} else {
						sql += "        OR A.STORE_ADDR LIKE '%" + guString + "%'          ";
					}
				}
				sql += "    )                                            ";
			}

			if (lowPrice.size() > 0 && highPrice.size() > 0) {
				sql += "    AND (                                        ";
				for (int i = 0; i < lowPrice.size(); i++) {
					int low = lowPrice.get(i);
					int high = highPrice.get(i);
					if (i == 0) {
						sql += "        B.MENU_PRICE BETWEEN " + low + " AND " + high + "         ";
					} else {
						sql += "        OR B.MENU_PRICE BETWEEN "+low+" AND "+high+"  ";
					}
				}
				sql += "    )                                            ";

			}

			if (foodType.size() > 0) {
				sql += "    AND A.STORE_TYPE IN (";
				for (int i = 0; i < foodType.size(); i++) {
					String type = foodType.get(i);
					if (i > 0) {
						sql += ",";
					}
					sql += "'" + type + "'";
				}
				sql += ")         ";
			}
			sql += "ORDER BY A.STORE_ID ASC           ";
			
			System.out.println(sql);

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

				
				storeVO vo2 = new storeVO(id, name, cell, type, time, addr, picture, lat, lng);
				arr.add(vo2);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			close();
		}
		return arr;
	}

}
