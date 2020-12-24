<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shop_order_detail.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>

<%
	String sp_odno = request.getParameter("sp_odno");
	Shop_order_detailService shop_order_detailSvc = new Shop_order_detailService();
	List<Shop_order_detailVO> list = shop_order_detailSvc.getShop_order_detailBySp_odno(sp_odno);
	pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>訂單細項資料 - listAllItem.jsp</title>

<style>
#title {
	width: 100%;
	height: auto;
	margin-top: 15px;
	background-color: rgb(204, 202, 202);
	border: 1px solid;
	font-size: 30px;
	text-align: center;
	padding-top: 5px;
	display: flex;
	flex-direction: row;
}

.titleAll {
	margin-left: auto;
	margin-right: auto;
}

.home {
	margin-left: 0px;
	margin-right: 5px;
	float: right;
	font-size: 27px;
}

table {
	width: 1100px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	margin-left: auto;
	margin-right: auto;
	border: 1px gray;
}

tr:nth-of-type(even) {
	background-color: #f3f3f3;
}

tr:nth-of-type(odd) {
	background-color: #ddd;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>

	<div id="title">

		<div class="titleAll">商品資料</div>
		<div>
			<a href="<%=request.getContextPath()%>/back-end/item/select_item.jsp"
				class="home">回商品管理</a>
		</div>

	</div>
	<table>
		<tr>
			<th>訂單編號</th>
			<th>商品編號</th>
			<th>商品名稱</th>
			<th>數量</th>
			<th>商品促銷折扣</th>
			<th>商品價格</th>
			<th>商品積分</th>
			<th>修改</th>
		</tr>

		<jsp:useBean id="itemSvc" scope="page"
			class="com.item.model.ItemService" />


		<c:forEach var="shop_order_detailVO" items="${list}">

			<tr>
				<td>${shop_order_detailVO.sp_odno}</td>
				<td>${shop_order_detailVO.item_no}</td>
				<td>${itemSvc.getOneItem(shop_order_detailVO.item_no).item_name}</td>
				<td>${shop_order_detailVO.qty}</td>
				<td>${shop_order_detailVO.sale_discount}</td>
				<td>${shop_order_detailVO.item_price}</td>
				<td>${shop_order_detailVO.points}</td>

				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/shop_order_detail/shop_order_detail.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> 
						<input type="hidden" name="item_no" value="${shop_order_detailVO.item_no}">
						<input type="hidden" name="sp_odno" value="${shop_order_detailVO.sp_odno}"> 
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>