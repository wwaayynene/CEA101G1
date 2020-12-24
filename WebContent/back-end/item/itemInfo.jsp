<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.item.model.*"%>
<%@ page import="com.item_type.model.*"%>
<%@ page import="com.item_pics.model.*"%>
<%@ page import="java.util.List"%>
<%@ include file="/back-end/backend_header.file" %> <!-- 加入常用 css -->
<title>商品管理</title>
</head>
<body>
<%@ include file="/back-end/backend_sidebar.file" %>
	<section class="wrapper">
		<ul class="tabs">
			<li class="active">商品查詢</li>
			<li>商品類別</li>
		</ul>

		<ul class="tab__content">
			<li class="active">
				<div class="content__wrapper">
					<div class="table-wrapper">
						<jsp:include page="listAllItem.jsp" />
					</div>
				</div>
			</li>
			<li>
				<div class="content__wrapper">
					<div class="table-wrapper">
					<jsp:include page="/back-end/item_type/listAllItem_type.jsp" />
					</div>
				</div>
			</li>
		</ul>
	</section>

	<%@ include file="/back-end/backend_footer.file" %> <!-- 加入常用 js -->
	<script src="${pageContext.request.contextPath}/js/backend.js"></script>
	
</body>
</html>
