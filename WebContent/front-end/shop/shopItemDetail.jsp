<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.item.model.*"%>
<%@ page import="com.item_type.model.*"%>
<%@ page import="com.item_pics.model.*"%>
<%
	ItemService itemSvc = new ItemService();
	String item_no = request.getParameter("item_no");
	System.err.println("item_no = " + item_no);
	ItemVO item = itemSvc.getOneItem(item_no);
	pageContext.setAttribute("item_no", item_no);
	List<ItemVO> list = itemSvc.getAllItem();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="description" content="Sona Template" />
<meta name="keywords" content="Sona, unica, creative, html" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Diamond Resort</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap"
	rel="stylesheet" />
<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/elegant-icons.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/flaticon.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/owl.carousel.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/nice-select.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery-ui.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slicknav.min.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/template.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/slick-theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/shoppagedetail.css"
	type="text/css" />
</head>
<body>
	<div class="back"></div>
	<!-- Page Preloder -->
	<div id="preloder">
		<img id="preloaderpic"
			src="${pageContext.request.contextPath}/img/loading.png" />
		<div class="loader"></div>
	</div>
	<!-- Offcanvas Menu Section Begin -->
	
	<div class="shopping-cart">
		
		<div class="cart-border">
			<div class="cart-title">MY SHOPPING BAG</div>			
<!-- 			<div class="cart-item"> -->
			
<!-- 				<div class="cart-item-pic"> -->
<!-- 					<img src="img/watch1.jpg" alt="" class="item-pic-size"> -->
<!-- 				</div> -->
<!-- 				<div class="cart-item-name"></div> -->
<!-- 				<div id="cart-item-no"></div> -->
<!-- 				<div class="cart-item-price"></div> -->
<!-- 				<div class="cart-points"></div> -->
<!-- 				<div> -->
<!-- 					<form class="far fa-trash-alt trash" > -->
					
<!-- 					</form> -->
<!-- 				</div> -->
				
<!-- 			</div>			 -->
		</div>
		
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
	</div >
<!-- 	<div class="shopping-cart"> -->
<%-- 	<jsp:include page="/front-end/shop/shopCart.jsp" flush="true"/> --%>
<!-- 	</div> -->
	<!-- <div class="added-cart">
            <div class="added-cart-bor">
                <div class="added-cart-title">ADDED TO CART</div>
                <div class="added-bor">
                    <div class="view-cart"></div>
                    <div class="conshopping"></div>
                </div>
            </div>
        </div> -->
	<div class="shopping-addednotice"></div>
	<div class="offcanvas-menu-overlay"></div>
	<div class="canvas-open">
		<i class="icon_menu"></i>
	</div>
	<div class="offcanvas-menu-wrapper">
		<div class="canvas-close">
			<i class="icon_close"></i>
		</div>
		<div class="search-icon search-switch">
			<i class="icon_search"></i>
		</div>
		<div class="header-configure-area">
			<div class="language-option">
				<img src="img/flag.jpeg" alt="" /> <span>TW <i
					class="fa fa-angle-down"></i></span>
			</div>
			<a href="#" class="bk-btn">立刻訂房</a>
		</div>
		<nav class="mainmenu mobile-menu">
			<ul>
				<li><a href="./pages.html" class="nav-event">會員中心</a>
					<ul class="dropdown">
						<li><a href="./room-details.html">個人檔案</a></li>
						<li><a href="./blog-details.html">我的假期</a></li>
						<li><a href="#">我的足跡</a></li>
					</ul></li>
				<li><a class="nav-event">住客專區</a>
					<ul class="dropdown">
						<li><a href="./activity.html">活動報名</a></li>
						<li><a href="">預約服務</a></li>
						<li><a href="">訂購餐點</a></li>
					</ul></li>
				<li><a href="shop.html" class="nav-evnet">戴蒙商城</a></li>
				<li><a class="nav-event" href="./rooms.html">渡假空間</a>
					<ul class="dropdown">
						<li><a href="#">戴蒙經典房</a></li>
						<li><a href="#">豪華蜜月房</a></li>
						<li><a href="#">奢華海景房</a></li>
						<li><a href="#">波賽頓套房</a></li>
						<li><a href="#">公共空間</a></li>
					</ul></li>
				<li><a class="nav-event" href="./pages.html">精彩活動</a>
					<ul class="dropdown">
						<li><a href="./room-details.html">陸上活動</a></li>
						<li><a href="./room-details.html">海上活動</a></li>
						<li><a href="./room-details.html">網紅行程</a></li>
					</ul></li>
				<li><a href="" class="nav-event">會員登入</a></li>
				<li><a href="" class="nav-event"
					style="color: rgb(240, 218, 162)">加入會員</a></li>
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="top-social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i
				class="fa fa-tripadvisor"></i></a> <a href="#"><i
				class="fa fa-instagram"></i></a>
		</div>
		<ul class="top-widget">
			<li><i class="fa fa-phone"></i> (12) 345 67890</li>
			<li><i class="fa fa-envelope"></i> info.colorlib@gmail.com</li>
		</ul>
	</div>
	<!-- Offcanvas Menu Section End -->
	<!-- Header Section Begin -->
	<header class="header-section">
		<div class="menu-item">
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<div class="logo">
							<a href="./index.html"> <img
								src="${pageContext.request.contextPath}/img/logo.png" alt="" />
							</a>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="nav-menu">

							<jsp:useBean id="item_typeSvc" scope="page"
								class="com.item_type.model.Item_typeService" />

							<nav class="mainmenu">
								<ul>
									<li class="active"><a
										href="<%=request.getContextPath()%>/front-end/shop/shopPage.jsp">HOME</a></li>
									<li><a class="nav-event">DIAMOND CLASSIC</a>
										<ul class="dropdown">
											<c:forEach var="item_typeVO"
												items="${item_typeSvc.allItem_type}" begin="0" end="2">
												<li value="${item_typeVO.item_type_no}" class="chtype"><a
													href="<%=request.getContextPath()%>/front-end/shop/shopPage.jsp?item_type_no=${item_typeVO.item_type_no}">${item_typeVO.type_name}</a></li>
											</c:forEach>
										</ul></li>
									<li><a class="nav-event">GIFTS & SOUVENIR</a>
										<ul class="dropdown">
											<c:forEach var="item_typeVO"
												items="${item_typeSvc.allItem_type}" begin="3" end="5">
												<li value="${item_typeVO.item_type_no}" class="chtype"><a
													href="<%=request.getContextPath()%>/front-end/shop/shopPage.jsp?item_type_no=${item_typeVO.item_type_no}">${item_typeVO.type_name}</a></li>
											</c:forEach>
										</ul></li>
									<li><a class="nav-evnet">SEASONAL GOODS</a>
										<ul class="dropdown">
											<c:forEach var="item_typeVO"
												items="${item_typeSvc.allItem_type}" begin="6">
												<li value="${item_typeVO.item_type_no}" class="chtype"><a
													href="<%=request.getContextPath()%>/front-end/shop/shopPage.jsp?item_type_no=${item_typeVO.item_type_no}">${item_typeVO.type_name}</a></li>
											</c:forEach>
										</ul></li>
									<li><a><i class="fas fa-shopping-cart icon"></i></a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="itemtypeheader">
			<div id="itemtype">

				<jsp:useBean id="item_picsSvc" scope="page"
					class="com.item_pics.model.Item_picsService" />

				<div id="itemsmpic">
					<img
						src="<%=request.getContextPath()%>/item_pics/item_pics.do?item_pic_no=<%=item_picsSvc.getAllPics(item_no).get(0).getItem_pic_no()%>&action=getOne_Pic_Display"
						alt="">
				</div>
				<div id="itemtypename"><%=itemSvc.getOneItem(item_no).getItem_name()%></div>
			</div>
			<div id="itemadd">Place in Cart</div>
			<div id="itemsmprice">
				$<%=itemSvc.getOneItem(item_no).getItem_price()%>.00
			</div>
		</div>
	</header>

	<!-- Header Section End -->
	<div class="wrapper">
		<form class="item">
			<div class="picborder">
				<div class="sliderpics">
					<c:forEach var="item_picsVO"
						items="${item_picsSvc.getAllPics(item_no)}">
						<div class="picsize">
							<img
								src="<%=request.getContextPath()%>/item_pics/item_pics.do?item_pic_no=${item_picsVO.item_pic_no}&action=getOne_Pic_Display"
								alt="" />
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="iteminfo">

				<div class="itemtypeno"><%=itemSvc.getOneItem(item_no).getItem_no()%></div>
				<div class="itemdename"><%=itemSvc.getOneItem(item_no).getItem_name()%></div>
				<div class="itemdeprice">
					$<%=itemSvc.getOneItem(item_no).getItem_price()%>.00
				</div>
				<div class="itempoints"><%=itemSvc.getOneItem(item_no).getPoints() %>points
				</div>
				<div class="itemdede"><%=itemSvc.getOneItem(item_no).getItem_detail()%></div>
				<button class="itemaddtocart" type="button" name="item_no" value="<%=item_no%>">Place in Cart</button>

			</div>
		</form>
		<div class="otheritem">
			<div class="otheritemtitle">YOU MAY ALSO LIKE</div>
			<div class="titlename">
				<div id="recent">Recently Viewed</div>
				<div id="recomm">Recommended</div>
			</div>
			<div class="otheritemborder">
				<div class="row">
					<c:forEach var="itemVO" items="${list}" begin="0" end="2">
						<div class="col col-12 col-sm-6 col-md-4">
							<div class="itemslider">
								<c:forEach var="item_picsVO" begin="0" end="0"
									items="${item_picsSvc.getAllPics(itemVO.item_no)}">
									<div class="itempic">
										<a
											href="<%=request.getContextPath()%>/front-end/shop/shopItemDetail.jsp?item_no=${itemVO.item_no}"><img
											src="<%=request.getContextPath()%>/item_pics/item_pics.do?item_pic_no=${item_picsVO.item_pic_no}&action=getOne_Pic_Display"
											alt="" /> </a>
									</div>
								</c:forEach>
							</div>
							<div class="itemdetail">
								<span class="itemdescribe">${itemVO.item_name}</span> <span
									class="itemprice">$ ${itemVO.item_price}.00</span>
							</div>
						</div>

					</c:forEach>

				</div>

			</div>
		</div>
	</div>

	<!-- Footer Section Start -->

	<!-- Footer Section End -->
	<!-- Js Plugins -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/slick.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/template.js"></script>
	<script src="${pageContext.request.contextPath}/js/sweetalert.js"></script>
	<script src="${pageContext.request.contextPath}/js/shopdetail.js"></script>
 	<script type="text/javascript"> 
 	$(document).ready(function() {
 		var addItem = {
 				"action":"ADD",
 				"item_no":<%="\"" + item_no + "\""%>, 
 				"item_price":<%=itemSvc.getOneItem(item_no).getItem_price()%>, 
 				"quantity":1
 		};
 		var html='';
 		console.log(<%=itemSvc.getOneItem(item_no).getItem_price()%>); 
 		$(document).on('click',".itemaddtocart",function(event){
 			console.log(<%="\" =========== " + item_no + "\""%>); 
 			event.stopPropagation();
 			
 		$.ajax({
 			type: "POST",
 			url: '<%=request.getContextPath()%>/shop/shoppingCart.do', 
 			data: addItem,
 			//dataType: "Json",
 			success: function(res){
 				console.log(res);
 				alert("已加入購物車");
 				console.log(data);
 				
 				<% 
 				Vector<ItemVO> buylist = (Vector<ItemVO>)session.getAttribute("shoppingcart");
 				%> 
 				<%if (buylist!= null && (buylist.size() > 0)){ %> 
 				
 						<% 
 						for(int index = 0; index < buylist.size(); index++){
 							ItemVO order = buylist.get(index);						
 						%> 
						
						html+=
 						'<div class="cart-item"><div class="cart-item-name">'+ "<%=itemSvc.getOneItem(order.getItem_no()).getItem_name()%>" +"</div>"+ 
 						'<div id="cart-item-no">'+ <%=order.getQuantity()%> +"</div>"+
 						'<div class="cart-item-price">'+ <%=order.getItem_price()%> +"</div>"+ 
 						'<div class="cart-points">'+ <%=itemSvc.getOneItem(order.getItem_no()).getPoints()%> +"</div>"+ 
						'<div><form class="far fa-trash-alt trash"></form></div></div><br>'
													
							
						
												
<%-- 						$(".cart-item-name").text("<%=itemSvc.getOneItem(order.getItem_no()).getItem_name()%>"); --%>
<%-- 						$("#cart-item-no").text(<%=order.getQuantity()%>); --%>
<%-- 						$(".cart-item-price").text(<%=order.getItem_price()%>); --%>
<%-- 						$(".cart-points").text(<%=itemSvc.getOneItem(order.getItem_no()).getPoints()%>);	 --%>
												
											
                          <%} %> 
                      
 						$(".cart-title").append(html);
						
 				<%}%>	
 			}
 		});
 		});
 		var html2 = "";
 		$(document).on('click',".fas fa-shopping-cart icon",function(event){ 
 			alert("===");
 		$.ajax({	
 			type: "POST",
 			url: '<%=request.getContextPath()%>/shop/shoppingCart.do',
 			//dataType: "Json",
 			success: function(res){
 			<% 
				buylist = (Vector<ItemVO>)session.getAttribute("shoppingcart");
				%>
 			<%if (buylist!= null && (buylist.size() > 0)){ %> 
				
				<% 
				for(int index = 0; index < buylist.size(); index++){
					ItemVO order = buylist.get(index);						
				%> 
			
			html2+=
				'<div class="cart-item"><div class="cart-item-name">'+ "<%=itemSvc.getOneItem(order.getItem_no()).getItem_name()%>" +"</div>"+ 
				'<div id="cart-item-no">'+ <%=order.getQuantity()%> +"</div>"+
				'<div class="cart-item-price">'+ <%=order.getItem_price()%> +"</div>"+ 
				'<div class="cart-points">'+ <%=itemSvc.getOneItem(order.getItem_no()).getPoints()%> +"</div>"+ 
			'<div><form class="far fa-trash-alt trash"></form></div></div><br>'
										
									
								
              <%} %> 
          
				$(".cart-title").append(html2);
			
		<%}%>
 			}
 		});
 		});
 	});
 	</script> 
</body>
</html>
