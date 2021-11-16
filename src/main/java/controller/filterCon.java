package controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.filterDAO;
import model.filterVO;
import model.storeVO;

@WebServlet("/filterCon")
public class filterCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String gu = request.getParameter("gu");
		String price = request.getParameter("price");
		String type = request.getParameter("type");

		String[] gulist = gu.split(",");
		String[] pricelist = price.split(",");
		String[] typelist = type.split(",");

		filterVO vo = new filterVO();

		List<String> gu1 = new LinkedList<String>();
		List<Integer> low = new LinkedList<Integer>();
		List<Integer> high = new LinkedList<Integer>();
		List<String> type1 = new LinkedList<String>();

		for (String s : gulist) {
			if (s.trim().equals(""))
				continue;
			gu1.add(s);
		}

		for (String s : pricelist) {
			if (s.trim().equals(""))
				continue;
			try {
				low.add(Integer.parseInt(s) * 10000);
				if (Integer.parseInt(s) * 10000 == 30000) {
					high.add(Integer.MAX_VALUE);
				} else
					high.add((Integer.parseInt(s) * 10000) + 10000);
			} catch (NumberFormatException ex) {
				ex.printStackTrace();
			}
		}

		for (String s : typelist) {
			if (s.trim().equals(""))
				continue;
			type1.add(s);
		}

		vo.setGu(gu1);
		vo.setLowPrice(low);
		vo.setHighPrice(high);
		vo.setFoodType(type1);

		filterDAO dao = new filterDAO();
		List<storeVO> list = dao.search(vo);
		
		String store = "";
		for (storeVO vv : list) {
			store += vv.getName();
			store += "," + vv.getType();
			store += "," + vv.getAddr();
			store += "," + vv.getTime();
			store += "," + vv.getPicture();
			store += "|";
		}
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(store);
		response.getWriter().close();
	}

}
