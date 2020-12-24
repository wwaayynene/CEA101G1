<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.item.model.*"%>
<%@ page import="com.item_type.model.*"%>
<%@ page import="com.item_pics.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    
	Vector<ItemVO> buylist = (Vector<ItemVO>)session.getAttribute("shoppingcart");
	%>
	<%if (buylist!= null && (buylist.size() > 0)){ %>
	<div class="shopping-cart">
		<div class="cart-border">
			<div class="cart-title">MY SHOPPING BAG</div>
			<%
			for(int index = 0; index < buylist.size(); index++){
				ItemVO order = buylist.get(index);
			
			%>
			<div class="cart-item">
				<div class="cart-item-pic">
					<img src="img/watch1.jpg" alt="" class="item-pic-size">
				</div>
				<div class="cart-item-name"><%=order.getItem_name()%></div>
				<input id="cart-item-no" type="text" value="<%=order.getQuantity()%>">
				<div class="cart-item-price">
					$<%=order.getItem_price()%>.00
				</div>
				<div>
					<form class="far fa-trash-alt trash" name="deleteForm"
						action="<%=request.getContextPath()%>/shoppingCart/shoppingCart.html"
						method="POST">
						<input type="hidden" name="action" value="DELETE"> <input
							type="hidden" name="del" value="<%=index%>"> <input
							type="submit">
					</form>
				</div>
			</div>
		</div>
		<%} %>
		<div class="priceborder">
			<div class="total">
				<div class="totaltitle">Total:</div>
				<div class="totalprice">$7,200.00</div>
			</div>
			<div class="point">
				<div class="pointtitle">Points:</div>
				<div class="pointdiscount">$0.00</div>
			</div>
			<div class="subtotal">
				<div class="subtotaltitle">Subtotal:</div>
				<div class="subtotalprice">$7,200.00</div>
				<form class="itemCheck" name="checkoutForm"
					action="<%=request.getContextPath()%>/shoppingCart/shoppingCart.html"
					method="POST">
					<input type="hidden" name="action" value="CHECKOUT"> <input
						type="submit" value="CHECK">
				</form>
			</div>
			<div class="close">✖</div>

		</div>
	</div>
	<%} %>
</body>
</html>