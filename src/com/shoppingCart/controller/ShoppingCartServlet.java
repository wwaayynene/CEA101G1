package com.shoppingCart.controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


import java.util.*;
import com.item.model.*;
import com.item_pics.*;

public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
//		String item_no =req.getParameter("item_no");
//		String quantity = req.getParameter("quantity");
//		System.out.println(item_no);	
//		System.out.println(quantity);
//		
		req.setCharacterEncoding("UTF-8");
		
//		JSONObject output = new JSONObject();
		
		HttpSession session = req.getSession();
		
		Vector<ItemVO> buylist = (Vector<ItemVO>)session.getAttribute("shoppingcart");
//		String jsonStr = "";
//		JSONArray jsonArray = new JSONArray(jsonStr);
//		for(int i = 0; i < jsonArray.length(); i++) {
//			JSONObject output = jsonArray.getJSONObject(i);
//			String aitem_no = output.getString("item_no");
//			String aquantity = output.getString("quantity");
//		}	
		String action = req.getParameter("action");
			if (!action.equals("CHECKOUT")) {
				// 刪除購物車中的商品
				if (action.equals("DELETE")) {
					String del = req.getParameter("del");
					int d = Integer.parseInt(del);
					buylist.removeElementAt(d);
				}
				// 新增商品至購物車中
				else if (action.equals("ADD")) {
					
					boolean match = false;

					// 取得後來新增的商品
					ItemVO aitem = getItemVO(req);
					System.out.println("=================================");
//					// 新增第一個商品到購物車

					if (buylist == null) {
						buylist = new Vector<ItemVO>();
						buylist.add(aitem);
					} else {
						for (int i = 0; i < buylist.size(); i++) {
							ItemVO itemIn = buylist.get(i);

							// 假如新增的商品跟購物車的一樣時
							if (itemIn.getItem_no().equals(aitem.getItem_no())) {
								itemIn.setQuantity(itemIn.getQuantity() + aitem.getQuantity());
								buylist.setElementAt(itemIn, i);
								match = true;
							} // end of if item_no match
						} // end of for
							// 假如新增的商品和購物車的不一樣時
						if (!match)
							buylist.add(aitem);
					}
				}

			session.setAttribute("shoppingcart", buylist);
//			response json shoppingcart
//			 JSONObject responseJSONObject = new JSONObject(buylist);
//			 	
//		        PrintWriter out = res.getWriter();
//		 
//		        out.println(responseJSONObject);
//		        out.flush();
//		        out.close();

//			String url = "/front-end/shop/shopItemDetail.jsp";
//			RequestDispatcher rd = req.getRequestDispatcher(url);
//			rd.forward(req, res);
			}
			
		//結帳,計算購物車商品總價格數量
		else if(action.equals("CHECKOUT")) {
			double total = 0;
			for(int i = 0; i < buylist.size(); i++) {
				ItemVO order = buylist.get(i);
				double item_price = order.getItem_price();
				int quantity = order.getQuantity();
				total += (item_price * quantity);
			}
			String amount = String.valueOf(total);
			req.setAttribute("amount", amount);
			String url = "/front-end/shopCheckout.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, res);
			}
	}
	
	private ItemVO getItemVO(HttpServletRequest req) {
		String item_no = req.getParameter("item_no");
//		String item_name = req.getParameter("item_name");
		Integer quantity = new Integer(req.getParameter("quantity"));
		Double item_price = new Double(req.getParameter("item_price"));
//		Integer points = new Integer(req.getParameter("points"));
		
		ItemVO item = new ItemVO();
//		item.setItem_name(item_name);
		item.setItem_no(item_no);
		item.setItem_price(item_price);
		item.setQuantity(quantity);
//		item.setPoints(points);
		
		return item;
	}
}
